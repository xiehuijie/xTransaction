import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/haptic_service.dart';
import 'onboarding_config.dart';

/// 预配置账本管理页面
class PreConfigLedgersPage extends ConsumerStatefulWidget {
  const PreConfigLedgersPage({super.key});

  @override
  ConsumerState<PreConfigLedgersPage> createState() =>
      _PreConfigLedgersPageState();
}

class _PreConfigLedgersPageState extends ConsumerState<PreConfigLedgersPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final config = ref.watch(initConfigProvider);
    final ledgers = config.preConfigLedgers;

    return Scaffold(
      appBar: AppBar(title: const Text('账本预配置'), centerTitle: true),
      body: ledgers.isEmpty
          ? _buildEmptyState(theme)
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: ledgers.length,
              itemBuilder: (context, index) {
                return _buildLedgerCard(ledgers[index], index, theme);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddLedgerDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.library_books_outlined,
            size: 80,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            '暂无预配置账本',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '点击右下角按钮添加账本',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLedgerCard(PreConfigLedger ledger, int index, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(
            Icons.book_outlined,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(ledger.name),
        subtitle: Text(
          ledger.description?.isNotEmpty == true
              ? '${ledger.currencyCode} · ${ledger.description}'
              : ledger.currencyCode,
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            HapticService.selectionClick();
            if (value == 'edit') {
              _showEditLedgerDialog(context, ledger, index);
            } else if (value == 'delete') {
              _confirmDelete(context, index);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit_outlined),
                  SizedBox(width: 12),
                  Text('编辑'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete_outline),
                  SizedBox(width: 12),
                  Text('删除'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddLedgerDialog(BuildContext context) {
    _showLedgerDialog(context, null, null);
  }

  void _showEditLedgerDialog(
    BuildContext context,
    PreConfigLedger ledger,
    int index,
  ) {
    _showLedgerDialog(context, ledger, index);
  }

  void _showLedgerDialog(
    BuildContext context,
    PreConfigLedger? ledger,
    int? index,
  ) {
    final theme = Theme.of(context);
    final isEdit = ledger != null;
    final nameController = TextEditingController(text: ledger?.name ?? '');
    final descController = TextEditingController(
      text: ledger?.description ?? '',
    );
    String selectedCurrency = ledger?.currencyCode ?? 'CNY';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(isEdit ? '编辑账本' : '添加账本'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '账本名称',
                    hintText: '例如：家庭账本',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(
                    labelText: '描述（可选）',
                    hintText: '账本描述',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedCurrency,
                  decoration: const InputDecoration(
                    labelText: '默认货币',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'CNY', child: Text('人民币 (CNY)')),
                    DropdownMenuItem(value: 'USD', child: Text('美元 (USD)')),
                    DropdownMenuItem(value: 'EUR', child: Text('欧元 (EUR)')),
                    DropdownMenuItem(value: 'JPY', child: Text('日元 (JPY)')),
                    DropdownMenuItem(value: 'GBP', child: Text('英镑 (GBP)')),
                    DropdownMenuItem(value: 'HKD', child: Text('港元 (HKD)')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => selectedCurrency = value);
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                HapticService.lightImpact();
                Navigator.pop(context);
              },
              child: const Text('取消'),
            ),
            FilledButton(
              onPressed: () {
                HapticService.mediumImpact();
                final name = nameController.text.trim();
                if (name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('请输入账本名称'),
                      backgroundColor: theme.colorScheme.error,
                    ),
                  );
                  return;
                }

                final newLedger = PreConfigLedger(
                  name: name,
                  currencyCode: selectedCurrency,
                  description: descController.text.trim(),
                );

                if (isEdit && index != null) {
                  ref
                      .read(initConfigProvider.notifier)
                      .updateLedger(index, newLedger);
                } else {
                  ref.read(initConfigProvider.notifier).addLedger(newLedger);
                }
                Navigator.pop(context);
              },
              child: Text(isEdit ? '保存' : '添加'),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除账本'),
        content: const Text('确定要删除这个预配置账本吗？'),
        actions: [
          TextButton(
            onPressed: () {
              HapticService.lightImpact();
              Navigator.pop(context);
            },
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              HapticService.mediumImpact();
              final success = ref
                  .read(initConfigProvider.notifier)
                  .removeLedger(index);
              Navigator.pop(context);
              if (!success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('至少需要保留一个账本'),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}
