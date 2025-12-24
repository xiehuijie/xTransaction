import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/haptic_service.dart';
import 'onboarding_config.dart';

/// 预配置账户管理页面
class PreConfigAccountsPage extends ConsumerStatefulWidget {
  const PreConfigAccountsPage({super.key});

  @override
  ConsumerState<PreConfigAccountsPage> createState() => _PreConfigAccountsPageState();
}

class _PreConfigAccountsPageState extends ConsumerState<PreConfigAccountsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final config = ref.watch(initConfigProvider);
    final accounts = config.preConfigAccounts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('账户预配置'),
        centerTitle: true,
      ),
      body: accounts.isEmpty
          ? _buildEmptyState(theme)
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                return _buildAccountCard(accounts[index], index, theme);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddAccountDialog(context),
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
            Icons.account_balance_wallet_outlined,
            size: 80,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            '暂无预配置账户',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '点击右下角按钮添加账户',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountCard(PreConfigAccount account, int index, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(
            _getAccountIcon(account.type),
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(account.name),
        subtitle: Text('${account.currencyCode} · ${_getAccountTypeName(account.type)}'),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            HapticService.selectionClick();
            if (value == 'edit') {
              _showEditAccountDialog(context, account, index);
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

  IconData _getAccountIcon(String type) {
    switch (type) {
      case 'balance':
        return Icons.account_balance_outlined;
      case 'credit':
        return Icons.credit_card_outlined;
      case 'invest':
        return Icons.trending_up_outlined;
      case 'prepaid':
        return Icons.card_giftcard_outlined;
      default:
        return Icons.account_balance_wallet_outlined;
    }
  }

  String _getAccountTypeName(String type) {
    switch (type) {
      case 'balance':
        return '储蓄账户';
      case 'credit':
        return '信用账户';
      case 'invest':
        return '投资账户';
      case 'prepaid':
        return '预付卡账户';
      default:
        return '其他账户';
    }
  }

  void _showAddAccountDialog(BuildContext context) {
    _showAccountDialog(context, null, null);
  }

  void _showEditAccountDialog(BuildContext context, PreConfigAccount account, int index) {
    _showAccountDialog(context, account, index);
  }

  void _showAccountDialog(BuildContext context, PreConfigAccount? account, int? index) {
    final theme = Theme.of(context);
    final isEdit = account != null;
    final nameController = TextEditingController(text: account?.name ?? '');
    String selectedType = account?.type ?? 'balance';
    String selectedCurrency = account?.currencyCode ?? 'CNY';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(isEdit ? '编辑账户' : '添加账户'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '账户名称',
                    hintText: '例如：招商银行储蓄卡',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedType,
                  decoration: const InputDecoration(
                    labelText: '账户类型',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'balance', child: Text('储蓄账户')),
                    DropdownMenuItem(value: 'credit', child: Text('信用账户')),
                    DropdownMenuItem(value: 'invest', child: Text('投资账户')),
                    DropdownMenuItem(value: 'prepaid', child: Text('预付卡账户')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => selectedType = value);
                    }
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedCurrency,
                  decoration: const InputDecoration(
                    labelText: '货币',
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
                      content: const Text('请输入账户名称'),
                      backgroundColor: theme.colorScheme.error,
                    ),
                  );
                  return;
                }

                final newAccount = PreConfigAccount(
                  name: name,
                  currencyCode: selectedCurrency,
                  type: selectedType,
                );

                if (isEdit && index != null) {
                  ref.read(initConfigProvider.notifier).updateAccount(index, newAccount);
                } else {
                  ref.read(initConfigProvider.notifier).addAccount(newAccount);
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
        title: const Text('删除账户'),
        content: const Text('确定要删除这个预配置账户吗？'),
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
              ref.read(initConfigProvider.notifier).removeAccount(index);
              Navigator.pop(context);
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
