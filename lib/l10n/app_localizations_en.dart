// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'X Transaction';

  @override
  String get appDescription => 'A personal transaction management app.';

  @override
  String get appLocked => 'App Locked';

  @override
  String get authenticating => 'Authenticating...';

  @override
  String get reauthenticate => 'Re-authenticate';

  @override
  String get appFailedToStart => 'App failed to start';

  @override
  String get verificationFailed => 'Verification failed, please try again';

  @override
  String get biometricNotSupported =>
      'Biometric not supported, please disable biometric unlock in settings';

  @override
  String get biometricNotAvailable =>
      'Biometric not available, please disable biometric unlock in settings';

  @override
  String get biometricNotEnrolled =>
      'Please set up biometric on your device first';

  @override
  String get biometricLockedOut => 'Too many attempts, please try later';

  @override
  String get biometricPermanentlyLockedOut =>
      'Verification locked, please use device password';

  @override
  String get biometricError => 'An error occurred, please try again';

  @override
  String get home => 'Home';

  @override
  String get overview => 'Overview';

  @override
  String get statistics => 'Statistics';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get assets => 'Assets';

  @override
  String get onboarding => 'Onboarding';

  @override
  String get accountConfig => 'Account Configuration';

  @override
  String get accountSelection => 'Account Selection';

  @override
  String get categoryConfig => 'Category Configuration';

  @override
  String get categorySelection => 'Category Selection';

  @override
  String get currencyConfig => 'Currency Configuration';

  @override
  String get dataRecovery => 'Data Recovery';

  @override
  String get ledgerConfig => 'Ledger Configuration';

  @override
  String get previewConfirm => 'Preview & Confirm';

  @override
  String get continueAction => 'Continue';

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get finish => 'Finish';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get add => 'Add';

  @override
  String get create => 'Create';

  @override
  String get update => 'Update';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get warning => 'Warning';

  @override
  String get info => 'Info';

  @override
  String get loading => 'Loading...';

  @override
  String get search => 'Search';

  @override
  String get filter => 'Filter';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get selectLanguageSubtitle => 'Please select your preferred language';

  @override
  String get chineseSimplified => '简体中文';

  @override
  String get assetManagement => 'Asset Management';

  @override
  String get assetManagementDesc =>
      'View account balances and asset distribution';

  @override
  String get budgetManagement => 'Budget Management';

  @override
  String get budgetManagementDesc => 'Set budgets and track expenses';

  @override
  String get multiCurrencySupport => 'Multi-Currency Support';

  @override
  String get multiCurrencySupportDesc =>
      'Support for multiple currencies and exchange rate conversion';

  @override
  String get multiLedger => 'Multi-Ledger';

  @override
  String get multiLedgerDesc =>
      'Create multiple ledgers for separate management';

  @override
  String get securitySettings => 'Security Settings';

  @override
  String get biometricUnlock => 'Biometric Unlock';

  @override
  String get biometricUnlockDesc => 'Use fingerprint or face to unlock the app';

  @override
  String get appearanceSettings => 'Appearance Settings';

  @override
  String get themeColor => 'Theme Color';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get language => 'Language';

  @override
  String get dataManagement => 'Data Management';

  @override
  String get backupAndRestore => 'Backup & Restore';

  @override
  String get resetAppData => 'Reset App Data';

  @override
  String get resetAppDataConfirm => 'Reset App Data';

  @override
  String get functionInDevelopment => 'Function in development';

  @override
  String get confirmReset => 'Confirm Reset';

  @override
  String get sort => 'Sort';

  @override
  String get more => 'More';

  @override
  String get functionSettings => 'Function Settings';

  @override
  String get disableAssetManagementConfirm =>
      'Disabling will hide the asset page, but recorded account and asset data will not be deleted.\n\nYou can re-enable this feature at any time.';

  @override
  String get selectThemeColor => 'Select Theme Color';

  @override
  String get selectThemeMode => 'Select Theme Mode';

  @override
  String get resetAppDataConfirmContent =>
      'This operation will clear all data, including accounts, transaction records, etc. This operation cannot be undone. Are you sure you want to continue?';

  @override
  String get welcomeTitle => 'Welcome';

  @override
  String get welcomeSubtitle => 'Let\'s start configuring your transaction app';

  @override
  String get currencySettingsTitle => 'Currency Settings';

  @override
  String get currencySettingsSubtitle =>
      'Configure the currencies you need and default currency';

  @override
  String get accountSettingsTitle => 'Account Settings';

  @override
  String get accountSettingsSubtitle =>
      'Add your bank cards, wallets and other accounts';

  @override
  String get categorySettingsTitle => 'Category Settings';

  @override
  String get categorySettingsSubtitle =>
      'Configure income and expense categories, support multi-level structure';

  @override
  String get ledgerSettingsTitle => 'Ledger Settings';

  @override
  String get ledgerSettingsSubtitle =>
      'Create ledgers and select associated accounts and categories';

  @override
  String get biometricTitle => 'Biometrics';

  @override
  String get biometricSubtitle =>
      'Enable fingerprint or face to protect your financial data';

  @override
  String get completeTitle => 'Configuration Complete';

  @override
  String get completeSubtitle =>
      'Everything is ready, start your transaction journey!';

  @override
  String get startFresh => 'Start Fresh';

  @override
  String get startFreshDesc => 'Create a new transaction environment';

  @override
  String get restoreFromBackup => 'Restore from Backup';

  @override
  String get restoreFromBackupDesc => 'Restore data from backup file';

  @override
  String get previousStep => 'Previous';

  @override
  String get nextStep => 'Next';

  @override
  String get startUsing => 'Start Using';

  @override
  String get saving => 'Saving...';

  @override
  String get configureCurrencies => 'Configure Currencies';

  @override
  String get configureAccounts => 'Configure Accounts';

  @override
  String get configureCategories => 'Configure Categories';

  @override
  String get configureLedgers => 'Configure Ledgers';

  @override
  String selectedCount(Object count) {
    return 'Selected $count items';
  }

  @override
  String addedCount(Object count) {
    return 'Added $count items';
  }

  @override
  String expenseIncomeCount(Object expenseCount, Object incomeCount) {
    return 'Expense $expenseCount, Income $incomeCount';
  }

  @override
  String get authenticateToEnable => 'Authenticate to enable biometric unlock';

  @override
  String get authenticationFailed => 'Authentication failed';

  @override
  String get setupBiometricFirst =>
      'Please set up biometrics on your device first';

  @override
  String get tooManyAttempts => 'Too many attempts, please try later';

  @override
  String get cannotEnableBiometric => 'Cannot enable biometrics';

  @override
  String initializationFailed(Object error) {
    return 'Initialization failed: $error';
  }

  @override
  String get configurationSummary => 'Configuration Summary';

  @override
  String get currency => 'Currency';

  @override
  String get account => 'Account';

  @override
  String get category => 'Category';

  @override
  String get ledger => 'Ledger';

  @override
  String get biometrics => 'Biometrics';

  @override
  String countItems(Object count) {
    return '$count items';
  }

  @override
  String countAccounts(Object count) {
    return '$count accounts';
  }

  @override
  String countCategories(Object count) {
    return '$count categories';
  }

  @override
  String countLedgers(Object count) {
    return '$count ledgers';
  }

  @override
  String get english => 'English';

  @override
  String get chinese => '简体中文';

  @override
  String get japanese => '日本語';

  @override
  String get blue => 'Blue';

  @override
  String get purple => 'Purple';

  @override
  String get orange => 'Orange';

  @override
  String get green => 'Green';

  @override
  String get pink => 'Pink';

  @override
  String get teal => 'Teal';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get enabled => 'Enabled';

  @override
  String get disabled => 'Disabled';

  @override
  String get biometricNotSupportedMessage =>
      'Device does not support biometrics or biometrics not set up';

  @override
  String get authenticateToEnableBiometric =>
      'Authenticate to enable biometric unlock';

  @override
  String get onboardingWelcomeTitle => 'Welcome';

  @override
  String get onboardingWelcomeSubtitle => 'Start your transaction journey';

  @override
  String get onboardingCurrencyTitle => 'Configure Currency';

  @override
  String get onboardingCurrencySubtitle =>
      'Select your commonly used currencies';

  @override
  String get onboardingAccountTitle => 'Configure Account';

  @override
  String get onboardingAccountSubtitle => 'Add your account information';

  @override
  String get onboardingCategoryTitle => 'Configure Category';

  @override
  String get onboardingCategorySubtitle => 'Set up transaction categories';

  @override
  String get onboardingLedgerTitle => 'Configure Ledger';

  @override
  String get onboardingLedgerSubtitle => 'Create your ledgers';

  @override
  String get onboardingCompleteTitle => 'Complete';

  @override
  String get onboardingCompleteSubtitle =>
      'Configuration complete, start using';

  @override
  String get onboardingNewStart => 'Start Fresh';

  @override
  String get onboardingNewStartDesc =>
      'Create a brand new transaction environment';

  @override
  String get onboardingRestore => 'Restore from Backup';

  @override
  String get onboardingRestoreDesc => 'Restore data from backup file';

  @override
  String get onboardingConfigureCurrency => 'Configure Currency';

  @override
  String onboardingCurrencySelected(Object count) {
    return 'Selected $count currencies';
  }

  @override
  String get onboardingConfigureAccount => 'Configure Account';

  @override
  String onboardingAccountAdded(Object count) {
    return 'Added $count accounts';
  }

  @override
  String get onboardingConfigureCategory => 'Configure Category';

  @override
  String onboardingCategoryAdded(Object expenseCount, Object incomeCount) {
    return 'Expense $expenseCount, Income $incomeCount';
  }

  @override
  String get onboardingConfigureLedger => 'Configure Ledger';

  @override
  String onboardingLedgerCreated(Object count) {
    return 'Created $count ledgers';
  }

  @override
  String get onboardingBiometricTitle => 'Biometrics';

  @override
  String get onboardingBiometricSubtitle => 'Enable biometric unlock';

  @override
  String get week => 'Week';

  @override
  String get month => 'Month';

  @override
  String get year => 'Year';

  @override
  String get categoryManagement => 'Category Management';

  @override
  String get newCategory => 'New Category';

  @override
  String get confirmDeleteTitle => 'Confirm Delete';

  @override
  String get confirmDeleteCategory =>
      'Are you sure you want to delete this category? This action cannot be undone.';

  @override
  String get selectIcon => 'Select Icon';

  @override
  String get about => 'About';

  @override
  String get licenses => 'Licenses';

  @override
  String get close => 'Close';

  @override
  String get record => 'Record';

  @override
  String get manage => 'Manage';

  @override
  String get currencyManagement => 'Currency Management';

  @override
  String get deleteCurrency => 'Delete Currency';

  @override
  String get deleteCurrencyConfirm =>
      'Are you sure you want to delete this currency?\n\nThis operation cannot be undone.';

  @override
  String get addCustomCurrency => 'Add Custom Currency';

  @override
  String get symbolPosition => 'Symbol Position';

  @override
  String get prefix => 'Prefix';

  @override
  String get suffix => 'Suffix';

  @override
  String get ledgerManagement => 'Ledger Management';

  @override
  String get createLedger => 'Create Ledger';

  @override
  String get newLedger => 'New Ledger';

  @override
  String get deleteLedger => 'Delete Ledger';

  @override
  String deleteLedgerConfirm(Object name) {
    return 'Are you sure you want to delete the ledger \"$name\"?\n\nThis operation cannot be undone.';
  }

  @override
  String get ledgerDeleted => 'Ledger deleted';

  @override
  String get baseCurrency => 'Base Currency';

  @override
  String get autoInclude => 'Auto Include';

  @override
  String get autoIncludeNewAccounts => 'Auto Include New Accounts';

  @override
  String get autoIncludeNewAccountsDesc =>
      'Newly created accounts will be automatically associated with this ledger';

  @override
  String get autoIncludeNewCategories => 'Auto Include New Categories';

  @override
  String get autoIncludeNewCategoriesDesc =>
      'Newly created categories will be automatically associated with this ledger';

  @override
  String get associatedAccounts => 'Associated Accounts';

  @override
  String get associatedCategories => 'Associated Categories';

  @override
  String get databaseBrowser => 'Database Browser';

  @override
  String get loadFailed => 'Load Failed';

  @override
  String get retry => 'Retry';

  @override
  String get noData => 'No Data';

  @override
  String get addNew => 'New';

  @override
  String get copied => 'Copied';

  @override
  String get copy => 'Copy';

  @override
  String get viewJson => 'View JSON';

  @override
  String get copyJson => 'Copy JSON';

  @override
  String get json => 'JSON';

  @override
  String jsonFormatError(Object error) {
    return 'JSON format error: $error';
  }

  @override
  String get createSuccess => 'Create Success';

  @override
  String createFailed(Object error) {
    return 'Create Failed: $error';
  }

  @override
  String get updateSuccess => 'Update Success';

  @override
  String updateFailed(Object error) {
    return 'Update Failed: $error';
  }

  @override
  String get deleteSuccess => 'Delete Success';

  @override
  String deleteFailed(Object error) {
    return 'Delete Failed: $error';
  }

  @override
  String get confirmDeleteRecord =>
      'Are you sure you want to delete this record? This operation cannot be undone.';

  @override
  String get iconPickerConfirm => 'Confirm';

  @override
  String get noRecentIcons => 'No recent icons';

  @override
  String get projectManagement => 'Project Management';

  @override
  String get newProject => 'New Project';

  @override
  String get createProject => 'Create Project';

  @override
  String get pleaseSelectLedger => 'Please select a ledger';

  @override
  String get confirmDeleteProject =>
      'Are you sure you want to delete this project? This action cannot be undone.';

  @override
  String saveFailed(Object error) {
    return 'Save Failed: $error';
  }

  @override
  String get editAccount => 'Edit';

  @override
  String get deleteAccount => 'Delete';

  @override
  String get addAccount => 'Add Account';

  @override
  String get deleteAccountConfirm =>
      'Are you sure you want to delete this account?';

  @override
  String get selectAccountType => 'Select Account Type';

  @override
  String get saveButton => 'Save';

  @override
  String get enableGiftBalance => 'Enable Gift Balance';

  @override
  String get enableGiftBalanceDesc =>
      'Associate a gift balance account with this prepaid account';

  @override
  String get useGiftFirst => 'Use Gift First';

  @override
  String get useGiftLast => 'Use Gift Last';

  @override
  String get useGiftProportional => 'Proportional Deduction';

  @override
  String get borrow => 'Borrow';

  @override
  String get lend => 'Lend';

  @override
  String get configureRepayment => 'Configure Repayment Plan';

  @override
  String get repaymentConfigInDev =>
      'Repayment plan configuration is in development...';

  @override
  String get developerTools => 'Developer Tools';

  @override
  String get allAccounts => 'All Accounts';

  @override
  String get accountDeleted => 'Account deleted';

  @override
  String deleteAccountWithTx(Object name) {
    return 'Are you sure you want to delete the account \"$name\"?\n\nThis operation cannot be undone. Related transactions will be kept but no longer associated with this account.';
  }

  @override
  String get deleteCategoryConfirm =>
      'Are you sure you want to delete this category?';

  @override
  String get stakeholderManagement => 'Stakeholder Management';

  @override
  String get newStakeholder => 'New Stakeholder';

  @override
  String addStakeholder(Object type) {
    return 'Add $type';
  }

  @override
  String get selectAvatar => 'Select Avatar';

  @override
  String get type => 'Type';

  @override
  String get deleteStakeholder => 'Delete Stakeholder';

  @override
  String deleteStakeholderConfirm(Object name) {
    return 'Are you sure you want to delete \"$name\"?\n\nThis operation cannot be undone.';
  }

  @override
  String get stakeholderDeleted => 'Stakeholder deleted';

  @override
  String get accountManagement => 'Account Management';

  @override
  String get newAccount => 'New Account';

  @override
  String addAccountType(Object type) {
    return 'Add $type';
  }

  @override
  String get allSystemFieldsAdded => 'All system fields have been added';

  @override
  String get extendedInfo => 'Extended Info';

  @override
  String get addSystemField => 'Add System Field';

  @override
  String get addCustomField => 'Add Custom Field';

  @override
  String get fieldName => 'Field Name';

  @override
  String get fieldValue => 'Field Value';

  @override
  String get allCategories => 'All Categories';

  @override
  String get multiCurrencyConfig => 'Multi-Currency Configuration';

  @override
  String get backupRestore => 'Restore from Backup';

  @override
  String get backupRestoreInDev => 'Backup restore is in development';

  @override
  String get selectBackupFile => 'Select Backup File';

  @override
  String get cloudRestoreInDev => 'Cloud backup is in development';

  @override
  String get restoreFromCloud => 'Restore from Cloud';

  @override
  String get bindSpecificAsset => 'Bind Specific Asset';

  @override
  String get repaymentPlanConfig => 'Repayment Plan Configuration';

  @override
  String get autoGenerate => 'Auto Generate';

  @override
  String get addPeriod => 'Add Period';

  @override
  String get autoGenerateRepayment => 'Auto Generate Repayment Plan';

  @override
  String get period => 'Period';

  @override
  String get amount => 'Amount';

  @override
  String get interval => 'Interval';

  @override
  String get everyMonth => 'Every Month';

  @override
  String get everyTwoMonths => 'Every Two Months';

  @override
  String get everyQuarter => 'Every Quarter';

  @override
  String get everySixMonths => 'Every Six Months';

  @override
  String get everyYear => 'Every Year';

  @override
  String get generate => 'Generate';

  @override
  String get addLedger => 'Add Ledger';

  @override
  String get setAsDefault => 'Set as Default';

  @override
  String get ledgerBaseCurrency => 'Ledger Base Currency';

  @override
  String get autoIncludeSettings => 'Auto Include Settings';

  @override
  String get autoIncludeNewAccount => 'Auto Include New Accounts';

  @override
  String get autoIncludeNewAccountDesc =>
      'Newly created accounts will be automatically added to this ledger';

  @override
  String get autoIncludeNewCategory => 'Auto Include New Categories';

  @override
  String get autoIncludeNewCategoryDesc =>
      'Newly created categories will be automatically added to this ledger';

  @override
  String get giftDeductionMode => 'Gift Deduction Mode';

  @override
  String get giftAccountName => 'Gift Account Name';

  @override
  String get giftAccountNameHint => 'Leave blank to auto-generate';

  @override
  String get giftCurrency => 'Gift Currency';

  @override
  String get giftInitialBalance => 'Gift Initial Balance';

  @override
  String get giftInitialBalanceHint => 'Gift amount when created';

  @override
  String get loanAmount => 'Loan Amount';

  @override
  String get loanAmountRequired => 'Loan Amount *';

  @override
  String get loanAmountHint => 'Please enter loan amount';

  @override
  String get annualRate => 'Annual Rate (%)';

  @override
  String get annualRateHint => 'e.g.: 5.00';

  @override
  String get startDate => 'Start Date';

  @override
  String get startDateRequired => 'Start Date *';

  @override
  String get endDate => 'End Date';

  @override
  String get endDateRequired => 'End Date *';

  @override
  String get loanNote => 'Loan Note';

  @override
  String get loanNoteHint => 'e.g.: Purpose, repayment method, etc.';

  @override
  String get dueDate => 'Due Date';

  @override
  String get note => 'Note';

  @override
  String get periods => 'Periods';

  @override
  String get amountPerPeriod => 'Amount Per Period';

  @override
  String get repaymentInterval => 'Repayment Interval';

  @override
  String get creditLimit => 'Credit Limit';

  @override
  String get creditLimitRequired => 'Credit Limit *';

  @override
  String get creditLimitHint => 'Please enter credit limit';

  @override
  String get billingDay => 'Billing Day';

  @override
  String get paymentDay => 'Payment Day';

  @override
  String get bankName => 'Bank Name';

  @override
  String get bankNameHint => 'e.g.: China Merchants Bank';

  @override
  String get cardNumber => 'Card Number';

  @override
  String get cardNumberHint => 'Please enter card number';

  @override
  String get expiryDate => 'Expiry Date';

  @override
  String get expiryDateHint => 'e.g.: 12/28';

  @override
  String dayRequired(Object label) {
    return '$label *';
  }

  @override
  String get bankNameLabel => 'Bank Name';

  @override
  String get bankNameLabelHint => 'e.g.: ICBC';

  @override
  String get bankCardNumber => 'Bank Card Number';

  @override
  String get bankCardNumberHint => 'Please enter bank card number';

  @override
  String get bankBranch => 'Bank Branch';

  @override
  String get bankBranchHint => 'e.g.: XX Branch';

  @override
  String get cardholderName => 'Cardholder Name';

  @override
  String get cardholderNameHint => 'Please enter cardholder name';

  @override
  String get accountNameRequired => 'Account Name *';

  @override
  String get accountNameHint => 'Please enter account name';

  @override
  String get accountCurrencyRequired => 'Account Currency *';

  @override
  String get initialBalance => 'Initial Balance';

  @override
  String get initialBalanceHint => 'Initial amount when created';

  @override
  String get accountDescription => 'Account Description';

  @override
  String get accountDescriptionHint =>
      'Optional, brief description of this account';

  @override
  String get accountNote => 'Note';

  @override
  String get accountNoteHint => 'Optional, add note information';

  @override
  String get previewConfig => 'Configuration Preview';

  @override
  String get confirmAndStart => 'Confirm and Start Using';

  @override
  String get searchCurrency => 'Search currency...';

  @override
  String get iconHint => 'Icon';

  @override
  String get currencyCode => 'Currency Code';

  @override
  String get currencyCodeHint => 'e.g.: POINT, TOKEN';

  @override
  String get currencyName => 'Currency Name';

  @override
  String get currencyNameHint => 'e.g.: Points, Tokens';

  @override
  String get currencySymbol => 'Currency Symbol';

  @override
  String get currencySymbolHint => 'e.g.: ¤, ₿';

  @override
  String get categoryName => 'Category Name';

  @override
  String get categoryNameHint => 'Please enter category name';

  @override
  String get categoryType => 'Category Type';

  @override
  String get parentCategory => 'Parent Category';

  @override
  String get sortOrder => 'Sort Order';

  @override
  String get sortOrderHint => 'Smaller values appear first';

  @override
  String get ledgerName => 'Ledger Name';

  @override
  String get ledgerNameHint => 'Enter ledger name';

  @override
  String get ledgerNameExample => 'e.g.: Daily Ledger, Family Ledger';

  @override
  String get descriptionOptional => 'Description (Optional)';

  @override
  String get descriptionHint => 'Enter description';

  @override
  String get ledgerDescriptionHint => 'Purpose of the ledger';

  @override
  String get noteOptional => 'Note (Optional)';

  @override
  String get noteHint => 'Enter note information';

  @override
  String get accountNameLabel => 'Account Name';

  @override
  String get accountNameExample => 'e.g.: ICBC Savings Card';

  @override
  String get accountCurrency => 'Account Currency';

  @override
  String get initialBalanceDefault => '0.00';

  @override
  String get accountDescriptionOptional => 'Account Description (Optional)';

  @override
  String get creditLimitLabel => 'Credit Limit';

  @override
  String get giftDeductionModeLabel => 'Gift Deduction Mode';

  @override
  String get giftInitialBalanceLabel => 'Gift Initial Balance';

  @override
  String get investmentType => 'Investment Type';

  @override
  String get investmentCode => 'Investment Code (Optional)';

  @override
  String get loanAmountLabel => 'Loan Amount';

  @override
  String get annualRateBps => 'Annual Rate (bps)';

  @override
  String get annualRateBpsHint => 'e.g.: 500 = 5%';

  @override
  String get jsonInputHint => 'Enter JSON...';

  @override
  String get searchEmoji => 'Search Emoji...';

  @override
  String get searchCountry => 'Search country/region...';

  @override
  String get fieldNameLabel => 'Field Name';

  @override
  String get fieldNameHint => 'e.g.: Note';

  @override
  String get fieldValueLabel => 'Field Value';

  @override
  String get fieldValueHint => 'Please enter value';

  @override
  String get stakeholderName => 'Name';

  @override
  String get stakeholderNameHint => 'Enter stakeholder name';

  @override
  String get stakeholderDescription => 'Description (Optional)';

  @override
  String get stakeholderDescriptionHint => 'Enter description';

  @override
  String get stakeholderContact => 'Contact (Optional)';

  @override
  String get stakeholderContactHint => 'Enter contact information';

  @override
  String get stakeholderNote => 'Note (Optional)';

  @override
  String get stakeholderNoteHint => 'Enter note information';

  @override
  String get projectName => 'Project Name';

  @override
  String get projectNameHint => 'Please enter project name';

  @override
  String get projectLedger => 'Project Ledger';

  @override
  String get projectDescription => 'Project Description';

  @override
  String get projectDescriptionHint =>
      'Please enter project description (optional)';

  @override
  String get projectBudget => 'Budget Amount';

  @override
  String get projectBudgetHint => 'Please enter budget amount (optional)';

  @override
  String get projectStartDate => 'Start Date';

  @override
  String get projectEndDate => 'End Date';

  @override
  String addCategoryType(Object type) {
    return 'Add $type Category';
  }
}
