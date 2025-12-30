// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Xトランザクション';

  @override
  String get appDescription => '個人取引管理アプリ。';

  @override
  String get appLocked => 'アプリがロックされています';

  @override
  String get authenticating => '認証中...';

  @override
  String get reauthenticate => '再認証';

  @override
  String get appFailedToStart => 'アプリの起動に失敗しました';

  @override
  String get verificationFailed => '認証に失敗しました。もう一度お試しください';

  @override
  String get biometricNotSupported =>
      'バイオメトリクスがサポートされていません。設定でバイオメトリックロックを無効にしてください';

  @override
  String get biometricNotAvailable =>
      'バイオメトリクスが利用できません。設定でバイオメトリックロックを無効にしてください';

  @override
  String get biometricNotEnrolled => 'デバイスにバイオメトリクスを設定してください';

  @override
  String get biometricLockedOut => '試行回数が多すぎます。後でもう一度お試しください';

  @override
  String get biometricPermanentlyLockedOut => '認証がロックされました。デバイスのパスワードを使用してください';

  @override
  String get biometricError => 'エラーが発生しました。もう一度お試しください';

  @override
  String get home => 'ホーム';

  @override
  String get overview => '概要';

  @override
  String get statistics => '統計';

  @override
  String get profile => 'プロフィール';

  @override
  String get settings => '設定';

  @override
  String get assets => '資産';

  @override
  String get onboarding => 'オンボーディング';

  @override
  String get accountConfig => 'アカウント設定';

  @override
  String get accountSelection => 'アカウント選択';

  @override
  String get categoryConfig => 'カテゴリ設定';

  @override
  String get categorySelection => 'カテゴリ選択';

  @override
  String get currencyConfig => '通貨設定';

  @override
  String get dataRecovery => 'データ復元';

  @override
  String get ledgerConfig => '台帳設定';

  @override
  String get previewConfirm => 'プレビューと確認';

  @override
  String get continueAction => '続ける';

  @override
  String get back => '戻る';

  @override
  String get next => '次へ';

  @override
  String get finish => '完了';

  @override
  String get save => '保存';

  @override
  String get cancel => 'キャンセル';

  @override
  String get edit => '編集';

  @override
  String get delete => '削除';

  @override
  String get add => '追加';

  @override
  String get create => '作成';

  @override
  String get update => '更新';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get ok => 'OK';

  @override
  String get error => 'エラー';

  @override
  String get success => '成功';

  @override
  String get warning => '警告';

  @override
  String get info => '情報';

  @override
  String get loading => '読み込み中...';

  @override
  String get search => '検索';

  @override
  String get filter => 'フィルター';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get selectLanguageSubtitle => '好みの言語を選択してください';

  @override
  String get chineseSimplified => '简体中文';

  @override
  String get assetManagement => '資産管理';

  @override
  String get assetManagementDesc => '口座残高と資産分布を確認';

  @override
  String get budgetManagement => '予算管理';

  @override
  String get budgetManagementDesc => '予算を設定し、支出を追跡';

  @override
  String get multiCurrencySupport => '複数通貨サポート';

  @override
  String get multiCurrencySupportDesc => '複数通貨の記帳と為替レート換算をサポート';

  @override
  String get multiLedger => '複数台帳';

  @override
  String get multiLedgerDesc => '複数の台帳を作成して別々に管理';

  @override
  String get securitySettings => 'セキュリティ設定';

  @override
  String get biometricUnlock => '生体認証ロック解除';

  @override
  String get biometricUnlockDesc => '指紋または顔認証でアプリをロック解除';

  @override
  String get appearanceSettings => '外観設定';

  @override
  String get themeColor => 'テーマカラー';

  @override
  String get themeMode => 'テーマモード';

  @override
  String get language => '言語';

  @override
  String get dataManagement => 'データ管理';

  @override
  String get backupAndRestore => 'バックアップと復元';

  @override
  String get resetAppData => 'アプリデータのリセット';

  @override
  String get resetAppDataConfirm => 'アプリデータのリセット';

  @override
  String get functionInDevelopment => '開発中の機能';

  @override
  String get confirmReset => 'リセットを確認';

  @override
  String get sort => 'ソート';

  @override
  String get more => 'もっと';

  @override
  String get functionSettings => '機能設定';

  @override
  String get disableAssetManagementConfirm =>
      '無効にすると資産ページが非表示になりますが、記録されたアカウントと資産データは削除されません。\n\nいつでもこの機能を再び有効にすることができます。';

  @override
  String get selectThemeColor => 'テーマカラーを選択';

  @override
  String get selectThemeMode => 'テーマモードを選択';

  @override
  String get resetAppDataConfirmContent =>
      'この操作により、アカウント、取引記録などのすべてのデータが消去されます。この操作は元に戻すことができません。続行してもよろしいですか？';

  @override
  String get welcomeTitle => 'ようこそ';

  @override
  String get welcomeSubtitle => '取引アプリの設定を始めましょう';

  @override
  String get currencySettingsTitle => '通貨設定';

  @override
  String get currencySettingsSubtitle => '必要な通貨とデフォルト通貨を設定します';

  @override
  String get accountSettingsTitle => 'アカウント設定';

  @override
  String get accountSettingsSubtitle => '銀行カード、ウォレットなどのアカウントを追加します';

  @override
  String get categorySettingsTitle => 'カテゴリ設定';

  @override
  String get categorySettingsSubtitle => '収支カテゴリを設定し、階層構造をサポートします';

  @override
  String get ledgerSettingsTitle => '台帳設定';

  @override
  String get ledgerSettingsSubtitle => '台帳を作成し、関連するアカウントとカテゴリを選択します';

  @override
  String get biometricTitle => 'バイオメトリクス';

  @override
  String get biometricSubtitle => '指紋または顔認証で財務データを保護します';

  @override
  String get completeTitle => '設定完了';

  @override
  String get completeSubtitle => '準備ができました、取引の旅を始めましょう！';

  @override
  String get startFresh => '新規スタート';

  @override
  String get startFreshDesc => '新しい取引環境を作成します';

  @override
  String get restoreFromBackup => 'バックアップから復元';

  @override
  String get restoreFromBackupDesc => 'バックアップファイルからデータを復元します';

  @override
  String get previousStep => '前へ';

  @override
  String get nextStep => '次へ';

  @override
  String get startUsing => '使用開始';

  @override
  String get saving => '保存中...';

  @override
  String get configureCurrencies => '通貨を設定';

  @override
  String get configureAccounts => 'アカウントを設定';

  @override
  String get configureCategories => 'カテゴリを設定';

  @override
  String get configureLedgers => '台帳を設定';

  @override
  String selectedCount(Object count) {
    return '$count 項目が選択されました';
  }

  @override
  String addedCount(Object count) {
    return '$count 項目が追加されました';
  }

  @override
  String expenseIncomeCount(Object expenseCount, Object incomeCount) {
    return '支出 $expenseCount, 収入 $incomeCount';
  }

  @override
  String get authenticateToEnable => 'バイオメトリクスロックを有効にするには認証してください';

  @override
  String get authenticationFailed => '認証に失敗しました';

  @override
  String get setupBiometricFirst => 'まずデバイスにバイオメトリクスを設定してください';

  @override
  String get tooManyAttempts => '試行回数が多すぎます、後で再試行してください';

  @override
  String get cannotEnableBiometric => 'バイオメトリクスを有効にできません';

  @override
  String initializationFailed(Object error) {
    return '初期化に失敗しました: $error';
  }

  @override
  String get configurationSummary => '設定概要';

  @override
  String get currency => '通貨';

  @override
  String get account => 'アカウント';

  @override
  String get category => 'カテゴリ';

  @override
  String get ledger => '台帳';

  @override
  String get biometrics => 'バイオメトリクス';

  @override
  String countItems(Object count) {
    return '$count 項目';
  }

  @override
  String countAccounts(Object count) {
    return '$count アカウント';
  }

  @override
  String countCategories(Object count) {
    return '$count カテゴリ';
  }

  @override
  String countLedgers(Object count) {
    return '$count 台帳';
  }

  @override
  String get english => 'English';

  @override
  String get chinese => '简体中文';

  @override
  String get japanese => '日本語';

  @override
  String get blue => '青';

  @override
  String get purple => '紫';

  @override
  String get orange => 'オレンジ';

  @override
  String get green => '緑';

  @override
  String get pink => 'ピンク';

  @override
  String get teal => 'ティール';

  @override
  String get system => 'システム';

  @override
  String get light => 'ライト';

  @override
  String get dark => 'ダーク';

  @override
  String get enabled => 'Enabled';

  @override
  String get disabled => 'Disabled';

  @override
  String get biometricNotSupportedMessage =>
      'デバイスはバイオメトリクスをサポートしていないか、バイオメトリクスが設定されていません';

  @override
  String get authenticateToEnableBiometric => 'バイオメトリクスロックを有効にするには認証してください';

  @override
  String get onboardingWelcomeTitle => 'ようこそ';

  @override
  String get onboardingWelcomeSubtitle => '取引の旅を始めましょう';

  @override
  String get onboardingCurrencyTitle => '通貨設定';

  @override
  String get onboardingCurrencySubtitle => '常用する通貨を選択してください';

  @override
  String get onboardingAccountTitle => 'アカウント設定';

  @override
  String get onboardingAccountSubtitle => 'アカウント情報を追加してください';

  @override
  String get onboardingCategoryTitle => 'カテゴリ設定';

  @override
  String get onboardingCategorySubtitle => '取引カテゴリを設定してください';

  @override
  String get onboardingLedgerTitle => '台帳設定';

  @override
  String get onboardingLedgerSubtitle => '台帳を作成してください';

  @override
  String get onboardingCompleteTitle => '完了';

  @override
  String get onboardingCompleteSubtitle => '設定が完了しました、使用を開始します';

  @override
  String get onboardingNewStart => '新規スタート';

  @override
  String get onboardingNewStartDesc => '新しい取引環境を作成します';

  @override
  String get onboardingRestore => 'バックアップから復元';

  @override
  String get onboardingRestoreDesc => 'バックアップファイルからデータを復元します';

  @override
  String get onboardingConfigureCurrency => '通貨設定';

  @override
  String onboardingCurrencySelected(Object count) {
    return '$count 種類の通貨が選択されました';
  }

  @override
  String get onboardingConfigureAccount => 'アカウント設定';

  @override
  String onboardingAccountAdded(Object count) {
    return '$count 個のアカウントが追加されました';
  }

  @override
  String get onboardingConfigureCategory => 'カテゴリ設定';

  @override
  String onboardingCategoryAdded(Object expenseCount, Object incomeCount) {
    return '支出 $expenseCount 個，収入 $incomeCount 個';
  }

  @override
  String get onboardingConfigureLedger => '台帳設定';

  @override
  String onboardingLedgerCreated(Object count) {
    return '$count 個の台帳が作成されました';
  }

  @override
  String get onboardingBiometricTitle => '生体認証';

  @override
  String get onboardingBiometricSubtitle => '生体認証を有効にしてデータを保護します';

  @override
  String get week => '週';

  @override
  String get month => '月';

  @override
  String get year => '年';

  @override
  String get categoryManagement => 'カテゴリ管理';

  @override
  String get newCategory => '新規カテゴリ';

  @override
  String get confirmDeleteTitle => '削除確認';

  @override
  String get confirmDeleteCategory => 'このカテゴリを削除してもよろしいですか？この操作は元に戻せません。';

  @override
  String get selectIcon => 'アイコンを選択';

  @override
  String get about => 'について';

  @override
  String get licenses => 'ライセンス';

  @override
  String get close => '閉じる';

  @override
  String get record => '記録';

  @override
  String get manage => '管理';

  @override
  String get currencyManagement => '通貨管理';

  @override
  String get deleteCurrency => '通貨を削除';

  @override
  String get deleteCurrencyConfirm => 'この通貨を削除してもよろしいですか？\n\nこの操作は元に戻せません。';

  @override
  String get addCustomCurrency => 'カスタム通貨を追加';

  @override
  String get symbolPosition => '記号位置';

  @override
  String get prefix => 'プレフィックス';

  @override
  String get suffix => 'サフィックス';

  @override
  String get ledgerManagement => '台帳管理';

  @override
  String get createLedger => '台帳を作成';

  @override
  String get newLedger => '新規台帳';

  @override
  String get deleteLedger => '台帳を削除';

  @override
  String deleteLedgerConfirm(Object name) {
    return '台帳「$name」を削除してもよろしいですか？\n\nこの操作は元に戻せません。';
  }

  @override
  String get ledgerDeleted => '台帳が削除されました';

  @override
  String get baseCurrency => '基本通貨';

  @override
  String get autoInclude => '自動設定';

  @override
  String get autoIncludeNewAccounts => '新規アカウントを自動追加';

  @override
  String get autoIncludeNewAccountsDesc => '新規作成されたアカウントは自動的にこの台帳に関連付けられます';

  @override
  String get autoIncludeNewCategories => '新規カテゴリを自動追加';

  @override
  String get autoIncludeNewCategoriesDesc => '新規作成されたカテゴリは自動的にこの台帳に関連付けられます';

  @override
  String get associatedAccounts => '関連アカウント';

  @override
  String get associatedCategories => '関連カテゴリ';

  @override
  String get databaseBrowser => 'データベースブラウザ';

  @override
  String get loadFailed => '読み込み失敗';

  @override
  String get retry => '再試行';

  @override
  String get noData => 'データなし';

  @override
  String get addNew => '新規';

  @override
  String get copied => 'コピーしました';

  @override
  String get copy => 'コピー';

  @override
  String get viewJson => 'JSONを表示';

  @override
  String get copyJson => 'JSONをコピー';

  @override
  String get json => 'JSON';

  @override
  String jsonFormatError(Object error) {
    return 'JSON形式エラー: $error';
  }

  @override
  String get createSuccess => '作成成功';

  @override
  String createFailed(Object error) {
    return '作成失敗: $error';
  }

  @override
  String get updateSuccess => '更新成功';

  @override
  String updateFailed(Object error) {
    return '更新失敗: $error';
  }

  @override
  String get deleteSuccess => '削除成功';

  @override
  String deleteFailed(Object error) {
    return '削除失敗: $error';
  }

  @override
  String get confirmDeleteRecord => 'このレコードを削除してもよろしいですか？この操作は元に戻せません。';

  @override
  String get iconPickerConfirm => '確認';

  @override
  String get noRecentIcons => '最近使用したアイコンはありません';

  @override
  String get projectManagement => 'プロジェクト管理';

  @override
  String get newProject => '新規プロジェクト';

  @override
  String get createProject => 'プロジェクトを作成';

  @override
  String get pleaseSelectLedger => '台帳を選択してください';

  @override
  String get confirmDeleteProject => 'このプロジェクトを削除してもよろしいですか？この操作は元に戻せません。';

  @override
  String saveFailed(Object error) {
    return '保存失敗: $error';
  }

  @override
  String get editAccount => '編集';

  @override
  String get deleteAccount => '削除';

  @override
  String get addAccount => 'アカウントを追加';

  @override
  String get deleteAccountConfirm => 'このアカウントを削除してもよろしいですか？';

  @override
  String get selectAccountType => 'アカウントタイプを選択';

  @override
  String get saveButton => '保存';

  @override
  String get enableGiftBalance => 'ギフト残高を有効化';

  @override
  String get enableGiftBalanceDesc => 'このプリペイドアカウントにギフト残高アカウントを関連付けます';

  @override
  String get useGiftFirst => 'ギフトを優先使用';

  @override
  String get useGiftLast => 'ギフトを最後に使用';

  @override
  String get useGiftProportional => '比例控除';

  @override
  String get borrow => '借入';

  @override
  String get lend => '貸出';

  @override
  String get configureRepayment => '返済計画を設定';

  @override
  String get repaymentConfigInDev => '返済計画設定は開発中です...';

  @override
  String get developerTools => '開発者ツール';

  @override
  String get allAccounts => '全アカウント';

  @override
  String get accountDeleted => 'アカウントが削除されました';

  @override
  String deleteAccountWithTx(Object name) {
    return 'アカウント「$name」を削除してもよろしいですか？\n\nこの操作は元に戻せません。関連する取引記録は保持されますが、このアカウントとの関連付けは解除されます。';
  }

  @override
  String get deleteCategoryConfirm => 'このカテゴリを削除してもよろしいですか？';

  @override
  String get stakeholderManagement => '関係者管理';

  @override
  String get newStakeholder => '新規関係者';

  @override
  String addStakeholder(Object type) {
    return '$typeを追加';
  }

  @override
  String get selectAvatar => 'アバターを選択';

  @override
  String get type => 'タイプ';

  @override
  String get deleteStakeholder => '関係者を削除';

  @override
  String deleteStakeholderConfirm(Object name) {
    return '「$name」を削除してもよろしいですか？\n\nこの操作は元に戻せません。';
  }

  @override
  String get stakeholderDeleted => '関係者が削除されました';

  @override
  String get accountManagement => 'アカウント管理';

  @override
  String get newAccount => '新規アカウント';

  @override
  String addAccountType(Object type) {
    return '$typeを追加';
  }

  @override
  String get allSystemFieldsAdded => 'すべてのシステムフィールドが追加されました';

  @override
  String get extendedInfo => '拡張情報';

  @override
  String get addSystemField => 'システムフィールドを追加';

  @override
  String get addCustomField => 'カスタムフィールドを追加';

  @override
  String get fieldName => 'フィールド名';

  @override
  String get fieldValue => 'フィールド値';

  @override
  String get allCategories => '全カテゴリ';

  @override
  String get multiCurrencyConfig => 'マルチ通貨設定';

  @override
  String get backupRestore => 'バックアップから復元';

  @override
  String get backupRestoreInDev => 'バックアップ復元は開発中です';

  @override
  String get selectBackupFile => 'バックアップファイルを選択';

  @override
  String get cloudRestoreInDev => 'クラウドバックアップは開発中です';

  @override
  String get restoreFromCloud => 'クラウドから復元';

  @override
  String get bindSpecificAsset => '特定の資産をバインド';

  @override
  String get repaymentPlanConfig => '返済計画設定';

  @override
  String get autoGenerate => '自動生成';

  @override
  String get addPeriod => '期を追加';

  @override
  String get autoGenerateRepayment => '返済計画を自動生成';

  @override
  String get period => '期数';

  @override
  String get amount => '金額';

  @override
  String get interval => '間隔';

  @override
  String get everyMonth => '毎月';

  @override
  String get everyTwoMonths => '2ヶ月ごと';

  @override
  String get everyQuarter => '四半期ごと';

  @override
  String get everySixMonths => '半年ごと';

  @override
  String get everyYear => '毎年';

  @override
  String get generate => '生成';

  @override
  String get addLedger => '台帳を追加';

  @override
  String get setAsDefault => 'デフォルトに設定';

  @override
  String get ledgerBaseCurrency => '台帳の基本通貨';

  @override
  String get autoIncludeSettings => '自動追加設定';

  @override
  String get autoIncludeNewAccount => '新規アカウントを自動追加';

  @override
  String get autoIncludeNewAccountDesc => '新規作成されたアカウントは自動的にこの台帳に追加されます';

  @override
  String get autoIncludeNewCategory => '新規カテゴリを自動追加';

  @override
  String get autoIncludeNewCategoryDesc => '新規作成されたカテゴリは自動的にこの台帳に追加されます';

  @override
  String get giftDeductionMode => 'ギフト控除モード';

  @override
  String get giftAccountName => 'ギフトアカウント名';

  @override
  String get giftAccountNameHint => '空白の場合は自動生成されます';

  @override
  String get giftCurrency => 'ギフト通貨';

  @override
  String get giftInitialBalance => 'ギフト初期残高';

  @override
  String get giftInitialBalanceHint => '作成時のギフト金額';

  @override
  String get loanAmount => 'ローン金額';

  @override
  String get loanAmountRequired => 'ローン金額 *';

  @override
  String get loanAmountHint => 'ローン金額を入力してください';

  @override
  String get annualRate => '年利（%）';

  @override
  String get annualRateHint => '例：5.00';

  @override
  String get startDate => '開始日';

  @override
  String get startDateRequired => '開始日 *';

  @override
  String get endDate => '終了日';

  @override
  String get endDateRequired => '終了日 *';

  @override
  String get loanNote => 'ローンメモ';

  @override
  String get loanNoteHint => '例：目的、返済方法など';

  @override
  String get dueDate => '期日';

  @override
  String get note => 'メモ';

  @override
  String get periods => '期数';

  @override
  String get amountPerPeriod => '期当たり金額';

  @override
  String get repaymentInterval => '返済間隔';

  @override
  String get creditLimit => 'クレジット限度額';

  @override
  String get creditLimitRequired => 'クレジット限度額 *';

  @override
  String get creditLimitHint => 'クレジット限度額を入力してください';

  @override
  String get billingDay => '請求日';

  @override
  String get paymentDay => '支払日';

  @override
  String get bankName => '発行銀行';

  @override
  String get bankNameHint => '例：招商銀行';

  @override
  String get cardNumber => 'カード番号';

  @override
  String get cardNumberHint => 'カード番号を入力してください';

  @override
  String get expiryDate => '有効期限';

  @override
  String get expiryDateHint => '例：12/28';

  @override
  String dayRequired(Object label) {
    return '$label *';
  }

  @override
  String get bankNameLabel => '銀行名';

  @override
  String get bankNameLabelHint => '例：ICBC';

  @override
  String get bankCardNumber => '銀行カード番号';

  @override
  String get bankCardNumberHint => '銀行カード番号を入力してください';

  @override
  String get bankBranch => '支店';

  @override
  String get bankBranchHint => '例：XX支店';

  @override
  String get cardholderName => 'カード所持者名';

  @override
  String get cardholderNameHint => 'カード所持者名を入力してください';

  @override
  String get accountNameRequired => 'アカウント名 *';

  @override
  String get accountNameHint => 'アカウント名を入力してください';

  @override
  String get accountCurrencyRequired => 'アカウント通貨 *';

  @override
  String get initialBalance => '初期残高';

  @override
  String get initialBalanceHint => '作成時の初期金額';

  @override
  String get accountDescription => 'アカウント説明';

  @override
  String get accountDescriptionHint => 'オプション、このアカウントの簡単な説明';

  @override
  String get accountNote => 'メモ';

  @override
  String get accountNoteHint => 'オプション、メモ情報を追加';

  @override
  String get previewConfig => '設定プレビュー';

  @override
  String get confirmAndStart => '確認して使用開始';

  @override
  String get searchCurrency => '通貨を検索...';

  @override
  String get iconHint => 'アイコン';

  @override
  String get currencyCode => '通貨コード';

  @override
  String get currencyCodeHint => '例: POINT, TOKEN';

  @override
  String get currencyName => '通貨名';

  @override
  String get currencyNameHint => '例: ポイント、トークン';

  @override
  String get currencySymbol => '通貨記号';

  @override
  String get currencySymbolHint => '例: ¤, ₿';

  @override
  String get categoryName => 'カテゴリ名';

  @override
  String get categoryNameHint => 'カテゴリ名を入力してください';

  @override
  String get categoryType => 'カテゴリタイプ';

  @override
  String get parentCategory => '親カテゴリ';

  @override
  String get sortOrder => 'ソート順';

  @override
  String get sortOrderHint => '小さい値が最初に表示されます';

  @override
  String get ledgerName => '台帳名';

  @override
  String get ledgerNameHint => '台帳名を入力';

  @override
  String get ledgerNameExample => '例：日常台帳、家族台帳';

  @override
  String get descriptionOptional => '説明（オプション）';

  @override
  String get descriptionHint => '説明を入力';

  @override
  String get ledgerDescriptionHint => '台帳の目的説明';

  @override
  String get noteOptional => 'メモ（オプション）';

  @override
  String get noteHint => 'メモ情報を入力';

  @override
  String get accountNameLabel => 'アカウント名';

  @override
  String get accountNameExample => '例：ICBC普通預金カード';

  @override
  String get accountCurrency => 'アカウント通貨';

  @override
  String get initialBalanceDefault => '0.00';

  @override
  String get accountDescriptionOptional => 'アカウント説明（オプション）';

  @override
  String get creditLimitLabel => 'クレジット限度額';

  @override
  String get giftDeductionModeLabel => 'ギフト控除方法';

  @override
  String get giftInitialBalanceLabel => 'ギフト初期残高';

  @override
  String get investmentType => '投資タイプ';

  @override
  String get investmentCode => '投資コード（オプション）';

  @override
  String get loanAmountLabel => 'ローン金額';

  @override
  String get annualRateBps => '年利（基準点）';

  @override
  String get annualRateBpsHint => '例：500 = 5%';

  @override
  String get jsonInputHint => 'JSONを入力...';

  @override
  String get searchEmoji => '絵文字を検索...';

  @override
  String get searchCountry => '国/地域を検索...';

  @override
  String get fieldNameLabel => 'フィールド名';

  @override
  String get fieldNameHint => '例：メモ';

  @override
  String get fieldValueLabel => 'フィールド値';

  @override
  String get fieldValueHint => '値を入力してください';

  @override
  String get stakeholderName => '名前';

  @override
  String get stakeholderNameHint => '関係者名を入力';

  @override
  String get stakeholderDescription => '説明（オプション）';

  @override
  String get stakeholderDescriptionHint => '説明を入力';

  @override
  String get stakeholderContact => '連絡先（オプション）';

  @override
  String get stakeholderContactHint => '連絡先情報を入力';

  @override
  String get stakeholderNote => 'メモ（オプション）';

  @override
  String get stakeholderNoteHint => 'メモ情報を入力';

  @override
  String get projectName => 'プロジェクト名';

  @override
  String get projectNameHint => 'プロジェクト名を入力してください';

  @override
  String get projectLedger => 'プロジェクト台帳';

  @override
  String get projectDescription => 'プロジェクト説明';

  @override
  String get projectDescriptionHint => 'プロジェクト説明を入力してください（オプション）';

  @override
  String get projectBudget => '予算金額';

  @override
  String get projectBudgetHint => '予算金額を入力してください（オプション）';

  @override
  String get projectStartDate => '開始日';

  @override
  String get projectEndDate => '終了日';

  @override
  String addCategoryType(Object type) {
    return '$typeカテゴリを追加';
  }
}
