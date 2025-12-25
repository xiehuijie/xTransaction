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
  String get verificationFailed => '認証に失敗しました';

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
  String get japanese => '日本語';

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
  String get selectThemeColor => 'テーマカラーを選択';

  @override
  String get selectThemeMode => 'テーマモードを選択';

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
  String get biometricVerificationFailed => '認証に失敗しました';

  @override
  String get biometricNotSetUp => 'デバイスにバイオメトリクスを設定してください';

  @override
  String get biometricTooManyAttempts => '試行回数が多すぎます。後でもう一度お試しください';

  @override
  String get biometricCannotEnable => 'バイオメトリクスを有効にできません';

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
  String get enabled => '有効';

  @override
  String get disabled => '無効';

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
  String get biometricNotSupportedMessage =>
      'デバイスはバイオメトリクスをサポートしていないか、バイオメトリクスが設定されていません';

  @override
  String get authenticateToEnableBiometric => 'バイオメトリクスロックを有効にするには認証してください';

  @override
  String get tooManyBiometricAttempts => '試行回数が多すぎます、後で再試行してください';

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
  String get onboardingBiometricTitle => '生体認証';

  @override
  String get onboardingBiometricSubtitle => '生体認証を有効にしてデータを保護します';

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
}
