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

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @categoryManagement.
  ///
  /// In en, this message translates to:
  /// **'Category Management'**
  String get categoryManagement;

  /// No description provided for @newCategory.
  ///
  /// In en, this message translates to:
  /// **'New Category'**
  String get newCategory;

  /// No description provided for @confirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDeleteTitle;

  /// No description provided for @confirmDeleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this category? This action cannot be undone.'**
  String get confirmDeleteCategory;

  /// No description provided for @selectIcon.
  ///
  /// In en, this message translates to:
  /// **'Select Icon'**
  String get selectIcon;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @record.
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get record;

  /// No description provided for @manage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manage;

  /// No description provided for @currencyManagement.
  ///
  /// In en, this message translates to:
  /// **'Currency Management'**
  String get currencyManagement;

  /// No description provided for @deleteCurrency.
  ///
  /// In en, this message translates to:
  /// **'Delete Currency'**
  String get deleteCurrency;

  /// No description provided for @deleteCurrencyConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this currency?\n\nThis operation cannot be undone.'**
  String get deleteCurrencyConfirm;

  /// No description provided for @addCustomCurrency.
  ///
  /// In en, this message translates to:
  /// **'Add Custom Currency'**
  String get addCustomCurrency;

  /// No description provided for @symbolPosition.
  ///
  /// In en, this message translates to:
  /// **'Symbol Position'**
  String get symbolPosition;

  /// No description provided for @prefix.
  ///
  /// In en, this message translates to:
  /// **'Prefix'**
  String get prefix;

  /// No description provided for @suffix.
  ///
  /// In en, this message translates to:
  /// **'Suffix'**
  String get suffix;

  /// No description provided for @ledgerManagement.
  ///
  /// In en, this message translates to:
  /// **'Ledger Management'**
  String get ledgerManagement;

  /// No description provided for @createLedger.
  ///
  /// In en, this message translates to:
  /// **'Create Ledger'**
  String get createLedger;

  /// No description provided for @newLedger.
  ///
  /// In en, this message translates to:
  /// **'New Ledger'**
  String get newLedger;

  /// No description provided for @deleteLedger.
  ///
  /// In en, this message translates to:
  /// **'Delete Ledger'**
  String get deleteLedger;

  /// No description provided for @deleteLedgerConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the ledger \"{name}\"?\n\nThis operation cannot be undone.'**
  String deleteLedgerConfirm(Object name);

  /// No description provided for @ledgerDeleted.
  ///
  /// In en, this message translates to:
  /// **'Ledger deleted'**
  String get ledgerDeleted;

  /// No description provided for @baseCurrency.
  ///
  /// In en, this message translates to:
  /// **'Base Currency'**
  String get baseCurrency;

  /// No description provided for @autoInclude.
  ///
  /// In en, this message translates to:
  /// **'Auto Include'**
  String get autoInclude;

  /// No description provided for @autoIncludeNewAccounts.
  ///
  /// In en, this message translates to:
  /// **'Auto Include New Accounts'**
  String get autoIncludeNewAccounts;

  /// No description provided for @autoIncludeNewAccountsDesc.
  ///
  /// In en, this message translates to:
  /// **'Newly created accounts will be automatically associated with this ledger'**
  String get autoIncludeNewAccountsDesc;

  /// No description provided for @autoIncludeNewCategories.
  ///
  /// In en, this message translates to:
  /// **'Auto Include New Categories'**
  String get autoIncludeNewCategories;

  /// No description provided for @autoIncludeNewCategoriesDesc.
  ///
  /// In en, this message translates to:
  /// **'Newly created categories will be automatically associated with this ledger'**
  String get autoIncludeNewCategoriesDesc;

  /// No description provided for @associatedAccounts.
  ///
  /// In en, this message translates to:
  /// **'Associated Accounts'**
  String get associatedAccounts;

  /// No description provided for @associatedCategories.
  ///
  /// In en, this message translates to:
  /// **'Associated Categories'**
  String get associatedCategories;

  /// No description provided for @databaseBrowser.
  ///
  /// In en, this message translates to:
  /// **'Database Browser'**
  String get databaseBrowser;

  /// No description provided for @loadFailed.
  ///
  /// In en, this message translates to:
  /// **'Load Failed'**
  String get loadFailed;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No Data'**
  String get noData;

  /// No description provided for @addNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get addNew;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get copied;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @viewJson.
  ///
  /// In en, this message translates to:
  /// **'View JSON'**
  String get viewJson;

  /// No description provided for @copyJson.
  ///
  /// In en, this message translates to:
  /// **'Copy JSON'**
  String get copyJson;

  /// No description provided for @json.
  ///
  /// In en, this message translates to:
  /// **'JSON'**
  String get json;

  /// No description provided for @jsonFormatError.
  ///
  /// In en, this message translates to:
  /// **'JSON format error: {error}'**
  String jsonFormatError(Object error);

  /// No description provided for @createSuccess.
  ///
  /// In en, this message translates to:
  /// **'Create Success'**
  String get createSuccess;

  /// No description provided for @createFailed.
  ///
  /// In en, this message translates to:
  /// **'Create Failed: {error}'**
  String createFailed(Object error);

  /// No description provided for @updateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Update Success'**
  String get updateSuccess;

  /// No description provided for @updateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update Failed: {error}'**
  String updateFailed(Object error);

  /// No description provided for @deleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Delete Success'**
  String get deleteSuccess;

  /// No description provided for @deleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Delete Failed: {error}'**
  String deleteFailed(Object error);

  /// No description provided for @confirmDeleteRecord.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this record? This operation cannot be undone.'**
  String get confirmDeleteRecord;

  /// No description provided for @iconPickerConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get iconPickerConfirm;

  /// No description provided for @noRecentIcons.
  ///
  /// In en, this message translates to:
  /// **'No recent icons'**
  String get noRecentIcons;

  /// No description provided for @projectManagement.
  ///
  /// In en, this message translates to:
  /// **'Project Management'**
  String get projectManagement;

  /// No description provided for @newProject.
  ///
  /// In en, this message translates to:
  /// **'New Project'**
  String get newProject;

  /// No description provided for @createProject.
  ///
  /// In en, this message translates to:
  /// **'Create Project'**
  String get createProject;

  /// No description provided for @pleaseSelectLedger.
  ///
  /// In en, this message translates to:
  /// **'Please select a ledger'**
  String get pleaseSelectLedger;

  /// No description provided for @confirmDeleteProject.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this project? This action cannot be undone.'**
  String get confirmDeleteProject;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Save Failed: {error}'**
  String saveFailed(Object error);

  /// No description provided for @editAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editAccount;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteAccount;

  /// No description provided for @addAccount.
  ///
  /// In en, this message translates to:
  /// **'Add Account'**
  String get addAccount;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this account?'**
  String get deleteAccountConfirm;

  /// No description provided for @selectAccountType.
  ///
  /// In en, this message translates to:
  /// **'Select Account Type'**
  String get selectAccountType;

  /// No description provided for @saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// No description provided for @enableGiftBalance.
  ///
  /// In en, this message translates to:
  /// **'Enable Gift Balance'**
  String get enableGiftBalance;

  /// No description provided for @enableGiftBalanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Associate a gift balance account with this prepaid account'**
  String get enableGiftBalanceDesc;

  /// No description provided for @useGiftFirst.
  ///
  /// In en, this message translates to:
  /// **'Use Gift First'**
  String get useGiftFirst;

  /// No description provided for @useGiftLast.
  ///
  /// In en, this message translates to:
  /// **'Use Gift Last'**
  String get useGiftLast;

  /// No description provided for @useGiftProportional.
  ///
  /// In en, this message translates to:
  /// **'Proportional Deduction'**
  String get useGiftProportional;

  /// No description provided for @borrow.
  ///
  /// In en, this message translates to:
  /// **'Borrow'**
  String get borrow;

  /// No description provided for @lend.
  ///
  /// In en, this message translates to:
  /// **'Lend'**
  String get lend;

  /// No description provided for @configureRepayment.
  ///
  /// In en, this message translates to:
  /// **'Configure Repayment Plan'**
  String get configureRepayment;

  /// No description provided for @repaymentConfigInDev.
  ///
  /// In en, this message translates to:
  /// **'Repayment plan configuration is in development...'**
  String get repaymentConfigInDev;

  /// No description provided for @developerTools.
  ///
  /// In en, this message translates to:
  /// **'Developer Tools'**
  String get developerTools;

  /// No description provided for @allAccounts.
  ///
  /// In en, this message translates to:
  /// **'All Accounts'**
  String get allAccounts;

  /// No description provided for @accountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Account deleted'**
  String get accountDeleted;

  /// No description provided for @deleteAccountWithTx.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the account \"{name}\"?\n\nThis operation cannot be undone. Related transactions will be kept but no longer associated with this account.'**
  String deleteAccountWithTx(Object name);

  /// No description provided for @deleteCategoryConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this category?'**
  String get deleteCategoryConfirm;

  /// No description provided for @stakeholderManagement.
  ///
  /// In en, this message translates to:
  /// **'Stakeholder Management'**
  String get stakeholderManagement;

  /// No description provided for @newStakeholder.
  ///
  /// In en, this message translates to:
  /// **'New Stakeholder'**
  String get newStakeholder;

  /// No description provided for @addStakeholder.
  ///
  /// In en, this message translates to:
  /// **'Add {type}'**
  String addStakeholder(Object type);

  /// No description provided for @selectAvatar.
  ///
  /// In en, this message translates to:
  /// **'Select Avatar'**
  String get selectAvatar;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @deleteStakeholder.
  ///
  /// In en, this message translates to:
  /// **'Delete Stakeholder'**
  String get deleteStakeholder;

  /// No description provided for @deleteStakeholderConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?\n\nThis operation cannot be undone.'**
  String deleteStakeholderConfirm(Object name);

  /// No description provided for @stakeholderDeleted.
  ///
  /// In en, this message translates to:
  /// **'Stakeholder deleted'**
  String get stakeholderDeleted;

  /// No description provided for @accountManagement.
  ///
  /// In en, this message translates to:
  /// **'Account Management'**
  String get accountManagement;

  /// No description provided for @newAccount.
  ///
  /// In en, this message translates to:
  /// **'New Account'**
  String get newAccount;

  /// No description provided for @addAccountType.
  ///
  /// In en, this message translates to:
  /// **'Add {type}'**
  String addAccountType(Object type);

  /// No description provided for @allSystemFieldsAdded.
  ///
  /// In en, this message translates to:
  /// **'All system fields have been added'**
  String get allSystemFieldsAdded;

  /// No description provided for @extendedInfo.
  ///
  /// In en, this message translates to:
  /// **'Extended Info'**
  String get extendedInfo;

  /// No description provided for @addSystemField.
  ///
  /// In en, this message translates to:
  /// **'Add System Field'**
  String get addSystemField;

  /// No description provided for @addCustomField.
  ///
  /// In en, this message translates to:
  /// **'Add Custom Field'**
  String get addCustomField;

  /// No description provided for @fieldName.
  ///
  /// In en, this message translates to:
  /// **'Field Name'**
  String get fieldName;

  /// No description provided for @fieldValue.
  ///
  /// In en, this message translates to:
  /// **'Field Value'**
  String get fieldValue;

  /// No description provided for @allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get allCategories;

  /// No description provided for @multiCurrencyConfig.
  ///
  /// In en, this message translates to:
  /// **'Multi-Currency Configuration'**
  String get multiCurrencyConfig;

  /// No description provided for @backupRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore from Backup'**
  String get backupRestore;

  /// No description provided for @backupRestoreInDev.
  ///
  /// In en, this message translates to:
  /// **'Backup restore is in development'**
  String get backupRestoreInDev;

  /// No description provided for @selectBackupFile.
  ///
  /// In en, this message translates to:
  /// **'Select Backup File'**
  String get selectBackupFile;

  /// No description provided for @cloudRestoreInDev.
  ///
  /// In en, this message translates to:
  /// **'Cloud backup is in development'**
  String get cloudRestoreInDev;

  /// No description provided for @restoreFromCloud.
  ///
  /// In en, this message translates to:
  /// **'Restore from Cloud'**
  String get restoreFromCloud;

  /// No description provided for @bindSpecificAsset.
  ///
  /// In en, this message translates to:
  /// **'Bind Specific Asset'**
  String get bindSpecificAsset;

  /// No description provided for @repaymentPlanConfig.
  ///
  /// In en, this message translates to:
  /// **'Repayment Plan Configuration'**
  String get repaymentPlanConfig;

  /// No description provided for @autoGenerate.
  ///
  /// In en, this message translates to:
  /// **'Auto Generate'**
  String get autoGenerate;

  /// No description provided for @addPeriod.
  ///
  /// In en, this message translates to:
  /// **'Add Period'**
  String get addPeriod;

  /// No description provided for @autoGenerateRepayment.
  ///
  /// In en, this message translates to:
  /// **'Auto Generate Repayment Plan'**
  String get autoGenerateRepayment;

  /// No description provided for @period.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get period;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @interval.
  ///
  /// In en, this message translates to:
  /// **'Interval'**
  String get interval;

  /// No description provided for @everyMonth.
  ///
  /// In en, this message translates to:
  /// **'Every Month'**
  String get everyMonth;

  /// No description provided for @everyTwoMonths.
  ///
  /// In en, this message translates to:
  /// **'Every Two Months'**
  String get everyTwoMonths;

  /// No description provided for @everyQuarter.
  ///
  /// In en, this message translates to:
  /// **'Every Quarter'**
  String get everyQuarter;

  /// No description provided for @everySixMonths.
  ///
  /// In en, this message translates to:
  /// **'Every Six Months'**
  String get everySixMonths;

  /// No description provided for @everyYear.
  ///
  /// In en, this message translates to:
  /// **'Every Year'**
  String get everyYear;

  /// No description provided for @generate.
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get generate;

  /// No description provided for @addLedger.
  ///
  /// In en, this message translates to:
  /// **'Add Ledger'**
  String get addLedger;

  /// No description provided for @setAsDefault.
  ///
  /// In en, this message translates to:
  /// **'Set as Default'**
  String get setAsDefault;

  /// No description provided for @ledgerBaseCurrency.
  ///
  /// In en, this message translates to:
  /// **'Ledger Base Currency'**
  String get ledgerBaseCurrency;

  /// No description provided for @autoIncludeSettings.
  ///
  /// In en, this message translates to:
  /// **'Auto Include Settings'**
  String get autoIncludeSettings;

  /// No description provided for @autoIncludeNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Auto Include New Accounts'**
  String get autoIncludeNewAccount;

  /// No description provided for @autoIncludeNewAccountDesc.
  ///
  /// In en, this message translates to:
  /// **'Newly created accounts will be automatically added to this ledger'**
  String get autoIncludeNewAccountDesc;

  /// No description provided for @autoIncludeNewCategory.
  ///
  /// In en, this message translates to:
  /// **'Auto Include New Categories'**
  String get autoIncludeNewCategory;

  /// No description provided for @autoIncludeNewCategoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Newly created categories will be automatically added to this ledger'**
  String get autoIncludeNewCategoryDesc;

  /// No description provided for @giftDeductionMode.
  ///
  /// In en, this message translates to:
  /// **'Gift Deduction Mode'**
  String get giftDeductionMode;

  /// No description provided for @giftAccountName.
  ///
  /// In en, this message translates to:
  /// **'Gift Account Name'**
  String get giftAccountName;

  /// No description provided for @giftAccountNameHint.
  ///
  /// In en, this message translates to:
  /// **'Leave blank to auto-generate'**
  String get giftAccountNameHint;

  /// No description provided for @giftCurrency.
  ///
  /// In en, this message translates to:
  /// **'Gift Currency'**
  String get giftCurrency;

  /// No description provided for @giftInitialBalance.
  ///
  /// In en, this message translates to:
  /// **'Gift Initial Balance'**
  String get giftInitialBalance;

  /// No description provided for @giftInitialBalanceHint.
  ///
  /// In en, this message translates to:
  /// **'Gift amount when created'**
  String get giftInitialBalanceHint;

  /// No description provided for @loanAmount.
  ///
  /// In en, this message translates to:
  /// **'Loan Amount'**
  String get loanAmount;

  /// No description provided for @loanAmountRequired.
  ///
  /// In en, this message translates to:
  /// **'Loan Amount *'**
  String get loanAmountRequired;

  /// No description provided for @loanAmountHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter loan amount'**
  String get loanAmountHint;

  /// No description provided for @annualRate.
  ///
  /// In en, this message translates to:
  /// **'Annual Rate (%)'**
  String get annualRate;

  /// No description provided for @annualRateHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: 5.00'**
  String get annualRateHint;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @startDateRequired.
  ///
  /// In en, this message translates to:
  /// **'Start Date *'**
  String get startDateRequired;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @endDateRequired.
  ///
  /// In en, this message translates to:
  /// **'End Date *'**
  String get endDateRequired;

  /// No description provided for @loanNote.
  ///
  /// In en, this message translates to:
  /// **'Loan Note'**
  String get loanNote;

  /// No description provided for @loanNoteHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: Purpose, repayment method, etc.'**
  String get loanNoteHint;

  /// No description provided for @dueDate.
  ///
  /// In en, this message translates to:
  /// **'Due Date'**
  String get dueDate;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @periods.
  ///
  /// In en, this message translates to:
  /// **'Periods'**
  String get periods;

  /// No description provided for @amountPerPeriod.
  ///
  /// In en, this message translates to:
  /// **'Amount Per Period'**
  String get amountPerPeriod;

  /// No description provided for @repaymentInterval.
  ///
  /// In en, this message translates to:
  /// **'Repayment Interval'**
  String get repaymentInterval;

  /// No description provided for @creditLimit.
  ///
  /// In en, this message translates to:
  /// **'Credit Limit'**
  String get creditLimit;

  /// No description provided for @creditLimitRequired.
  ///
  /// In en, this message translates to:
  /// **'Credit Limit *'**
  String get creditLimitRequired;

  /// No description provided for @creditLimitHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter credit limit'**
  String get creditLimitHint;

  /// No description provided for @billingDay.
  ///
  /// In en, this message translates to:
  /// **'Billing Day'**
  String get billingDay;

  /// No description provided for @paymentDay.
  ///
  /// In en, this message translates to:
  /// **'Payment Day'**
  String get paymentDay;

  /// No description provided for @bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankName;

  /// No description provided for @bankNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: China Merchants Bank'**
  String get bankNameHint;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cardNumber;

  /// No description provided for @cardNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter card number'**
  String get cardNumberHint;

  /// No description provided for @expiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiryDate;

  /// No description provided for @expiryDateHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: 12/28'**
  String get expiryDateHint;

  /// No description provided for @dayRequired.
  ///
  /// In en, this message translates to:
  /// **'{label} *'**
  String dayRequired(Object label);

  /// No description provided for @bankNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankNameLabel;

  /// No description provided for @bankNameLabelHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: ICBC'**
  String get bankNameLabelHint;

  /// No description provided for @bankCardNumber.
  ///
  /// In en, this message translates to:
  /// **'Bank Card Number'**
  String get bankCardNumber;

  /// No description provided for @bankCardNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter bank card number'**
  String get bankCardNumberHint;

  /// No description provided for @bankBranch.
  ///
  /// In en, this message translates to:
  /// **'Bank Branch'**
  String get bankBranch;

  /// No description provided for @bankBranchHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: XX Branch'**
  String get bankBranchHint;

  /// No description provided for @cardholderName.
  ///
  /// In en, this message translates to:
  /// **'Cardholder Name'**
  String get cardholderName;

  /// No description provided for @cardholderNameHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter cardholder name'**
  String get cardholderNameHint;

  /// No description provided for @accountNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Account Name *'**
  String get accountNameRequired;

  /// No description provided for @accountNameHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter account name'**
  String get accountNameHint;

  /// No description provided for @accountCurrencyRequired.
  ///
  /// In en, this message translates to:
  /// **'Account Currency *'**
  String get accountCurrencyRequired;

  /// No description provided for @initialBalance.
  ///
  /// In en, this message translates to:
  /// **'Initial Balance'**
  String get initialBalance;

  /// No description provided for @initialBalanceHint.
  ///
  /// In en, this message translates to:
  /// **'Initial amount when created'**
  String get initialBalanceHint;

  /// No description provided for @accountDescription.
  ///
  /// In en, this message translates to:
  /// **'Account Description'**
  String get accountDescription;

  /// No description provided for @accountDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Optional, brief description of this account'**
  String get accountDescriptionHint;

  /// No description provided for @accountNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get accountNote;

  /// No description provided for @accountNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Optional, add note information'**
  String get accountNoteHint;

  /// No description provided for @previewConfig.
  ///
  /// In en, this message translates to:
  /// **'Configuration Preview'**
  String get previewConfig;

  /// No description provided for @confirmAndStart.
  ///
  /// In en, this message translates to:
  /// **'Confirm and Start Using'**
  String get confirmAndStart;

  /// No description provided for @searchCurrency.
  ///
  /// In en, this message translates to:
  /// **'Search currency...'**
  String get searchCurrency;

  /// No description provided for @iconHint.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get iconHint;

  /// No description provided for @currencyCode.
  ///
  /// In en, this message translates to:
  /// **'Currency Code'**
  String get currencyCode;

  /// No description provided for @currencyCodeHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: POINT, TOKEN'**
  String get currencyCodeHint;

  /// No description provided for @currencyName.
  ///
  /// In en, this message translates to:
  /// **'Currency Name'**
  String get currencyName;

  /// No description provided for @currencyNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: Points, Tokens'**
  String get currencyNameHint;

  /// No description provided for @currencySymbol.
  ///
  /// In en, this message translates to:
  /// **'Currency Symbol'**
  String get currencySymbol;

  /// No description provided for @currencySymbolHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: ¤, ₿'**
  String get currencySymbolHint;

  /// No description provided for @categoryName.
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get categoryName;

  /// No description provided for @categoryNameHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter category name'**
  String get categoryNameHint;

  /// No description provided for @categoryType.
  ///
  /// In en, this message translates to:
  /// **'Category Type'**
  String get categoryType;

  /// No description provided for @parentCategory.
  ///
  /// In en, this message translates to:
  /// **'Parent Category'**
  String get parentCategory;

  /// No description provided for @sortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort Order'**
  String get sortOrder;

  /// No description provided for @sortOrderHint.
  ///
  /// In en, this message translates to:
  /// **'Smaller values appear first'**
  String get sortOrderHint;

  /// No description provided for @ledgerName.
  ///
  /// In en, this message translates to:
  /// **'Ledger Name'**
  String get ledgerName;

  /// No description provided for @ledgerNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter ledger name'**
  String get ledgerNameHint;

  /// No description provided for @ledgerNameExample.
  ///
  /// In en, this message translates to:
  /// **'e.g.: Daily Ledger, Family Ledger'**
  String get ledgerNameExample;

  /// No description provided for @descriptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get descriptionOptional;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get descriptionHint;

  /// No description provided for @ledgerDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Purpose of the ledger'**
  String get ledgerDescriptionHint;

  /// No description provided for @noteOptional.
  ///
  /// In en, this message translates to:
  /// **'Note (Optional)'**
  String get noteOptional;

  /// No description provided for @noteHint.
  ///
  /// In en, this message translates to:
  /// **'Enter note information'**
  String get noteHint;

  /// No description provided for @accountNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Account Name'**
  String get accountNameLabel;

  /// No description provided for @accountNameExample.
  ///
  /// In en, this message translates to:
  /// **'e.g.: ICBC Savings Card'**
  String get accountNameExample;

  /// No description provided for @accountCurrency.
  ///
  /// In en, this message translates to:
  /// **'Account Currency'**
  String get accountCurrency;

  /// No description provided for @initialBalanceDefault.
  ///
  /// In en, this message translates to:
  /// **'0.00'**
  String get initialBalanceDefault;

  /// No description provided for @accountDescriptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Account Description (Optional)'**
  String get accountDescriptionOptional;

  /// No description provided for @creditLimitLabel.
  ///
  /// In en, this message translates to:
  /// **'Credit Limit'**
  String get creditLimitLabel;

  /// No description provided for @giftDeductionModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Gift Deduction Mode'**
  String get giftDeductionModeLabel;

  /// No description provided for @giftInitialBalanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Gift Initial Balance'**
  String get giftInitialBalanceLabel;

  /// No description provided for @investmentType.
  ///
  /// In en, this message translates to:
  /// **'Investment Type'**
  String get investmentType;

  /// No description provided for @investmentCode.
  ///
  /// In en, this message translates to:
  /// **'Investment Code (Optional)'**
  String get investmentCode;

  /// No description provided for @loanAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Loan Amount'**
  String get loanAmountLabel;

  /// No description provided for @annualRateBps.
  ///
  /// In en, this message translates to:
  /// **'Annual Rate (bps)'**
  String get annualRateBps;

  /// No description provided for @annualRateBpsHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: 500 = 5%'**
  String get annualRateBpsHint;

  /// No description provided for @jsonInputHint.
  ///
  /// In en, this message translates to:
  /// **'Enter JSON...'**
  String get jsonInputHint;

  /// No description provided for @searchEmoji.
  ///
  /// In en, this message translates to:
  /// **'Search Emoji...'**
  String get searchEmoji;

  /// No description provided for @searchCountry.
  ///
  /// In en, this message translates to:
  /// **'Search country/region...'**
  String get searchCountry;

  /// No description provided for @fieldNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Field Name'**
  String get fieldNameLabel;

  /// No description provided for @fieldNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: Note'**
  String get fieldNameHint;

  /// No description provided for @fieldValueLabel.
  ///
  /// In en, this message translates to:
  /// **'Field Value'**
  String get fieldValueLabel;

  /// No description provided for @fieldValueHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter value'**
  String get fieldValueHint;

  /// No description provided for @stakeholderName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get stakeholderName;

  /// No description provided for @stakeholderNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter stakeholder name'**
  String get stakeholderNameHint;

  /// No description provided for @stakeholderDescription.
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get stakeholderDescription;

  /// No description provided for @stakeholderDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get stakeholderDescriptionHint;

  /// No description provided for @stakeholderContact.
  ///
  /// In en, this message translates to:
  /// **'Contact (Optional)'**
  String get stakeholderContact;

  /// No description provided for @stakeholderContactHint.
  ///
  /// In en, this message translates to:
  /// **'Enter contact information'**
  String get stakeholderContactHint;

  /// No description provided for @stakeholderNote.
  ///
  /// In en, this message translates to:
  /// **'Note (Optional)'**
  String get stakeholderNote;

  /// No description provided for @stakeholderNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Enter note information'**
  String get stakeholderNoteHint;

  /// No description provided for @projectName.
  ///
  /// In en, this message translates to:
  /// **'Project Name'**
  String get projectName;

  /// No description provided for @projectNameHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter project name'**
  String get projectNameHint;

  /// No description provided for @projectLedger.
  ///
  /// In en, this message translates to:
  /// **'Project Ledger'**
  String get projectLedger;

  /// No description provided for @projectDescription.
  ///
  /// In en, this message translates to:
  /// **'Project Description'**
  String get projectDescription;

  /// No description provided for @projectDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter project description (optional)'**
  String get projectDescriptionHint;

  /// No description provided for @projectBudget.
  ///
  /// In en, this message translates to:
  /// **'Budget Amount'**
  String get projectBudget;

  /// No description provided for @projectBudgetHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter budget amount (optional)'**
  String get projectBudgetHint;

  /// No description provided for @projectStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get projectStartDate;

  /// No description provided for @projectEndDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get projectEndDate;

  /// No description provided for @addCategoryType.
  ///
  /// In en, this message translates to:
  /// **'Add {type} Category'**
  String addCategoryType(Object type);
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
