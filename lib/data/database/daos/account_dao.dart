import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'account_dao.g.dart';

/// 账户 DAO
@DriftAccessor(
  tables: [
    Account,
    AccountMeta,
    AccountCredit,
    AccountPrepaid,
    AccountPlanLoan,
    AccountFlexLoan,
    AccountInvest,
    LoanPlan,
    LoanRecord,
  ],
)
class AccountDao extends DatabaseAccessor<LedgerDatabase> with _$AccountDaoMixin {
  AccountDao(super.db);

  // ==================== Account CRUD ====================

  /// 获取所有账户
  Future<List<AccountEntity>> getAllAccounts() => select(account).get();

  /// 根据ID获取账户
  Future<AccountEntity?> getAccountById(int id) =>
      (select(account)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 根据类型获取账户
  Future<List<AccountEntity>> getAccountsByType(AccountType type) =>
      (select(account)..where((t) => t.type.equalsValue(type))).get();

  /// 根据ID列表获取账户
  Future<List<AccountEntity>> getAccountsByIds(List<int> ids) =>
      (select(account)..where((t) => t.id.isIn(ids))).get();

  /// 添加账户
  Future<int> insertAccount(AccountCompanion entry) =>
      into(account).insert(entry);

  /// 更新账户
  Future<bool> updateAccount(AccountEntity entry) =>
      update(account).replace(entry);

  /// 删除账户
  Future<int> deleteAccount(int id) =>
      (delete(account)..where((t) => t.id.equals(id))).go();

  /// 监听所有账户变化
  Stream<List<AccountEntity>> watchAllAccounts() => select(account).watch();

  /// 监听特定类型账户变化
  Stream<List<AccountEntity>> watchAccountsByType(AccountType type) =>
      (select(account)..where((t) => t.type.equalsValue(type))).watch();

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

  /// 删除账户的所有元数据
  Future<int> deleteAllAccountMeta(int accountId) =>
      (delete(accountMeta)..where((t) => t.accountId.equals(accountId))).go();

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

  /// 删除信用账户详情
  Future<int> deleteCreditAccount(int accountId) =>
      (delete(accountCredit)..where((t) => t.accountId.equals(accountId))).go();

  // ==================== PrepaidAccount CRUD ====================

  /// 获取预付账户详情
  Future<PrepaidAccountEntity?> getPrepaidAccount(int accountId) => (select(
    accountPrepaid,
  )..where((t) => t.prepaidAccountId.equals(accountId))).getSingleOrNull();

  /// 添加预付账户详情
  Future<void> insertPrepaidAccount(AccountPrepaidCompanion entry) =>
      into(accountPrepaid).insert(entry);

  /// 更新预付账户详情
  Future<bool> updatePrepaidAccount(PrepaidAccountEntity entry) =>
      update(accountPrepaid).replace(entry);

  /// 删除预付账户详情
  Future<int> deletePrepaidAccount(int accountId) =>
      (delete(accountPrepaid)..where((t) => t.prepaidAccountId.equals(accountId))).go();

  /// 根据赠送金账户ID获取预付账户
  Future<PrepaidAccountEntity?> getPrepaidByBonusAccountId(int bonusAccountId) => (select(
    accountPrepaid,
  )..where((t) => t.bonusAccountId.equals(bonusAccountId))).getSingleOrNull();

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

  /// 删除计划借贷账户详情
  Future<int> deletePlanLoanAccount(int accountId) =>
      (delete(accountPlanLoan)..where((t) => t.accountId.equals(accountId))).go();

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

  /// 删除灵活借贷账户详情
  Future<int> deleteFlexLoanAccount(int accountId) =>
      (delete(accountFlexLoan)..where((t) => t.accountId.equals(accountId))).go();

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

  /// 删除投资账户详情
  Future<int> deleteInvestAccount(int accountId) =>
      (delete(accountInvest)..where((t) => t.accountId.equals(accountId))).go();

  /// 根据投资类型获取投资账户
  Future<List<InvestAccountEntity>> getInvestAccountsByType(
    AccountInvestType type,
  ) => (select(accountInvest)..where((t) => t.type.equalsValue(type))).get();

  // ==================== LoanPlan CRUD ====================

  /// 获取借贷计划
  Future<List<LoanPlanEntity>> getLoanPlansByAccountId(int accountId) =>
      (select(loanPlan)
            ..where((t) => t.accountId.equals(accountId))
            ..orderBy([(t) => OrderingTerm.asc(t.startDate)]))
          .get();

  /// 根据ID获取借贷计划
  Future<LoanPlanEntity?> getLoanPlanById(int id) =>
      (select(loanPlan)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 添加借贷计划
  Future<int> insertLoanPlan(LoanPlanCompanion entry) =>
      into(loanPlan).insert(entry);

  /// 更新借贷计划
  Future<bool> updateLoanPlan(LoanPlanEntity entry) =>
      update(loanPlan).replace(entry);

  /// 删除借贷计划
  Future<int> deleteLoanPlan(int id) =>
      (delete(loanPlan)..where((t) => t.id.equals(id))).go();

  /// 删除账户的所有借贷计划
  Future<int> deleteLoanPlansByAccountId(int accountId) =>
      (delete(loanPlan)..where((t) => t.accountId.equals(accountId))).go();

  // ==================== LoanRecord CRUD ====================

  /// 获取借贷记录
  Future<List<LoanRecordEntity>> getLoanRecordsByAccountId(int accountId) {
    final planQuery = selectOnly(loanPlan)
      ..addColumns([loanPlan.id])
      ..where(loanPlan.accountId.equals(accountId));
    
    return (select(loanRecord)
          ..where((t) => t.loanPlanId.isInQuery(planQuery))
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .get();
  }

  /// 根据借贷计划ID获取借贷记录
  Future<List<LoanRecordEntity>> getLoanRecordsByPlanId(int planId) =>
      (select(loanRecord)
            ..where((t) => t.loanPlanId.equals(planId))
            ..orderBy([(t) => OrderingTerm.asc(t.period)]))
          .get();

  /// 添加借贷记录
  Future<int> insertLoanRecord(LoanRecordCompanion entry) =>
      into(loanRecord).insert(entry);

  /// 更新借贷记录
  Future<bool> updateLoanRecord(LoanRecordEntity entry) =>
      update(loanRecord).replace(entry);

  /// 删除借贷记录
  Future<int> deleteLoanRecord(int planId, int period) =>
      (delete(loanRecord)..where(
        (t) => t.loanPlanId.equals(planId) & t.period.equals(period),
      )).go();

  /// 删除借贷计划的所有记录
  Future<int> deleteLoanRecordsByPlanId(int planId) =>
      (delete(loanRecord)..where((t) => t.loanPlanId.equals(planId))).go();
}
