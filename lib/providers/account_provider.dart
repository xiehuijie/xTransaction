import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

import '../data/data.dart';
import 'providers.dart';

export '../data/constants/account_types.dart';

/// 所有账户列表 Provider
final allAccountsProvider = StreamProvider<List<AccountEntity>>((ref) {
  final accountDao = ref.watch(accountDaoProvider);
  return accountDao.watchAllAccounts();
});

/// 按类型分组的账户 Provider
final groupedAccountsProvider =
    FutureProvider<Map<AccountType, List<AccountEntity>>>((ref) async {
  final accountDao = ref.watch(accountDaoProvider);
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
  return accountDao.getAccountsByType(type);
});

/// 账户详情 Provider
final accountDetailProvider =
    FutureProvider.family<AccountEntity?, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  return accountDao.getAccountById(accountId);
});

/// 信用账户详情 Provider
final creditAccountDetailProvider =
    FutureProvider.family<CreditAccountEntity?, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  return accountDao.getCreditAccount(accountId);
});

/// 借贷账户详情 Provider
final loanAccountDetailProvider =
    FutureProvider.family<LoanAccountEntity?, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  return accountDao.getLoanAccount(accountId);
});

/// 借贷计划列表 Provider
final loanPlansProvider =
    FutureProvider.family<List<LoanPlanEntity>, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  return accountDao.getLoanPlansByAccountId(accountId);
});

/// 借贷记录列表 Provider
final loanRecordsProvider =
    FutureProvider.family<List<LoanRecordEntity>, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  return accountDao.getLoanRecordsByAccountId(accountId);
});

/// 账户元数据 Provider
final accountMetaProvider =
    FutureProvider.family<List<AccountMetaEntity>, int>((ref, accountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  return accountDao.getAccountMeta(accountId);
});

/// 所有货币列表 Provider
final allCurrenciesProvider = StreamProvider<List<CurrencyEntity>>((ref) {
  final currencyDao = ref.watch(currencyDaoProvider);
  return currencyDao.watchAllCurrencies();
});

/// 系统货币列表 Provider
final systemCurrenciesProvider =
    FutureProvider<List<CurrencyEntity>>((ref) async {
  final currencyDao = ref.watch(currencyDaoProvider);
  return currencyDao.getSystemCurrencies();
});

/// 自定义货币列表 Provider
final customCurrenciesProvider =
    FutureProvider<List<CurrencyEntity>>((ref) async {
  final currencyDao = ref.watch(currencyDaoProvider);
  return currencyDao.getCustomCurrencies();
});

/// 所有相关方列表 Provider
final allStakeholdersProvider = StreamProvider<List<StakeholderEntity>>((ref) {
  final stakeholderDao = ref.watch(stakeholderDaoProvider);
  return stakeholderDao.watchAllStakeholders();
});

/// 预付款账户关联的赠送金账户 Provider
final bonusAccountsByPrepaidProvider =
    FutureProvider.family<List<BonusAccountEntity>, int>(
        (ref, prepaidAccountId) async {
  final accountDao = ref.watch(accountDaoProvider);
  return accountDao.getBonusAccountsByPrepaidId(prepaidAccountId);
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

    // 保存赠送金启用状态
    await accountDao.upsertAccountMeta(
      AccountMetaCompanion.insert(
        accountId: accountId,
        scope: AccountMetaScope.system,
        key: AccountMetaKeys.enableBonus,
        value: enableBonus.toString(),
      ),
    );

    // 保存赠送金扣减模式
    await accountDao.upsertAccountMeta(
      AccountMetaCompanion.insert(
        accountId: accountId,
        scope: AccountMetaScope.system,
        key: AccountMetaKeys.bonusDeductMode,
        value: bonusDeductMode,
      ),
    );

    // 如果启用了赠送金，创建关联的赠送金账户
    if (enableBonus) {
      final bonusAccountId = await accountDao.insertAccount(
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

      // 建立赠送金账户关联
      await accountDao.insertBonusAccount(
        AccountBonusCompanion.insert(
          bonusAccountId: bonusAccountId,
          prepaidAccountId: accountId,
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

  /// 创建借贷账户
  Future<int> createLoanAccount({
    required String name,
    required String currencyCode,
    required int stakeholderId,
    required AccountLoanType loanType,
    required int amount,
    required int rate,
    required int startDate,
    required int endDate,
    String description = '',
    String icon = '',
    String note = '',
    String loanNote = '',
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

    // 保存借贷账户详情
    await accountDao.insertLoanAccount(
      AccountLoanCompanion.insert(
        accountId: Value(accountId),
        stakeholderId: stakeholderId,
        type: loanType,
        amount: amount,
        rate: rate,
        startDate: startDate,
        endDate: endDate,
        archived: const Value(false),
        note: Value(loanNote),
      ),
    );

    // 保存借贷计划
    if (plans != null) {
      for (final plan in plans) {
        await accountDao.insertLoanPlan(
          LoanPlanCompanion.insert(
            accountId: accountId,
            amount: plan.amount,
            dueDate: plan.dueDate,
            createdAt: now,
            updatedAt: now,
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
    required InvestType investType,
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

    // 保存投资类型
    await accountDao.upsertAccountMeta(
      AccountMetaCompanion.insert(
        accountId: accountId,
        scope: AccountMetaScope.system,
        key: AccountMetaKeys.investType,
        value: investType.name,
      ),
    );

    // 保存投资代码（股票/基金/虚拟货币代号）
    if (investCode != null && investCode.isNotEmpty) {
      await accountDao.upsertAccountMeta(
        AccountMetaCompanion.insert(
          accountId: accountId,
          scope: AccountMetaScope.system,
          key: AccountMetaKeys.investCode,
          value: investCode,
        ),
      );
    }

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

  /// 更新借贷账户详情
  Future<bool> updateLoanAccount(LoanAccountEntity loanAccount) async {
    return accountDao.updateLoanAccount(loanAccount);
  }

  /// 删除账户
  Future<int> deleteAccount(int accountId) async {
    return accountDao.deleteAccount(accountId);
  }

  /// 添加借贷计划
  Future<int> addLoanPlan({
    required int accountId,
    required int amount,
    required int dueDate,
    String note = '',
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    return accountDao.insertLoanPlan(
      LoanPlanCompanion.insert(
        accountId: accountId,
        amount: amount,
        dueDate: dueDate,
        createdAt: now,
        updatedAt: now,
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
  final int amount;
  final int dueDate;
  final String note;

  const LoanPlanData({
    required this.amount,
    required this.dueDate,
    this.note = '',
  });
}

/// 账户服务 Provider
final accountServiceProvider = Provider<AccountService>((ref) {
  final accountDao = ref.watch(accountDaoProvider);
  final currencyDao = ref.watch(currencyDaoProvider);
  return AccountService(accountDao: accountDao, currencyDao: currencyDao);
});
