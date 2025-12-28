import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database/database.dart';
import '../data/preferences/app_preferences.dart';
import '../utils/app_theme.dart';

export 'locale_provider.dart';

/// 数据库 Provider
final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(() => database.close());
  return database;
});

/// 应用配置 Provider
final appPreferencesProvider = FutureProvider<AppPreferences>((ref) async {
  return AppPreferences.create();
});

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

/// 当前账本ID Provider
final currentLedgerIdProvider = FutureProvider<int?>((ref) async {
  final prefs = await ref.watch(appPreferencesProvider.future);
  return prefs.currentLedgerId;
});

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

/// DAO Providers
final currencyDaoProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return db.currencyDao;
});

final accountDaoProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return db.accountDao;
});

final ledgerDaoProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return db.ledgerDao;
});

final categoryDaoProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return db.categoryDao;
});

final stakeholderDaoProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return db.stakeholderDao;
});

final transactionDaoProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return db.transactionDao;
});

final reimbursementDaoProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return db.reimbursementDao;
});
