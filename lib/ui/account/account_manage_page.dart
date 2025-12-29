/// 账户管理页面
///
/// 提供账户的分类展示、新增与编辑功能
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data.dart';
import '../../data/constants/account_types.dart';
import '../../providers/account_provider.dart';
import '../../utils/haptic_service.dart';
import '../common/app_icon_widget.dart';

import 'account_form_page.dart';

/// 账户管理页面
class AccountManagePage extends ConsumerStatefulWidget {
  const AccountManagePage({super.key});

  @override
  ConsumerState<AccountManagePage> createState() => _AccountManagePageState();
}

class _AccountManagePageState extends ConsumerState<AccountManagePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 可创建的账户类型（不包括bonus）
  final List<AccountType> _accountTypes = creatableAccountTypes;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _accountTypes.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _navigateToAddAccount(AccountType type) {
    HapticService.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AccountFormPage(accountType: type),
      ),
    );
  }

  void _navigateToEditAccount(AccountEntity account) {
    HapticService.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AccountFormPage(
          accountType: account.type,
          editAccount: account,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final groupedAccountsAsync = ref.watch(groupedAccountsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('账户管理'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabAlignment: TabAlignment.fill,
          tabs: _accountTypes.map((type) {
            final info = getAccountTypeInfo(type);
            return Tab(
              icon: Icon(info.icon, size: 20),
              text: info.name,
              iconMargin: const EdgeInsets.only(bottom: 4),
            );
          }).toList(),
        ),
      ),
      body: groupedAccountsAsync.when(
        data: (groupedAccounts) => TabBarView(
          controller: _tabController,
          children: _accountTypes.map((type) {
            final accounts = groupedAccounts[type] ?? [];
            return _AccountTypeListView(
              accountType: type,
              accounts: accounts,
              onAccountTap: _navigateToEditAccount,
              onAddAccount: () => _navigateToAddAccount(type),
            );
          }).toList(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                '加载失败',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => ref.invalidate(groupedAccountsProvider),
                icon: const Icon(Icons.refresh),
                label: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final currentType = _accountTypes[_tabController.index];
          _navigateToAddAccount(currentType);
        },
        icon: const Icon(Icons.add),
        label: const Text('新增账户'),
      ),
    );
  }
}

/// 账户类型列表视图
class _AccountTypeListView extends StatelessWidget {
  final AccountType accountType;
  final List<AccountEntity> accounts;
  final void Function(AccountEntity) onAccountTap;
  final VoidCallback onAddAccount;

  const _AccountTypeListView({
    required this.accountType,
    required this.accounts,
    required this.onAccountTap,
    required this.onAddAccount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typeInfo = getAccountTypeInfo(accountType);

    if (accounts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              typeInfo.icon,
              size: 72,
              color: theme.colorScheme.onSurfaceVariant.withAlpha(128),
            ),
            const SizedBox(height: 16),
            Text(
              '暂无${typeInfo.name}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              typeInfo.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withAlpha(180),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onAddAccount,
              icon: const Icon(Icons.add),
              label: Text('添加${typeInfo.name}'),
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
          onTap: () => onAccountTap(account),
        );
      },
    );
  }
}

/// 账户列表项
class _AccountListItem extends ConsumerWidget {
  final AccountEntity account;
  final VoidCallback onTap;

  const _AccountListItem({
    required this.account,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        subtitle: account.description.isNotEmpty
            ? Text(
                account.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : Text(
                typeInfo.name,
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              account.currencyCode,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Icon(
              Icons.chevron_right,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
        onTap: () {
          HapticService.selectionClick();
          onTap();
        },
      ),
    );
  }
}
