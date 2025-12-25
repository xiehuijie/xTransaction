import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';
import 'daos/currency_dao.dart';
import 'daos/account_dao.dart';
import 'daos/ledger_dao.dart';
import 'daos/category_dao.dart';
import 'daos/stakeholder_dao.dart';
import 'daos/transaction_dao.dart';
import 'daos/reimbursement_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Currency,
    Account,
    AccountMeta,
    AccountCredit,
    AccountBonus,
    AccountLoan,
    LoanPlan,
    LoanRecord,
    Ledger,
    RelationAccountLedger,
    Project,
    Category,
    RelationCategoryLedger,
    Stakeholder,
    Transactions,
    TransactionAmountDetail,
    TransactionCategoryDetail,
    TransactionInstallmentDetail,
    TransactionInstallmentItem,
    TransactionReduce,
    TransactionRefund,
    RelationProjectTransaction,
    RelationTransaction,
    Reimbursement,
    ReimbursementExpectation,
    ReimbursementActual,
  ],
  daos: [
    CurrencyDao,
    AccountDao,
    LedgerDao,
    CategoryDao,
    StakeholderDao,
    TransactionDao,
    ReimbursementDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _seedInitialData();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // 未来的迁移逻辑
      },
    );
  }

  /// 初始化系统内置数据
  Future<void> _seedInitialData() async {
    // 插入系统内置货币
    await batch((batch) {
      batch.insertAll(currency, [
        CurrencyCompanion.insert(
          currencyCode: 'CNY',
          name: '人民币',
          symbol: '¥',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(2),
          source: Value(CurrencySource.system),
        ),
        CurrencyCompanion.insert(
          currencyCode: 'USD',
          name: '美元',
          symbol: '\$',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(2),
          source: Value(CurrencySource.system),
        ),
        CurrencyCompanion.insert(
          currencyCode: 'EUR',
          name: '欧元',
          symbol: '€',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(2),
          source: Value(CurrencySource.system),
        ),
        CurrencyCompanion.insert(
          currencyCode: 'JPY',
          name: '日元',
          symbol: '¥',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(0),
          source: Value(CurrencySource.system),
        ),
        CurrencyCompanion.insert(
          currencyCode: 'GBP',
          name: '英镑',
          symbol: '£',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(2),
          source: Value(CurrencySource.system),
        ),
        CurrencyCompanion.insert(
          currencyCode: 'HKD',
          name: '港元',
          symbol: 'HK\$',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(2),
          source: Value(CurrencySource.system),
        ),
      ]);
    });
  }

  /// 重置数据库（清空所有数据并重新初始化）
  Future<void> resetDatabase() async {
    await transaction(() async {
      // 按照依赖顺序删除所有表数据
      await delete(reimbursementActual).go();
      await delete(reimbursementExpectation).go();
      await delete(reimbursement).go();
      await delete(relationTransaction).go();
      await delete(relationProjectTransaction).go();
      await delete(transactionRefund).go();
      await delete(transactionReduce).go();
      await delete(transactionInstallmentItem).go();
      await delete(transactionInstallmentDetail).go();
      await delete(transactionCategoryDetail).go();
      await delete(transactionAmountDetail).go();
      await delete(transactions).go();
      await delete(stakeholder).go();
      await delete(relationCategoryLedger).go();
      await delete(category).go();
      await delete(project).go();
      await delete(relationAccountLedger).go();
      await delete(ledger).go();
      await delete(loanRecord).go();
      await delete(loanPlan).go();
      await delete(accountLoan).go();
      await delete(accountBonus).go();
      await delete(accountCredit).go();
      await delete(accountMeta).go();
      await delete(account).go();
      await delete(currency).go();

      // 重新插入初始数据
      await _seedInitialData();
    });
  }

  /// 导出数据库为JSON格式
  Future<Map<String, dynamic>> exportToJson() async {
    final Map<String, dynamic> data = {};

    data['currency'] = await select(currency).get();
    data['account'] = await select(account).get();
    data['accountMeta'] = await select(accountMeta).get();
    data['accountCredit'] = await select(accountCredit).get();
    data['accountBonus'] = await select(accountBonus).get();
    data['accountLoan'] = await select(accountLoan).get();
    data['loanPlan'] = await select(loanPlan).get();
    data['loanRecord'] = await select(loanRecord).get();
    data['ledger'] = await select(ledger).get();
    data['relationAccountLedger'] = await select(relationAccountLedger).get();
    data['project'] = await select(project).get();
    data['category'] = await select(category).get();
    data['relationCategoryLedger'] = await select(relationCategoryLedger).get();
    data['stakeholder'] = await select(stakeholder).get();
    data['transactions'] = await select(transactions).get();
    data['transactionAmountDetail'] = await select(
      transactionAmountDetail,
    ).get();
    data['transactionCategoryDetail'] = await select(
      transactionCategoryDetail,
    ).get();
    data['transactionInstallmentDetail'] = await select(
      transactionInstallmentDetail,
    ).get();
    data['transactionInstallmentItem'] = await select(
      transactionInstallmentItem,
    ).get();
    data['transactionReduce'] = await select(transactionReduce).get();
    data['transactionRefund'] = await select(transactionRefund).get();
    data['relationProjectTransaction'] = await select(
      relationProjectTransaction,
    ).get();
    data['relationTransaction'] = await select(relationTransaction).get();
    data['reimbursement'] = await select(reimbursement).get();
    data['reimbursementExpectation'] = await select(
      reimbursementExpectation,
    ).get();
    data['reimbursementActual'] = await select(reimbursementActual).get();

    return data;
  }

  /// 获取数据库文件路径
  static Future<String> getDatabasePath() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return p.join(dbFolder.path, 'x_transaction.db');
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'x_transaction.db'));
    return NativeDatabase.createInBackground(file);
  });
}
