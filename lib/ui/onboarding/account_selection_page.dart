import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/app_icon_widget.dart';
import 'onboarding_state.dart';

/// 账户选择页面
/// 用于在账本配置时选择关联的账户
class AccountSelectionPage extends ConsumerStatefulWidget {
  final Set<String> initialSelectedIds;
  final String title;

  const AccountSelectionPage({
    super.key,
    required this.initialSelectedIds,
    this.title = '选择账户',
  });

  @override
  ConsumerState<AccountSelectionPage> createState() =>
      _AccountSelectionPageState();
}

class _AccountSelectionPageState extends ConsumerState<AccountSelectionPage> {
  late Set<String> _selectedIds;
  bool _selectAll = false;

  @override
  void initState() {
    super.initState();
    _selectedIds = Set.from(widget.initialSelectedIds);
    // 如果初始为空，则表示全选
    _selectAll = _selectedIds.isEmpty;
  }

  void _toggleSelectAll() {
    setState(() {
      _selectAll = !_selectAll;
      if (_selectAll) {
        _selectedIds.clear();
      }
    });
  }

  void _toggleAccount(String id) {
    setState(() {
      if (_selectAll) {
        // 从全选切换到单选模式
        final state = ref.read(onboardingProvider);
        _selectedIds = state.accounts
            .asMap()
            .entries
            .map((e) => 'account_${e.key}')
            .toSet();
        _selectedIds.remove(id);
        _selectAll = false;
      } else if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        // 如果取消所有选择，恢复全选
        if (_selectedIds.isEmpty) {
          _selectAll = true;
        }
      } else {
        _selectedIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(_selectAll ? <String>{} : _selectedIds);
            },
            child: const Text('确定'),
          ),
        ],
      ),
      body: Column(
        children: [
          // 全选选项
          Material(
            color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
            child: CheckboxListTile(
              value: _selectAll,
              onChanged: (_) => _toggleSelectAll(),
              title: const Text('全部账户'),
              subtitle: Text(
                '自动包含所有账户（包括后续新增）',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              secondary: Icon(
                Icons.select_all,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const Divider(height: 1),
          // 账户列表
          Expanded(
            child: ListView.builder(
              itemCount: state.accounts.length,
              itemBuilder: (context, index) {
                final account = state.accounts[index];
                final id = 'account_$index';
                final isSelected = _selectAll || _selectedIds.contains(id);

                return _AccountListTile(
                  account: account,
                  isSelected: isSelected,
                  enabled: !_selectAll,
                  onTap: () => _toggleAccount(id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountListTile extends StatelessWidget {
  final PreConfigAccount account;
  final bool isSelected;
  final bool enabled;
  final VoidCallback onTap;

  const _AccountListTile({
    required this.account,
    required this.isSelected,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      enabled: enabled,
      leading: account.icon != null
          ? AppIconWidget.fromString(account.icon!, size: 40)
          : CircleAvatar(
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Text(
                account.name.isNotEmpty ? account.name[0] : '?',
                style: TextStyle(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
      title: Text(account.name),
      subtitle: Text(
        account.typeName,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.outline,
        ),
      ),
      trailing: Checkbox(
        value: isSelected,
        onChanged: enabled ? (_) => onTap() : null,
      ),
      onTap: enabled ? onTap : null,
    );
  }
}
