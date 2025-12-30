/// 账本账户关联管理页面
///
/// 用于管理账本与账户的关联关系，支持添加/移除账户关联，以及设置初始余额
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data.dart';
import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../common/app_icon_widget.dart';

/// 账本关联账户列表 Provider
final ledgerAccountsProvider = FutureProvider.family<List<AccountEntity>, int>(
  (ref, ledgerId) async {
    final ledgerDao = ref.watch(ledgerDaoProvider);
    final accountDao = ref.watch(accountDaoProvider);

    final accountIds = await ledgerDao.getAccountIdsByLedgerId(ledgerId);
    if (accountIds.isEmpty) return [];

    final accounts = await accountDao.getAccountsByIds(accountIds);
    return accounts;
  },
);

/// 未关联到账本的账户列表 Provider
final unlinkedAccountsProvider = FutureProvider.family<List<AccountEntity>, int>(
  (ref, ledgerId) async {
    final ledgerDao = ref.watch(ledgerDaoProvider);
    final accountDao = ref.watch(accountDaoProvider);

    final linkedAccountIds = await ledgerDao.getAccountIdsByLedgerId(ledgerId);
    final allAccounts = await accountDao.getAllAccounts();

    return allAccounts
        .where((a) => !linkedAccountIds.contains(a.accountId))
        .toList();
  },
);

/// 账本账户关联管理页面
class LedgerAccountsPage extends ConsumerStatefulWidget {
  final LedgerEntity ledger;

  const LedgerAccountsPage({super.key, required this.ledger});

  @override
  ConsumerState<LedgerAccountsPage> createState() => _LedgerAccountsPageState();
}

class _LedgerAccountsPageState extends ConsumerState<LedgerAccountsPage> {
  bool _isLoading = false;

  Future<void> _addAccount() async {
    HapticService.lightImpact();

    final unlinkedAsync = ref.read(unlinkedAccountsProvider(widget.ledger.ledgerId));
    final unlinkedAccounts = unlinkedAsync.valueOrNull ?? [];

    if (unlinkedAccounts.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('没有可添加的账户')),
        );
      }
      return;
    }

    final selectedAccount = await showModalBottomSheet<AccountEntity>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _AccountPickerSheet(
        accounts: unlinkedAccounts,
        title: '选择要关联的账户',
      ),
    );

    if (selectedAccount == null) return;

    // 显示初始余额输入对话框
    final initialBalance = await _showInitialBalanceDialog(selectedAccount);
    if (initialBalance == null) return; // 用户取消

    await _linkAccount(selectedAccount, initialBalance);
  }

  Future<int?> _showInitialBalanceDialog(AccountEntity account) async {
    final controller = TextEditingController();

    return showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('设置初始余额'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '为账户"${account.name}"在此账本下设置初始余额',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: InputDecoration(
                labelText: '初始余额',
                hintText: '可留空表示0',
                suffixText: account.currencyCode,
                border: const OutlineInputBorder(),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 8),
            Text(
              '初始余额将通过一笔隐藏交易记录平账',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isEmpty) {
                Navigator.pop(context, 0);
              } else {
                final value = int.tryParse(text);
                if (value != null) {
                  Navigator.pop(context, value);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('请输入有效的金额')),
                  );
                }
              }
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  Future<void> _linkAccount(AccountEntity account, int initialBalance) async {
    setState(() => _isLoading = true);

    try {
      final accountService = ref.read(accountServiceProvider);
      await accountService.linkAccountToLedger(
        accountId: account.accountId,
        ledgerId: widget.ledger.ledgerId,
        initialBalance: initialBalance,
      );

      // 刷新列表
      ref.invalidate(ledgerAccountsProvider(widget.ledger.ledgerId));
      ref.invalidate(unlinkedAccountsProvider(widget.ledger.ledgerId));

      if (mounted) {
        HapticService.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已关联账户"${account.name}"')),
        );
      }
    } catch (e) {
      if (mounted) {
        HapticService.heavyImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('关联失败：$e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _removeAccount(AccountEntity account) async {
    HapticService.lightImpact();

    // 检查账户是否有依赖
    final hasDependency = await _checkAccountDependency(account);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('移除关联'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('确定要解除账户"${account.name}"与此账本的关联吗？'),
            if (hasDependency) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '此账户在账本中已有交易记录，解除关联将同时删除相关交易记录',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: hasDependency
                ? FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                  )
                : null,
            child: Text(hasDependency ? '强制移除' : '确认'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    await _unlinkAccount(account, forceDelete: hasDependency);
  }

  Future<bool> _checkAccountDependency(AccountEntity account) async {
    final transactionDao = ref.read(transactionDaoProvider);
    final count = await transactionDao.getTransactionCountByAccountInLedger(
      account.accountId,
      widget.ledger.ledgerId,
    );
    return count > 0;
  }

  Future<void> _unlinkAccount(AccountEntity account, {bool forceDelete = false}) async {
    setState(() => _isLoading = true);

    try {
      final accountService = ref.read(accountServiceProvider);
      await accountService.unlinkAccountFromLedger(
        accountId: account.accountId,
        ledgerId: widget.ledger.ledgerId,
        deleteRelatedTransactions: forceDelete,
      );

      // 刷新列表
      ref.invalidate(ledgerAccountsProvider(widget.ledger.ledgerId));
      ref.invalidate(unlinkedAccountsProvider(widget.ledger.ledgerId));

      if (mounted) {
        HapticService.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已解除账户"${account.name}"的关联')),
        );
      }
    } catch (e) {
      if (mounted) {
        HapticService.heavyImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('操作失败：$e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accountsAsync = ref.watch(ledgerAccountsProvider(widget.ledger.ledgerId));

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.ledger.name} - 关联账户'),
        centerTitle: true,
      ),
      body: accountsAsync.when(
        data: (accounts) {
          if (accounts.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 72,
                    color: theme.colorScheme.onSurfaceVariant.withAlpha(128),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '暂无关联账户',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: _isLoading ? null : _addAccount,
                    icon: const Icon(Icons.add),
                    label: const Text('添加账户'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              final account = accounts[index];
              return _AccountListItem(
                account: account,
                onRemove: () => _removeAccount(account),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
      floatingActionButton: accountsAsync.maybeWhen(
        data: (accounts) => accounts.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: _isLoading ? null : _addAccount,
                icon: const Icon(Icons.add),
                label: const Text('添加账户'),
              )
            : null,
        orElse: () => null,
      ),
    );
  }
}

/// 账户列表项
class _AccountListItem extends StatelessWidget {
  final AccountEntity account;
  final VoidCallback onRemove;

  const _AccountListItem({
    required this.account,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typeInfo = getAccountTypeInfo(account.type);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: account.icon.isNotEmpty
            ? AppIconWidget.fromString(account.icon, size: 40)
            : CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  typeInfo.icon,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
        title: Text(
          account.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          '${typeInfo.name} · ${account.currencyCode}',
          style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
        ),
        trailing: IconButton(
          onPressed: onRemove,
          icon: const Icon(Icons.link_off),
          tooltip: '解除关联',
        ),
      ),
    );
  }
}

/// 账户选择底部弹窗
class _AccountPickerSheet extends StatelessWidget {
  final List<AccountEntity> accounts;
  final String title;

  const _AccountPickerSheet({
    required this.accounts,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                final typeInfo = getAccountTypeInfo(account.type);

                return ListTile(
                  leading: account.icon.isNotEmpty
                      ? AppIconWidget.fromString(account.icon, size: 40)
                      : CircleAvatar(
                          backgroundColor: theme.colorScheme.primaryContainer,
                          child: Icon(
                            typeInfo.icon,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                  title: Text(account.name),
                  subtitle: Text('${typeInfo.name} · ${account.currencyCode}'),
                  onTap: () {
                    HapticService.selectionClick();
                    Navigator.pop(context, account);
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
