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
  String get japanese => '日本語';

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

  @override
  String get week => '周';

  @override
  String get month => '月';

  @override
  String get year => '年';

  @override
  String get categoryManagement => '分类管理';

  @override
  String get newCategory => '新增分类';

  @override
  String get confirmDeleteTitle => '确认删除';

  @override
  String get confirmDeleteCategory => '确定要删除这个分类吗？此操作不可恢复。';

  @override
  String get selectIcon => '选择图标';

  @override
  String get about => '关于';

  @override
  String get licenses => '许可证';

  @override
  String get close => '关闭';

  @override
  String get record => '记一笔';

  @override
  String get manage => '管理';

  @override
  String get currencyManagement => '货币管理';

  @override
  String get deleteCurrency => '删除货币';

  @override
  String get deleteCurrencyConfirm => '确定要删除这个货币吗？\n\n此操作不可撤销。';

  @override
  String get addCustomCurrency => '添加自定义货币';

  @override
  String get symbolPosition => '符号位置';

  @override
  String get prefix => '前缀';

  @override
  String get suffix => '后缀';

  @override
  String get ledgerManagement => '账本管理';

  @override
  String get createLedger => '创建账本';

  @override
  String get newLedger => '新建账本';

  @override
  String get deleteLedger => '删除账本';

  @override
  String deleteLedgerConfirm(Object name) {
    return '确定要删除账本「$name」吗？此操作不可撤销。';
  }

  @override
  String get ledgerDeleted => '账本已删除';

  @override
  String get baseCurrency => '本币';

  @override
  String get autoInclude => '自动设置';

  @override
  String get autoIncludeNewAccounts => '自动包含新账户';

  @override
  String get autoIncludeNewAccountsDesc => '新创建的账户将自动关联到此账本';

  @override
  String get autoIncludeNewCategories => '自动包含新分类';

  @override
  String get autoIncludeNewCategoriesDesc => '新创建的分类将自动关联到此账本';

  @override
  String get associatedAccounts => '关联账户';

  @override
  String get associatedCategories => '关联分类';

  @override
  String get databaseBrowser => '数据库浏览器';

  @override
  String get loadFailed => '加载失败';

  @override
  String get retry => '重试';

  @override
  String get noData => '暂无数据';

  @override
  String get addNew => '新增';

  @override
  String get copied => '已复制';

  @override
  String get copy => '复制';

  @override
  String get viewJson => '查看JSON';

  @override
  String get copyJson => '复制JSON';

  @override
  String get json => 'JSON';

  @override
  String jsonFormatError(Object error) {
    return 'JSON格式错误: $error';
  }

  @override
  String get createSuccess => '新增成功';

  @override
  String createFailed(Object error) {
    return '新增失败: $error';
  }

  @override
  String get updateSuccess => '更新成功';

  @override
  String updateFailed(Object error) {
    return '更新失败: $error';
  }

  @override
  String get deleteSuccess => '删除成功';

  @override
  String deleteFailed(Object error) {
    return '删除失败: $error';
  }

  @override
  String get confirmDeleteRecord => '确定要删除这条记录吗？此操作不可撤销。';

  @override
  String get iconPickerConfirm => '确定';

  @override
  String get noRecentIcons => '暂无最近使用';

  @override
  String get projectManagement => '项目管理';

  @override
  String get newProject => '新建项目';

  @override
  String get createProject => '创建项目';

  @override
  String get pleaseSelectLedger => '请选择所属账本';

  @override
  String get confirmDeleteProject => '确定要删除这个项目吗？此操作不可恢复。';

  @override
  String saveFailed(Object error) {
    return '保存失败: $error';
  }

  @override
  String get editAccount => '编辑';

  @override
  String get deleteAccount => '删除';

  @override
  String get addAccount => '添加账户';

  @override
  String get deleteAccountConfirm => '确定要删除这个账户吗？';

  @override
  String get selectAccountType => '选择账户类型';

  @override
  String get saveButton => '保存';

  @override
  String get enableGiftBalance => '启用赠送金账户';

  @override
  String get enableGiftBalanceDesc => '为此预付账户关联一个赠送金账户';

  @override
  String get useGiftFirst => '优先使用赠送金';

  @override
  String get useGiftLast => '最后使用赠送金';

  @override
  String get useGiftProportional => '等比例扣减';

  @override
  String get borrow => '借入';

  @override
  String get lend => '借出';

  @override
  String get configureRepayment => '配置还款计划';

  @override
  String get repaymentConfigInDev => '借贷计划配置功能开发中...';

  @override
  String get developerTools => '开发者工具';

  @override
  String get allAccounts => '全部账户';

  @override
  String get accountDeleted => '账户已删除';

  @override
  String deleteAccountWithTx(Object name) {
    return '确定要删除账户「$name」吗？此操作不可撤销，相关的交易记录将保留但不再关联此账户。';
  }

  @override
  String get deleteCategoryConfirm => '确定要删除这个分类吗？';

  @override
  String get stakeholderManagement => '相关方管理';

  @override
  String get newStakeholder => '新增相关方';

  @override
  String addStakeholder(Object type) {
    return '添加$type';
  }

  @override
  String get selectAvatar => '选择头像';

  @override
  String get type => '类型';

  @override
  String get deleteStakeholder => '删除相关方';

  @override
  String deleteStakeholderConfirm(Object name) {
    return '确定要删除「$name」吗？此操作不可撤销。';
  }

  @override
  String get stakeholderDeleted => '相关方已删除';

  @override
  String get accountManagement => '账户管理';

  @override
  String get newAccount => '新增账户';

  @override
  String addAccountType(Object type) {
    return '添加$type';
  }

  @override
  String get allSystemFieldsAdded => '所有系统字段都已添加';

  @override
  String get extendedInfo => '扩展信息';

  @override
  String get addSystemField => '添加系统字段';

  @override
  String get addCustomField => '添加自定义字段';

  @override
  String get fieldName => '字段名';

  @override
  String get fieldValue => '字段值';

  @override
  String get allCategories => '全部分类';

  @override
  String get multiCurrencyConfig => '多货币配置';

  @override
  String get backupRestore => '从备份恢复';

  @override
  String get backupRestoreInDev => '备份恢复功能正在开发中';

  @override
  String get selectBackupFile => '选择备份文件';

  @override
  String get cloudRestoreInDev => '云端备份功能正在开发中';

  @override
  String get restoreFromCloud => '从云端恢复';

  @override
  String get bindSpecificAsset => '绑定特定资产';

  @override
  String get repaymentPlanConfig => '还款计划配置';

  @override
  String get autoGenerate => '自动生成';

  @override
  String get addPeriod => '添加一期';

  @override
  String get autoGenerateRepayment => '自动生成还款计划';

  @override
  String get period => '期数';

  @override
  String get amount => '金额';

  @override
  String get interval => '间隔';

  @override
  String get everyMonth => '每月';

  @override
  String get everyTwoMonths => '每两月';

  @override
  String get everyQuarter => '每季度';

  @override
  String get everySixMonths => '每半年';

  @override
  String get everyYear => '每年';

  @override
  String get generate => '生成';

  @override
  String get addLedger => '添加账本';

  @override
  String get setAsDefault => '设为默认';

  @override
  String get ledgerBaseCurrency => '账本本币';

  @override
  String get autoIncludeSettings => '自动包含设置';

  @override
  String get autoIncludeNewAccount => '自动包含新增账户';

  @override
  String get autoIncludeNewAccountDesc => '新增的账户将自动加入此账本';

  @override
  String get autoIncludeNewCategory => '自动包含新增分类';

  @override
  String get autoIncludeNewCategoryDesc => '新增的分类将自动加入此账本';

  @override
  String get giftDeductionMode => '扣减模式';

  @override
  String get giftAccountName => '赠送金账户名称';

  @override
  String get giftAccountNameHint => '留空则自动生成';

  @override
  String get giftCurrency => '赠送金货币';

  @override
  String get giftInitialBalance => '赠送金初始余额';

  @override
  String get giftInitialBalanceHint => '创建时的赠送金金额';

  @override
  String get loanAmount => '借贷金额';

  @override
  String get loanAmountRequired => '借贷金额 *';

  @override
  String get loanAmountHint => '请输入借贷金额';

  @override
  String get annualRate => '年化利率（%）';

  @override
  String get annualRateHint => '如：5.00';

  @override
  String get startDate => '开始日期';

  @override
  String get startDateRequired => '开始日期 *';

  @override
  String get endDate => '结束日期';

  @override
  String get endDateRequired => '结束日期 *';

  @override
  String get loanNote => '借贷备注';

  @override
  String get loanNoteHint => '如：借款用途、还款方式等';

  @override
  String get dueDate => '到期日';

  @override
  String get note => '备注';

  @override
  String get periods => '期数';

  @override
  String get amountPerPeriod => '每期金额';

  @override
  String get repaymentInterval => '还款间隔';

  @override
  String get creditLimit => '信用额度';

  @override
  String get creditLimitRequired => '信用额度 *';

  @override
  String get creditLimitHint => '请输入信用额度';

  @override
  String get billingDay => '账单日';

  @override
  String get paymentDay => '还款日';

  @override
  String get bankName => '发卡银行';

  @override
  String get bankNameHint => '如：招商银行';

  @override
  String get cardNumber => '卡号';

  @override
  String get cardNumberHint => '请输入信用卡号';

  @override
  String get expiryDate => '有效期';

  @override
  String get expiryDateHint => '如：12/28';

  @override
  String dayRequired(Object label) {
    return '$label *';
  }

  @override
  String get bankNameLabel => '银行名称';

  @override
  String get bankNameLabelHint => '如：中国工商银行';

  @override
  String get bankCardNumber => '银行卡号';

  @override
  String get bankCardNumberHint => '请输入银行卡号';

  @override
  String get bankBranch => '开户行';

  @override
  String get bankBranchHint => '如：某某支行';

  @override
  String get cardholderName => '持卡人姓名';

  @override
  String get cardholderNameHint => '请输入持卡人姓名';

  @override
  String get accountNameRequired => '账户名称 *';

  @override
  String get accountNameHint => '请输入账户名称';

  @override
  String get accountCurrencyRequired => '账户货币 *';

  @override
  String get initialBalance => '初始余额';

  @override
  String get initialBalanceHint => '创建时的初始金额';

  @override
  String get accountDescription => '账户描述';

  @override
  String get accountDescriptionHint => '可选，简短描述此账户';

  @override
  String get accountNote => '备注';

  @override
  String get accountNoteHint => '可选，添加备注信息';

  @override
  String get previewConfig => '配置预览';

  @override
  String get confirmAndStart => '确认并开始使用';

  @override
  String get searchCurrency => '搜索货币...';

  @override
  String get iconHint => '图标';

  @override
  String get currencyCode => '货币代码';

  @override
  String get currencyCodeHint => '如: POINT, TOKEN';

  @override
  String get currencyName => '货币名称';

  @override
  String get currencyNameHint => '如: 积分, 代币';

  @override
  String get currencySymbol => '货币符号';

  @override
  String get currencySymbolHint => '如: ¤, ₿';

  @override
  String get categoryName => '分类名称';

  @override
  String get categoryNameHint => '请输入分类名称';

  @override
  String get categoryType => '分类类型';

  @override
  String get parentCategory => '父级分类';

  @override
  String get sortOrder => '排序值';

  @override
  String get sortOrderHint => '数值越小越靠前';

  @override
  String get ledgerName => '账本名称';

  @override
  String get ledgerNameHint => '输入账本名称';

  @override
  String get ledgerNameExample => '如: 日常账本、家庭账本';

  @override
  String get descriptionOptional => '描述（可选）';

  @override
  String get descriptionHint => '输入描述信息';

  @override
  String get ledgerDescriptionHint => '账本的用途说明';

  @override
  String get noteOptional => '备注（可选）';

  @override
  String get noteHint => '输入备注信息';

  @override
  String get accountNameLabel => '账户名称';

  @override
  String get accountNameExample => '如: 工商银行储蓄卡';

  @override
  String get accountCurrency => '账户货币';

  @override
  String get initialBalanceDefault => '0.00';

  @override
  String get accountDescriptionOptional => '账户描述（可选）';

  @override
  String get creditLimitLabel => '信用额度';

  @override
  String get giftDeductionModeLabel => '赠送金扣减方式';

  @override
  String get giftInitialBalanceLabel => '赠送金初始余额';

  @override
  String get investmentType => '投资类型';

  @override
  String get investmentCode => '投资代码（可选）';

  @override
  String get loanAmountLabel => '借贷金额';

  @override
  String get annualRateBps => '年化利率（基点）';

  @override
  String get annualRateBpsHint => '如: 500 表示 5%';

  @override
  String get jsonInputHint => '输入JSON...';

  @override
  String get searchEmoji => '搜索 Emoji...';

  @override
  String get searchCountry => '搜索国家/地区...';

  @override
  String get fieldNameLabel => '字段名';

  @override
  String get fieldNameHint => '如：备注信息';

  @override
  String get fieldValueLabel => '字段值';

  @override
  String get fieldValueHint => '请输入值';

  @override
  String get stakeholderName => '名称';

  @override
  String get stakeholderNameHint => '输入相关方名称';

  @override
  String get stakeholderDescription => '描述（可选）';

  @override
  String get stakeholderDescriptionHint => '输入描述信息';

  @override
  String get stakeholderContact => '联系方式（可选）';

  @override
  String get stakeholderContactHint => '输入联系方式';

  @override
  String get stakeholderNote => '备注（可选）';

  @override
  String get stakeholderNoteHint => '输入备注信息';

  @override
  String get projectName => '项目名称';

  @override
  String get projectNameHint => '请输入项目名称';

  @override
  String get projectLedger => '所属账本';

  @override
  String get projectDescription => '项目描述';

  @override
  String get projectDescriptionHint => '请输入项目描述（可选）';

  @override
  String get projectBudget => '预算金额';

  @override
  String get projectBudgetHint => '请输入预算金额（可选）';

  @override
  String get projectStartDate => '开始日期';

  @override
  String get projectEndDate => '结束日期';

  @override
  String addCategoryType(Object type) {
    return '添加$type分类';
  }
}
