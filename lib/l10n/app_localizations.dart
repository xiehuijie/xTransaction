import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'X Transaction'**
  String get appName;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'A personal transaction management app.'**
  String get appDescription;

  /// No description provided for @appLocked.
  ///
  /// In en, this message translates to:
  /// **'App Locked'**
  String get appLocked;

  /// No description provided for @authenticating.
  ///
  /// In en, this message translates to:
  /// **'Authenticating...'**
  String get authenticating;

  /// No description provided for @reauthenticate.
  ///
  /// In en, this message translates to:
  /// **'Re-authenticate'**
  String get reauthenticate;

  /// No description provided for @appFailedToStart.
  ///
  /// In en, this message translates to:
  /// **'App failed to start'**
  String get appFailedToStart;

  /// No description provided for @verificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Verification failed, please try again'**
  String get verificationFailed;

  /// No description provided for @biometricNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Biometric not supported, please disable biometric unlock in settings'**
  String get biometricNotSupported;

  /// No description provided for @biometricNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Biometric not available, please disable biometric unlock in settings'**
  String get biometricNotAvailable;

  /// No description provided for @biometricNotEnrolled.
  ///
  /// In en, this message translates to:
  /// **'Please set up biometric on your device first'**
  String get biometricNotEnrolled;

  /// No description provided for @biometricLockedOut.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts, please try later'**
  String get biometricLockedOut;

  /// No description provided for @biometricPermanentlyLockedOut.
  ///
  /// In en, this message translates to:
  /// **'Verification locked, please use device password'**
  String get biometricPermanentlyLockedOut;

  /// No description provided for @biometricError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again'**
  String get biometricError;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @assets.
  ///
  /// In en, this message translates to:
  /// **'Assets'**
  String get assets;

  /// No description provided for @onboarding.
  ///
  /// In en, this message translates to:
  /// **'Onboarding'**
  String get onboarding;

  /// No description provided for @accountConfig.
  ///
  /// In en, this message translates to:
  /// **'Account Configuration'**
  String get accountConfig;

  /// No description provided for @accountSelection.
  ///
  /// In en, this message translates to:
  /// **'Account Selection'**
  String get accountSelection;

  /// No description provided for @categoryConfig.
  ///
  /// In en, this message translates to:
  /// **'Category Configuration'**
  String get categoryConfig;

  /// No description provided for @categorySelection.
  ///
  /// In en, this message translates to:
  /// **'Category Selection'**
  String get categorySelection;

  /// No description provided for @currencyConfig.
  ///
  /// In en, this message translates to:
  /// **'Currency Configuration'**
  String get currencyConfig;

  /// No description provided for @dataRecovery.
  ///
  /// In en, this message translates to:
  /// **'Data Recovery'**
  String get dataRecovery;

  /// No description provided for @ledgerConfig.
  ///
  /// In en, this message translates to:
  /// **'Ledger Configuration'**
  String get ledgerConfig;

  /// No description provided for @previewConfirm.
  ///
  /// In en, this message translates to:
  /// **'Preview & Confirm'**
  String get previewConfirm;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @selectLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please select your preferred language'**
  String get selectLanguageSubtitle;

  /// No description provided for @chineseSimplified.
  ///
  /// In en, this message translates to:
  /// **'简体中文'**
  String get chineseSimplified;

  /// No description provided for @assetManagement.
  ///
  /// In en, this message translates to:
  /// **'Asset Management'**
  String get assetManagement;

  /// No description provided for @assetManagementDesc.
  ///
  /// In en, this message translates to:
  /// **'View account balances and asset distribution'**
  String get assetManagementDesc;

  /// No description provided for @budgetManagement.
  ///
  /// In en, this message translates to:
  /// **'Budget Management'**
  String get budgetManagement;

  /// No description provided for @budgetManagementDesc.
  ///
  /// In en, this message translates to:
  /// **'Set budgets and track expenses'**
  String get budgetManagementDesc;

  /// No description provided for @multiCurrencySupport.
  ///
  /// In en, this message translates to:
  /// **'Multi-Currency Support'**
  String get multiCurrencySupport;

  /// No description provided for @multiCurrencySupportDesc.
  ///
  /// In en, this message translates to:
  /// **'Support for multiple currencies and exchange rate conversion'**
  String get multiCurrencySupportDesc;

  /// No description provided for @multiLedger.
  ///
  /// In en, this message translates to:
  /// **'Multi-Ledger'**
  String get multiLedger;

  /// No description provided for @multiLedgerDesc.
  ///
  /// In en, this message translates to:
  /// **'Create multiple ledgers for separate management'**
  String get multiLedgerDesc;

  /// No description provided for @securitySettings.
  ///
  /// In en, this message translates to:
  /// **'Security Settings'**
  String get securitySettings;

  /// No description provided for @biometricUnlock.
  ///
  /// In en, this message translates to:
  /// **'Biometric Unlock'**
  String get biometricUnlock;

  /// No description provided for @biometricUnlockDesc.
  ///
  /// In en, this message translates to:
  /// **'Use fingerprint or face to unlock the app'**
  String get biometricUnlockDesc;

  /// No description provided for @appearanceSettings.
  ///
  /// In en, this message translates to:
  /// **'Appearance Settings'**
  String get appearanceSettings;

  /// No description provided for @themeColor.
  ///
  /// In en, this message translates to:
  /// **'Theme Color'**
  String get themeColor;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @dataManagement.
  ///
  /// In en, this message translates to:
  /// **'Data Management'**
  String get dataManagement;

  /// No description provided for @backupAndRestore.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get backupAndRestore;

  /// No description provided for @resetAppData.
  ///
  /// In en, this message translates to:
  /// **'Reset App Data'**
  String get resetAppData;

  /// No description provided for @resetAppDataConfirm.
  ///
  /// In en, this message translates to:
  /// **'Reset App Data'**
  String get resetAppDataConfirm;

  /// No description provided for @functionInDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Function in development'**
  String get functionInDevelopment;

  /// No description provided for @confirmReset.
  ///
  /// In en, this message translates to:
  /// **'Confirm Reset'**
  String get confirmReset;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @functionSettings.
  ///
  /// In en, this message translates to:
  /// **'Function Settings'**
  String get functionSettings;

  /// No description provided for @disableAssetManagementConfirm.
  ///
  /// In en, this message translates to:
  /// **'Disabling will hide the asset page, but recorded account and asset data will not be deleted.\n\nYou can re-enable this feature at any time.'**
  String get disableAssetManagementConfirm;

  /// No description provided for @selectThemeColor.
  ///
  /// In en, this message translates to:
  /// **'Select Theme Color'**
  String get selectThemeColor;

  /// No description provided for @selectThemeMode.
  ///
  /// In en, this message translates to:
  /// **'Select Theme Mode'**
  String get selectThemeMode;

  /// No description provided for @resetAppDataConfirmContent.
  ///
  /// In en, this message translates to:
  /// **'This operation will clear all data, including accounts, transaction records, etc. This operation cannot be undone. Are you sure you want to continue?'**
  String get resetAppDataConfirmContent;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start configuring your transaction app'**
  String get welcomeSubtitle;

  /// No description provided for @currencySettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Currency Settings'**
  String get currencySettingsTitle;

  /// No description provided for @currencySettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Configure the currencies you need and default currency'**
  String get currencySettingsSubtitle;

  /// No description provided for @accountSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettingsTitle;

  /// No description provided for @accountSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your bank cards, wallets and other accounts'**
  String get accountSettingsSubtitle;

  /// No description provided for @categorySettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Category Settings'**
  String get categorySettingsTitle;

  /// No description provided for @categorySettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Configure income and expense categories, support multi-level structure'**
  String get categorySettingsSubtitle;

  /// No description provided for @ledgerSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Ledger Settings'**
  String get ledgerSettingsTitle;

  /// No description provided for @ledgerSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create ledgers and select associated accounts and categories'**
  String get ledgerSettingsSubtitle;

  /// No description provided for @biometricTitle.
  ///
  /// In en, this message translates to:
  /// **'Biometrics'**
  String get biometricTitle;

  /// No description provided for @biometricSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable fingerprint or face to protect your financial data'**
  String get biometricSubtitle;

  /// No description provided for @completeTitle.
  ///
  /// In en, this message translates to:
  /// **'Configuration Complete'**
  String get completeTitle;

  /// No description provided for @completeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Everything is ready, start your transaction journey!'**
  String get completeSubtitle;

  /// No description provided for @startFresh.
  ///
  /// In en, this message translates to:
  /// **'Start Fresh'**
  String get startFresh;

  /// No description provided for @startFreshDesc.
  ///
  /// In en, this message translates to:
  /// **'Create a new transaction environment'**
  String get startFreshDesc;

  /// No description provided for @restoreFromBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore from Backup'**
  String get restoreFromBackup;

  /// No description provided for @restoreFromBackupDesc.
  ///
  /// In en, this message translates to:
  /// **'Restore data from backup file'**
  String get restoreFromBackupDesc;

  /// No description provided for @previousStep.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previousStep;

  /// No description provided for @nextStep.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextStep;

  /// No description provided for @startUsing.
  ///
  /// In en, this message translates to:
  /// **'Start Using'**
  String get startUsing;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @configureCurrencies.
  ///
  /// In en, this message translates to:
  /// **'Configure Currencies'**
  String get configureCurrencies;

  /// No description provided for @configureAccounts.
  ///
  /// In en, this message translates to:
  /// **'Configure Accounts'**
  String get configureAccounts;

  /// No description provided for @configureCategories.
  ///
  /// In en, this message translates to:
  /// **'Configure Categories'**
  String get configureCategories;

  /// No description provided for @configureLedgers.
  ///
  /// In en, this message translates to:
  /// **'Configure Ledgers'**
  String get configureLedgers;

  /// No description provided for @selectedCount.
  ///
  /// In en, this message translates to:
  /// **'Selected {count} items'**
  String selectedCount(Object count);

  /// No description provided for @addedCount.
  ///
  /// In en, this message translates to:
  /// **'Added {count} items'**
  String addedCount(Object count);

  /// No description provided for @expenseIncomeCount.
  ///
  /// In en, this message translates to:
  /// **'Expense {expenseCount}, Income {incomeCount}'**
  String expenseIncomeCount(Object expenseCount, Object incomeCount);

  /// No description provided for @authenticateToEnable.
  ///
  /// In en, this message translates to:
  /// **'Authenticate to enable biometric unlock'**
  String get authenticateToEnable;

  /// No description provided for @authenticationFailed.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed'**
  String get authenticationFailed;

  /// No description provided for @setupBiometricFirst.
  ///
  /// In en, this message translates to:
  /// **'Please set up biometrics on your device first'**
  String get setupBiometricFirst;

  /// No description provided for @tooManyAttempts.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts, please try later'**
  String get tooManyAttempts;

  /// No description provided for @cannotEnableBiometric.
  ///
  /// In en, this message translates to:
  /// **'Cannot enable biometrics'**
  String get cannotEnableBiometric;

  /// No description provided for @initializationFailed.
  ///
  /// In en, this message translates to:
  /// **'Initialization failed: {error}'**
  String initializationFailed(Object error);

  /// No description provided for @configurationSummary.
  ///
  /// In en, this message translates to:
  /// **'Configuration Summary'**
  String get configurationSummary;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @ledger.
  ///
  /// In en, this message translates to:
  /// **'Ledger'**
  String get ledger;

  /// No description provided for @biometrics.
  ///
  /// In en, this message translates to:
  /// **'Biometrics'**
  String get biometrics;

  /// No description provided for @countItems.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String countItems(Object count);

  /// No description provided for @countAccounts.
  ///
  /// In en, this message translates to:
  /// **'{count} accounts'**
  String countAccounts(Object count);

  /// No description provided for @countCategories.
  ///
  /// In en, this message translates to:
  /// **'{count} categories'**
  String countCategories(Object count);

  /// No description provided for @countLedgers.
  ///
  /// In en, this message translates to:
  /// **'{count} ledgers'**
  String countLedgers(Object count);

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @chinese.
  ///
  /// In en, this message translates to:
  /// **'简体中文'**
  String get chinese;

  /// No description provided for @japanese.
  ///
  /// In en, this message translates to:
  /// **'日本語'**
  String get japanese;

  /// No description provided for @blue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get blue;

  /// No description provided for @purple.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get purple;

  /// No description provided for @orange.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get orange;

  /// No description provided for @green.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get green;

  /// No description provided for @pink.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get pink;

  /// No description provided for @teal.
  ///
  /// In en, this message translates to:
  /// **'Teal'**
  String get teal;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @biometricNotSupportedMessage.
  ///
  /// In en, this message translates to:
  /// **'Device does not support biometrics or biometrics not set up'**
  String get biometricNotSupportedMessage;

  /// No description provided for @authenticateToEnableBiometric.
  ///
  /// In en, this message translates to:
  /// **'Authenticate to enable biometric unlock'**
  String get authenticateToEnableBiometric;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start your transaction journey'**
  String get onboardingWelcomeSubtitle;

  /// No description provided for @onboardingCurrencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Configure Currency'**
  String get onboardingCurrencyTitle;

  /// No description provided for @onboardingCurrencySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your commonly used currencies'**
  String get onboardingCurrencySubtitle;

  /// No description provided for @onboardingAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Configure Account'**
  String get onboardingAccountTitle;

  /// No description provided for @onboardingAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your account information'**
  String get onboardingAccountSubtitle;

  /// No description provided for @onboardingCategoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Configure Category'**
  String get onboardingCategoryTitle;

  /// No description provided for @onboardingCategorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set up transaction categories'**
  String get onboardingCategorySubtitle;

  /// No description provided for @onboardingLedgerTitle.
  ///
  /// In en, this message translates to:
  /// **'Configure Ledger'**
  String get onboardingLedgerTitle;

  /// No description provided for @onboardingLedgerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your ledgers'**
  String get onboardingLedgerSubtitle;

  /// No description provided for @onboardingCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get onboardingCompleteTitle;

  /// No description provided for @onboardingCompleteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Configuration complete, start using'**
  String get onboardingCompleteSubtitle;

  /// No description provided for @onboardingNewStart.
  ///
  /// In en, this message translates to:
  /// **'Start Fresh'**
  String get onboardingNewStart;

  /// No description provided for @onboardingNewStartDesc.
  ///
  /// In en, this message translates to:
  /// **'Create a brand new transaction environment'**
  String get onboardingNewStartDesc;

  /// No description provided for @onboardingRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore from Backup'**
  String get onboardingRestore;

  /// No description provided for @onboardingRestoreDesc.
  ///
  /// In en, this message translates to:
  /// **'Restore data from backup file'**
  String get onboardingRestoreDesc;

  /// No description provided for @onboardingConfigureCurrency.
  ///
  /// In en, this message translates to:
  /// **'Configure Currency'**
  String get onboardingConfigureCurrency;

  /// No description provided for @onboardingCurrencySelected.
  ///
  /// In en, this message translates to:
  /// **'Selected {count} currencies'**
  String onboardingCurrencySelected(Object count);

  /// No description provided for @onboardingConfigureAccount.
  ///
  /// In en, this message translates to:
  /// **'Configure Account'**
  String get onboardingConfigureAccount;

  /// No description provided for @onboardingAccountAdded.
  ///
  /// In en, this message translates to:
  /// **'Added {count} accounts'**
  String onboardingAccountAdded(Object count);

  /// No description provided for @onboardingConfigureCategory.
  ///
  /// In en, this message translates to:
  /// **'Configure Category'**
  String get onboardingConfigureCategory;

  /// No description provided for @onboardingCategoryAdded.
  ///
  /// In en, this message translates to:
  /// **'Expense {expenseCount}, Income {incomeCount}'**
  String onboardingCategoryAdded(Object expenseCount, Object incomeCount);

  /// No description provided for @onboardingConfigureLedger.
  ///
  /// In en, this message translates to:
  /// **'Configure Ledger'**
  String get onboardingConfigureLedger;

  /// No description provided for @onboardingLedgerCreated.
  ///
  /// In en, this message translates to:
  /// **'Created {count} ledgers'**
  String onboardingLedgerCreated(Object count);

  /// No description provided for @onboardingBiometricTitle.
  ///
  /// In en, this message translates to:
  /// **'Biometrics'**
  String get onboardingBiometricTitle;

  /// No description provided for @onboardingBiometricSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable biometric unlock'**
  String get onboardingBiometricSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
