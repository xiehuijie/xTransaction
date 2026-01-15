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
      expect(currencies.any((c) => c.currencyCode == 'CNY'), isTrue);
      expect(currencies.any((c) => c.currencyCode == 'USD'), isTrue);
    });

    test('should insert custom currency', () async {
      await currencyDao.insertCurrency(
        CurrencyCompanion.insert(
          currencyCode: 'BTC',
          name: 'Bitcoin',
          symbol: '₿',
          source: const Value(CurrencySource.custom),
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
          currencyCode: 'TEST',
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
      final accountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Test Account',
          type: AccountType.balance,
          currencyCode: 'CNY',
          balance: const Value(100000), // 1000.00 元
          icon: const Value('wallet'),
        ),
      );

      final account = await accountDao.getAccountById(accountId);
      expect(account, isNotNull);
      expect(account!.name, equals('Test Account'));
      expect(account.type, equals(AccountType.balance));
      expect(account.balance, equals(100000));
    });

    test('should get accounts by type', () async {
      await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Balance 1',
          type: AccountType.balance,
          currencyCode: 'CNY',
        ),
      );
      await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Credit 1',
          type: AccountType.credit,
          currencyCode: 'CNY',
        ),
      );

      final balanceAccounts = await accountDao.getAccountsByType(AccountType.balance);
      expect(balanceAccounts.length, equals(1));
      expect(balanceAccounts.first.name, equals('Balance 1'));

      final creditAccounts = await accountDao.getAccountsByType(AccountType.credit);
      expect(creditAccounts.length, equals(1));
      expect(creditAccounts.first.name, equals('Credit 1'));
    });

    test('should archive and unarchive account', () async {
      final accountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Archive Test',
          type: AccountType.balance,
          currencyCode: 'CNY',
        ),
      );

      // Archive
      await accountDao.archiveAccount(accountId, true);
      var account = await accountDao.getAccountById(accountId);
      expect(account!.archived, isTrue);

      // Unarchive
      await accountDao.archiveAccount(accountId, false);
      account = await accountDao.getAccountById(accountId);
      expect(account!.archived, isFalse);
    });

    test('should manage account meta', () async {
      final accountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Meta Test',
          type: AccountType.balance,
          currencyCode: 'CNY',
        ),
      );

      await accountDao.upsertAccountMeta(
        AccountMetaCompanion.insert(
          accountId: accountId,
          scope: AccountMetaScope.user,
          key: 'custom_key',
          value: 'custom_value',
        ),
      );

      final meta = await accountDao.getAccountMetaByKey(
        accountId,
        AccountMetaScope.user,
        'custom_key',
      );
      expect(meta, isNotNull);
      expect(meta!.value, equals('custom_value'));
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
          currencyCode: 'CNY',
          amount: 5000, // 50.00
          realAmount: 5000,
          timestamp: now,
          date: 45000, // 1900日期系统天数
        ),
      );

      final tx = await transactionDao.getTransactionById(txId);
      expect(tx, isNotNull);
      expect(tx!.type, equals(TransactionType.expense));
      expect(tx.amount, equals(5000));
    });

    test('should add amount details to transaction', () async {
      final accountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: 'Test',
          type: AccountType.balance,
          currencyCode: 'CNY',
        ),
      );

      final now = DateTime.now().millisecondsSinceEpoch;
      final txId = await transactionDao.insertTransaction(
        TransactionsCompanion.insert(
          type: TransactionType.expense,
          currencyCode: 'CNY',
          amount: 10000,
          realAmount: 10000,
          timestamp: now,
          date: 45000,
        ),
      );

      await transactionDao.insertAmountDetail(
        TransactionAmountDetailCompanion.insert(
          transactionId: txId,
          accountId: accountId,
          amount: 10000,
          realAmount: 10000,
          changeType: AmountChangeType.decrease,
        ),
      );

      final details = await transactionDao.getAmountDetails(txId);
      expect(details.length, equals(1));
      expect(details.first.amount, equals(10000));
    });

    test('should delete full transaction with relations', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      
      final txId = await transactionDao.insertTransaction(
        TransactionsCompanion.insert(
          type: TransactionType.expense,
          currencyCode: 'CNY',
          amount: 5000,
          realAmount: 5000,
          timestamp: now,
          date: 45000,
        ),
      );

      await transactionDao.upsertTransactionMeta(
        TransactionMetaCompanion.insert(
          transactionId: txId,
          scope: TransactionMetaScope.user,
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
  });

  group('ReimbursementDao Tests', () {
    late LedgerDatabase db;
    late ReimbursementDao reimbursementDao;
    late TransactionDao transactionDao;

    setUp(() async {
      db = createTestDatabase();
      reimbursementDao = db.reimbursementDao;
      transactionDao = db.transactionDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('should insert and retrieve reimbursement', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      
      final txId = await transactionDao.insertTransaction(
        TransactionsCompanion.insert(
          type: TransactionType.expense,
          currencyCode: 'CNY',
          amount: 100000,
          realAmount: 100000,
          timestamp: now,
          date: 45000,
        ),
      );

      final reimbId = await reimbursementDao.insertReimbursement(
        ReimbursementCompanion.insert(
          transactionId: txId,
          name: 'Business Trip',
          createdAt: now,
        ),
      );

      final reimb = await reimbursementDao.getReimbursementById(reimbId);
      expect(reimb, isNotNull);
      expect(reimb!.name, equals('Business Trip'));
    });

    test('should calculate reimbursement progress', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      
      final txId = await transactionDao.insertTransaction(
        TransactionsCompanion.insert(
          type: TransactionType.expense,
          currencyCode: 'CNY',
          amount: 100000,
          realAmount: 100000,
          timestamp: now,
          date: 45000,
        ),
      );

      final reimbId = await reimbursementDao.insertReimbursement(
        ReimbursementCompanion.insert(
          transactionId: txId,
          name: 'Test Reimb',
          createdAt: now,
        ),
      );

      // Add expectations
      await reimbursementDao.insertExpectation(
        ReimbursementExpectationCompanion.insert(
          reimbursementId: reimbId,
          amount: 50000,
          stakeholderId: const Value(null),
        ),
      );
      await reimbursementDao.insertExpectation(
        ReimbursementExpectationCompanion.insert(
          reimbursementId: reimbId,
          amount: 50000,
          stakeholderId: const Value(null),
        ),
      );

      // Add actuals
      await reimbursementDao.insertActual(
        ReimbursementActualCompanion.insert(
          reimbursementId: reimbId,
          amount: 30000,
          timestamp: now,
        ),
      );

      final progress = await reimbursementDao.calculateProgress(reimbId);
      expect(progress, equals(30.0)); // 30000 / 100000 * 100 = 30%
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
      final projectId = await projectDao.insertProject(
        ProjectCompanion.insert(
          name: 'Test Project',
          icon: const Value('folder'),
        ),
      );

      final project = await projectDao.getProjectById(projectId);
      expect(project, isNotNull);
      expect(project!.name, equals('Test Project'));
    });

    test('should archive and unarchive project', () async {
      final projectId = await projectDao.insertProject(
        ProjectCompanion.insert(name: 'Archive Test'),
      );

      await projectDao.archiveProject(projectId, true);
      var project = await projectDao.getProjectById(projectId);
      expect(project!.archived, isTrue);

      await projectDao.archiveProject(projectId, false);
      project = await projectDao.getProjectById(projectId);
      expect(project!.archived, isFalse);
    });

    test('should get active projects only', () async {
      await projectDao.insertProject(
        ProjectCompanion.insert(name: 'Active Project'),
      );
      final archivedId = await projectDao.insertProject(
        ProjectCompanion.insert(name: 'Archived Project'),
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
      final stakeholderId = await stakeholderDao.insertStakeholder(
        StakeholderCompanion.insert(
          name: 'John Doe',
          type: StakeholderType.person,
        ),
      );

      final stakeholder = await stakeholderDao.getStakeholderById(stakeholderId);
      expect(stakeholder, isNotNull);
      expect(stakeholder!.name, equals('John Doe'));
      expect(stakeholder.type, equals(StakeholderType.person));
    });

    test('should search stakeholders by name', () async {
      await stakeholderDao.insertStakeholder(
        StakeholderCompanion.insert(
          name: 'Alice Smith',
          type: StakeholderType.person,
        ),
      );
      await stakeholderDao.insertStakeholder(
        StakeholderCompanion.insert(
          name: 'Bob Johnson',
          type: StakeholderType.person,
        ),
      );

      final results = await stakeholderDao.searchStakeholders('Alice');
      expect(results.length, equals(1));
      expect(results.first.name, equals('Alice Smith'));
    });
  });
}
