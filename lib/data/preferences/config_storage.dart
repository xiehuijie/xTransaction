/// 应用配置存储服务
/// 
/// 提供类型安全的键值对存储，分门别类管理各种配置项
/// 每个配置项都有详细说明，便于维护

import 'package:shared_preferences/shared_preferences.dart';

/// 配置项定义基类
abstract class ConfigKey<T> {
  /// 存储键名
  final String key;
  
  /// 配置项说明
  final String description;
  
  /// 默认值
  final T defaultValue;
  
  /// 配置分类
  final String category;

  const ConfigKey({
    required this.key,
    required this.description,
    required this.defaultValue,
    required this.category,
  });
}

/// 布尔型配置项
class BoolConfigKey extends ConfigKey<bool> {
  const BoolConfigKey({
    required super.key,
    required super.description,
    required super.defaultValue,
    required super.category,
  });
}

/// 字符串型配置项
class StringConfigKey extends ConfigKey<String> {
  const StringConfigKey({
    required super.key,
    required super.description,
    required super.defaultValue,
    required super.category,
  });
}

/// 可空字符串型配置项
class NullableStringConfigKey extends ConfigKey<String?> {
  const NullableStringConfigKey({
    required super.key,
    required super.description,
    required super.category,
  }) : super(defaultValue: null);
}

/// 整型配置项
class IntConfigKey extends ConfigKey<int> {
  const IntConfigKey({
    required super.key,
    required super.description,
    required super.defaultValue,
    required super.category,
  });
}

/// 可空整型配置项
class NullableIntConfigKey extends ConfigKey<int?> {
  const NullableIntConfigKey({
    required super.key,
    required super.description,
    required super.category,
  }) : super(defaultValue: null);
}

/// 字符串列表型配置项
class StringListConfigKey extends ConfigKey<List<String>> {
  const StringListConfigKey({
    required super.key,
    required super.description,
    required super.category,
  }) : super(defaultValue: const []);
}

// ==================== 配置项定义 ====================

/// 应用状态相关配置
class AppStateConfig {
  AppStateConfig._();
  
  static const category = 'app_state';
  
  /// 是否已完成初始化向导
  static const initialized = BoolConfigKey(
    key: 'app_initialized',
    description: '应用是否已完成初始化向导流程',
    defaultValue: false,
    category: category,
  );
  
  /// 应用版本号（用于检测升级）
  static const appVersion = StringConfigKey(
    key: 'app_version',
    description: '上次运行的应用版本号，用于检测升级',
    defaultValue: '',
    category: category,
  );
  
  /// 数据库版本号
  static const dbVersion = IntConfigKey(
    key: 'db_version',
    description: '当前数据库版本号',
    defaultValue: 1,
    category: category,
  );
}

/// 功能开关配置
class FeatureConfig {
  FeatureConfig._();
  
  static const category = 'feature';
  
  /// 是否启用资产管理功能
  static const enableAssetManagement = BoolConfigKey(
    key: 'enable_asset_management',
    description: '是否启用资产管理功能，查看账户余额和资产分布',
    defaultValue: true,
    category: category,
  );
  
  /// 是否启用预算管理功能
  static const enableBudgetManagement = BoolConfigKey(
    key: 'enable_budget_management',
    description: '是否启用预算管理功能，帮助控制支出',
    defaultValue: true,
    category: category,
  );
  
  /// 是否启用多货币功能
  static const enableMultiCurrency = BoolConfigKey(
    key: 'enable_multi_currency',
    description: '是否启用多货币功能，支持不同币种的记账和汇率转换',
    defaultValue: false,
    category: category,
  );
  
  /// 是否启用多账户功能
  static const enableMultiAccount = BoolConfigKey(
    key: 'enable_multi_account',
    description: '是否启用多账户功能，管理多个账户',
    defaultValue: true,
    category: category,
  );
  
  /// 是否启用多账本功能
  static const enableMultiLedger = BoolConfigKey(
    key: 'enable_multi_ledger',
    description: '是否启用多账本功能，分开管理个人、家庭或项目账目',
    defaultValue: false,
    category: category,
  );
  
  /// 是否启用生物识别解锁
  static const enableBiometric = BoolConfigKey(
    key: 'enable_biometric',
    description: '是否启用生物识别解锁，使用指纹或面容保护财务数据',
    defaultValue: false,
    category: category,
  );
}

/// 货币相关配置
class CurrencyConfig {
  CurrencyConfig._();
  
  static const category = 'currency';
  
  /// 默认货币代码
  static const defaultCurrencyCode = StringConfigKey(
    key: 'default_currency_code',
    description: '默认货币代码，用于新建账本、账户、交易时的默认货币',
    defaultValue: 'CNY',
    category: category,
  );
  
  /// 已启用的货币代码列表
  static const enabledCurrencyCodes = StringListConfigKey(
    key: 'enabled_currency_codes',
    description: '已启用的货币代码列表',
    category: category,
  );
}

/// 账本相关配置
class LedgerConfig {
  LedgerConfig._();
  
  static const category = 'ledger';
  
  /// 当前选中的账本ID
  static const currentLedgerId = NullableIntConfigKey(
    key: 'current_ledger_id',
    description: '当前选中的账本ID',
    category: category,
  );
}

/// 外观相关配置
class AppearanceConfig {
  AppearanceConfig._();
  
  static const category = 'appearance';
  
  /// 主题模式（system/light/dark）
  static const themeMode = StringConfigKey(
    key: 'theme_mode',
    description: '主题模式：system-跟随系统、light-浅色、dark-深色',
    defaultValue: 'system',
    category: category,
  );
  
  /// 主题色
  static const themeColor = StringConfigKey(
    key: 'theme_color',
    description: '主题色：blue/purple/orange/green/pink/teal',
    defaultValue: 'teal',
    category: category,
  );
  
  /// 应用语言
  static const locale = NullableStringConfigKey(
    key: 'locale',
    description: '应用语言代码，null表示跟随系统',
    category: category,
  );
}

/// 隐私安全相关配置
class PrivacyConfig {
  PrivacyConfig._();
  
  static const category = 'privacy';
  
  /// 锁屏超时时间（秒）
  static const lockTimeout = IntConfigKey(
    key: 'lock_timeout',
    description: '应用进入后台多少秒后需要重新验证，0表示立即锁定',
    defaultValue: 0,
    category: category,
  );
  
  /// 是否隐藏金额
  static const hideAmount = BoolConfigKey(
    key: 'hide_amount',
    description: '是否在界面上隐藏金额显示',
    defaultValue: false,
    category: category,
  );
}

/// 记账相关配置
class TransactionConfig {
  TransactionConfig._();
  
  static const category = 'transaction';
  
  /// 默认使用的账户ID
  static const defaultAccountId = NullableIntConfigKey(
    key: 'default_account_id',
    description: '记账时默认使用的账户ID',
    category: category,
  );
  
  /// 是否记住上次使用的分类
  static const rememberLastCategory = BoolConfigKey(
    key: 'remember_last_category',
    description: '是否记住并默认使用上次记账使用的分类',
    defaultValue: true,
    category: category,
  );
  
  /// 上次使用的支出分类ID
  static const lastExpenseCategoryId = NullableIntConfigKey(
    key: 'last_expense_category_id',
    description: '上次使用的支出分类ID',
    category: category,
  );
  
  /// 上次使用的收入分类ID
  static const lastIncomeCategoryId = NullableIntConfigKey(
    key: 'last_income_category_id',
    description: '上次使用的收入分类ID',
    category: category,
  );
}

// ==================== 配置存储服务 ====================

/// 类型安全的配置存储服务
class AppConfigStorage {
  final SharedPreferences _prefs;

  AppConfigStorage(this._prefs);

  /// 工厂方法创建实例
  static Future<AppConfigStorage> create() async {
    final prefs = await SharedPreferences.getInstance();
    return AppConfigStorage(prefs);
  }

  // ==================== 通用读写方法 ====================

  /// 读取布尔值
  bool getBool(BoolConfigKey key) {
    return _prefs.getBool(key.key) ?? key.defaultValue;
  }

  /// 写入布尔值
  Future<bool> setBool(BoolConfigKey key, bool value) {
    return _prefs.setBool(key.key, value);
  }

  /// 读取字符串
  String getString(StringConfigKey key) {
    return _prefs.getString(key.key) ?? key.defaultValue;
  }

  /// 写入字符串
  Future<bool> setString(StringConfigKey key, String value) {
    return _prefs.setString(key.key, value);
  }

  /// 读取可空字符串
  String? getNullableString(NullableStringConfigKey key) {
    return _prefs.getString(key.key);
  }

  /// 写入可空字符串
  Future<bool> setNullableString(NullableStringConfigKey key, String? value) {
    if (value == null) {
      return _prefs.remove(key.key);
    }
    return _prefs.setString(key.key, value);
  }

  /// 读取整数
  int getInt(IntConfigKey key) {
    return _prefs.getInt(key.key) ?? key.defaultValue;
  }

  /// 写入整数
  Future<bool> setInt(IntConfigKey key, int value) {
    return _prefs.setInt(key.key, value);
  }

  /// 读取可空整数
  int? getNullableInt(NullableIntConfigKey key) {
    return _prefs.getInt(key.key);
  }

  /// 写入可空整数
  Future<bool> setNullableInt(NullableIntConfigKey key, int? value) {
    if (value == null) {
      return _prefs.remove(key.key);
    }
    return _prefs.setInt(key.key, value);
  }

  /// 读取字符串列表
  List<String> getStringList(StringListConfigKey key) {
    return _prefs.getStringList(key.key) ?? key.defaultValue;
  }

  /// 写入字符串列表
  Future<bool> setStringList(StringListConfigKey key, List<String> value) {
    return _prefs.setStringList(key.key, value);
  }

  // ==================== 便捷属性访问 ====================

  // 应用状态
  bool get isInitialized => getBool(AppStateConfig.initialized);
  Future<bool> setInitialized(bool value) => setBool(AppStateConfig.initialized, value);

  // 功能开关
  bool get enableAssetManagement => getBool(FeatureConfig.enableAssetManagement);
  Future<bool> setEnableAssetManagement(bool value) => setBool(FeatureConfig.enableAssetManagement, value);

  bool get enableBudgetManagement => getBool(FeatureConfig.enableBudgetManagement);
  Future<bool> setEnableBudgetManagement(bool value) => setBool(FeatureConfig.enableBudgetManagement, value);

  bool get enableMultiCurrency => getBool(FeatureConfig.enableMultiCurrency);
  Future<bool> setEnableMultiCurrency(bool value) => setBool(FeatureConfig.enableMultiCurrency, value);

  bool get enableMultiAccount => getBool(FeatureConfig.enableMultiAccount);
  Future<bool> setEnableMultiAccount(bool value) => setBool(FeatureConfig.enableMultiAccount, value);

  bool get enableMultiLedger => getBool(FeatureConfig.enableMultiLedger);
  Future<bool> setEnableMultiLedger(bool value) => setBool(FeatureConfig.enableMultiLedger, value);

  bool get enableBiometric => getBool(FeatureConfig.enableBiometric);
  Future<bool> setEnableBiometric(bool value) => setBool(FeatureConfig.enableBiometric, value);

  // 货币配置
  String get defaultCurrencyCode => getString(CurrencyConfig.defaultCurrencyCode);
  Future<bool> setDefaultCurrencyCode(String value) => setString(CurrencyConfig.defaultCurrencyCode, value);

  List<String> get enabledCurrencyCodes => getStringList(CurrencyConfig.enabledCurrencyCodes);
  Future<bool> setEnabledCurrencyCodes(List<String> value) => setStringList(CurrencyConfig.enabledCurrencyCodes, value);

  // 账本配置
  int? get currentLedgerId => getNullableInt(LedgerConfig.currentLedgerId);
  Future<bool> setCurrentLedgerId(int? value) => setNullableInt(LedgerConfig.currentLedgerId, value);

  // 外观配置
  String get themeMode => getString(AppearanceConfig.themeMode);
  Future<bool> setThemeMode(String value) => setString(AppearanceConfig.themeMode, value);

  String get themeColor => getString(AppearanceConfig.themeColor);
  Future<bool> setThemeColor(String value) => setString(AppearanceConfig.themeColor, value);

  String? get locale => getNullableString(AppearanceConfig.locale);
  Future<bool> setLocale(String? value) => setNullableString(AppearanceConfig.locale, value);

  // 隐私配置
  int get lockTimeout => getInt(PrivacyConfig.lockTimeout);
  Future<bool> setLockTimeout(int value) => setInt(PrivacyConfig.lockTimeout, value);

  bool get hideAmount => getBool(PrivacyConfig.hideAmount);
  Future<bool> setHideAmount(bool value) => setBool(PrivacyConfig.hideAmount, value);

  // 记账配置
  int? get defaultAccountId => getNullableInt(TransactionConfig.defaultAccountId);
  Future<bool> setDefaultAccountId(int? value) => setNullableInt(TransactionConfig.defaultAccountId, value);

  bool get rememberLastCategory => getBool(TransactionConfig.rememberLastCategory);
  Future<bool> setRememberLastCategory(bool value) => setBool(TransactionConfig.rememberLastCategory, value);

  int? get lastExpenseCategoryId => getNullableInt(TransactionConfig.lastExpenseCategoryId);
  Future<bool> setLastExpenseCategoryId(int? value) => setNullableInt(TransactionConfig.lastExpenseCategoryId, value);

  int? get lastIncomeCategoryId => getNullableInt(TransactionConfig.lastIncomeCategoryId);
  Future<bool> setLastIncomeCategoryId(int? value) => setNullableInt(TransactionConfig.lastIncomeCategoryId, value);

  // ==================== 批量操作 ====================

  /// 保存初始化配置
  Future<void> saveInitConfig({
    required bool enableAssetManagement,
    required bool enableBudgetManagement,
    required bool enableMultiCurrency,
    required bool enableMultiAccount,
    required bool enableMultiLedger,
    required bool enableBiometric,
    required String defaultCurrencyCode,
    required List<String> enabledCurrencyCodes,
  }) async {
    await Future.wait([
      setEnableAssetManagement(enableAssetManagement),
      setEnableBudgetManagement(enableBudgetManagement),
      setEnableMultiCurrency(enableMultiCurrency),
      setEnableMultiAccount(enableMultiAccount),
      setEnableMultiLedger(enableMultiLedger),
      setEnableBiometric(enableBiometric),
      setDefaultCurrencyCode(defaultCurrencyCode),
      setEnabledCurrencyCodes(enabledCurrencyCodes),
      setInitialized(true),
    ]);
  }

  /// 清除所有配置
  Future<bool> clear() => _prefs.clear();
}
