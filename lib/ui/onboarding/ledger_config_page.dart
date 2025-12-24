/// 账本预配置页面
/// 
/// 初始化流程的第四步，配置多账本

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealed_currencies/sealed_currencies.dart';

import '../common/icon_picker_page.dart';
import '../common/app_icon_widget.dart';
import '../../data/constants/icon_data.dart';
import 'onboarding_state.dart';
import 'account_selection_page.dart';
import 'category_selection_page.dart';

/// 账本预配置页面
class LedgerConfigPage extends ConsumerWidget {
  const LedgerConfigPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('账本配置'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 说明
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '账本用于管理不同场景的财务记录。每个账本可选择不同的账户和分类。',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // 账本列表
          Expanded(
            child: state.ledgers.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book_outlined,
                          size: 64,
                          color: theme.colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '至少需要一个账本',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  )
                : ReorderableListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: state.ledgers.length,
                    onReorder: (oldIndex, newIndex) {
                      ref.read(onboardingProvider.notifier).reorderLedger(
                        oldIndex,
                        newIndex,
                      );
                    },
                    itemBuilder: (context, index) {
                      final ledger = state.ledgers[index];
                      return _LedgerItem(
                        key: ValueKey('ledger_$index'),
                        ledger: ledger,
                        index: index,
                        isFirst: index == 0,
                        total: state.ledgers.length,
                      );
                    },
                  ),
          ),

          // 添加按钮
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton.icon(
              onPressed: () => _showAddDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text('添加账本'),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final state = ref.read(onboardingProvider);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LedgerEditorPage(
          availableCurrencies: state.availableCurrencies,
          defaultCurrency: state.defaultCurrency ?? 'CNY',
          onSave: (ledger) {
            ref.read(onboardingProvider.notifier).addLedger(ledger);
          },
        ),
      ),
    );
  }
}

/// 账本项组件
class _LedgerItem extends ConsumerWidget {
  final PreConfigLedger ledger;
  final int index;
  final bool isFirst;
  final int total;

  const _LedgerItem({
    super.key,
    required this.ledger,
    required this.index,
    required this.isFirst,
    required this.total,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: ledger.icon != null
            ? AppIconWidget.fromString(
                ledger.icon!,
                size: 24,
                showBackground: true,
              )
            : CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  Icons.book,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
        title: Row(
          children: [
            Flexible(child: Text(ledger.name, overflow: TextOverflow.ellipsis)),
            if (ledger.isDefault) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '默认',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Text(_buildSubtitle()),
        trailing: ReorderableDragStartListener(
          index: index,
          child: PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'edit':
                  _showEditDialog(context, ref);
                  break;
                case 'default':
                  ref.read(onboardingProvider.notifier).setDefaultLedger(index);
                  break;
                case 'delete':
                  _confirmDelete(context, ref);
                  break;
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
              if (!ledger.isDefault)
                const PopupMenuItem(
                  value: 'default',
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline),
                      SizedBox(width: 12),
                      Text('设为默认'),
                    ],
                  ),
                ),
              if (!ledger.isDefault && total > 1)
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
      ),
    );
  }

  String _buildSubtitle() {
    final parts = <String>[];
    
    // 货币
    parts.add(ledger.currencyCode);
    
    // 账户
    if (ledger.selectedAccountIds.isEmpty) {
      if (ledger.autoAccount) {
        parts.add('自动包含账户');
      } else {
        parts.add('全部账户');
      }
    } else {
      parts.add('${ledger.selectedAccountIds.length}个账户');
    }
    
    return parts.join(' · ');
  }

  void _showEditDialog(BuildContext context, WidgetRef ref) {
    final state = ref.read(onboardingProvider);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LedgerEditorPage(
          ledger: ledger,
          availableCurrencies: state.availableCurrencies,
          defaultCurrency: state.defaultCurrency ?? 'CNY',
          onSave: (newLedger) {
            ref.read(onboardingProvider.notifier).updateLedger(index, newLedger);
          },
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除账本'),
        content: const Text('确定要删除这个账本吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              ref.read(onboardingProvider.notifier).removeLedger(index);
              Navigator.of(context).pop();
            },
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}

/// 账本编辑页面
class LedgerEditorPage extends ConsumerStatefulWidget {
  final PreConfigLedger? ledger;
  final Set<String> availableCurrencies;
  final String defaultCurrency;
  final void Function(PreConfigLedger) onSave;

  const LedgerEditorPage({
    super.key,
    this.ledger,
    required this.availableCurrencies,
    required this.defaultCurrency,
    required this.onSave,
  });

  @override
  ConsumerState<LedgerEditorPage> createState() => _LedgerEditorPageState();
}

class _LedgerEditorPageState extends ConsumerState<LedgerEditorPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  String? _icon;
  late String _currencyCode;
  bool _autoAccount = true;
  bool _autoCategory = true;
  Set<String> _selectedAccountIds = {};
  Set<String> _selectedCategoryIds = {};

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.ledger?.name);
    _descriptionController = TextEditingController(text: widget.ledger?.description);
    _icon = widget.ledger?.icon;
    _currencyCode = widget.ledger?.currencyCode ?? widget.defaultCurrency;
    _autoAccount = widget.ledger?.autoAccount ?? true;
    _autoCategory = widget.ledger?.autoCategory ?? true;
    _selectedAccountIds = Set.from(widget.ledger?.selectedAccountIds ?? {});
    _selectedCategoryIds = Set.from(widget.ledger?.selectedCategoryIds ?? {});
    
    // 确保货币代码有效
    if (!widget.availableCurrencies.contains(_currencyCode)) {
      _currencyCode = widget.availableCurrencies.isNotEmpty 
          ? widget.availableCurrencies.first 
          : 'CNY';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool get _isValid => _nameController.text.isNotEmpty;

  void _save() {
    if (!_isValid) return;

    final ledger = PreConfigLedger(
      name: _nameController.text,
      currencyCode: _currencyCode,
      description: _descriptionController.text.isEmpty
          ? null
          : _descriptionController.text,
      icon: _icon,
      isDefault: widget.ledger?.isDefault ?? false,
      autoAccount: _autoAccount,
      autoCategory: _autoCategory,
      selectedAccountIds: _selectedAccountIds,
      selectedCategoryIds: _selectedCategoryIds,
    );

    widget.onSave(ledger);
    Navigator.of(context).pop();
  }

  Future<void> _pickIcon() async {
    final result = await Navigator.of(context).push<AppIcon>(
      MaterialPageRoute(
        builder: (_) => IconPickerPage(
          initialIcon: _icon != null ? AppIcon.fromString(_icon!) : null,
          title: '选择账本图标',
        ),
      ),
    );
    if (result != null) {
      setState(() => _icon = result.toStorageString());
    }
  }

  Future<void> _selectAccounts() async {
    final result = await Navigator.of(context).push<Set<String>>(
      MaterialPageRoute(
        builder: (_) => AccountSelectionPage(
          initialSelectedIds: _selectedAccountIds,
        ),
      ),
    );
    if (result != null) {
      setState(() => _selectedAccountIds = result);
    }
  }

  Future<void> _selectCategories() async {
    final result = await Navigator.of(context).push<Set<String>>(
      MaterialPageRoute(
        builder: (_) => CategorySelectionPage(
          initialSelectedIds: _selectedCategoryIds,
        ),
      ),
    );
    if (result != null) {
      setState(() => _selectedCategoryIds = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ledger == null ? '添加账本' : '编辑账本'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _isValid ? _save : null,
            child: const Text('保存'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 图标和名称
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIconButton(
                icon: _icon != null ? AppIcon.fromString(_icon!) : null,
                size: 72,
                onTap: _pickIcon,
                hintText: '图标',
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: '账本名称',
                        hintText: '如: 日常账本、家庭账本',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 描述
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: '描述（可选）',
              hintText: '账本的用途说明',
              border: OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 24),

          // 货币选择
          _buildCurrencySelector(theme),
          const SizedBox(height: 24),

          // 自动包含开关
          _buildAutoOptions(theme),
          const SizedBox(height: 24),

          // 账户选择
          _buildAccountSelection(theme, state),
          const SizedBox(height: 16),

          // 分类选择
          _buildCategorySelection(theme, state),
        ],
      ),
    );
  }

  Widget _buildCurrencySelector(ThemeData theme) {
    // 构建可用货币列表
    final currencies = widget.availableCurrencies.map((code) {
      try {
        return FiatCurrency.fromCode(code);
      } catch (_) {
        return null;
      }
    }).whereType<FiatCurrency>().toList();

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.currency_exchange),
            title: const Text('账本本币'),
            subtitle: Text(
              '账本中所有金额将以此货币为基准',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownButtonFormField<String>(
              value: _currencyCode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              items: currencies.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency.code,
                  child: Text('${currency.code} - ${currency.name}'),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _currencyCode = value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAutoOptions(ThemeData theme) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.auto_awesome),
            title: const Text('自动包含设置'),
            subtitle: Text(
              '控制新增的账户或分类是否自动加入此账本',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: const Text('自动包含新增账户'),
            subtitle: const Text('新增的账户将自动加入此账本'),
            value: _autoAccount,
            onChanged: (value) => setState(() => _autoAccount = value),
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: const Text('自动包含新增分类'),
            subtitle: const Text('新增的分类将自动加入此账本'),
            value: _autoCategory,
            onChanged: (value) => setState(() => _autoCategory = value),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSelection(ThemeData theme, OnboardingState state) {
    final accountCount = _selectedAccountIds.isEmpty
        ? state.accounts.length
        : _selectedAccountIds.length;

    return Card(
      child: InkWell(
        onTap: _selectAccounts,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.account_balance_wallet_outlined),
              title: const Text('关联账户'),
              subtitle: Text(
                _selectedAccountIds.isEmpty
                    ? '使用全部账户（$accountCount个）'
                    : '已选择 $accountCount 个账户',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            if (_selectedAccountIds.isNotEmpty && _selectedAccountIds.length <= 5) ...[
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _selectedAccountIds.map((id) {
                    final index = int.tryParse(id.replaceFirst('account_', ''));
                    if (index == null || index >= state.accounts.length) {
                      return const SizedBox.shrink();
                    }
                    final account = state.accounts[index];
                    return Chip(
                      avatar: account.icon != null
                          ? AppIconWidget.fromString(account.icon!, size: 18)
                          : null,
                      label: Text(account.name),
                    );
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySelection(ThemeData theme, OnboardingState state) {
    final totalCategories = state.expenseCategories.length +
        state.incomeCategories.length +
        state.discountCategories.length +
        state.costCategories.length;
    final categoryCount = _selectedCategoryIds.isEmpty
        ? totalCategories
        : _selectedCategoryIds.length;

    return Card(
      child: InkWell(
        onTap: _selectCategories,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          leading: const Icon(Icons.category_outlined),
          title: const Text('关联分类'),
          subtitle: Text(
            _selectedCategoryIds.isEmpty
                ? '使用全部分类（$categoryCount个）'
                : '已选择 $categoryCount 个分类',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
