import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../overview/overview_page.dart';
import '../statistics/statistics_page.dart';
import '../assets/assets_page.dart';
import '../profile/profile_page.dart';

/// 导航项配置
class NavigationItem {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Widget page;

  const NavigationItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.page,
  });
}

/// 当前选中的导航索引
final selectedNavIndexProvider = StateProvider<int>((ref) => 0);

/// 主页面
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isReverse = false;
  int _previousIndex = 0;

  /// 构建导航项列表
  List<NavigationItem> _buildNavigationItems(bool enableAssetManagement) {
    final items = <NavigationItem>[
      const NavigationItem(
        label: '概览',
        icon: Icons.dashboard_outlined,
        selectedIcon: Icons.dashboard_rounded,
        page: OverviewPage(),
      ),
      const NavigationItem(
        label: '统计',
        icon: Icons.bar_chart_outlined,
        selectedIcon: Icons.bar_chart_rounded,
        page: StatisticsPage(),
      ),
      if (enableAssetManagement)
        const NavigationItem(
          label: '资产',
          icon: Icons.account_balance_wallet_outlined,
          selectedIcon: Icons.account_balance_wallet_rounded,
          page: AssetsPage(),
        ),
      const NavigationItem(
        label: '我的',
        icon: Icons.person_outline,
        selectedIcon: Icons.person_rounded,
        page: ProfilePage(),
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final enableAssetManagement =
        ref.watch(enableAssetManagementProvider).valueOrNull ?? true;
    final selectedIndex = ref.watch(selectedNavIndexProvider);
    final items = _buildNavigationItems(enableAssetManagement);

    // 确保索引在有效范围内
    final safeIndex = selectedIndex.clamp(0, items.length - 1);
    if (safeIndex != selectedIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(selectedNavIndexProvider.notifier).state = safeIndex;
      });
    }

    return Scaffold(
      body: PageTransitionSwitcher(
        reverse: _isReverse,
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey(safeIndex),
          child: items[safeIndex].page,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: safeIndex,
        onDestinationSelected: (index) {
          HapticService.selectionClick();
          setState(() {
            _isReverse = index < _previousIndex;
            _previousIndex = index;
          });
          ref.read(selectedNavIndexProvider.notifier).state = index;
        },
        destinations: items
            .map(
              (item) => NavigationDestination(
                icon: Icon(item.icon),
                selectedIcon: Icon(item.selectedIcon),
                label: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
