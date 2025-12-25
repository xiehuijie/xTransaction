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
  String get verificationFailed => 'Verification failed';

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
  String get japanese => '日本語';

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
  String get selectThemeColor => 'Select Theme Color';

  @override
  String get selectThemeMode => 'Select Theme Mode';

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
  String get biometricVerificationFailed => 'Verification failed';

  @override
  String get biometricNotSetUp =>
      'Please set up biometrics on your device first';

  @override
  String get biometricTooManyAttempts => 'Too many attempts, please try later';

  @override
  String get biometricCannotEnable => 'Cannot enable biometric';

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
  String get enabled => 'Enabled';

  @override
  String get disabled => 'Disabled';

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
  String get biometricNotSupportedMessage =>
      'Device does not support biometrics or biometrics not set up';

  @override
  String get authenticateToEnableBiometric =>
      'Authenticate to enable biometric unlock';

  @override
  String get tooManyBiometricAttempts => 'Too many attempts, please try later';

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
  String get onboardingBiometricTitle => 'Biometrics';

  @override
  String get onboardingBiometricSubtitle => 'Enable biometric unlock';

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
}
