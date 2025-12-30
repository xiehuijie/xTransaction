import 'package:drift/drift.dart';

// ==================== 枚举定义 ====================

/// 账户类型
enum AccountType { balance, credit, loan, invest, prepaid, bonus }

/// 账户元数据作用域
enum AccountMetaScope { system, custom }

/// 借贷类型
enum AccountLoanType { lend, borrow }

/// 货币来源
enum CurrencySource { system, custom }

/// 货币符号位置
enum CurrencyPosition { prefix, suffix }

/// 分类类型
enum CategoryType { expense, income, discount, cost }

/// 相关方类型
enum StakeholderType { person, merchant, company, other }

/// 交易类型
enum TransactionType { expense, income, transfer }

/// 交易关联类型
enum TransactionRelationType { afterwards, forwards, children, parent, related }

/// 交易元数据作用域
enum TransactionMetaScope { system, custom }

/// 投资类型
enum AccountInvestType { stock, fund, bond, crypto, other }

// ==================== 表定义 ====================

/// 货币表
@DataClassName('CurrencyEntity')
class Currency extends Table {
  TextColumn get currencyCode => text().named('currency_code')();
  TextColumn get name => text()();
  TextColumn get symbol => text()();
  TextColumn get position =>
      textEnum<CurrencyPosition>().withDefault(const Constant('prefix'))();
  IntColumn get decimal => integer().withDefault(const Constant(2))();
  TextColumn get icon => text().nullable()();
  TextColumn get source =>
      textEnum<CurrencySource>().withDefault(const Constant('system'))();

  @override
  Set<Column> get primaryKey => {currencyCode};
}

/// 账户表
@DataClassName('AccountEntity')
class Account extends Table {
  IntColumn get accountId => integer().autoIncrement().named('account_id')();
  TextColumn get name => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get icon => text().withDefault(const Constant(''))();
  TextColumn get type => textEnum<AccountType>()();
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #currencyCode)();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
  TextColumn get note => text().withDefault(const Constant(''))();

  @override
  List<Set<Column>> get uniqueKeys => [
    {name},
  ];
}

/// 账户元数据表
@DataClassName('AccountMetaEntity')
class AccountMeta extends Table {
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  TextColumn get scope => textEnum<AccountMetaScope>()();
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {accountId, scope, key};
}

/// 信用账户表
@DataClassName('CreditAccountEntity')
class AccountCredit extends Table {
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  IntColumn get creditLimit => integer().named('credit_limit')();
  IntColumn get billingCycleDay => integer().named('billing_cycle_day')();
  IntColumn get paymentDueDay => integer().named('payment_due_day')();

  @override
  Set<Column> get primaryKey => {accountId};
}

/// 赠送金账户表
@DataClassName('BonusAccountEntity')
class AccountBonus extends Table {
  IntColumn get bonusAccountId =>
      integer().named('bonus_account_id').references(Account, #accountId)();
  IntColumn get prepaidAccountId =>
      integer().named('prepaid_account_id').references(Account, #accountId)();

  @override
  Set<Column> get primaryKey => {bonusAccountId, prepaidAccountId};
}

/// 借贷账户表
@DataClassName('LoanAccountEntity')
class AccountLoan extends Table {
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  IntColumn get stakeholderId => integer()
      .named('stakeholder_id')
      .references(Stakeholder, #stakeholderId)();
  TextColumn get type => textEnum<AccountLoanType>()();
  IntColumn get amount => integer()();
  IntColumn get rate => integer()();
  IntColumn get startDate => integer().named('start_date')();
  IntColumn get endDate => integer().named('end_date')();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
  TextColumn get note => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {accountId};
}

/// 计划借贷账户表
@DataClassName('PlanLoanAccountEntity')
class AccountPlanLoan extends Table {
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  IntColumn get stakeholderId => integer()
      .named('stakeholder_id')
      .references(Stakeholder, #stakeholderId)();
  TextColumn get type => textEnum<AccountLoanType>()();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
  TextColumn get note => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {accountId};
}

/// 灵活借贷账户表
@DataClassName('FlexLoanAccountEntity')
class AccountFlexLoan extends Table {
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  IntColumn get stakeholderId => integer()
      .named('stakeholder_id')
      .references(Stakeholder, #stakeholderId)();
  TextColumn get type => textEnum<AccountLoanType>()();
  RealColumn get rate => real()();
  IntColumn get startDate => integer().named('start_date')();
  IntColumn get endDate => integer().named('end_date')();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
  TextColumn get note => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {accountId};
}

/// 投资账户表
@DataClassName('InvestAccountEntity')
class AccountInvest extends Table {
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  TextColumn get type => textEnum<AccountInvestType>()();
  TextColumn get code => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {accountId};
}

/// 借贷计划表
@DataClassName('LoanPlanEntity')
class LoanPlan extends Table {
  IntColumn get loanPlanId => integer().autoIncrement().named('loan_plan_id')();
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  IntColumn get amount => integer()();
  IntColumn get dueDate => integer().named('due_date')();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
  TextColumn get note => text().withDefault(const Constant(''))();
}

/// 借贷实况表
@DataClassName('LoanRecordEntity')
class LoanRecord extends Table {
  IntColumn get loanRecordId =>
      integer().autoIncrement().named('loan_record_id')();
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  IntColumn get amount => integer()();
  IntColumn get timestamp => integer()();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
  TextColumn get note => text().withDefault(const Constant(''))();
}

/// 账本表
@DataClassName('LedgerEntity')
class Ledger extends Table {
  IntColumn get ledgerId => integer().autoIncrement().named('ledger_id')();
  TextColumn get name => text()();
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #currencyCode)();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get photo => text().nullable()();
  BoolColumn get autoAccount =>
      boolean().named('auto_account').withDefault(const Constant(true))();
  BoolColumn get autoCategory =>
      boolean().named('auto_category').withDefault(const Constant(true))();
  BoolColumn get autoStakeholder =>
      boolean().named('auto_stakeholder').withDefault(const Constant(true))();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
  TextColumn get note => text().withDefault(const Constant(''))();

  @override
  List<Set<Column>> get uniqueKeys => [
    {name},
  ];
}

/// 账户账本关联表
@DataClassName('LedgerAccountRelationEntity')
class RelationAccountLedger extends Table {
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  IntColumn get ledgerId =>
      integer().named('ledger_id').references(Ledger, #ledgerId)();

  @override
  Set<Column> get primaryKey => {accountId, ledgerId};
}

/// 项目表
@DataClassName('ProjectEntity')
class Project extends Table {
  IntColumn get projectId => integer().autoIncrement().named('project_id')();
  IntColumn get ledgerId =>
      integer().named('ledger_id').references(Ledger, #ledgerId)();
  TextColumn get name => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  IntColumn get budget => integer().withDefault(const Constant(0))();
  TextColumn get icon => text().withDefault(const Constant(''))();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
  IntColumn get startDate => integer().nullable().named('start_date')();
  IntColumn get endDate => integer().nullable().named('end_date')();

  @override
  List<Set<Column>> get uniqueKeys => [
    {ledgerId, name},
  ];
}

/// 分类表
@DataClassName('CategoryEntity')
class Category extends Table {
  IntColumn get categoryId => integer().autoIncrement().named('category_id')();
  IntColumn get parentId => integer()
      .nullable()
      .named('parent_id')
      .references(Category, #categoryId)();
  TextColumn get name => text()();
  TextColumn get type => textEnum<CategoryType>()();
  TextColumn get icon => text().withDefault(const Constant(''))();
  IntColumn get order => integer().withDefault(const Constant(0))();

  @override
  List<Set<Column>> get uniqueKeys => [
    {name, type},
  ];
}

/// 分类账本关联表
@DataClassName('LedgerCategoryRelationEntity')
class RelationCategoryLedger extends Table {
  IntColumn get categoryId =>
      integer().named('category_id').references(Category, #categoryId)();
  IntColumn get ledgerId =>
      integer().named('ledger_id').references(Ledger, #ledgerId)();

  @override
  Set<Column> get primaryKey => {categoryId, ledgerId};
}

/// 相关方表
@DataClassName('StakeholderEntity')
class Stakeholder extends Table {
  IntColumn get stakeholderId =>
      integer().autoIncrement().named('stakeholder_id')();
  TextColumn get name => text()();
  TextColumn get type => textEnum<StakeholderType>()();
  TextColumn get avatar => text().nullable()();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get contact => text().nullable()();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
  TextColumn get note => text().withDefault(const Constant(''))();
}

/// 相关方账本关联表
@DataClassName('LedgerStakeholderRelationEntity')
class RelationStakeholderLedger extends Table {
  IntColumn get stakeholderId => integer()
      .named('stakeholder_id')
      .references(Stakeholder, #stakeholderId)();
  IntColumn get ledgerId =>
      integer().named('ledger_id').references(Ledger, #ledgerId)();

  @override
  Set<Column> get primaryKey => {stakeholderId, ledgerId};
}

/// 交易表
@DataClassName('TransactionEntity')
class Transactions extends Table {
  IntColumn get transactionId =>
      integer().autoIncrement().named('transaction_id')();
  IntColumn get ledgerId =>
      integer().named('ledger_id').references(Ledger, #ledgerId)();
  TextColumn get type => textEnum<TransactionType>()();
  IntColumn get timestamp => integer()();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
  IntColumn get stakeholderId => integer()
      .nullable()
      .named('stakeholder_id')
      .references(Stakeholder, #stakeholderId)();
  BoolColumn get hidden => boolean().withDefault(const Constant(false))();
  BoolColumn get excluded => boolean().withDefault(const Constant(false))();
  TextColumn get note => text().withDefault(const Constant(''))();
}

/// 交易元数据表
@DataClassName('TransactionMetaEntity')
class TransactionMeta extends Table {
  IntColumn get transactionId => integer()
      .named('transaction_id')
      .references(Transactions, #transactionId)();
  TextColumn get scope => textEnum<TransactionMetaScope>()();
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {transactionId, scope, key};
}

/// 交易金额明细表
@DataClassName('TransactionAmountDetailEntity')
class TransactionAmountDetail extends Table {
  IntColumn get amountDetailId =>
      integer().autoIncrement().named('amount_detail_id')();
  IntColumn get transactionId => integer()
      .named('transaction_id')
      .references(Transactions, #transactionId)();
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #currencyCode)();
  IntColumn get amount => integer()();
  IntColumn get realAmount => integer().named('real_amount')();
}

/// 交易分类明细表
@DataClassName('TransactionCategoryDetailEntity')
class TransactionCategoryDetail extends Table {
  IntColumn get categoryDetailId =>
      integer().autoIncrement().named('category_detail_id')();
  IntColumn get transactionId => integer()
      .named('transaction_id')
      .references(Transactions, #transactionId)();
  IntColumn get categoryId =>
      integer().named('category_id').references(Category, #categoryId)();
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #currencyCode)();
  IntColumn get amount => integer()();
  IntColumn get realAmount => integer().named('real_amount')();
}

/// 交易分期计划表
@DataClassName('TransactionInstallmentPlanEntity')
class TransactionInstallmentPlan extends Table {
  IntColumn get installmentPlanId =>
      integer().autoIncrement().named('installment_plan_id')();
  IntColumn get transactionId => integer()
      .named('transaction_id')
      .references(Transactions, #transactionId)();
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #currencyCode)();
}

/// 交易分期明细表
@DataClassName('TransactionInstallmentItemEntity')
class TransactionInstallmentItem extends Table {
  IntColumn get installmentItemId =>
      integer().autoIncrement().named('installment_item_id')();
  IntColumn get installmentPlanId => integer()
      .named('installment_plan_id')
      .references(TransactionInstallmentPlan, #installmentPlanId)();
  IntColumn get installmentNumber => integer().named('installment_number')();
  IntColumn get dueDate => integer().named('due_date')();
  IntColumn get capitalAmount => integer().named('capital_amount')();
  IntColumn get realCapitalAmount => integer().named('real_capital_amount')();
  IntColumn get interestAmount => integer().named('interest_amount')();
  IntColumn get realInterestAmount => integer().named('real_interest_amount')();
}

/// 交易减免表
@DataClassName('TransactionReduceEntity')
class TransactionReduce extends Table {
  IntColumn get transactionReduceId =>
      integer().autoIncrement().named('transaction_reduce_id')();
  IntColumn get transactionId => integer()
      .named('transaction_id')
      .references(Transactions, #transactionId)();
  IntColumn get categoryId =>
      integer().named('category_id').references(Category, #categoryId)();
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #currencyCode)();
  IntColumn get amount => integer()();
  IntColumn get realAmount => integer().named('real_amount')();
}

/// 交易退款表
@DataClassName('TransactionRefundEntity')
class TransactionRefund extends Table {
  IntColumn get transactionRefundId =>
      integer().autoIncrement().named('transaction_refund_id')();
  IntColumn get transactionId => integer()
      .named('transaction_id')
      .references(Transactions, #transactionId)();
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #currencyCode)();
  IntColumn get amount => integer()();
  IntColumn get realAmount => integer().named('real_amount')();
  IntColumn get timestamp => integer()();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
  TextColumn get note => text().withDefault(const Constant(''))();
}

/// 交易与项目关联表
@DataClassName('TransactionProjectRelationEntity')
class RelationProjectTransaction extends Table {
  IntColumn get transactionId => integer()
      .named('transaction_id')
      .references(Transactions, #transactionId)();
  IntColumn get projectId =>
      integer().named('project_id').references(Project, #projectId)();

  @override
  Set<Column> get primaryKey => {transactionId, projectId};
}

/// 交易关联表
@DataClassName('TransactionRelationEntity')
class RelationTransaction extends Table {
  IntColumn get targetTransactionId => integer()
      .named('target_transaction_id')
      .references(Transactions, #transactionId)();
  IntColumn get sourceTransactionId => integer()
      .named('source_transaction_id')
      .references(Transactions, #transactionId)();
  TextColumn get type => textEnum<TransactionRelationType>()();

  @override
  Set<Column> get primaryKey => {targetTransactionId, sourceTransactionId};
}

/// 报销计划表
@DataClassName('ReimbursementEntity')
class Reimbursement extends Table {
  IntColumn get reimbursementId =>
      integer().autoIncrement().named('reimbursement_id')();
  IntColumn get transactionId => integer()
      .named('transaction_id')
      .references(Transactions, #transactionId)();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
}

/// 报销预期表
@DataClassName('ReimbursementExpectationEntity')
class ReimbursementExpectation extends Table {
  IntColumn get reimbursementExpectationId =>
      integer().autoIncrement().named('reimbursement_expectation_id')();
  IntColumn get reimbursementId => integer()
      .named('reimbursement_id')
      .references(Reimbursement, #reimbursementId)();
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #currencyCode)();
  IntColumn get stakeholderId => integer()
      .nullable()
      .named('stakeholder_id')
      .references(Stakeholder, #stakeholderId)();
  IntColumn get amount => integer()();
  IntColumn get realAmount => integer().named('real_amount')();
  TextColumn get note => text().withDefault(const Constant(''))();
}

/// 报销实际表
@DataClassName('ReimbursementActualEntity')
class ReimbursementActual extends Table {
  IntColumn get reimbursementActualId =>
      integer().autoIncrement().named('reimbursement_actual_id')();
  IntColumn get reimbursementId => integer()
      .named('reimbursement_id')
      .references(Reimbursement, #reimbursementId)();
  IntColumn get accountId =>
      integer().named('account_id').references(Account, #accountId)();
  TextColumn get currencyCode =>
      text().named('currency_code').references(Currency, #currencyCode)();
  IntColumn get amount => integer()();
  IntColumn get realAmount => integer().named('real_amount')();
  IntColumn get timestamp => integer()();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
  TextColumn get note => text().withDefault(const Constant(''))();
}
