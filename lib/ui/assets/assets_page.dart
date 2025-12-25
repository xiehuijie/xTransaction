import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 资产页面
class AssetsPage extends ConsumerWidget {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('资产'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: 添加账户
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 净资产卡片
          Card(
            color: theme.colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '净资产',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '¥ 0.00',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildAssetItem(
                          context,
                          '总资产',
                          '¥ 0.00',
                          theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      Expanded(
                        child: _buildAssetItem(
                          context,
                          '总负债',
                          '¥ 0.00',
                          theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 账户分类
          _buildAccountSection(
            context,
            '储蓄账户',
            Icons.account_balance_rounded,
            [],
          ),
          const SizedBox(height: 16),
          _buildAccountSection(context, '信用账户', Icons.credit_card_rounded, []),
          const SizedBox(height: 16),
          _buildAccountSection(context, '投资账户', Icons.trending_up_rounded, []),
        ],
      ),
    );
  }

  Widget _buildAssetItem(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: color.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildAccountSection(
    BuildContext context,
    String title,
    IconData icon,
    List<dynamic> accounts,
  ) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (accounts.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(
                  '暂无账户',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
