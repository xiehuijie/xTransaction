import 'package:flutter/material.dart';

/// 主题色枚举
enum AppThemeColor {
  blue('蓝色', Colors.blue),
  purple('紫色', Colors.purple),
  orange('橙色', Colors.orange),
  green('绿色', Colors.green),
  pink('粉红', Colors.pink),
  teal('青色', Colors.teal);

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
}

/// 主题模式枚举
enum AppThemeModeOption {
  system('跟随系统', Icons.brightness_auto),
  light('浅色', Icons.light_mode),
  dark('深色', Icons.dark_mode);

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
