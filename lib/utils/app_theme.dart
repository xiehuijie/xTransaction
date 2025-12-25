import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

/// 主题色枚举
enum AppThemeColor {
  blue('', Colors.blue),
  purple('', Colors.purple),
  orange('', Colors.orange),
  green('', Colors.green),
  pink('', Colors.pink),
  teal('', Colors.teal);

  final String label;
  final Color color;

  const AppThemeColor(this.label, this.color);

  /// 从字符串获取主题色
  static AppThemeColor fromString(String value) {
    return AppThemeColor.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AppThemeColor.teal,
    );
  }

  /// 获取本地化标签
  String getLocalizedLabel(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    switch (this) {
      case AppThemeColor.blue:
        return localizations?.blue ?? 'Blue';
      case AppThemeColor.purple:
        return localizations?.purple ?? 'Purple';
      case AppThemeColor.orange:
        return localizations?.orange ?? 'Orange';
      case AppThemeColor.green:
        return localizations?.green ?? 'Green';
      case AppThemeColor.pink:
        return localizations?.pink ?? 'Pink';
      case AppThemeColor.teal:
        return localizations?.teal ?? 'Teal';
    }
  }
}

/// 主题模式枚举
enum AppThemeModeOption {
  system('', Icons.brightness_auto),
  light('', Icons.light_mode),
  dark('', Icons.dark_mode);

  final String label;
  final IconData icon;

  const AppThemeModeOption(this.label, this.icon);

  /// 从字符串获取主题模式
  static AppThemeModeOption fromString(String value) {
    return AppThemeModeOption.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AppThemeModeOption.system,
    );
  }

  /// 转换为 Flutter ThemeMode
  ThemeMode toThemeMode() {
    switch (this) {
      case AppThemeModeOption.system:
        return ThemeMode.system;
      case AppThemeModeOption.light:
        return ThemeMode.light;
      case AppThemeModeOption.dark:
        return ThemeMode.dark;
    }
  }

  /// 获取本地化标签
  String getLocalizedLabel(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    switch (this) {
      case AppThemeModeOption.system:
        return localizations?.system ?? 'System';
      case AppThemeModeOption.light:
        return localizations?.light ?? 'Light';
      case AppThemeModeOption.dark:
        return localizations?.dark ?? 'Dark';
    }
  }
}

/// 应用主题管理
class AppTheme {
  AppTheme._();

  /// 生成浅色主题
  static ThemeData lightTheme(AppThemeColor themeColor) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: themeColor.color,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
    );
  }

  /// 生成深色主题
  static ThemeData darkTheme(AppThemeColor themeColor) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: themeColor.color,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
  }
}
