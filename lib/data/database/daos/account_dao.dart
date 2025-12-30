import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'account_dao.g.dart';

@DriftAccessor(
  tables: [
    Account,
    AccountMeta,
    AccountCredit,
    AccountBonus,
    AccountPlanLoan,
    AccountFlexLoan,
    AccountInvest,
    LoanPlan,
    LoanRecord,
    RelationAccountLedger,
  ],
)
class AccountDao extends DatabaseAccessor<AppDatabase> with _$AccountDaoMixin {
  AccountDao(super.db);

  // ==================== Account CRUD ====================

  /// 获取所有账户
  Future<List<AccountEntity>> getAllAccounts() => select(account).get();

  /// 根据ID获取账户
  Future<AccountEntity?> getAccountById(int id) =>
      (select(account)..where((t) => t.accountId.equals(id))).getSingleOrNull();

  /// 根据类型获取账户
  Future<List<AccountEntity>> getAccountsByType(AccountType type) =>
      (select(account)..where((t) => t.type.equalsValue(type))).get();

  /// 添加账户
  Future<int> insertAccount(AccountCompanion entry) =>
      into(account).insert(entry);

  /// 更新账户
  Future<bool> updateAccount(AccountEntity entry) =>
      update(account).replace(entry);

  /// 删除账户
  Future<int> deleteAccount(int id) =>
      (delete(account)..where((t) => t.accountId.equals(id))).go();

  /// 监听所有账户变化
  Stream<List<AccountEntity>> watchAllAccounts() => select(account).watch();

  // ==================== AccountMeta CRUD ====================

  /// 获取账户的所有元数据
  Future<List<AccountMetaEntity>> getAccountMeta(int accountId) =>
      (select(accountMeta)..where((t) => t.accountId.equals(accountId))).get();

  /// 获取账户的指定元数据
  Future<AccountMetaEntity?> getAccountMetaByKey(
    int accountId,
    AccountMetaScope scope,
    String key,
  ) =>
      (select(accountMeta)..where(
            (t) =>
                t.accountId.equals(accountId) &
                t.scope.equalsValue(scope) &
                t.key.equals(key),
          ))
          .getSingleOrNull();

  /// 添加或更新账户元数据
  Future<void> upsertAccountMeta(AccountMetaCompanion entry) =>
      into(accountMeta).insertOnConflictUpdate(entry);

  /// 删除账户元数据
  Future<int> deleteAccountMeta(
    int accountId,
    AccountMetaScope scope,
    String key,
  ) =>
      (delete(accountMeta)..where(
            (t) =>
                t.accountId.equals(accountId) &
                t.scope.equalsValue(scope) &
                t.key.equals(key),
          ))
          .go();

  // ==================== CreditAccount CRUD ====================

  /// 获取信用账户详情
  Future<CreditAccountEntity?> getCreditAccount(int accountId) => (select(
    accountCredit,
  )..where((t) => t.accountId.equals(accountId))).getSingleOrNull();

  /// 添加信用账户详情
  Future<void> insertCreditAccount(AccountCreditCompanion entry) =>
      into(accountCredit).insert(entry);

  /// 更新信用账户详情
  Future<bool> updateCreditAccount(CreditAccountEntity entry) =>
      update(accountCredit).replace(entry);

  // ==================== BonusAccount CRUD ====================

  /// 获取赠送金账户关联
  Future<List<BonusAccountEntity>> getBonusAccountsByPrepaidId(
    int prepaidAccountId,
  ) => (select(
    accountBonus,
  )..where((t) => t.prepaidAccountId.equals(prepaidAccountId))).get();

  /// 添加赠送金账户关联
  Future<void> insertBonusAccount(AccountBonusCompanion entry) =>
      into(accountBonus).insert(entry);

  /// 删除赠送金账户关联
  Future<int> deleteBonusAccount(int bonusAccountId, int prepaidAccountId) =>
      (delete(accountBonus)..where(
            (t) =>
                t.bonusAccountId.equals(bonusAccountId) &
                t.prepaidAccountId.equals(prepaidAccountId),
          ))
          .go();

  // ==================== PlanLoanAccount CRUD ====================

  /// 获取计划借贷账户详情
  Future<PlanLoanAccountEntity?> getPlanLoanAccount(int accountId) => (select(
    accountPlanLoan,
  )..where((t) => t.accountId.equals(accountId))).getSingleOrNull();

  /// 添加计划借贷账户详情
  Future<void> insertPlanLoanAccount(AccountPlanLoanCompanion entry) =>
      into(accountPlanLoan).insert(entry);

  /// 更新计划借贷账户详情
  Future<bool> updatePlanLoanAccount(PlanLoanAccountEntity entry) =>
      update(accountPlanLoan).replace(entry);

  /// 获取未归档的计划借贷账户
  Future<List<PlanLoanAccountEntity>> getActivePlanLoanAccounts() =>
      (select(accountPlanLoan)..where((t) => t.archived.equals(false))).get();

  // ==================== FlexLoanAccount CRUD ====================

  /// 获取灵活借贷账户详情
  Future<FlexLoanAccountEntity?> getFlexLoanAccount(int accountId) => (select(
    accountFlexLoan,
  )..where((t) => t.accountId.equals(accountId))).getSingleOrNull();

  /// 添加灵活借贷账户详情
  Future<void> insertFlexLoanAccount(AccountFlexLoanCompanion entry) =>
      into(accountFlexLoan).insert(entry);

  /// 更新灵活借贷账户详情
  Future<bool> updateFlexLoanAccount(FlexLoanAccountEntity entry) =>
      update(accountFlexLoan).replace(entry);

  /// 获取未归档的灵活借贷账户
  Future<List<FlexLoanAccountEntity>> getActiveFlexLoanAccounts() =>
      (select(accountFlexLoan)..where((t) => t.archived.equals(false))).get();

  // ==================== InvestAccount CRUD ====================

  /// 获取投资账户详情
  Future<InvestAccountEntity?> getInvestAccount(int accountId) => (select(
    accountInvest,
  )..where((t) => t.accountId.equals(accountId))).getSingleOrNull();

  /// 添加投资账户详情
  Future<void> insertInvestAccount(AccountInvestCompanion entry) =>
      into(accountInvest).insert(entry);

  /// 更新投资账户详情
  Future<bool> updateInvestAccount(InvestAccountEntity entry) =>
      update(accountInvest).replace(entry);

  /// 根据投资类型获取投资账户
  Future<List<InvestAccountEntity>> getInvestAccountsByType(
    AccountInvestType type,
  ) => (select(accountInvest)..where((t) => t.type.equalsValue(type))).get();

  // ==================== LoanPlan CRUD ====================

  /// 获取借贷计划
  Future<List<LoanPlanEntity>> getLoanPlansByAccountId(int accountId) =>
      (select(loanPlan)
            ..where((t) => t.accountId.equals(accountId))
            ..orderBy([(t) => OrderingTerm.asc(t.dueDate)]))
          .get();

  /// 添加借贷计划
  Future<int> insertLoanPlan(LoanPlanCompanion entry) =>
      into(loanPlan).insert(entry);

  /// 更新借贷计划
  Future<bool> updateLoanPlan(LoanPlanEntity entry) =>
      update(loanPlan).replace(entry);

  /// 删除借贷计划
  Future<int> deleteLoanPlan(int id) =>
      (delete(loanPlan)..where((t) => t.loanPlanId.equals(id))).go();

  // ==================== LoanRecord CRUD ====================

  /// 获取借贷记录
  Future<List<LoanRecordEntity>> getLoanRecordsByAccountId(int accountId) =>
      (select(loanRecord)
            ..where((t) => t.accountId.equals(accountId))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get();

  /// 添加借贷记录
  Future<int> insertLoanRecord(LoanRecordCompanion entry) =>
      into(loanRecord).insert(entry);

  /// 更新借贷记录
  Future<bool> updateLoanRecord(LoanRecordEntity entry) =>
      update(loanRecord).replace(entry);

  /// 删除借贷记录
  Future<int> deleteLoanRecord(int id) =>
      (delete(loanRecord)..where((t) => t.loanRecordId.equals(id))).go();

  // ==================== Account-Ledger Relation ====================

  /// 获取账户关联的账本
  Future<List<LedgerAccountRelationEntity>> getAccountLedgers(int accountId) =>
      (select(
        relationAccountLedger,
      )..where((t) => t.accountId.equals(accountId))).get();

  /// 将账户关联到账本
  Future<void> linkAccountToLedger(int accountId, int ledgerId) =>
      into(relationAccountLedger).insert(
        RelationAccountLedgerCompanion.insert(
          accountId: accountId,
          ledgerId: ledgerId,
        ),
        mode: InsertMode.insertOrIgnore,
      );

  /// 解除账户与账本的关联
  Future<int> unlinkAccountFromLedger(int accountId, int ledgerId) =>
      (delete(relationAccountLedger)..where(
            (t) => t.accountId.equals(accountId) & t.ledgerId.equals(ledgerId),
          ))
          .go();
}
