/// 初始化流程状态管理
/// 
/// 管理应用初始化向导中的所有预配置数据

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/constants/currency_data.dart';
import '../../data/constants/account_types.dart';
import '../../data/database/tables.dart';

// ==================== 数据模型 ====================

/// 预配置货币数据
class PreConfigCurrency {
  final String currencyCode;
  final String name;
  final String symbol;
  final int decimal;
  final String? icon;
  final bool isCustom;
  final String position; // 'prefix' or 'suffix'

  const PreConfigCurrency({
    required this.currencyCode,
    required this.name,
    required this.symbol,
    this.decimal = 2,
    this.icon,
    this.isCustom = false,
    this.position = 'prefix',
  });

  PreConfigCurrency copyWith({
    String? currencyCode,
    String? name,
    String? symbol,
    int? decimal,
    String? icon,
    bool? isCustom,
    String? position,
  }) {
    return PreConfigCurrency(
      currencyCode: currencyCode ?? this.currencyCode,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      decimal: decimal ?? this.decimal,
      icon: icon ?? this.icon,
      isCustom: isCustom ?? this.isCustom,
      position: position ?? this.position,
    );
  }

  /// 从货币模板创建
  factory PreConfigCurrency.fromTemplate(CurrencyTemplate template) {
    return PreConfigCurrency(
      currencyCode: template.code,
      name: template.nameCN,
      symbol: template.symbol,
      decimal: template.decimal,
      icon: template.iconString,
      isCustom: false,
      position: template.symbolPrefix ? 'prefix' : 'suffix',
    );
  }
}

/// 预配置账户数据
class PreConfigAccount {
  final String name;
  final String currencyCode;
  final AccountType type;
  final String? icon;
  final String description;
  
  /// 初始余额（以最小货币单位存储）
  final int initialBalance;
  
  // 信用账户特有字段
  final int? creditLimit;
  final int? billingCycleDay;
  final int? paymentDueDay;
  
  // 预付账户特有字段
  final bool enableBonus;
  final String? bonusDeductMode; // 'first', 'last', 'same'
  final int? bonusInitialBalance;
  
  // 投资账户特有字段
  final InvestType? investType;
  final String? investCode;
  
  // 借贷账户特有字段
  final AccountLoanType? loanType;
  final int? loanAmount;
  final int? loanRate; // 基点
  final int? loanStartDate;
  final int? loanEndDate;
  final List<PreConfigLoanPlan>? loanPlans;
  
  // 元数据
  final Map<String, String> metadata;

  const PreConfigAccount({
    required this.name,
    required this.currencyCode,
    this.type = AccountType.balance,
    this.icon,
    this.description = '',
    this.initialBalance = 0,
    this.creditLimit,
    this.billingCycleDay,
    this.paymentDueDay,
    this.enableBonus = false,
    this.bonusDeductMode,
    this.bonusInitialBalance,
    this.investType,
    this.investCode,
    this.loanType,
    this.loanAmount,
    this.loanRate,
    this.loanStartDate,
    this.loanEndDate,
    this.loanPlans,
    this.metadata = const {},
  });

  /// 获取账户类型名称
  String get typeName {
    final info = accountTypeInfoMap[type];
    return info?.name ?? type.name;
  }

  PreConfigAccount copyWith({
    String? name,
    String? currencyCode,
    AccountType? type,
    String? icon,
    String? description,
    int? initialBalance,
    int? creditLimit,
    int? billingCycleDay,
    int? paymentDueDay,
    bool? enableBonus,
    String? bonusDeductMode,
    int? bonusInitialBalance,
    InvestType? investType,
    String? investCode,
    AccountLoanType? loanType,
    int? loanAmount,
    int? loanRate,
    int? loanStartDate,
    int? loanEndDate,
    List<PreConfigLoanPlan>? loanPlans,
    Map<String, String>? metadata,
  }) {
    return PreConfigAccount(
      name: name ?? this.name,
      currencyCode: currencyCode ?? this.currencyCode,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      initialBalance: initialBalance ?? this.initialBalance,
      creditLimit: creditLimit ?? this.creditLimit,
      billingCycleDay: billingCycleDay ?? this.billingCycleDay,
      paymentDueDay: paymentDueDay ?? this.paymentDueDay,
      enableBonus: enableBonus ?? this.enableBonus,
      bonusDeductMode: bonusDeductMode ?? this.bonusDeductMode,
      bonusInitialBalance: bonusInitialBalance ?? this.bonusInitialBalance,
      investType: investType ?? this.investType,
      investCode: investCode ?? this.investCode,
      loanType: loanType ?? this.loanType,
      loanAmount: loanAmount ?? this.loanAmount,
      loanRate: loanRate ?? this.loanRate,
      loanStartDate: loanStartDate ?? this.loanStartDate,
      loanEndDate: loanEndDate ?? this.loanEndDate,
      loanPlans: loanPlans ?? this.loanPlans,
      metadata: metadata ?? this.metadata,
    );
  }
}

/// 借贷计划
class PreConfigLoanPlan {
  final int amount;
  final int dueDate;
  final String? note;

  const PreConfigLoanPlan({
    required this.amount,
    required this.dueDate,
    this.note,
  });

  PreConfigLoanPlan copyWith({
    int? amount,
    int? dueDate,
    String? note,
  }) {
    return PreConfigLoanPlan(
      amount: amount ?? this.amount,
      dueDate: dueDate ?? this.dueDate,
      note: note ?? this.note,
    );
  }
}

/// 预配置分类数据
class PreConfigCategory {
  final String name;
  final CategoryType type;
  final String? icon;
  final int? parentIndex; // 父分类在列表中的索引
  final List<PreConfigCategory> children;

  const PreConfigCategory({
    required this.name,
    required this.type,
    this.icon,
    this.parentIndex,
    this.children = const [],
  });

  PreConfigCategory copyWith({
    String? name,
    CategoryType? type,
    String? icon,
    int? parentIndex,
    List<PreConfigCategory>? children,
  }) {
    return PreConfigCategory(
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      parentIndex: parentIndex ?? this.parentIndex,
      children: children ?? this.children,
    );
  }
}

/// 预配置账本数据
class PreConfigLedger {
  final String name;
  final String currencyCode;
  final String? description;
  final String? icon;
  final bool isDefault;
  final bool autoAccount; // 是否自动包含新增账户
  final bool autoCategory; // 是否自动包含新增分类
  final Set<String> selectedAccountIds;
  final Set<String> selectedCategoryIds;

  const PreConfigLedger({
    required this.name,
    this.currencyCode = 'CNY',
    this.description,
    this.icon,
    this.isDefault = false,
    this.autoAccount = true,
    this.autoCategory = true,
    this.selectedAccountIds = const {},
    this.selectedCategoryIds = const {},
  });

  PreConfigLedger copyWith({
    String? name,
    String? currencyCode,
    String? description,
    String? icon,
    bool? isDefault,
    bool? autoAccount,
    bool? autoCategory,
    Set<String>? selectedAccountIds,
    Set<String>? selectedCategoryIds,
  }) {
    return PreConfigLedger(
      name: name ?? this.name,
      currencyCode: currencyCode ?? this.currencyCode,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      isDefault: isDefault ?? this.isDefault,
      autoAccount: autoAccount ?? this.autoAccount,
      autoCategory: autoCategory ?? this.autoCategory,
      selectedAccountIds: selectedAccountIds ?? this.selectedAccountIds,
      selectedCategoryIds: selectedCategoryIds ?? this.selectedCategoryIds,
    );
  }
}

// ==================== 状态定义 ====================

/// 初始化配置状态
class OnboardingState {
  // 功能开关
  final bool enableMultiCurrency;
  final bool enableMultiAccount;
  final bool enableMultiLedger;
  final bool enableBudgetManagement;
  final bool enableBiometric;

  // 货币配置
  final String? defaultCurrency; // 默认货币代码
  final Set<String> availableCurrencies; // 选中的系统货币代码
  final List<PreConfigCurrency> customCurrencies; // 自定义货币列表

  // 账户配置
  final List<PreConfigAccount> accounts;

  // 分类配置
  final List<PreConfigCategory> expenseCategories;
  final List<PreConfigCategory> incomeCategories;
  final List<PreConfigCategory> discountCategories;
  final List<PreConfigCategory> costCategories;

  // 账本配置
  final List<PreConfigLedger> ledgers;

  const OnboardingState({
    this.enableMultiCurrency = false,
    this.enableMultiAccount = true,
    this.enableMultiLedger = false,
    this.enableBudgetManagement = true,
    this.enableBiometric = false,
    this.defaultCurrency = 'CNY',
    this.availableCurrencies = const {'CNY', 'USD'},
    this.customCurrencies = const [],
    this.accounts = const [],
    this.expenseCategories = const [],
    this.incomeCategories = const [],
    this.discountCategories = const [],
    this.costCategories = const [],
    this.ledgers = const [],
  });

  /// 默认初始状态
  factory OnboardingState.initial() {
    return OnboardingState(
      defaultCurrency: 'CNY',
      availableCurrencies: const {'CNY', 'USD'},
      accounts: const [
        PreConfigAccount(
          name: '默认账户',
          currencyCode: 'CNY',
          type: AccountType.balance,
          icon: 'material:account_balance_wallet',
        ),
      ],
      expenseCategories: _defaultExpenseCategories,
      incomeCategories: _defaultIncomeCategories,
      ledgers: const [
        PreConfigLedger(
          name: '日常账本',
          currencyCode: 'CNY',
          description: '记录日常收支',
          isDefault: true,
        ),
      ],
    );
  }

  OnboardingState copyWith({
    bool? enableMultiCurrency,
    bool? enableMultiAccount,
    bool? enableMultiLedger,
    bool? enableBudgetManagement,
    bool? enableBiometric,
    String? defaultCurrency,
    Set<String>? availableCurrencies,
    List<PreConfigCurrency>? customCurrencies,
    List<PreConfigAccount>? accounts,
    List<PreConfigCategory>? expenseCategories,
    List<PreConfigCategory>? incomeCategories,
    List<PreConfigCategory>? discountCategories,
    List<PreConfigCategory>? costCategories,
    List<PreConfigLedger>? ledgers,
  }) {
    return OnboardingState(
      enableMultiCurrency: enableMultiCurrency ?? this.enableMultiCurrency,
      enableMultiAccount: enableMultiAccount ?? this.enableMultiAccount,
      enableMultiLedger: enableMultiLedger ?? this.enableMultiLedger,
      enableBudgetManagement: enableBudgetManagement ?? this.enableBudgetManagement,
      enableBiometric: enableBiometric ?? this.enableBiometric,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
      availableCurrencies: availableCurrencies ?? this.availableCurrencies,
      customCurrencies: customCurrencies ?? this.customCurrencies,
      accounts: accounts ?? this.accounts,
      expenseCategories: expenseCategories ?? this.expenseCategories,
      incomeCategories: incomeCategories ?? this.incomeCategories,
      discountCategories: discountCategories ?? this.discountCategories,
      costCategories: costCategories ?? this.costCategories,
      ledgers: ledgers ?? this.ledgers,
    );
  }

  /// 获取所有可用货币（系统货币 + 自定义货币）
  List<PreConfigCurrency> get allAvailableCurrencies {
    final systemCurrencies = availableCurrencies
        .map((code) => findCurrencyByCode(code))
        .where((c) => c != null)
        .map((c) => PreConfigCurrency.fromTemplate(c!))
        .toList();
    return [...systemCurrencies, ...customCurrencies];
  }

  /// 检查是否满足多货币要求（至少两种货币）
  bool get hasEnoughCurrencies =>
      !enableMultiCurrency || availableCurrencies.length >= 2;

  /// 检查是否满足账户要求（至少一个账户）
  bool get hasEnoughAccounts =>
      !enableMultiAccount || accounts.isNotEmpty;

  /// 检查是否满足账本要求（至少一个账本）
  bool get hasEnoughLedgers =>
      !enableMultiLedger || ledgers.isNotEmpty;
}

// ==================== 默认分类数据 ====================

const List<PreConfigCategory> _defaultExpenseCategories = [
  PreConfigCategory(
    name: '餐饮',
    type: CategoryType.expense,
    icon: 'material:restaurant',
    children: [
      PreConfigCategory(name: '早餐', type: CategoryType.expense, icon: 'emoji:1f373'),
      PreConfigCategory(name: '午餐', type: CategoryType.expense, icon: 'emoji:1f35c'),
      PreConfigCategory(name: '晚餐', type: CategoryType.expense, icon: 'emoji:1f35d'),
      PreConfigCategory(name: '饮料', type: CategoryType.expense, icon: 'emoji:1f9cb'),
      PreConfigCategory(name: '水果', type: CategoryType.expense, icon: 'emoji:1f34e'),
      PreConfigCategory(name: '零食', type: CategoryType.expense, icon: 'emoji:1f369'),
    ],
  ),
  PreConfigCategory(
    name: '交通',
    type: CategoryType.expense,
    icon: 'material:directions_car',
    children: [
      PreConfigCategory(name: '公交地铁', type: CategoryType.expense, icon: 'material:directions_bus'),
      PreConfigCategory(name: '打车', type: CategoryType.expense, icon: 'material:local_taxi'),
      PreConfigCategory(name: '加油', type: CategoryType.expense, icon: 'material:local_gas_station'),
      PreConfigCategory(name: '停车', type: CategoryType.expense, icon: 'material:local_parking'),
    ],
  ),
  PreConfigCategory(
    name: '购物',
    type: CategoryType.expense,
    icon: 'material:shopping_cart',
    children: [
      PreConfigCategory(name: '日用品', type: CategoryType.expense, icon: 'emoji:1f9f4'),
      PreConfigCategory(name: '服饰', type: CategoryType.expense, icon: 'emoji:1f454'),
      PreConfigCategory(name: '数码', type: CategoryType.expense, icon: 'emoji:1f4f1'),
    ],
  ),
  PreConfigCategory(
    name: '居住',
    type: CategoryType.expense,
    icon: 'material:home',
    children: [
      PreConfigCategory(name: '房租', type: CategoryType.expense, icon: 'material:house'),
      PreConfigCategory(name: '物业', type: CategoryType.expense, icon: 'material:apartment'),
      PreConfigCategory(name: '水电燃气', type: CategoryType.expense, icon: 'material:power'),
      PreConfigCategory(name: '网络通信', type: CategoryType.expense, icon: 'material:wifi'),
    ],
  ),
  PreConfigCategory(
    name: '娱乐',
    type: CategoryType.expense,
    icon: 'material:movie',
    children: [
      PreConfigCategory(name: '电影', type: CategoryType.expense, icon: 'material:theaters'),
      PreConfigCategory(name: '游戏', type: CategoryType.expense, icon: 'material:sports_esports'),
      PreConfigCategory(name: '运动', type: CategoryType.expense, icon: 'material:fitness_center'),
    ],
  ),
  PreConfigCategory(
    name: '医疗',
    type: CategoryType.expense,
    icon: 'material:local_hospital',
  ),
  PreConfigCategory(
    name: '教育',
    type: CategoryType.expense,
    icon: 'material:school',
  ),
  PreConfigCategory(
    name: '人情',
    type: CategoryType.expense,
    icon: 'material:card_giftcard',
    children: [
      PreConfigCategory(name: '红包', type: CategoryType.expense, icon: 'emoji:1f9e7'),
      PreConfigCategory(name: '礼物', type: CategoryType.expense, icon: 'emoji:1f381'),
      PreConfigCategory(name: '请客', type: CategoryType.expense, icon: 'emoji:1f37b'),
    ],
  ),
  PreConfigCategory(
    name: '其他支出',
    type: CategoryType.expense,
    icon: 'material:more_horiz',
  ),
];

const List<PreConfigCategory> _defaultIncomeCategories = [
  PreConfigCategory(
    name: '工资',
    type: CategoryType.income,
    icon: 'material:work',
  ),
  PreConfigCategory(
    name: '奖金',
    type: CategoryType.income,
    icon: 'emoji:1f4b0',
  ),
  PreConfigCategory(
    name: '投资收益',
    type: CategoryType.income,
    icon: 'material:trending_up',
  ),
  PreConfigCategory(
    name: '兼职',
    type: CategoryType.income,
    icon: 'material:laptop',
  ),
  PreConfigCategory(
    name: '报销',
    type: CategoryType.income,
    icon: 'material:receipt',
  ),
  PreConfigCategory(
    name: '红包',
    type: CategoryType.income,
    icon: 'emoji:1f9e7',
  ),
  PreConfigCategory(
    name: '其他收入',
    type: CategoryType.income,
    icon: 'material:more_horiz',
  ),
];

// ==================== StateNotifier ====================

/// 初始化配置 Notifier
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(OnboardingState.initial());

  // ==================== 功能开关 ====================

  void setEnableMultiCurrency(bool value) {
    state = state.copyWith(enableMultiCurrency: value);
  }

  void setEnableMultiAccount(bool value) {
    state = state.copyWith(enableMultiAccount: value);
  }

  void setEnableMultiLedger(bool value) {
    state = state.copyWith(enableMultiLedger: value);
  }

  void setEnableBudgetManagement(bool value) {
    state = state.copyWith(enableBudgetManagement: value);
  }

  void setEnableBiometric(bool value) {
    state = state.copyWith(enableBiometric: value);
  }

  // ==================== 货币管理 ====================

  void setDefaultCurrency(String currencyCode) {
    state = state.copyWith(defaultCurrency: currencyCode);
  }

  void toggleCurrencySelection(String currencyCode) {
    final newSet = Set<String>.from(state.availableCurrencies);
    if (newSet.contains(currencyCode)) {
      // 不能取消选择默认货币
      if (currencyCode != state.defaultCurrency) {
        newSet.remove(currencyCode);
      }
    } else {
      newSet.add(currencyCode);
    }
    state = state.copyWith(availableCurrencies: newSet);
  }

  void addCustomCurrency(PreConfigCurrency currency) {
    state = state.copyWith(
      customCurrencies: [...state.customCurrencies, currency],
    );
  }

  void updateCustomCurrency(int index, PreConfigCurrency currency) {
    final list = List<PreConfigCurrency>.from(state.customCurrencies);
    if (index >= 0 && index < list.length) {
      list[index] = currency;
      state = state.copyWith(customCurrencies: list);
    }
  }

  void removeCustomCurrency(int index) {
    final list = List<PreConfigCurrency>.from(state.customCurrencies);
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      state = state.copyWith(customCurrencies: list);
    }
  }

  // ==================== 账户管理 ====================

  void addAccount(PreConfigAccount account) {
    state = state.copyWith(
      accounts: [...state.accounts, account],
    );
  }

  void updateAccount(int index, PreConfigAccount account) {
    final list = List<PreConfigAccount>.from(state.accounts);
    if (index >= 0 && index < list.length) {
      list[index] = account;
      state = state.copyWith(accounts: list);
    }
  }

  bool removeAccount(int index) {
    final list = List<PreConfigAccount>.from(state.accounts);
    if (index >= 0 && index < list.length && list.length > 1) {
      list.removeAt(index);
      state = state.copyWith(accounts: list);
      return true;
    }
    return false;
  }

  void reorderAccount(int oldIndex, int newIndex) {
    final list = List<PreConfigAccount>.from(state.accounts);
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    state = state.copyWith(accounts: list);
  }

  // ==================== 分类管理 ====================

  void addExpenseCategory(PreConfigCategory category) {
    state = state.copyWith(
      expenseCategories: [...state.expenseCategories, category],
    );
  }

  void updateExpenseCategory(int index, PreConfigCategory category) {
    final list = List<PreConfigCategory>.from(state.expenseCategories);
    if (index >= 0 && index < list.length) {
      list[index] = category;
      state = state.copyWith(expenseCategories: list);
    }
  }

  void removeExpenseCategory(int index) {
    final list = List<PreConfigCategory>.from(state.expenseCategories);
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      state = state.copyWith(expenseCategories: list);
    }
  }

  void addIncomeCategory(PreConfigCategory category) {
    state = state.copyWith(
      incomeCategories: [...state.incomeCategories, category],
    );
  }

  void updateIncomeCategory(int index, PreConfigCategory category) {
    final list = List<PreConfigCategory>.from(state.incomeCategories);
    if (index >= 0 && index < list.length) {
      list[index] = category;
      state = state.copyWith(incomeCategories: list);
    }
  }

  void removeIncomeCategory(int index) {
    final list = List<PreConfigCategory>.from(state.incomeCategories);
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      state = state.copyWith(incomeCategories: list);
    }
  }

  // 折扣/优惠分类
  void addDiscountCategory(PreConfigCategory category) {
    state = state.copyWith(
      discountCategories: [...state.discountCategories, category],
    );
  }

  void updateDiscountCategory(int index, PreConfigCategory category) {
    final list = List<PreConfigCategory>.from(state.discountCategories);
    if (index >= 0 && index < list.length) {
      list[index] = category;
      state = state.copyWith(discountCategories: list);
    }
  }

  void removeDiscountCategory(int index) {
    final list = List<PreConfigCategory>.from(state.discountCategories);
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      state = state.copyWith(discountCategories: list);
    }
  }

  void reorderDiscountCategory(int oldIndex, int newIndex) {
    final list = List<PreConfigCategory>.from(state.discountCategories);
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    state = state.copyWith(discountCategories: list);
  }

  // 税收/手续费分类
  void addCostCategory(PreConfigCategory category) {
    state = state.copyWith(
      costCategories: [...state.costCategories, category],
    );
  }

  void updateCostCategory(int index, PreConfigCategory category) {
    final list = List<PreConfigCategory>.from(state.costCategories);
    if (index >= 0 && index < list.length) {
      list[index] = category;
      state = state.copyWith(costCategories: list);
    }
  }

  void removeCostCategory(int index) {
    final list = List<PreConfigCategory>.from(state.costCategories);
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      state = state.copyWith(costCategories: list);
    }
  }

  void reorderCostCategory(int oldIndex, int newIndex) {
    final list = List<PreConfigCategory>.from(state.costCategories);
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    state = state.copyWith(costCategories: list);
  }

  // 排序方法
  void reorderExpenseCategory(int oldIndex, int newIndex) {
    final list = List<PreConfigCategory>.from(state.expenseCategories);
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    state = state.copyWith(expenseCategories: list);
  }

  void reorderIncomeCategory(int oldIndex, int newIndex) {
    final list = List<PreConfigCategory>.from(state.incomeCategories);
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    state = state.copyWith(incomeCategories: list);
  }

  void setCategories(List<PreConfigCategory> expense, List<PreConfigCategory> income) {
    state = state.copyWith(
      expenseCategories: expense,
      incomeCategories: income,
    );
  }

  // ==================== 账本管理 ====================

  void addLedger(PreConfigLedger ledger) {
    // 如果是第一个账本，设为默认
    final isFirst = state.ledgers.isEmpty;
    final newLedger = isFirst ? ledger.copyWith(isDefault: true) : ledger;
    state = state.copyWith(
      ledgers: [...state.ledgers, newLedger],
    );
  }

  void updateLedger(int index, PreConfigLedger ledger) {
    final list = List<PreConfigLedger>.from(state.ledgers);
    if (index >= 0 && index < list.length) {
      list[index] = ledger;
      state = state.copyWith(ledgers: list);
    }
  }

  bool removeLedger(int index) {
    final list = List<PreConfigLedger>.from(state.ledgers);
    if (index >= 0 && index < list.length && list.length > 1) {
      final wasDefault = list[index].isDefault;
      list.removeAt(index);
      // 如果删除的是默认账本，设置第一个为默认
      if (wasDefault && list.isNotEmpty) {
        list[0] = list[0].copyWith(isDefault: true);
      }
      state = state.copyWith(ledgers: list);
      return true;
    }
    return false;
  }

  void reorderLedger(int oldIndex, int newIndex) {
    final list = List<PreConfigLedger>.from(state.ledgers);
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    state = state.copyWith(ledgers: list);
  }

  void setDefaultLedger(int index) {
    final list = List<PreConfigLedger>.from(state.ledgers);
    if (index >= 0 && index < list.length) {
      for (var i = 0; i < list.length; i++) {
        list[i] = list[i].copyWith(isDefault: i == index);
      }
      state = state.copyWith(ledgers: list);
    }
  }

  // ==================== 重置 ====================

  void reset() {
    state = OnboardingState.initial();
  }
}

// ==================== Provider ====================

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>(
  (ref) => OnboardingNotifier(),
);
