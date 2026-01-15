import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';
import '../data/preferences/app_preferences.dart';
import '../data/services/ledger_service.dart';
import '../utils/app_theme.dart';

export 'locale_provider.dart';
export 'account_provider.dart';

// ==================== 基础服务 Providers ====================

/// 应用配置 Provider
final appPreferencesProvider = FutureProvider<AppPreferences>((ref) async {
  return AppPreferences.create();
});

/// 账本服务 Provider
final ledgerServiceProvider = FutureProvider<LedgerService>((ref) async {
  return LedgerService.create();
});

// ==================== 账本管理 Providers ====================

/// 所有账本列表 Provider
final allLedgersProvider = Provider<List<LedgerMeta>>((ref) {
  final ledgerService = ref.watch(ledgerServiceProvider);
  return ledgerService.whenOrNull(data: (s) => s.getAllLedgers()) ?? [];
});

/// 当前选中账本ID Provider (可变状态)
final currentLedgerIdProvider = StateProvider<String?>((ref) {
  final ledgerService = ref.watch(ledgerServiceProvider);
  return ledgerService.whenOrNull(data: (s) => s.getCurrentLedgerId());
});

/// 当前账本元数据 Provider
final currentLedgerProvider = Provider<LedgerMeta?>((ref) {
  final currentId = ref.watch(currentLedgerIdProvider);
  if (currentId == null) return null;
  
  final ledgerService = ref.watch(ledgerServiceProvider);
  return ledgerService.whenOrNull(
    data: (s) => s.getLedgerById(currentId),
  );
});

/// 数据库管理器 Provider
final databaseManagerProvider = Provider<DatabaseManager>((ref) {
  final manager = DatabaseManager();
  ref.onDispose(() => manager.closeAll());
  return manager;
});

/// 当前账本数据库 Provider
/// 
/// 根据当前选中的账本ID返回对应的数据库实例
final currentDatabaseProvider = Provider<LedgerDatabase?>((ref) {
  final currentId = ref.watch(currentLedgerIdProvider);
  if (currentId == null) return null;
  
  final manager = ref.watch(databaseManagerProvider);
  return manager.getDatabase(currentId);
});

/// 指定账本数据库 Provider (带参数)
final ledgerDatabaseProvider = Provider.family<LedgerDatabase, String>((ref, ledgerId) {
  final manager = ref.watch(databaseManagerProvider);
  return manager.getDatabase(ledgerId);
});

// ==================== DAO Providers ====================

/// 货币 DAO Provider
final currencyDaoProvider = Provider<CurrencyDao?>((ref) {
  final db = ref.watch(currentDatabaseProvider);
  return db?.currencyDao;
});

/// 账户 DAO Provider
final accountDaoProvider = Provider<AccountDao?>((ref) {
  final db = ref.watch(currentDatabaseProvider);
  return db?.accountDao;
});

/// 分类 DAO Provider
final categoryDaoProvider = Provider<CategoryDao?>((ref) {
  final db = ref.watch(currentDatabaseProvider);
  return db?.categoryDao;
});

/// 相关方 DAO Provider
final stakeholderDaoProvider = Provider<StakeholderDao?>((ref) {
  final db = ref.watch(currentDatabaseProvider);
  return db?.stakeholderDao;
});

/// 项目 DAO Provider
final projectDaoProvider = Provider<ProjectDao?>((ref) {
  final db = ref.watch(currentDatabaseProvider);
  return db?.projectDao;
});

/// 交易 DAO Provider
final transactionDaoProvider = Provider<TransactionDao?>((ref) {
  final db = ref.watch(currentDatabaseProvider);
  return db?.transactionDao;
});

/// 报销 DAO Provider
final reimbursementDaoProvider = Provider<ReimbursementDao?>((ref) {
  final db = ref.watch(currentDatabaseProvider);
  return db?.reimbursementDao;
});

// ==================== 应用配置 Providers ====================

/// 是否已初始化 Provider
final isInitializedProvider = FutureProvider<bool>((ref) async {
  final prefs = await ref.watch(appPreferencesProvider.future);
  return prefs.isInitialized;
});

/// 是否启用资产管理 Provider
final enableAssetManagementProvider = FutureProvider<bool>((ref) async {
  final prefs = await ref.watch(appPreferencesProvider.future);
  return prefs.enableAssetManagement;
});

/// 是否启用预算管理 Provider
final enableBudgetManagementProvider = FutureProvider<bool>((ref) async {
  final prefs = await ref.watch(appPreferencesProvider.future);
  return prefs.enableBudgetManagement;
});

/// 是否启用多货币 Provider
final enableMultiCurrencyProvider = FutureProvider<bool>((ref) async {
  final prefs = await ref.watch(appPreferencesProvider.future);
  return prefs.enableMultiCurrency;
});

/// 是否启用多账本 Provider
final enableMultiLedgerProvider = FutureProvider<bool>((ref) async {
  final prefs = await ref.watch(appPreferencesProvider.future);
  return prefs.enableMultiLedger;
});

/// 是否启用生物识别解锁 Provider
final enableBiometricProvider = FutureProvider<bool>((ref) async {
  final prefs = await ref.watch(appPreferencesProvider.future);
  return prefs.enableBiometric;
});

// ==================== 主题 Providers ====================

/// 主题模式 Provider (使用 StateProvider 以便实时更新)
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

/// 主题色 Provider (使用 StateProvider 以便实时更新)
final themeColorProvider = StateProvider<AppThemeColor>(
  (ref) => AppThemeColor.teal,
);

/// 初始化主题 Provider
final initThemeProvider = FutureProvider<void>((ref) async {
  final prefs = await ref.read(appPreferencesProvider.future);
  final themeModeString = prefs.themeMode;
  final themeColorString = prefs.themeColor;

  ref.read(themeModeProvider.notifier).state = AppThemeModeOption.fromString(
    themeModeString,
  ).toThemeMode();
  ref.read(themeColorProvider.notifier).state = AppThemeColor.fromString(
    themeColorString,
  );
});

// ==================== 向后兼容 ====================

/// 旧版数据库 Provider (已废弃，保留向后兼容)
@Deprecated('Use currentDatabaseProvider instead')
final databaseProvider = Provider<LedgerDatabase?>((ref) {
  return ref.watch(currentDatabaseProvider);
});
