// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'X交易';

  @override
  String get appDescription => '个人交易管理应用。';

  @override
  String get appLocked => '应用已锁定';

  @override
  String get authenticating => '正在验证...';

  @override
  String get reauthenticate => '重新验证';

  @override
  String get appFailedToStart => '应用启动失败';

  @override
  String get verificationFailed => '验证失败，请重试';

  @override
  String get biometricNotSupported => '设备不支持生物识别，请在设置中关闭生物识别解锁';

  @override
  String get biometricNotAvailable => '生物识别不可用，请在设置中关闭生物识别解锁';

  @override
  String get biometricNotEnrolled => '请先在设备上设置生物识别';

  @override
  String get biometricLockedOut => '验证次数过多，请稍后重试';

  @override
  String get biometricPermanentlyLockedOut => '验证已被锁定，请使用设备密码';

  @override
  String get biometricError => '发生错误，请重试';

  @override
  String get home => '首页';

  @override
  String get overview => '概览';

  @override
  String get statistics => '统计';

  @override
  String get profile => '个人中心';

  @override
  String get settings => '设置';

  @override
  String get assets => '资产';

  @override
  String get onboarding => '引导';

  @override
  String get accountConfig => '账户配置';

  @override
  String get accountSelection => '账户选择';

  @override
  String get categoryConfig => '分类配置';

  @override
  String get categorySelection => '分类选择';

  @override
  String get currencyConfig => '货币配置';

  @override
  String get dataRecovery => '数据恢复';

  @override
  String get ledgerConfig => '账本配置';

  @override
  String get previewConfirm => '预览与确认';

  @override
  String get continueAction => '继续';

  @override
  String get back => '返回';

  @override
  String get next => '下一步';

  @override
  String get finish => '完成';

  @override
  String get save => '保存';

  @override
  String get cancel => '取消';

  @override
  String get edit => '编辑';

  @override
  String get delete => '删除';

  @override
  String get add => '添加';

  @override
  String get create => '创建';

  @override
  String get update => '更新';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get ok => '确定';

  @override
  String get error => '错误';

  @override
  String get success => '成功';

  @override
  String get warning => '警告';

  @override
  String get info => '信息';

  @override
  String get loading => '加载中...';

  @override
  String get search => '搜索';

  @override
  String get filter => '筛选';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get selectLanguageSubtitle => '请选择您偏好的语言';

  @override
  String get chineseSimplified => '简体中文';

  @override
  String get japanese => '日本語';

  @override
  String get assetManagement => '资产管理';

  @override
  String get assetManagementDesc => '查看账户余额和资产分布';

  @override
  String get budgetManagement => '预算管理';

  @override
  String get budgetManagementDesc => '设置预算并追踪支出';

  @override
  String get multiCurrencySupport => '多货币支持';

  @override
  String get multiCurrencySupportDesc => '支持多种货币记账和汇率转换';

  @override
  String get multiLedger => '多账本';

  @override
  String get multiLedgerDesc => '创建多个账本分开管理';

  @override
  String get securitySettings => '安全设置';

  @override
  String get biometricUnlock => '生物识别解锁';

  @override
  String get biometricUnlockDesc => '使用指纹或面容解锁应用';

  @override
  String get appearanceSettings => '外观设置';

  @override
  String get themeColor => '主题色';

  @override
  String get themeMode => '深浅模式';

  @override
  String get language => '语言';

  @override
  String get dataManagement => '数据管理';

  @override
  String get backupAndRestore => '备份与恢复';

  @override
  String get resetAppData => '重置应用数据';

  @override
  String get resetAppDataConfirm => '重置应用数据';

  @override
  String get functionInDevelopment => '功能开发中';

  @override
  String get confirmReset => '确认重置';

  @override
  String get sort => '排序';

  @override
  String get more => '更多';

  @override
  String get functionSettings => '功能设置';

  @override
  String get disableAssetManagementConfirm =>
      '关闭后将隐藏资产页面，但已记录的账户和资产数据不会被删除。\n\n您可以随时重新开启此功能。';

  @override
  String get selectThemeColor => '选择主题色';

  @override
  String get selectThemeMode => '选择深浅模式';

  @override
  String get resetAppDataConfirmContent =>
      '此操作将清空所有数据，包括账户、交易记录等。此操作不可撤销，确定要继续吗？';

  @override
  String get welcomeTitle => '欢迎使用';

  @override
  String get welcomeSubtitle => '让我们开始配置您的记账应用';

  @override
  String get currencySettingsTitle => '货币设置';

  @override
  String get currencySettingsSubtitle => '配置您需要使用的货币和默认货币';

  @override
  String get accountSettingsTitle => '账户设置';

  @override
  String get accountSettingsSubtitle => '添加您的银行卡、钱包等账户';

  @override
  String get categorySettingsTitle => '分类设置';

  @override
  String get categorySettingsSubtitle => '配置收支分类，支持多层级结构';

  @override
  String get ledgerSettingsTitle => '账本设置';

  @override
  String get ledgerSettingsSubtitle => '创建账本并选择关联的账户和分类';

  @override
  String get biometricTitle => '生物识别';

  @override
  String get biometricSubtitle => '启用指纹或面容保护您的财务数据';

  @override
  String get completeTitle => '配置完成';

  @override
  String get completeSubtitle => '一切就绪，开始您的记账之旅！';

  @override
  String get startFresh => '从新开始';

  @override
  String get startFreshDesc => '创建全新的记账环境';

  @override
  String get restoreFromBackup => '从备份恢复';

  @override
  String get restoreFromBackupDesc => '从备份文件恢复数据';

  @override
  String get previousStep => '上一步';

  @override
  String get nextStep => '下一步';

  @override
  String get startUsing => '开始使用';

  @override
  String get saving => '保存中...';

  @override
  String get configureCurrencies => '配置货币';

  @override
  String get configureAccounts => '配置账户';

  @override
  String get configureCategories => '配置分类';

  @override
  String get configureLedgers => '配置账本';

  @override
  String selectedCount(Object count) {
    return '已选择 $count 种';
  }

  @override
  String addedCount(Object count) {
    return '已添加 $count 个';
  }

  @override
  String expenseIncomeCount(Object expenseCount, Object incomeCount) {
    return '支出 $expenseCount 个, 收入 $incomeCount 个';
  }

  @override
  String get authenticateToEnable => '验证身份以启用生物识别解锁';

  @override
  String get authenticationFailed => '验证失败';

  @override
  String get setupBiometricFirst =>
      'Please set up biometrics on your device first';

  @override
  String get tooManyAttempts => '验证次数过多，请稍后重试';

  @override
  String get cannotEnableBiometric => 'Cannot enable biometrics';

  @override
  String initializationFailed(Object error) {
    return '初始化失败: $error';
  }

  @override
  String get configurationSummary => 'Configuration Summary';

  @override
  String get currency => '货币';

  @override
  String get account => '账户';

  @override
  String get category => '分类';

  @override
  String get ledger => '账本';

  @override
  String get biometrics => '生物识别';

  @override
  String countItems(Object count) {
    return '$count 种';
  }

  @override
  String countAccounts(Object count) {
    return '$count 个';
  }

  @override
  String countCategories(Object count) {
    return '$count 个';
  }

  @override
  String countLedgers(Object count) {
    return '$count 个';
  }

  @override
  String get english => 'English';

  @override
  String get chinese => '简体中文';

  @override
  String get blue => '蓝色';

  @override
  String get purple => '紫色';

  @override
  String get orange => '橙色';

  @override
  String get green => '绿色';

  @override
  String get pink => '粉色';

  @override
  String get teal => '青色';

  @override
  String get system => '跟随系统';

  @override
  String get light => '浅色';

  @override
  String get dark => '深色';

  @override
  String get enabled => 'Enabled';

  @override
  String get disabled => 'Disabled';

  @override
  String get biometricNotSupportedMessage => '设备不支持生物识别或未设置生物识别';

  @override
  String get authenticateToEnableBiometric => '验证身份以启用生物识别解锁';

  @override
  String get onboardingWelcomeTitle => '欢迎使用';

  @override
  String get onboardingWelcomeSubtitle => '开始您的记账之旅';

  @override
  String get onboardingCurrencyTitle => '配置货币';

  @override
  String get onboardingCurrencySubtitle => '选择您常用的货币';

  @override
  String get onboardingAccountTitle => '配置账户';

  @override
  String get onboardingAccountSubtitle => '添加您的账户信息';

  @override
  String get onboardingCategoryTitle => '配置分类';

  @override
  String get onboardingCategorySubtitle => '设置交易分类';

  @override
  String get onboardingLedgerTitle => '配置账本';

  @override
  String get onboardingLedgerSubtitle => '创建您的账本';

  @override
  String get onboardingCompleteTitle => '完成';

  @override
  String get onboardingCompleteSubtitle => '配置完成，开始使用';

  @override
  String get onboardingNewStart => '从新开始';

  @override
  String get onboardingNewStartDesc => '创建全新的记账环境';

  @override
  String get onboardingRestore => '从备份恢复';

  @override
  String get onboardingRestoreDesc => '从备份文件恢复数据';

  @override
  String get onboardingConfigureCurrency => '配置货币';

  @override
  String onboardingCurrencySelected(Object count) {
    return '已选择 $count 种货币';
  }

  @override
  String get onboardingConfigureAccount => '配置账户';

  @override
  String onboardingAccountAdded(Object count) {
    return '已添加 $count 个账户';
  }

  @override
  String get onboardingConfigureCategory => '配置分类';

  @override
  String onboardingCategoryAdded(Object expenseCount, Object incomeCount) {
    return '支出 $expenseCount 个，收入 $incomeCount 个';
  }

  @override
  String get onboardingConfigureLedger => '配置账本';

  @override
  String onboardingLedgerCreated(Object count) {
    return '已创建 $count 个账本';
  }

  @override
  String get onboardingBiometricTitle => '生物识别';

  @override
  String get onboardingBiometricSubtitle => '启用生物识别保护您的数据';
}
