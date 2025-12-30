import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';

import '../../data/data.dart';
import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../settings/ledger_manage_page.dart';

/// 当前账本 Provider
final currentLedgerProvider = FutureProvider<LedgerEntity?>((ref) async {
  final ledgerId = await ref.watch(currentLedgerIdProvider.future);
  if (ledgerId == null) return null;
  final ledgerDao = ref.read(ledgerDaoProvider);
  return ledgerDao.getLedgerById(ledgerId);
});

/// 概览页面
class OverviewPage extends ConsumerWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentLedgerAsync = ref.watch(currentLedgerProvider);
    final ledgersAsync = ref.watch(allLedgersProvider);

    return Scaffold(
      appBar: AppBar(
        title: _buildLedgerSelector(
          context,
          ref,
          currentLedgerAsync,
          ledgersAsync,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 总览卡片
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '本月支出',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '¥ 0.00',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatItem(
                          context,
                          '收入',
                          '¥ 0.00',
                          Colors.green,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: theme.colorScheme.outlineVariant,
                      ),
                      Expanded(
                        child: _buildStatItem(
                          context,
                          '支出',
                          '¥ 0.00',
                          Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 最近交易
          Text(
            '最近交易',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.receipt_long_outlined,
                      size: 64,
                      color: theme.colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '暂无交易记录',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: 添加新交易
        },
        icon: const Icon(Icons.add),
        label: Text(AppLocalizations.of(context)!.record),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
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

  Widget _buildLedgerSelector(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<LedgerEntity?> currentLedgerAsync,
    AsyncValue<List<LedgerEntity>> ledgersAsync,
  ) {
    final theme = Theme.of(context);
    final currentLedger = currentLedgerAsync.value;
    final ledgers = ledgersAsync.value ?? [];

    return InkWell(
      onTap: ledgers.isEmpty
          ? null
          : () => _showLedgerPicker(context, ref, ledgers, currentLedger),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentLedger?.name ?? '选择账本',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (ledgers.isNotEmpty) ...[
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_drop_down,
                color: theme.colorScheme.onSurface,
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showLedgerPicker(
    BuildContext context,
    WidgetRef ref,
    List<LedgerEntity> ledgers,
    LedgerEntity? currentLedger,
  ) {
    HapticService.lightImpact();
    showModalBottomSheet(
      context: context,
      builder: (context) => _LedgerPickerSheet(
        ledgers: ledgers,
        currentLedgerId: currentLedger?.ledgerId,
        onLedgerSelected: (ledger) async {
          Navigator.pop(context);
          final prefs = await ref.read(appPreferencesProvider.future);
          await prefs.setCurrentLedgerId(ledger.ledgerId);
          ref.invalidate(currentLedgerIdProvider);
          ref.invalidate(currentLedgerProvider);
        },
        onManageLedgers: () {
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const LedgerManagePage()),
          );
        },
      ),
    );
  }
}

/// 账本选择器底部弹窗
class _LedgerPickerSheet extends StatelessWidget {
  final List<LedgerEntity> ledgers;
  final int? currentLedgerId;
  final void Function(LedgerEntity) onLedgerSelected;
  final VoidCallback onManageLedgers;

  const _LedgerPickerSheet({
    required this.ledgers,
    required this.currentLedgerId,
    required this.onLedgerSelected,
    required this.onManageLedgers,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      maxChildSize: 0.8,
      minChildSize: 0.3,
      expand: false,
      builder: (context, scrollController) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '切换账本',
                  style: theme.textTheme.titleMedium,
                ),
                TextButton.icon(
                  onPressed: onManageLedgers,
                  icon: const Icon(Icons.settings, size: 18),
                  label: Text(AppLocalizations.of(context)!.manage),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: ledgers.length,
              itemBuilder: (context, index) {
                final ledger = ledgers[index];
                final isSelected = ledger.ledgerId == currentLedgerId;

                return ListTile(
                  leading: ledger.photo != null && ledger.photo!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.network(
                              ledger.photo!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => CircleAvatar(
                                backgroundColor:
                                    theme.colorScheme.primaryContainer,
                                child: Icon(
                                  Icons.book,
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                          ),
                        )
                      : CircleAvatar(
                          backgroundColor: theme.colorScheme.primaryContainer,
                          child: Icon(
                            Icons.book,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                  title: Text(ledger.name),
                  subtitle: Text(
                    '本币: ${ledger.currencyCode}',
                    style: theme.textTheme.bodySmall,
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check, color: theme.colorScheme.primary)
                      : null,
                  selected: isSelected,
                  onTap: () {
                    HapticService.selectionClick();
                    onLedgerSelected(ledger);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
