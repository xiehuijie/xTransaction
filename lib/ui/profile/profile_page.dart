import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/haptic_service.dart';
import '../settings/settings_page.dart';

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
              // TODO: 账本管理
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.category_outlined,
            title: '分类管理',
            onTap: () {
              // TODO: 分类管理
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.account_balance_outlined,
            title: '账户管理',
            onTap: () {
              // TODO: 账户管理
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.people_outlined,
            title: '相关方管理',
            onTap: () {
              // TODO: 相关方管理
            },
          ),

          const Divider(),

          _buildMenuItem(
            context,
            icon: Icons.folder_outlined,
            title: '项目管理',
            onTap: () {
              // TODO: 项目管理
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
            icon: Icons.download_outlined,
            title: '数据导出',
            onTap: () {
              // TODO: 数据导出
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.upload_outlined,
            title: '数据导入',
            onTap: () {
              // TODO: 数据导入
            },
          ),

          const Divider(),

          _buildMenuItem(
            context,
            icon: Icons.info_outlined,
            title: '关于',
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'X Transaction',
                applicationVersion: '0.1.0',
                applicationIcon: const Icon(
                  Icons.account_balance_wallet,
                  size: 48,
                ),
                children: [const Text('一款简洁高效的个人记账应用')],
              );
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
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
