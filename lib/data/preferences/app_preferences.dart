import 'package:shared_preferences/shared_preferences.dart';

/// 应用配置键
class AppConfigKeys {
  AppConfigKeys._();

  /// 是否已完成初始化
  static const String initialized = 'app_initialized';

  /// 是否启用资产管理
  static const String enableAssetManagement = 'enable_asset_management';

  /// 是否启用预算管理
  static const String enableBudgetManagement = 'enable_budget_management';

  /// 是否启用多货币
  static const String enableMultiCurrency = 'enable_multi_currency';

  /// 是否启用多账本
  static const String enableMultiLedger = 'enable_multi_ledger';

  /// 是否启用生物识别解锁
  static const String enableBiometric = 'enable_biometric';

  /// 当前选中的账本ID
  static const String currentLedgerId = 'current_ledger_id';

  /// 应用主题模式 (system, light, dark)
  static const String themeMode = 'theme_mode';

  /// 主题色 (blue, purple, orange, green, pink, teal)
  static const String themeColor = 'theme_color';

  /// 应用语言
  static const String locale = 'locale';
}

/// 应用配置服务
class AppPreferences {
  final SharedPreferences _prefs;

  AppPreferences(this._prefs);

  /// 工厂方法创建实例
  static Future<AppPreferences> create() async {
    final prefs = await SharedPreferences.getInstance();
    return AppPreferences(prefs);
  }

  // ==================== 初始化状态 ====================

  /// 是否已完成初始化
  bool get isInitialized => _prefs.getBool(AppConfigKeys.initialized) ?? false;

  /// 设置初始化状态
  Future<bool> setInitialized(bool value) =>
      _prefs.setBool(AppConfigKeys.initialized, value);

  // ==================== 功能开关 ====================

  /// 是否启用资产管理
  bool get enableAssetManagement =>
      _prefs.getBool(AppConfigKeys.enableAssetManagement) ?? true;

  /// 设置是否启用资产管理
  Future<bool> setEnableAssetManagement(bool value) =>
      _prefs.setBool(AppConfigKeys.enableAssetManagement, value);

  /// 是否启用预算管理
  bool get enableBudgetManagement =>
      _prefs.getBool(AppConfigKeys.enableBudgetManagement) ?? true;

  /// 设置是否启用预算管理
  Future<bool> setEnableBudgetManagement(bool value) =>
      _prefs.setBool(AppConfigKeys.enableBudgetManagement, value);

  /// 是否启用多货币
  bool get enableMultiCurrency =>
      _prefs.getBool(AppConfigKeys.enableMultiCurrency) ?? false;

  /// 设置是否启用多货币
  Future<bool> setEnableMultiCurrency(bool value) =>
      _prefs.setBool(AppConfigKeys.enableMultiCurrency, value);

  /// 是否启用多账本
  bool get enableMultiLedger =>
      _prefs.getBool(AppConfigKeys.enableMultiLedger) ?? false;

  /// 设置是否启用多账本
  Future<bool> setEnableMultiLedger(bool value) =>
      _prefs.setBool(AppConfigKeys.enableMultiLedger, value);

  /// 是否启用生物识别解锁
  bool get enableBiometric =>
      _prefs.getBool(AppConfigKeys.enableBiometric) ?? false;

  /// 设置是否启用生物识别解锁
  Future<bool> setEnableBiometric(bool value) =>
      _prefs.setBool(AppConfigKeys.enableBiometric, value);

  // ==================== 账本相关 ====================

  /// 当前选中的账本ID
  int? get currentLedgerId => _prefs.getInt(AppConfigKeys.currentLedgerId);

  /// 设置当前选中的账本ID
  Future<bool> setCurrentLedgerId(int value) =>
      _prefs.setInt(AppConfigKeys.currentLedgerId, value);

  // ==================== 主题相关 ====================

  /// 主题模式
  String get themeMode => _prefs.getString(AppConfigKeys.themeMode) ?? 'system';

  /// 设置主题模式
  Future<bool> setThemeMode(String value) =>
      _prefs.setString(AppConfigKeys.themeMode, value);

  /// 主题色
  String get themeColor => _prefs.getString(AppConfigKeys.themeColor) ?? 'teal';

  /// 设置主题色
  Future<bool> setThemeColor(String value) =>
      _prefs.setString(AppConfigKeys.themeColor, value);

  // ==================== 语言相关 ====================

  /// 语言
  String? get locale => _prefs.getString(AppConfigKeys.locale);

  /// 设置语言
  Future<bool> setLocale(String value) =>
      _prefs.setString(AppConfigKeys.locale, value);

  // ==================== 批量保存初始化配置 ====================

  /// 保存初始化配置
  Future<void> saveInitConfig({
    required bool enableAssetManagement,
    required bool enableBudgetManagement,
    required bool enableMultiCurrency,
    required bool enableMultiLedger,
    required bool enableBiometric,
  }) async {
    await Future.wait([
      setEnableAssetManagement(enableAssetManagement),
      setEnableBudgetManagement(enableBudgetManagement),
      setEnableMultiCurrency(enableMultiCurrency),
      setEnableMultiLedger(enableMultiLedger),
      setEnableBiometric(enableBiometric),
      setInitialized(true),
    ]);
  }

  // ==================== 清除所有配置 ====================

  /// 清除所有配置
  Future<bool> clear() => _prefs.clear();
}
