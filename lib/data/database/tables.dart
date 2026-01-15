import 'package:drift/drift.dart';

// ==================== 枚举定义 ====================

/// 账户类型
enum AccountType { balance, credit, loan, invest, prepaid, bonus }

/// 账户元数据作用域
enum AccountMetaScope { system, custom }

/// 借贷类型
enum AccountLoanType { lend, borrow }

/// 赠送金账户扣减方式
enum AccountBonusMode { first, last, same }

/// 投资账户类型
enum AccountInvestType { stock, fund, bond, crypto, other }

/// 借贷计息周期
enum LoanInterestCycle {
  minutely,
  hourly,
  daily,
  weekly,
  monthly,
  quarterly,
  yearly
}

/// 货币来源
enum CurrencySource { system, custom }

/// 货币符号位置
enum CurrencyPosition { prefix, suffix }

/// 分类类型
enum CategoryType { expense, income, discount, cost, gain, loss }

/// 相关方类型
enum StakeholderType { person, merchant, company, other }

/// 交易类型
enum TransactionType { expense, income, transfer }

/// 交易关联类型
enum TransactionRelationType { afterwards, forwards, children, parent, related }

/// 交易元数据作用域
enum TransactionMetaScope { system, custom }

/// 金额变动类型
enum AmountChangeType { adjust, basic, refund, reimbursement, loan, repayment }

// ==================== 表定义 ====================

/// 货币表
@DataClassName('CurrencyEntity')
class Currency extends Table {
  /// 货币代码 🔑
  TextColumn get code => text()();

  /// 货币名称
  TextColumn get name => text()();

  /// 货币符号
  TextColumn get symbol => text()();

  /// 是否为本币
  BoolColumn get main => boolean().withDefault(const Constant(false))();

  /// 货币符号位置 ℹ️
  TextColumn get position =>
      textEnum<CurrencyPosition>().withDefault(const Constant('prefix'))();

  /// 小数位数
  IntColumn get decimal => integer().withDefault(const Constant(2))();

  /// 货币图标
  TextColumn get icon => text().withDefault(const Constant(''))();

  /// 货币来源 ℹ️
  TextColumn get source =>
      textEnum<CurrencySource>().withDefault(const Constant('system'))();

  @override
  Set<Column> get primaryKey => {code};
}

/// 账户表
@DataClassName('AccountEntity')
class Account extends Table {
  /// 账户唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 账户名称 ❄️
  TextColumn get name => text()();

  /// 账户描述
  TextColumn get description => text().withDefault(const Constant(''))();

  /// 账户图标
  TextColumn get icon => text().withDefault(const Constant(''))();

  /// 账户类型 ℹ️
  TextColumn get type => textEnum<AccountType>()();

  /// 账户货币代码 🔗
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #code)();

  /// 创建时间 🕗
  IntColumn get createdAt => integer().named('created_at')();

  /// 更新时间 🕗
  IntColumn get updatedAt => integer().named('updated_at')();

  /// 备注
  TextColumn get note => text().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {name},
      ];
}

/// 账户元数据表
@DataClassName('AccountMetaEntity')
class AccountMeta extends Table {
  /// 关联的账户唯一标识 🔑🔗
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #id)();

  /// 元数据作用域 🔑ℹ️
  TextColumn get scope => textEnum<AccountMetaScope>()();

  /// 元数据键 🔑
  TextColumn get key => text()();

  /// 元数据值
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {accountId, scope, key};
}

/// 信用账户表
@DataClassName('CreditAccountEntity')
class AccountCredit extends Table {
  /// 关联的账户唯一标识 🔑🔗
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #id)();

  /// 信用额度 💰
  IntColumn get creditLimit => integer().named('credit_limit')();

  /// 账单日 📅
  IntColumn get billingCycleDay => integer().named('billing_cycle_day')();

  /// 还款日 📅
  IntColumn get paymentDueDay => integer().named('payment_due_day')();

  @override
  Set<Column> get primaryKey => {accountId};
}

/// 预付款账户表
@DataClassName('PrepaidAccountEntity')
class AccountPrepaid extends Table {
  /// 对应的预付款账户唯一标识 🔑🔗
  IntColumn get prepaidAccountId =>
      integer().named('prepaid_account_id').references(Account, #id)();

  /// 对应的赠送金账户唯一标识 ❄️🔗
  IntColumn get bonusAccountId =>
      integer().named('bonus_account_id').references(Account, #id)();

  /// 赠送金扣减方式 ℹ️
  TextColumn get bonusMode =>
      textEnum<AccountBonusMode>().named('bonus_mode')();

  @override
  Set<Column> get primaryKey => {prepaidAccountId};
}

/// 计划借贷账户表
@DataClassName('PlanLoanAccountEntity')
class AccountPlanLoan extends Table {
  /// 关联的账户唯一标识 🔑🔗
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #id)();

  /// 关联的相关方唯一标识 🔗🔍
  IntColumn get stakeholderId =>
      integer().named('stakeholder_id').references(Stakeholder, #id)();

  /// 借贷类型 ℹ️
  TextColumn get type => textEnum<AccountLoanType>()();

  /// 是否归档 🔍
  BoolColumn get archived => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {accountId};
}

/// 灵活借贷账户表
@DataClassName('FlexLoanAccountEntity')
class AccountFlexLoan extends Table {
  /// 关联的账户唯一标识 🔑🔗
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #id)();

  /// 关联的相关方唯一标识 🔗🔍
  IntColumn get stakeholderId =>
      integer().named('stakeholder_id').references(Stakeholder, #id)();

  /// 借贷类型 ℹ️
  TextColumn get type => textEnum<AccountLoanType>()();

  /// 年化利率
  RealColumn get rate => real()();

  /// 计息周期 ℹ️
  TextColumn get cycle => textEnum<LoanInterestCycle>()();

  /// 借贷开始日期 📅
  IntColumn get startDate => integer().named('start_date')();

  /// 借贷结束日期 📅🔍
  IntColumn get endDate => integer().named('end_date')();

  /// 是否归档 🔍
  BoolColumn get archived => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {accountId};
}

/// 投资账户表
@DataClassName('InvestAccountEntity')
class AccountInvest extends Table {
  /// 关联的账户唯一标识 🔑🔗
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #id)();

  /// 投资类型 ℹ️
  TextColumn get type => textEnum<AccountInvestType>()();

  /// 对应资产代码
  TextColumn get code => text().nullable()();

  @override
  Set<Column> get primaryKey => {accountId};
}

/// 项目表
@DataClassName('ProjectEntity')
class Project extends Table {
  /// 项目唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 项目名称 ❄️
  TextColumn get name => text()();

  /// 项目描述
  TextColumn get description => text().nullable()();

  /// 项目预算 💰
  IntColumn get budget => integer().withDefault(const Constant(0))();

  /// 项目图标
  TextColumn get icon => text().nullable()();

  /// 是否归档 🔍
  BoolColumn get archived => boolean().withDefault(const Constant(false))();

  /// 创建时间 🕗
  IntColumn get createdAt => integer().named('created_at')();

  /// 更新时间 🕗
  IntColumn get updatedAt => integer().named('updated_at')();

  /// 项目开始日期 📅🔍
  IntColumn get startDate => integer().nullable().named('start_date')();

  /// 项目结束日期 📅🔍
  IntColumn get endDate => integer().nullable().named('end_date')();

  @override
  List<Set<Column>> get uniqueKeys => [
        {name},
      ];
}

/// 分类表
@DataClassName('CategoryEntity')
class Category extends Table {
  /// 分类唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 分类名称 ❄️
  TextColumn get name => text()();

  /// 分类类型 ℹ️🔍
  TextColumn get type => textEnum<CategoryType>()();

  /// 分类图标
  TextColumn get icon => text().nullable()();

  /// 禁止删除标记
  BoolColumn get undeletable => boolean().withDefault(const Constant(false))();

  /// 父级分类唯一标识 🔗🔍
  IntColumn get parentId =>
      integer().nullable().named('parent_id').references(Category, #id)();

  /// 排序权重 🔍
  IntColumn get weight => integer().withDefault(const Constant(0))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {name},
      ];
}

/// 相关方表
@DataClassName('StakeholderEntity')
class Stakeholder extends Table {
  /// 相关方唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 相关方名称 ❄️
  TextColumn get name => text()();

  /// 相关方类型 ℹ️🔍
  TextColumn get type => textEnum<StakeholderType>()();

  /// 相关方描述
  TextColumn get description => text().nullable()();

  /// 相关方图标
  TextColumn get icon => text().nullable()();

  /// 是否归档 🔍
  BoolColumn get archived => boolean().withDefault(const Constant(false))();

  /// 创建时间 🕗
  IntColumn get createdAt => integer().named('created_at')();

  /// 更新时间 🕗
  IntColumn get updatedAt => integer().named('updated_at')();

  @override
  List<Set<Column>> get uniqueKeys => [
        {name},
      ];
}

/// 借贷计划表
@DataClassName('LoanPlanEntity')
class LoanPlan extends Table {
  /// 借贷计划唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 关联的账户唯一标识 🔗🔍
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #id)();

  /// 年化利率
  RealColumn get rate => real().withDefault(const Constant(0.0))();

  /// 计划开始日期 📅🔍
  IntColumn get startDate => integer().named('start_date')();

  /// 计划结束日期 📅🔍
  IntColumn get endDate => integer().nullable().named('end_date')();

  /// 备注
  TextColumn get note => text().nullable()();
}

/// 借贷记录表
@DataClassName('LoanRecordEntity')
class LoanRecord extends Table {
  /// 关联的借贷计划唯一标识 🔑🔗🔍
  IntColumn get loanPlanId =>
      integer().named('loan_plan_id').references(LoanPlan, #id)();

  /// 借贷期数 🔑
  IntColumn get period => integer()();

  /// 本金 💰
  IntColumn get amount => integer()();

  /// 利息 💰
  IntColumn get interest => integer()();

  /// 实际发生日期 📅🔍
  IntColumn get date => integer()();

  /// 状态 🔍
  BoolColumn get status => boolean().withDefault(const Constant(false))();

  /// 备注
  TextColumn get note => text().nullable()();

  @override
  Set<Column> get primaryKey => {loanPlanId, period};
}

/// 交易表
@DataClassName('TransactionEntity')
class Transactions extends Table {
  /// 交易唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 交易类型 ℹ️🔍
  TextColumn get type => textEnum<TransactionType>()();

  /// 交易是否可见
  BoolColumn get visible => boolean().withDefault(const Constant(true))();

  /// 交易备注
  TextColumn get note => text().nullable()();

  /// 交易发生时间戳 🕗🔍
  IntColumn get timestamp => integer()();

  /// 创建时间 🕗
  IntColumn get createdAt => integer().named('created_at')();

  /// 更新时间 🕗
  IntColumn get updatedAt => integer().named('updated_at')();
}

/// 交易元数据表
@DataClassName('TransactionMetaEntity')
class TransactionMeta extends Table {
  /// 关联的交易唯一标识 🔑🔗
  IntColumn get transactionId =>
      integer().named('transaction_id').references(Transactions, #id)();

  /// 元数据作用域 🔑ℹ️
  TextColumn get scope => textEnum<TransactionMetaScope>()();

  /// 元数据键 🔑
  TextColumn get key => text()();

  /// 元数据值
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {transactionId, scope, key};
}

/// 交易金额变动明细表
@DataClassName('TransactionAmountDetailEntity')
class TransactionAmountDetail extends Table {
  /// 交易金额明细唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 关联的交易唯一标识 🔗🔍
  IntColumn get transactionId =>
      integer().named('transaction_id').references(Transactions, #id)();

  /// 关联的账户唯一标识 🔗🔍
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #id)();

  /// 金额变动类型 ℹ️
  TextColumn get type => textEnum<AmountChangeType>()();

  /// 交易时货币代码 🔗
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #code)();

  /// 交易币种金额 💰
  IntColumn get occurAmount => integer().named('occur_amount')();

  /// 账本本币金额 💰
  IntColumn get localAmount => integer().named('local_amount')();

  /// 金额变动发生时间戳 🕗🔍
  IntColumn get timestamp => integer()();
}

/// 交易收支统计明细表
@DataClassName('TransactionCountDetailEntity')
class TransactionCountDetail extends Table {
  /// 交易明细唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 关联的交易唯一标识 🔗🔍
  IntColumn get transactionId =>
      integer().named('transaction_id').references(Transactions, #id)();

  /// 关联的分类唯一标识 🔗🔍
  IntColumn get categoryId =>
      integer().named('category_id').references(Category, #id)();

  /// 相关方唯一标识 🔗🔍
  IntColumn get stakeholderId =>
      integer().nullable().named('stakeholder_id').references(Stakeholder, #id)();

  /// 项目唯一标识 🔗🔍
  IntColumn get projectId =>
      integer().nullable().named('project_id').references(Project, #id)();

  /// 记账金额 💰
  IntColumn get amount => integer()();
}

/// 交易减项表
@DataClassName('TransactionReduceEntity')
class TransactionReduce extends Table {
  /// 减项唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 关联的交易唯一标识 🔗🔍
  IntColumn get transactionId =>
      integer().named('transaction_id').references(Transactions, #id)();

  /// 货币代码 🔗
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #code)();

  /// 减项类型 ℹ️
  TextColumn get type => textEnum<CategoryType>()();

  /// 减项金额 💰
  IntColumn get amount => integer()();

  /// 减项说明
  TextColumn get description => text().nullable()();
}

/// 交易退款表
@DataClassName('TransactionRefundEntity')
class TransactionRefund extends Table {
  /// 退款唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 原始交易唯一标识 🔗🔍
  IntColumn get transactionId =>
      integer().named('transaction_id').references(Transactions, #id)();

  /// 退款金额 💰
  IntColumn get amount => integer()();

  /// 退款时间戳 🕗🔍
  IntColumn get timestamp => integer()();

  /// 退款说明
  TextColumn get description => text().nullable()();
}

/// 交易关联表
@DataClassName('TransactionRelationEntity')
class TransactionRelation extends Table {
  /// 源交易唯一标识 🔑🔗🔍
  IntColumn get sourceTransactionId =>
      integer().named('source_transaction_id').references(Transactions, #id)();

  /// 目标交易唯一标识 🔑🔗🔍
  IntColumn get targetTransactionId =>
      integer().named('target_transaction_id').references(Transactions, #id)();

  /// 关联关系类型 ℹ️
  TextColumn get type => textEnum<TransactionRelationType>()();

  @override
  Set<Column> get primaryKey => {sourceTransactionId, targetTransactionId};
}

/// 报销表
@DataClassName('ReimbursementEntity')
class Reimbursement extends Table {
  /// 报销唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 报销摘要
  TextColumn get summary => text()();

  /// 报销状态 🔍
  BoolColumn get status => boolean().withDefault(const Constant(false))();

  /// 创建时间 🕗
  IntColumn get createdAt => integer().named('created_at')();

  /// 更新时间 🕗
  IntColumn get updatedAt => integer().named('updated_at')();
}

/// 报销期望明细表
@DataClassName('ReimbursementExpectationEntity')
class ReimbursementExpectation extends Table {
  /// 报销期望明细唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 关联的报销唯一标识 🔗🔍
  IntColumn get reimbursementId =>
      integer().named('reimbursement_id').references(Reimbursement, #id)();

  /// 关联的交易收支明细唯一标识 🔗🔍
  IntColumn get transactionCountDetailId => integer()
      .named('transaction_count_detail_id')
      .references(TransactionCountDetail, #id)();

  /// 期望金额 💰
  IntColumn get amount => integer()();

  /// 期望说明
  TextColumn get description => text().nullable()();
}

/// 报销实际明细表
@DataClassName('ReimbursementActualEntity')
class ReimbursementActual extends Table {
  /// 报销实际明细唯一标识 🔑#️⃣
  IntColumn get id => integer().autoIncrement()();

  /// 关联的报销唯一标识 🔗🔍
  IntColumn get reimbursementId =>
      integer().named('reimbursement_id').references(Reimbursement, #id)();

  /// 关联的账户唯一标识 🔗🔍
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #id)();

  /// 实际金额 💰
  IntColumn get amount => integer()();

  /// 报销时间 📅🔍
  IntColumn get timestamp => integer()();

  /// 备注
  TextColumn get note => text().nullable()();
}
