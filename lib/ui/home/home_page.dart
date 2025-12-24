import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../overview/overview_page.dart';
import '../statistics/statistics_page.dart';
import '../assets/assets_page.dart';
import '../profile/profile_page.dart';

/// 导航项标识
enum NavItemId { overview, statistics, assets, profile }

/// 导航项配置
class NavigationItem {
  final NavItemId id;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Widget page;

  const NavigationItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.page,
  });
}

/// 当前选中的导航项ID
final selectedNavItemProvider = StateProvider<NavItemId>((ref) => NavItemId.overview);

/// 主页面
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isReverse = false;
  NavItemId? _previousId;

  /// 构建导航项列表
  List<NavigationItem> _buildNavigationItems(bool enableAssetManagement) {
    final items = <NavigationItem>[
      const NavigationItem(
        id: NavItemId.overview,
        label: '概览',
        icon: Icons.dashboard_outlined,
        selectedIcon: Icons.dashboard_rounded,
        page: OverviewPage(),
      ),
      const NavigationItem(
        id: NavItemId.statistics,
        label: '统计',
        icon: Icons.bar_chart_outlined,
        selectedIcon: Icons.bar_chart_rounded,
        page: StatisticsPage(),
      ),
      if (enableAssetManagement)
        const NavigationItem(
          id: NavItemId.assets,
          label: '资产',
          icon: Icons.account_balance_wallet_outlined,
          selectedIcon: Icons.account_balance_wallet_rounded,
          page: AssetsPage(),
        ),
      const NavigationItem(
        id: NavItemId.profile,
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
    final selectedItemId = ref.watch(selectedNavItemProvider);
    final items = _buildNavigationItems(enableAssetManagement);

    // 根据ID找到当前选中项的索引，如果找不到则默认选第一个
    int selectedIndex = items.indexWhere((item) => item.id == selectedItemId);
    if (selectedIndex < 0) {
      selectedIndex = 0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(selectedNavItemProvider.notifier).state = items[0].id;
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
          key: ValueKey(selectedItemId),
          child: items[selectedIndex].page,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          HapticService.selectionClick();
          final currentPreviousId = _previousId ?? selectedItemId;
          final previousIndex = items.indexWhere((item) => item.id == currentPreviousId);
          setState(() {
            _isReverse = index < previousIndex;
            _previousId = items[index].id;
          });
          ref.read(selectedNavItemProvider.notifier).state = items[index].id;
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
