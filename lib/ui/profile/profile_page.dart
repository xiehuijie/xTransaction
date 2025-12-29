import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/haptic_service.dart';
import '../settings/settings_page.dart';
import '../settings/ledger_manage_page.dart';
import '../settings/currency_manage_page.dart';
import '../settings/stakeholder_manage_page.dart';
import '../settings/category_manage_page.dart';
import '../settings/project_manage_page.dart';
import '../account/account_manage_page.dart';
import '../dev/developer_tools_page.dart';

/// 个人中心页面
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        centerTitle: true,
        actions: [
          // 使用自定义滑入动画打开设置页
          IconButton(
            onPressed: () {
              HapticService.lightImpact();
              Navigator.of(context).push(_createSettingsRoute());
            },
            icon: const Icon(Icons.settings_outlined),
            tooltip: '设置',
          ),
        ],
      ),
      body: ListView(
        children: [
          // 用户头像区域
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 48,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '未登录',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '登录后可同步数据',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // 功能列表
          _buildMenuItem(
            context,
            icon: Icons.book_outlined,
            title: '账本管理',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const LedgerManagePage(),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.currency_exchange_outlined,
            title: '货币管理',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CurrencyManagePage(),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.category_outlined,
            title: '分类管理',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CategoryManagePage(),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.account_balance_outlined,
            title: '账户管理',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AccountManagePage(),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.people_outlined,
            title: '相关方管理',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StakeholderManagePage(),
                ),
              );
            },
          ),

          const Divider(),

          _buildMenuItem(
            context,
            icon: Icons.folder_outlined,
            title: '项目管理',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ProjectManagePage(),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.receipt_long_outlined,
            title: '报销管理',
            onTap: () {
              // TODO: 报销管理
            },
          ),

          const Divider(),

          _buildMenuItem(
            context,
            icon: Icons.info_outlined,
            title: '关于',
            onTap: () {
              _showAboutDialog(context);
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const _AboutDialog(),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.onSurfaceVariant),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: () {
        HapticService.lightImpact();
        onTap();
      },
    );
  }
}

/// 关于对话框（包含隐藏的开发者工具入口）
class _AboutDialog extends StatefulWidget {
  const _AboutDialog();

  @override
  State<_AboutDialog> createState() => _AboutDialogState();
}

class _AboutDialogState extends State<_AboutDialog> {
  int _tapCount = 0;
  static const int _requiredTaps = 10;

  void _onIconTap() {
    setState(() {
      _tapCount++;
    });

    if (_tapCount >= _requiredTaps) {
      _tapCount = 0;
      HapticService.heavyImpact();
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DeveloperToolsPage(),
        ),
      );
    } else if (_tapCount >= 5) {
      HapticService.lightImpact();
      final remaining = _requiredTaps - _tapCount;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('再点击 $remaining 次开启开发者模式'),
          duration: const Duration(milliseconds: 800),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: const Text('关于'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _onIconTap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_balance_wallet,
                size: 48,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'X Transaction',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '版本 0.1.0',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '一款简洁高效的个人记账应用',
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            showLicensePage(
              context: context,
              applicationName: 'X Transaction',
              applicationVersion: '0.1.0',
            );
          },
          child: const Text('许可证'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('关闭'),
        ),
      ],
    );
  }
}

/// 创建设置页的滑入动画路由
Route _createSettingsRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const SettingsPage(),
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // 从右向左滑入
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
