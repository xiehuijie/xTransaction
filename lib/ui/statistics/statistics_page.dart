import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// 统计页面
class StatisticsPage extends ConsumerWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.statistics),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: 筛选
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            // 时间范围选择
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: SegmentedButton<int>(
                      segments: [
                        ButtonSegment(value: 0, label: Text(l10n.week)),
                        ButtonSegment(value: 1, label: Text(l10n.month)),
                        ButtonSegment(value: 2, label: Text(l10n.year)),
                      ],
                      selected: const {1},
                      onSelectionChanged: (selected) {
                        // TODO: 切换时间范围
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 收支切换
            TabBar(
              tabs: const [
                Tab(text: '支出'),
                Tab(text: '收入'),
              ],
              labelColor: theme.colorScheme.primary,
              indicatorColor: theme.colorScheme.primary,
            ),

            // 统计内容
            Expanded(
              child: TabBarView(
                children: [
                  _buildEmptyContent(context, '暂无支出记录'),
                  _buildEmptyContent(context, '暂无收入记录'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyContent(BuildContext context, String message) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.insert_chart_outlined,
            size: 80,
            color: theme.colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
