import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

import '../data/data.dart';
import 'providers.dart';

export '../data/constants/account_types.dart';

/// 所有账户列表 Provider（当前账本）
final allAccountsProvider = StreamProvider<List<AccountEntity>>((ref) {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return const Stream.empty();
  return accountDao.watchAllAccounts();
});

/// 按类型分组的账户 Provider
final groupedAccountsProvider =
    FutureProvider<Map<AccountType, List<AccountEntity>>>((ref) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return {};
  
  final accounts = await accountDao.getAllAccounts();

  final Map<AccountType, List<AccountEntity>> grouped = {};
  for (final type in AccountType.values) {
    grouped[type] = [];
  }
  for (final account in accounts) {
    grouped[account.type]!.add(account);
  }
  return grouped;
});

/// 特定类型账户列表 Provider
final accountsByTypeProvider =
    FutureProvider.family<List<AccountEntity>, AccountType>((ref, type) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return [];
  return accountDao.getAccountsByType(type);
});

/// 账户详情 Provider
final accountDetailProvider =
    FutureProvider.family<AccountEntity?, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return null;
  return accountDao.getAccountById(accountId);
});

/// 信用账户详情 Provider
final creditAccountDetailProvider =
    FutureProvider.family<CreditAccountEntity?, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return null;
  return accountDao.getCreditAccount(accountId);
});

/// 灵活借贷账户详情 Provider
final flexLoanAccountDetailProvider =
    FutureProvider.family<FlexLoanAccountEntity?, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return null;
  return accountDao.getFlexLoanAccount(accountId);
});

/// 计划借贷账户详情 Provider
final planLoanAccountDetailProvider =
    FutureProvider.family<PlanLoanAccountEntity?, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return null;
  return accountDao.getPlanLoanAccount(accountId);
});

/// 预付账户详情 Provider
final prepaidAccountDetailProvider =
    FutureProvider.family<PrepaidAccountEntity?, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return null;
  return accountDao.getPrepaidAccount(accountId);
});

/// 投资账户详情 Provider
final investAccountDetailProvider =
    FutureProvider.family<InvestAccountEntity?, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return null;
  return accountDao.getInvestAccount(accountId);
});

/// 借贷计划列表 Provider
final loanPlansProvider =
    FutureProvider.family<List<LoanPlanEntity>, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return [];
  return accountDao.getLoanPlansByAccountId(accountId);
});

/// 借贷记录列表 Provider
final loanRecordsProvider =
    FutureProvider.family<List<LoanRecordEntity>, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return [];
  return accountDao.getLoanRecordsByAccountId(accountId);
});

/// 账户元数据 Provider
final accountMetaProvider =
    FutureProvider.family<List<AccountMetaEntity>, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  if (accountDao == null) return [];
  return accountDao.getAccountMeta(accountId);
});

/// 所有货币列表 Provider
final allCurrenciesProvider = StreamProvider<List<CurrencyEntity>>((ref) {
  final currencyDao = ref.watch(currencyDaoProvider);
  if (currencyDao == null) return const Stream.empty();
  return currencyDao.watchAllCurrencies();
});

/// 系统货币列表 Provider
final systemCurrenciesProvider =
    FutureProvider<List<CurrencyEntity>>((ref) async {
  final currencyDao = ref.watch(currencyDaoProvider);
  if (currencyDao == null) return [];
  return currencyDao.getSystemCurrencies();
});

/// 自定义货币列表 Provider
final customCurrenciesProvider =
    FutureProvider<List<CurrencyEntity>>((ref) async {
  final currencyDao = ref.watch(currencyDaoProvider);
  if (currencyDao == null) return [];
  return currencyDao.getCustomCurrencies();
});

/// 所有相关方列表 Provider
final allStakeholdersProvider = StreamProvider<List<StakeholderEntity>>((ref) {
  final stakeholderDao = ref.watch(stakeholderDaoProvider);
  if (stakeholderDao == null) return const Stream.empty();
  return stakeholderDao.watchAllStakeholders();
});

/// 账户管理服务
class AccountService {
  final AccountDao accountDao;
  final CurrencyDao currencyDao;

  AccountService({required this.accountDao, required this.currencyDao});

  /// 创建余额账户
  Future<int> createBalanceAccount({
    required String name,
    required String currencyCode,
    String description = '',
    String icon = '',
    String note = '',
    int? initialBalance,
    Map<String, String>? systemMeta,
    Map<String, String>? customMeta,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final accountId = await accountDao.insertAccount(
      AccountCompanion.insert(
        name: name,
        description: Value(description),
        icon: Value(icon),
        type: AccountType.balance,
        currencyCode: currencyCode,
        createdAt: now,
        updatedAt: now,
        note: Value(note),
      ),
    );

    // 保存初始余额元数据
    if (initialBalance != null) {
      await accountDao.upsertAccountMeta(
        AccountMetaCompanion.insert(
          accountId: accountId,
          scope: AccountMetaScope.system,
          key: AccountMetaKeys.initialBalance,
          value: initialBalance.toString(),
        ),
      );
    }

    // 保存系统级元数据
    if (systemMeta != null) {
      for (final entry in systemMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.system,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    // 保存用户自定义元数据
    if (customMeta != null) {
      for (final entry in customMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.custom,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    return accountId;
  }

  /// 创建信用账户
  Future<int> createCreditAccount({
    required String name,
    required String currencyCode,
    required int creditLimit,
    required int billingCycleDay,
    required int paymentDueDay,
    String description = '',
    String icon = '',
    String note = '',
    int? initialBalance,
    Map<String, String>? systemMeta,
    Map<String, String>? customMeta,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final accountId = await accountDao.insertAccount(
      AccountCompanion.insert(
        name: name,
        description: Value(description),
        icon: Value(icon),
        type: AccountType.credit,
        currencyCode: currencyCode,
        createdAt: now,
        updatedAt: now,
        note: Value(note),
      ),
    );

    // 保存信用账户详情
    await accountDao.insertCreditAccount(
      AccountCreditCompanion.insert(
        accountId: Value(accountId),
        creditLimit: creditLimit,
        billingCycleDay: billingCycleDay,
        paymentDueDay: paymentDueDay,
      ),
    );

    // 保存初始余额元数据
    if (initialBalance != null) {
      await accountDao.upsertAccountMeta(
        AccountMetaCompanion.insert(
          accountId: accountId,
          scope: AccountMetaScope.system,
          key: AccountMetaKeys.initialBalance,
          value: initialBalance.toString(),
        ),
      );
    }

    // 保存系统级元数据
    if (systemMeta != null) {
      for (final entry in systemMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.system,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    // 保存用户自定义元数据
    if (customMeta != null) {
      for (final entry in customMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.custom,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    return accountId;
  }

  /// 创建预付款账户
  Future<int> createPrepaidAccount({
    required String name,
    required String currencyCode,
    String description = '',
    String icon = '',
    String note = '',
    int? initialBalance,
    bool enableBonus = false,
    String bonusDeductMode = 'first',
    String? bonusName,
    String? bonusCurrencyCode,
    int? bonusInitialBalance,
    Map<String, String>? systemMeta,
    Map<String, String>? customMeta,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final accountId = await accountDao.insertAccount(
      AccountCompanion.insert(
        name: name,
        description: Value(description),
        icon: Value(icon),
        type: AccountType.prepaid,
        currencyCode: currencyCode,
        createdAt: now,
        updatedAt: now,
        note: Value(note),
      ),
    );

    // 保存初始余额元数据
    if (initialBalance != null) {
      await accountDao.upsertAccountMeta(
        AccountMetaCompanion.insert(
          accountId: accountId,
          scope: AccountMetaScope.system,
          key: AccountMetaKeys.initialBalance,
          value: initialBalance.toString(),
        ),
      );
    }

    // 创建赠送金账户（如果启用）
    int? bonusAccountId;
    if (enableBonus) {
      bonusAccountId = await accountDao.insertAccount(
        AccountCompanion.insert(
          name: bonusName ?? '$name-赠送金',
          description: Value('$name 的赠送金账户'),
          icon: Value(icon),
          type: AccountType.bonus,
          currencyCode: bonusCurrencyCode ?? currencyCode,
          createdAt: now,
          updatedAt: now,
          note: Value(''),
        ),
      );

      // 保存赠送金初始余额
      if (bonusInitialBalance != null) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: bonusAccountId,
            scope: AccountMetaScope.system,
            key: AccountMetaKeys.initialBalance,
            value: bonusInitialBalance.toString(),
          ),
        );
      }
    }

    // 保存预付账户详情（包含赠送金关联）
    // 注意：如果没有赠送金账户，使用主账户ID作为占位
    await accountDao.insertPrepaidAccount(
      AccountPrepaidCompanion.insert(
        prepaidAccountId: Value(accountId),
        bonusAccountId: bonusAccountId ?? accountId,
        bonusMode: bonusDeductMode == 'first' ? AccountBonusMode.first : AccountBonusMode.same,
      ),
    );

    // 保存赠送金启用状态
    await accountDao.upsertAccountMeta(
      AccountMetaCompanion.insert(
        accountId: accountId,
        scope: AccountMetaScope.system,
        key: AccountMetaKeys.enableBonus,
        value: enableBonus.toString(),
      ),
    );

    // 保存系统级元数据
    if (systemMeta != null) {
      for (final entry in systemMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.system,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    // 保存用户自定义元数据
    if (customMeta != null) {
      for (final entry in customMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.custom,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    return accountId;
  }

  /// 创建灵活借贷账户
  Future<int> createFlexLoanAccount({
    required String name,
    required String currencyCode,
    required int stakeholderId,
    required AccountLoanType loanType,
    required double rate,
    required LoanInterestCycle cycle,
    required int startDate,
    required int endDate,
    String description = '',
    String icon = '',
    String note = '',
    Map<String, String>? systemMeta,
    Map<String, String>? customMeta,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final accountId = await accountDao.insertAccount(
      AccountCompanion.insert(
        name: name,
        description: Value(description),
        icon: Value(icon),
        type: AccountType.loan,
        currencyCode: currencyCode,
        createdAt: now,
        updatedAt: now,
        note: Value(note),
      ),
    );

    // 保存灵活借贷账户详情
    await accountDao.insertFlexLoanAccount(
      AccountFlexLoanCompanion.insert(
        accountId: Value(accountId),
        stakeholderId: stakeholderId,
        type: loanType,
        rate: rate,
        cycle: cycle,
        startDate: startDate,
        endDate: endDate,
        archived: const Value(false),
      ),
    );

    // 保存系统级元数据
    if (systemMeta != null) {
      for (final entry in systemMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.system,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    // 保存用户自定义元数据
    if (customMeta != null) {
      for (final entry in customMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.custom,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    return accountId;
  }

  /// 创建计划借贷账户
  Future<int> createPlanLoanAccount({
    required String name,
    required String currencyCode,
    required int stakeholderId,
    required AccountLoanType loanType,
    String description = '',
    String icon = '',
    String note = '',
    List<LoanPlanData>? plans,
    Map<String, String>? systemMeta,
    Map<String, String>? customMeta,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final accountId = await accountDao.insertAccount(
      AccountCompanion.insert(
        name: name,
        description: Value(description),
        icon: Value(icon),
        type: AccountType.loan,
        currencyCode: currencyCode,
        createdAt: now,
        updatedAt: now,
        note: Value(note),
      ),
    );

    // 保存计划借贷账户详情
    await accountDao.insertPlanLoanAccount(
      AccountPlanLoanCompanion.insert(
        accountId: Value(accountId),
        stakeholderId: stakeholderId,
        type: loanType,
        archived: const Value(false),
      ),
    );

    // 保存借贷计划
    if (plans != null) {
      for (final plan in plans) {
        await accountDao.insertLoanPlan(
          LoanPlanCompanion.insert(
            accountId: accountId,
            rate: Value(plan.rate),
            startDate: plan.startDate,
            endDate: Value(plan.endDate),
            note: Value(plan.note),
          ),
        );
      }
    }

    // 保存系统级元数据
    if (systemMeta != null) {
      for (final entry in systemMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.system,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    // 保存用户自定义元数据
    if (customMeta != null) {
      for (final entry in customMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.custom,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    return accountId;
  }

  /// 创建投资账户
  Future<int> createInvestAccount({
    required String name,
    required String currencyCode,
    required AccountInvestType investType,
    String? investCode,
    String description = '',
    String icon = '',
    String note = '',
    int? initialBalance,
    Map<String, String>? systemMeta,
    Map<String, String>? customMeta,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final accountId = await accountDao.insertAccount(
      AccountCompanion.insert(
        name: name,
        description: Value(description),
        icon: Value(icon),
        type: AccountType.invest,
        currencyCode: currencyCode,
        createdAt: now,
        updatedAt: now,
        note: Value(note),
      ),
    );

    // 保存投资账户详情
    await accountDao.insertInvestAccount(
      AccountInvestCompanion.insert(
        accountId: Value(accountId),
        type: investType,
        code: Value(investCode),
      ),
    );

    // 保存初始余额元数据
    if (initialBalance != null) {
      await accountDao.upsertAccountMeta(
        AccountMetaCompanion.insert(
          accountId: accountId,
          scope: AccountMetaScope.system,
          key: AccountMetaKeys.initialBalance,
          value: initialBalance.toString(),
        ),
      );
    }

    // 保存系统级元数据
    if (systemMeta != null) {
      for (final entry in systemMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.system,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    // 保存用户自定义元数据
    if (customMeta != null) {
      for (final entry in customMeta.entries) {
        await accountDao.upsertAccountMeta(
          AccountMetaCompanion.insert(
            accountId: accountId,
            scope: AccountMetaScope.custom,
            key: entry.key,
            value: entry.value,
          ),
        );
      }
    }

    return accountId;
  }

  /// 更新账户基本信息
  Future<bool> updateAccount(AccountEntity account) async {
    return accountDao.updateAccount(account.copyWith(
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    ));
  }

  /// 更新信用账户详情
  Future<bool> updateCreditAccount(CreditAccountEntity creditAccount) async {
    return accountDao.updateCreditAccount(creditAccount);
  }

  /// 更新灵活借贷账户详情
  Future<bool> updateFlexLoanAccount(FlexLoanAccountEntity flexLoanAccount) async {
    return accountDao.updateFlexLoanAccount(flexLoanAccount);
  }

  /// 更新计划借贷账户详情
  Future<bool> updatePlanLoanAccount(PlanLoanAccountEntity planLoanAccount) async {
    return accountDao.updatePlanLoanAccount(planLoanAccount);
  }

  /// 更新预付账户详情
  Future<bool> updatePrepaidAccount(PrepaidAccountEntity prepaidAccount) async {
    return accountDao.updatePrepaidAccount(prepaidAccount);
  }

  /// 更新投资账户详情
  Future<bool> updateInvestAccount(InvestAccountEntity investAccount) async {
    return accountDao.updateInvestAccount(investAccount);
  }

  /// 删除账户
  Future<int> deleteAccount(int accountId) async {
    return accountDao.deleteAccount(accountId);
  }

  // ==================== 获取方法 ====================

  /// 获取账户详情
  Future<AccountEntity?> getAccountById(int accountId) {
    return accountDao.getAccountById(accountId);
  }

  /// 获取信用账户详情
  Future<CreditAccountEntity?> getCreditAccount(int accountId) {
    return accountDao.getCreditAccount(accountId);
  }

  /// 获取账户元数据
  Future<List<AccountMetaEntity>> getAccountMeta(int accountId) {
    return accountDao.getAccountMeta(accountId);
  }

  /// 获取灵活借贷账户详情
  Future<FlexLoanAccountEntity?> getFlexLoanAccount(int accountId) {
    return accountDao.getFlexLoanAccount(accountId);
  }

  /// 根据ID获取相关方
  Future<StakeholderEntity?> getStakeholderById(int stakeholderId) async {
    // TODO: 需要通过 StakeholderDao 获取
    return null;
  }

  /// 获取账户的借贷计划
  Future<List<LoanPlanEntity>> getLoanPlansByAccountId(int accountId) {
    return accountDao.getLoanPlansByAccountId(accountId);
  }

  /// 获取预付账户的赠送金账户
  Future<List<PrepaidAccountEntity>> getBonusAccountsByPrepaidId(int prepaidAccountId) async {
    // 通过 PrepaidAccount 表查询
    final prepaidAccount = await accountDao.getPrepaidAccount(prepaidAccountId);
    if (prepaidAccount != null && prepaidAccount.bonusAccountId != null) {
      return [prepaidAccount];
    }
    return [];
  }

  /// 添加借贷计划
  Future<int> addLoanPlan({
    required int accountId,
    required int startDate,
    double rate = 0.0,
    int? endDate,
    String note = '',
  }) async {
    return accountDao.insertLoanPlan(
      LoanPlanCompanion.insert(
        accountId: accountId,
        rate: Value(rate),
        startDate: startDate,
        endDate: Value(endDate),
        note: Value(note),
      ),
    );
  }

  /// 删除借贷计划
  Future<int> deleteLoanPlan(int planId) async {
    return accountDao.deleteLoanPlan(planId);
  }

  /// 更新账户元数据
  Future<void> updateAccountMeta({
    required int accountId,
    required AccountMetaScope scope,
    required String key,
    required String value,
  }) async {
    await accountDao.upsertAccountMeta(
      AccountMetaCompanion.insert(
        accountId: accountId,
        scope: scope,
        key: key,
        value: value,
      ),
    );
  }

  /// 删除账户元数据
  Future<int> deleteAccountMeta({
    required int accountId,
    required AccountMetaScope scope,
    required String key,
  }) async {
    return accountDao.deleteAccountMeta(accountId, scope, key);
  }
}

/// 借贷计划数据
class LoanPlanData {
  final double rate;
  final int startDate;
  final int? endDate;
  final String note;

  const LoanPlanData({
    this.rate = 0.0,
    required this.startDate,
    this.endDate,
    this.note = '',
  });
}

/// 账户服务 Provider
final accountServiceProvider = Provider<AccountService?>((ref) {
  final accountDao = ref.watch(accountDaoProvider);
  final currencyDao = ref.watch(currencyDaoProvider);
  if (accountDao == null || currencyDao == null) return null;
  return AccountService(accountDao: accountDao, currencyDao: currencyDao);
});
