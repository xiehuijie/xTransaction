import 'package:flutter/services.dart';

/// 震动反馈服务
/// 提供各种交互的触觉反馈
class HapticService {
  HapticService._();

  /// 轻触反馈 - 用于按钮点击、开关切换等
  static Future<void> lightImpact() async {
    await HapticFeedback.lightImpact();
  }

  /// 中等反馈 - 用于重要操作
  static Future<void> mediumImpact() async {
    await HapticFeedback.mediumImpact();
  }

  /// 重度反馈 - 用于警告或错误
  static Future<void> heavyImpact() async {
    await HapticFeedback.heavyImpact();
  }

  /// 选择反馈 - 用于导航切换、列表选择等
  static Future<void> selectionClick() async {
    await HapticFeedback.selectionClick();
  }

  /// 振动反馈 - 通用振动
  static Future<void> vibrate() async {
    await HapticFeedback.vibrate();
  }
}
