import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:x_transaction/data/database/database.dart';
import 'package:x_transaction/data/database/tables.dart';

/// 创建内存数据库用于测试
LedgerDatabase createTestDatabase() {
  return LedgerDatabase.forTesting(NativeDatabase.memory());
}

void main() {
  group('CurrencyDao Tests', () {
    late LedgerDatabase db;
    late CurrencyDao currencyDao;

    setUp(() async {
      db = createTestDatabase();
      currencyDao = db.currencyDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('should get system currencies after initialization', () async {
      final currencies = await currencyDao.getSystemCurrencies();
      expect(currencies, isNotEmpty);
      expect(currencies.any((c) => c.code == 'CNY'), isTrue);
      expect(currencies.any((c) => c.code == 'USD'), isTrue);
    });

    test('should insert custom currency', () async {
      await currencyDao.insertCurrency(
        CurrencyCompanion.insert(
          code: 'BTC',
          name: 'Bitcoin',
          symbol: '₿',
          source: Value(CurrencySource.custom),
        ),
      );

      final currency = await currencyDao.getCurrencyByCode('BTC');
      expect(currency, isNotNull);
      expect(currency!.name, equals('Bitcoin'));
      expect(currency.source, equals(CurrencySource.custom));
    });

    test('should delete currency', () async {
      await currencyDao.insertCurrency(
        CurrencyCompanion.insert(
          code: 'TEST',
          name: 'Test',
          symbol: 'T',
        ),
      );

      final deleted = await currencyDao.deleteCurrencyByCode('TEST');
      expect(deleted, equals(1));

      final currency = await currencyDao.getCurrencyByCode('TEST');
      expect(currency, isNull);
    });
  });

  group('AccountDao Tests', () {
    late LedgerDatabase db;
    late AccountDao accountDao;

    setUp(() async {
      db = createTestDatabase();
      accountDao = db.accountDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('should insert and retrieve account', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final accountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Test Account',
          type: AccountType.balance,
          currencyCode: 'CNY',
          createdAt: now,
          updatedAt: now,
          icon: const Value('wallet'),
        ),
      );

      final account = await accountDao.getAccountById(accountId);
      expect(account, isNotNull);
      expect(account!.name, equals('Test Account'));
      expect(account.type, equals(AccountType.balance));
    });

    test('should get accounts by type', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Balance 1',
          type: AccountType.balance,
          currencyCode: 'CNY',
          createdAt: now,
          updatedAt: now,
        ),
      );
      await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Credit 1',
          type: AccountType.credit,
          currencyCode: 'CNY',
          createdAt: now,
          updatedAt: now,
        ),
      );

      final balanceAccounts = await accountDao.getAccountsByType(AccountType.balance);
      expect(balanceAccounts.length, equals(1));
      expect(balanceAccounts.first.name, equals('Balance 1'));

      final creditAccounts = await accountDao.getAccountsByType(AccountType.credit);
      expect(creditAccounts.length, equals(1));
      expect(creditAccounts.first.name, equals('Credit 1'));
    });

    test('should manage account meta', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final accountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Meta Test',
          type: AccountType.balance,
          currencyCode: 'CNY',
          createdAt: now,
          updatedAt: now,
        ),
      );

      await accountDao.upsertAccountMeta(
        AccountMetaCompanion.insert(
          accountId: accountId,
          scope: AccountMetaScope.custom,
          key: 'custom_key',
          value: 'custom_value',
        ),
      );

      final meta = await accountDao.getAccountMetaByKey(
        accountId,
        AccountMetaScope.custom,
        'custom_key',
      );
      expect(meta, isNotNull);
      expect(meta!.value, equals('custom_value'));
    });

    test('should insert and retrieve credit account', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final accountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Credit Card',
          type: AccountType.credit,
          currencyCode: 'CNY',
          createdAt: now,
          updatedAt: now,
        ),
      );

      await accountDao.insertCreditAccount(
        AccountCreditCompanion(
          accountId: Value(accountId),
          creditLimit: const Value(500000), // 5000.00
          billingCycleDay: const Value(5),
          paymentDueDay: const Value(25),
        ),
      );

      final creditAccount = await accountDao.getCreditAccount(accountId);
      expect(creditAccount, isNotNull);
      expect(creditAccount!.creditLimit, equals(500000));
      expect(creditAccount.billingCycleDay, equals(5));
      expect(creditAccount.paymentDueDay, equals(25));
    });
  });

  group('CategoryDao Tests', () {
    late LedgerDatabase db;
    late CategoryDao categoryDao;

    setUp(() async {
      db = createTestDatabase();
      categoryDao = db.categoryDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('should insert and retrieve category', () async {
      final categoryId = await categoryDao.insertCategory(
        CategoryCompanion.insert(
          name: 'Food',
          type: CategoryType.expense,
          icon: const Value('restaurant'),
        ),
      );

      final category = await categoryDao.getCategoryById(categoryId);
      expect(category, isNotNull);
      expect(category!.name, equals('Food'));
      expect(category.type, equals(CategoryType.expense));
    });

    test('should get child categories', () async {
      final parentId = await categoryDao.insertCategory(
        CategoryCompanion.insert(
          name: 'Parent',
          type: CategoryType.expense,
        ),
      );

      await categoryDao.insertCategory(
        CategoryCompanion.insert(
          name: 'Child 1',
          type: CategoryType.expense,
          parentId: Value(parentId),
        ),
      );
      await categoryDao.insertCategory(
        CategoryCompanion.insert(
          name: 'Child 2',
          type: CategoryType.expense,
          parentId: Value(parentId),
        ),
      );

      final children = await categoryDao.getChildCategories(parentId);
      expect(children.length, equals(2));
    });

    test('should get root categories', () async {
      await categoryDao.insertCategory(
        CategoryCompanion.insert(
          name: 'Root 1',
          type: CategoryType.expense,
        ),
      );
      await categoryDao.insertCategory(
        CategoryCompanion.insert(
          name: 'Root 2',
          type: CategoryType.income,
        ),
      );

      final rootCategories = await categoryDao.getRootCategories();
      expect(rootCategories.length, equals(2));
    });

    test('should get categories by type', () async {
      await categoryDao.insertCategory(
        CategoryCompanion.insert(
          name: 'Expense Cat',
          type: CategoryType.expense,
        ),
      );
      await categoryDao.insertCategory(
        CategoryCompanion.insert(
          name: 'Income Cat',
          type: CategoryType.income,
        ),
      );

      final expenseCategories = await categoryDao.getCategoriesByType(CategoryType.expense);
      expect(expenseCategories.length, equals(1));
      expect(expenseCategories.first.name, equals('Expense Cat'));

      final incomeCategories = await categoryDao.getCategoriesByType(CategoryType.income);
      expect(incomeCategories.length, equals(1));
      expect(incomeCategories.first.name, equals('Income Cat'));
    });
  });

  group('TransactionDao Tests', () {
    late LedgerDatabase db;
    late TransactionDao transactionDao;
    late AccountDao accountDao;
    late CategoryDao categoryDao;

    setUp(() async {
      db = createTestDatabase();
      transactionDao = db.transactionDao;
      accountDao = db.accountDao;
      categoryDao = db.categoryDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('should insert and retrieve transaction', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      
      final txId = await transactionDao.insertTransaction(
        TransactionsCompanion.insert(
          type: TransactionType.expense,
          timestamp: now,
          createdAt: now,
          updatedAt: now,
        ),
      );

      final tx = await transactionDao.getTransactionById(txId);
      expect(tx, isNotNull);
      expect(tx!.type, equals(TransactionType.expense));
    });

    test('should add amount details to transaction', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      final nowSec = now ~/ 1000;
      
      final accountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Test',
          type: AccountType.balance,
          currencyCode: 'CNY',
          createdAt: nowSec,
          updatedAt: nowSec,
        ),
      );

      final txId = await transactionDao.insertTransaction(
        TransactionsCompanion.insert(
          type: TransactionType.expense,
          timestamp: now,
          createdAt: now,
          updatedAt: now,
        ),
      );

      await transactionDao.insertAmountDetail(
        TransactionAmountDetailCompanion.insert(
          transactionId: txId,
          accountId: accountId,
          type: AmountChangeType.basic,
          currencyCode: 'CNY',
          occurAmount: -10000, // 支出用负数
          localAmount: -10000,
          timestamp: now,
        ),
      );

      final details = await transactionDao.getAmountDetails(txId);
      expect(details.length, equals(1));
      expect(details.first.occurAmount, equals(-10000));
    });

    test('should add count details with category to transaction', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      final nowSec = now ~/ 1000;

      final categoryId = await categoryDao.insertCategory(
        CategoryCompanion.insert(
          name: 'Food',
          type: CategoryType.expense,
        ),
      );

      final txId = await transactionDao.insertTransaction(
        TransactionsCompanion.insert(
          type: TransactionType.expense,
          timestamp: now,
          createdAt: now,
          updatedAt: now,
        ),
      );

      await transactionDao.insertCountDetail(
        TransactionCountDetailCompanion.insert(
          transactionId: txId,
          categoryId: categoryId,
          amount: 5000, // 50.00
        ),
      );

      final details = await transactionDao.getCountDetails(txId);
      expect(details.length, equals(1));
      expect(details.first.amount, equals(5000));
      expect(details.first.categoryId, equals(categoryId));
    });

    test('should delete full transaction with relations', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      
      final txId = await transactionDao.insertTransaction(
        TransactionsCompanion.insert(
          type: TransactionType.expense,
          timestamp: now,
          createdAt: now,
          updatedAt: now,
        ),
      );

      await transactionDao.upsertTransactionMeta(
        TransactionMetaCompanion.insert(
          transactionId: txId,
          scope: TransactionMetaScope.custom,
          key: 'note',
          value: 'test note',
        ),
      );

      await transactionDao.deleteFullTransaction(txId);

      final tx = await transactionDao.getTransactionById(txId);
      expect(tx, isNull);

      final metas = await transactionDao.getTransactionMetas(txId);
      expect(metas, isEmpty);
    });

    test('should get transactions by date range', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      final yesterday = now - 86400000; // 24 hours ago
      final tomorrow = now + 86400000; // 24 hours later
      
      await transactionDao.insertTransaction(
        TransactionsCompanion.insert(
          type: TransactionType.expense,
          timestamp: now,
          createdAt: now,
          updatedAt: now,
        ),
      );

      final inRangeTransactions = await transactionDao.getTransactionsByDateRange(yesterday, tomorrow);
      expect(inRangeTransactions.length, equals(1));

      final outOfRangeTransactions = await transactionDao.getTransactionsByDateRange(
        tomorrow,
        tomorrow + 86400000,
      );
      expect(outOfRangeTransactions.length, equals(0));
    });
  });

  group('ReimbursementDao Tests', () {
    late LedgerDatabase db;
    late ReimbursementDao reimbursementDao;

    setUp(() async {
      db = createTestDatabase();
      reimbursementDao = db.reimbursementDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('should insert and retrieve reimbursement', () async {
      final now = DateTime.now().millisecondsSinceEpoch;

      final reimbId = await reimbursementDao.insertReimbursement(
        ReimbursementCompanion.insert(
          summary: 'Business Trip',
          createdAt: now,
          updatedAt: now,
        ),
      );

      final reimb = await reimbursementDao.getReimbursementById(reimbId);
      expect(reimb, isNotNull);
      expect(reimb!.summary, equals('Business Trip'));
      expect(reimb.status, isFalse); // 默认未完成
    });

    test('should complete reimbursement', () async {
      final now = DateTime.now().millisecondsSinceEpoch;

      final reimbId = await reimbursementDao.insertReimbursement(
        ReimbursementCompanion.insert(
          summary: 'Test Reimb',
          createdAt: now,
          updatedAt: now,
        ),
      );

      // 标记完成
      await reimbursementDao.completeReimbursement(reimbId);

      final reimb = await reimbursementDao.getReimbursementById(reimbId);
      expect(reimb!.status, isTrue);
    });

    test('should get pending reimbursements', () async {
      final now = DateTime.now().millisecondsSinceEpoch;

      await reimbursementDao.insertReimbursement(
        ReimbursementCompanion.insert(
          summary: 'Pending Reimb',
          createdAt: now,
          updatedAt: now,
        ),
      );

      final pending = await reimbursementDao.getPendingReimbursements();
      expect(pending.length, equals(1));
      expect(pending.first.summary, equals('Pending Reimb'));
    });
  });

  group('ProjectDao Tests', () {
    late LedgerDatabase db;
    late ProjectDao projectDao;

    setUp(() async {
      db = createTestDatabase();
      projectDao = db.projectDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('should insert and retrieve project', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final projectId = await projectDao.insertProject(
        ProjectCompanion.insert(
          name: 'Test Project',
          createdAt: now,
          updatedAt: now,
          icon: const Value('folder'),
        ),
      );

      final project = await projectDao.getProjectById(projectId);
      expect(project, isNotNull);
      expect(project!.name, equals('Test Project'));
    });

    test('should archive and unarchive project', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final projectId = await projectDao.insertProject(
        ProjectCompanion.insert(
          name: 'Archive Test',
          createdAt: now,
          updatedAt: now,
        ),
      );

      await projectDao.archiveProject(projectId, true);
      var project = await projectDao.getProjectById(projectId);
      expect(project!.archived, isTrue);

      await projectDao.archiveProject(projectId, false);
      project = await projectDao.getProjectById(projectId);
      expect(project!.archived, isFalse);
    });

    test('should get active projects only', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      await projectDao.insertProject(
        ProjectCompanion.insert(
          name: 'Active Project',
          createdAt: now,
          updatedAt: now,
        ),
      );
      final archivedId = await projectDao.insertProject(
        ProjectCompanion.insert(
          name: 'Archived Project',
          createdAt: now,
          updatedAt: now,
        ),
      );
      await projectDao.archiveProject(archivedId, true);

      final activeProjects = await projectDao.getActiveProjects();
      expect(activeProjects.length, equals(1));
      expect(activeProjects.first.name, equals('Active Project'));
    });
  });

  group('StakeholderDao Tests', () {
    late LedgerDatabase db;
    late StakeholderDao stakeholderDao;

    setUp(() async {
      db = createTestDatabase();
      stakeholderDao = db.stakeholderDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('should insert and retrieve stakeholder', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final stakeholderId = await stakeholderDao.insertStakeholder(
        StakeholderCompanion.insert(
          name: 'John Doe',
          type: StakeholderType.person,
          createdAt: now,
          updatedAt: now,
        ),
      );

      final stakeholder = await stakeholderDao.getStakeholderById(stakeholderId);
      expect(stakeholder, isNotNull);
      expect(stakeholder!.name, equals('John Doe'));
      expect(stakeholder.type, equals(StakeholderType.person));
    });

    test('should search stakeholders by name', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      await stakeholderDao.insertStakeholder(
        StakeholderCompanion.insert(
          name: 'Alice Smith',
          type: StakeholderType.person,
          createdAt: now,
          updatedAt: now,
        ),
      );
      await stakeholderDao.insertStakeholder(
        StakeholderCompanion.insert(
          name: 'Bob Johnson',
          type: StakeholderType.person,
          createdAt: now,
          updatedAt: now,
        ),
      );

      final results = await stakeholderDao.searchStakeholders('Alice');
      expect(results.length, equals(1));
      expect(results.first.name, equals('Alice Smith'));
    });

    test('should archive stakeholder', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final stakeholderId = await stakeholderDao.insertStakeholder(
        StakeholderCompanion.insert(
          name: 'Test Stakeholder',
          type: StakeholderType.merchant,
          createdAt: now,
          updatedAt: now,
        ),
      );

      await stakeholderDao.archiveStakeholder(stakeholderId, true);
      var stakeholder = await stakeholderDao.getStakeholderById(stakeholderId);
      expect(stakeholder!.archived, isTrue);

      await stakeholderDao.archiveStakeholder(stakeholderId, false);
      stakeholder = await stakeholderDao.getStakeholderById(stakeholderId);
      expect(stakeholder!.archived, isFalse);
    });
  });

  group('LoanPlan and LoanRecord Tests', () {
    late LedgerDatabase db;
    late AccountDao accountDao;

    setUp(() async {
      db = createTestDatabase();
      accountDao = db.accountDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('should insert and retrieve loan plan', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      
      final accountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Loan Account',
          type: AccountType.loan,
          currencyCode: 'CNY',
          createdAt: now,
          updatedAt: now,
        ),
      );

      final loanPlanId = await accountDao.insertLoanPlan(
        LoanPlanCompanion.insert(
          accountId: accountId,
          startDate: 45000, // 日期天数
          rate: const Value(0.05), // 5% 年利率
        ),
      );

      final loanPlan = await accountDao.getLoanPlanById(loanPlanId);
      expect(loanPlan, isNotNull);
      expect(loanPlan!.accountId, equals(accountId));
      expect(loanPlan.rate, equals(0.05));
    });

    test('should insert and retrieve loan records', () async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      
      final accountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Loan Account',
          type: AccountType.loan,
          currencyCode: 'CNY',
          createdAt: now,
          updatedAt: now,
        ),
      );

      final loanPlanId = await accountDao.insertLoanPlan(
        LoanPlanCompanion.insert(
          accountId: accountId,
          startDate: 45000,
        ),
      );

      // 添加借贷记录
      await accountDao.insertLoanRecord(
        LoanRecordCompanion.insert(
          loanPlanId: loanPlanId,
          period: 1,
          amount: 100000, // 1000.00 本金
          interest: 5000, // 50.00 利息
          date: 45030,
        ),
      );
      await accountDao.insertLoanRecord(
        LoanRecordCompanion.insert(
          loanPlanId: loanPlanId,
          period: 2,
          amount: 100000,
          interest: 4500,
          date: 45060,
        ),
      );

      final records = await accountDao.getLoanRecordsByPlanId(loanPlanId);
      expect(records.length, equals(2));
      expect(records.first.period, equals(1));
      expect(records.first.amount, equals(100000));
    });
  });

  group('DatabaseManager Tests', () {
    test('should create different databases for different ledger IDs', () {
      final manager = DatabaseManager();
      
      final db1 = manager.getDatabase('ledger1');
      final db2 = manager.getDatabase('ledger2');
      
      expect(db1.ledgerId, equals('ledger1'));
      expect(db2.ledgerId, equals('ledger2'));
      expect(identical(db1, db2), isFalse);
    });

    test('should return same database instance for same ledger ID', () {
      final manager = DatabaseManager();
      
      final db1 = manager.getDatabase('same_ledger');
      final db2 = manager.getDatabase('same_ledger');
      
      expect(identical(db1, db2), isTrue);
    });
  });
}
