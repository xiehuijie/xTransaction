import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../utils/app_theme.dart';
import '../../utils/haptic_service.dart';
import '../home/home_page.dart';

/// 设置页面
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _enableAssetManagement = true;
  bool _enableBudgetManagement = true;
  bool _enableMultiCurrency = false;
  bool _enableMultiLedger = false;
  bool _enableBiometric = false;
  bool _isLoading = true;

  AppThemeModeOption _themeMode = AppThemeModeOption.system;
  AppThemeColor _themeColor = AppThemeColor.teal;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final prefs = await ref.read(appPreferencesProvider.future);
      setState(() {
        _enableAssetManagement = prefs.enableAssetManagement;
        _enableBudgetManagement = prefs.enableBudgetManagement;
        _enableMultiCurrency = prefs.enableMultiCurrency;
        _enableMultiLedger = prefs.enableMultiLedger;
        _enableBiometric = prefs.enableBiometric;
        _themeMode = AppThemeModeOption.fromString(prefs.themeMode);
        _themeColor = AppThemeColor.fromString(prefs.themeColor);
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  /// 保存单个设置并刷新对应的 provider
  Future<void> _saveSetting(String key, dynamic value) async {
    final prefs = await ref.read(appPreferencesProvider.future);

    switch (key) {
      case 'enableAssetManagement':
        await prefs.setEnableAssetManagement(value as bool);
        ref.invalidate(enableAssetManagementProvider);
        // 更新导航索引，确保返回时停留在"我的"页
        final profileIndex = value ? 3 : 2;
        ref.read(selectedNavIndexProvider.notifier).state = profileIndex;
        break;
      case 'enableBudgetManagement':
        await prefs.setEnableBudgetManagement(value as bool);
        ref.invalidate(enableBudgetManagementProvider);
        break;
      case 'enableMultiCurrency':
        await prefs.setEnableMultiCurrency(value as bool);
        ref.invalidate(enableMultiCurrencyProvider);
        break;
      case 'enableMultiLedger':
        await prefs.setEnableMultiLedger(value as bool);
        ref.invalidate(enableMultiLedgerProvider);
        break;
      case 'enableBiometric':
        await prefs.setEnableBiometric(value as bool);
        ref.invalidate(enableBiometricProvider);
        break;
      case 'themeMode':
        final mode = value as AppThemeModeOption;
        await prefs.setThemeMode(mode.name);
        ref.read(themeModeProvider.notifier).state = mode.toThemeMode();
        break;
      case 'themeColor':
        final color = value as AppThemeColor;
        await prefs.setThemeColor(color.name);
        ref.read(themeColorProvider.notifier).state = color;
        break;
    }
  }

  Future<void> _handleAssetManagementChange(bool value) async {
    HapticService.selectionClick();

    if (!value) {
      // 关闭资产管理时显示确认对话框
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('关闭资产管理'),
          content: const Text('关闭后将隐藏资产页面，但已记录的账户和资产数据不会被删除。\n\n您可以随时重新开启此功能。'),
          actions: [
            TextButton(
              onPressed: () {
                HapticService.lightImpact();
                Navigator.pop(context, false);
              },
              child: const Text('取消'),
            ),
            FilledButton(
              onPressed: () {
                HapticService.mediumImpact();
                Navigator.pop(context, true);
              },
              child: const Text('确认关闭'),
            ),
          ],
        ),
      );

      if (confirmed != true) return;
    }

    setState(() => _enableAssetManagement = value);
    await _saveSetting('enableAssetManagement', value);
  }

  Future<void> _handleSwitchChange(
    String key,
    bool value,
    void Function(bool) localSetter,
  ) async {
    HapticService.selectionClick();
    localSetter(value);
    await _saveSetting(key, value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('设置')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('设置'), centerTitle: true),
      body: ListView(
        children: [
          // 功能设置
          _buildSectionHeader(context, '功能设置'),
          _buildSwitchTile(
            context,
            icon: Icons.account_balance_wallet_outlined,
            title: '资产管理',
            subtitle: '查看账户余额和资产分布',
            value: _enableAssetManagement,
            onChanged: _handleAssetManagementChange,
          ),
          _buildSwitchTile(
            context,
            icon: Icons.pie_chart_outline_rounded,
            title: '预算管理',
            subtitle: '设置预算并追踪支出',
            value: _enableBudgetManagement,
            onChanged: (value) => _handleSwitchChange(
              'enableBudgetManagement',
              value,
              (v) => setState(() => _enableBudgetManagement = v),
            ),
          ),
          _buildSwitchTile(
            context,
            icon: Icons.currency_exchange_outlined,
            title: '多货币支持',
            subtitle: '支持多种货币记账和汇率转换',
            value: _enableMultiCurrency,
            onChanged: (value) => _handleSwitchChange(
              'enableMultiCurrency',
              value,
              (v) => setState(() => _enableMultiCurrency = v),
            ),
          ),
          _buildSwitchTile(
            context,
            icon: Icons.library_books_outlined,
            title: '多账本',
            subtitle: '创建多个账本分开管理',
            value: _enableMultiLedger,
            onChanged: (value) => _handleSwitchChange(
              'enableMultiLedger',
              value,
              (v) => setState(() => _enableMultiLedger = v),
            ),
          ),

          const Divider(height: 32),

          // 安全设置
          _buildSectionHeader(context, '安全设置'),
          _buildSwitchTile(
            context,
            icon: Icons.fingerprint_outlined,
            title: '生物识别解锁',
            subtitle: '使用指纹或面容解锁应用',
            value: _enableBiometric,
            onChanged: (value) => _handleSwitchChange(
              'enableBiometric',
              value,
              (v) => setState(() => _enableBiometric = v),
            ),
          ),

          const Divider(height: 32),

          // 外观设置
          _buildSectionHeader(context, '外观设置'),
          _buildMenuTile(
            context,
            icon: Icons.palette_outlined,
            title: '主题色',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: _themeColor.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _themeColor.label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            onTap: () {
              HapticService.lightImpact();
              _showThemeColorDialog(context);
            },
          ),
          _buildMenuTile(
            context,
            icon: Icons.brightness_6_outlined,
            title: '深浅模式',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _themeMode.icon,
                  size: 20,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  _themeMode.label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            onTap: () {
              HapticService.lightImpact();
              _showThemeModeDialog(context);
            },
          ),
          _buildMenuTile(
            context,
            icon: Icons.language_outlined,
            title: '语言',
            trailing: Text(
              '简体中文',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            onTap: () {
              HapticService.lightImpact();
              // TODO: 语言选择
            },
          ),

          const Divider(height: 32),

          // 数据管理
          _buildSectionHeader(context, '数据管理'),
          _buildMenuTile(
            context,
            icon: Icons.backup_outlined,
            title: '备份与恢复',
            onTap: () {
              HapticService.lightImpact();
              // TODO: 备份与恢复
            },
          ),
          _buildMenuTile(
            context,
            icon: Icons.delete_forever_outlined,
            title: '重置应用数据',
            titleColor: theme.colorScheme.error,
            onTap: () {
              HapticService.mediumImpact();
              _showResetDialog(context);
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final theme = Theme.of(context);
    return SwitchListTile(
      secondary: Icon(icon, color: theme.colorScheme.onSurfaceVariant),
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildMenuTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
    Color? titleColor,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(
        icon,
        color: titleColor ?? theme.colorScheme.onSurfaceVariant,
      ),
      title: Text(
        title,
        style: titleColor != null ? TextStyle(color: titleColor) : null,
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void _showThemeColorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择主题色'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: AppThemeColor.values.map((color) {
              final isSelected = color == _themeColor;
              return ListTile(
                leading: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color.color,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 3,
                          )
                        : null,
                  ),
                ),
                title: Text(color.label),
                trailing: isSelected ? const Icon(Icons.check) : null,
                onTap: () async {
                  HapticService.selectionClick();
                  Navigator.pop(context);
                  setState(() => _themeColor = color);
                  await _saveSetting('themeColor', color);
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showThemeModeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择深浅模式'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppThemeModeOption.values.map((mode) {
            final isSelected = mode == _themeMode;
            return ListTile(
              leading: Icon(mode.icon),
              title: Text(mode.label),
              trailing: isSelected ? const Icon(Icons.check) : null,
              onTap: () async {
                HapticService.selectionClick();
                Navigator.pop(context);
                setState(() => _themeMode = mode);
                await _saveSetting('themeMode', mode);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('重置应用数据'),
        content: const Text('此操作将清空所有数据，包括账户、交易记录等。此操作不可撤销，确定要继续吗？'),
        actions: [
          TextButton(
            onPressed: () {
              HapticService.lightImpact();
              Navigator.pop(context);
            },
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              HapticService.heavyImpact();
              Navigator.pop(context);
              // TODO: 执行重置
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('功能开发中')));
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('确认重置'),
          ),
        ],
      ),
    );
  }
}
