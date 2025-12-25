import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_transaction/l10n/app_localizations.dart';

/// 语言偏好的键
const String _localePrefKey = 'app_locale';

/// 语言选择Provider
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

/// 语言Notifier，管理当前语言和语言偏好
class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en')) {
    _loadLocale();
  }

  /// 加载保存的语言偏好
  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeStr = prefs.getString(_localePrefKey);
    
    if (localeStr != null) {
      final locale = Locale(localeStr);
      if (_isLocaleSupported(locale)) {
        state = locale;
        return;
      }
    }
    
    // 默认使用系统语言，如果系统语言不支持则使用英语
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
    if (_isLocaleSupported(systemLocale)) {
      state = systemLocale;
    }
  }

  /// 切换语言
  Future<void> changeLocale(Locale locale) async {
    if (_isLocaleSupported(locale)) {
      state = locale;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localePrefKey, locale.languageCode);
    }
  }

  /// 检查语言是否受支持
  bool _isLocaleSupported(Locale locale) {
    return AppLocalizations.supportedLocales.contains(locale);
  }
}

/// 获取当前语言的AppLocalizations
final localizationsProvider = Provider<AppLocalizations>((ref) {
  final context = ref.watch(contextProvider);
  return AppLocalizations.of(context)!;
});

/// 提供BuildContext的Provider
final contextProvider = Provider<BuildContext>((ref) {
  throw UnimplementedError('BuildContext must be provided by the widget tree');
});