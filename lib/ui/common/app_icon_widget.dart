/// 通用图标显示组件
/// 
/// 根据存储格式字符串显示对应的图标

import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

import '../../data/constants/icon_data.dart';

/// 图标显示组件
class AppIconWidget extends StatelessWidget {
  /// 图标数据
  final AppIcon icon;
  
  /// 图标大小
  final double size;
  
  /// 图标颜色（仅对Material图标有效）
  final Color? color;
  
  /// 背景颜色
  final Color? backgroundColor;
  
  /// 是否显示圆形背景
  final bool showBackground;
  
  /// 圆角半径
  final double borderRadius;

  const AppIconWidget({
    super.key,
    required this.icon,
    this.size = 24,
    this.color,
    this.backgroundColor,
    this.showBackground = false,
    this.borderRadius = 8,
  });

  /// 从存储格式字符串创建
  factory AppIconWidget.fromString(
    String iconString, {
    double size = 24,
    Color? color,
    Color? backgroundColor,
    bool showBackground = false,
    double borderRadius = 8,
  }) {
    return AppIconWidget(
      icon: AppIcon.fromString(iconString),
      size: size,
      color: color,
      backgroundColor: backgroundColor,
      showBackground: showBackground,
      borderRadius: borderRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Widget iconWidget;
    
    switch (icon.type) {
      case IconType.emoji:
        final emoji = icon.emojiChar;
        if (emoji != null) {
          iconWidget = Text(
            emoji,
            style: TextStyle(fontSize: size * 0.8),
          );
        } else {
          iconWidget = Icon(
            Icons.help_outline,
            size: size,
            color: color ?? theme.colorScheme.onSurfaceVariant,
          );
        }
        break;
        
      case IconType.material:
        final iconData = icon.materialIcon;
        iconWidget = Icon(
          iconData ?? Icons.help_outline,
          size: size,
          color: color ?? theme.colorScheme.onSurfaceVariant,
        );
        break;
        
      case IconType.flag:
        iconWidget = CountryFlag.fromCountryCode(
          icon.value,
          theme: ImageTheme(
            width: size * 1.2,
            height: size * 0.8,
            shape: const RoundedRectangle(2),
          ),
        );
        break;
    }

    if (!showBackground) {
      return iconWidget;
    }

    return Container(
      width: size * 1.6,
      height: size * 1.6,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(child: iconWidget),
    );
  }
}

/// 图标按钮组件（可点击选择图标）
class AppIconButton extends StatelessWidget {
  /// 图标数据
  final AppIcon? icon;
  
  /// 图标大小
  final double size;
  
  /// 点击回调
  final VoidCallback? onTap;
  
  /// 是否显示编辑提示
  final bool showEditHint;
  
  /// 提示文字
  final String hintText;

  const AppIconButton({
    super.key,
    this.icon,
    this.size = 48,
    this.onTap,
    this.showEditHint = true,
    this.hintText = '选择图标',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.colorScheme.outline.withOpacity(0.5),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: icon != null
                  ? AppIconWidget(
                      icon: icon!,
                      size: size * 0.5,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          size: size * 0.35,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        if (showEditHint)
                          Text(
                            hintText,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
            ),
            if (icon != null && showEditHint)
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.edit,
                    size: 10,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
