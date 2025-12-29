/// 账本管理页面
///
/// 用于管理账本的新增、编辑和删除
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;

import '../../data/data.dart';
import '../../data/constants/icon_data.dart';
import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../common/app_icon_widget.dart';
import '../common/icon_picker_page.dart';

/// 账本列表 Provider
final allLedgersProvider = StreamProvider<List<LedgerEntity>>((ref) {
  final ledgerDao = ref.watch(ledgerDaoProvider);
  return ledgerDao.watchAllLedgers();
});

/// 账本管理页面
class LedgerManagePage extends ConsumerWidget {
  const LedgerManagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ledgersAsync = ref.watch(allLedgersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('账本管理'),
        centerTitle: true,
      ),
      body: ledgersAsync.when(
        data: (ledgers) {
          if (ledgers.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.book_outlined,
                    size: 72,
                    color: theme.colorScheme.onSurfaceVariant.withAlpha(128),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '暂无账本',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () => _navigateToForm(context, ref),
                    icon: const Icon(Icons.add),
                    label: const Text('创建账本'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: ledgers.length,
            itemBuilder: (context, index) {
              final ledger = ledgers[index];
              return _LedgerListItem(
                ledger: ledger,
                onTap: () => _navigateToForm(context, ref, ledger: ledger),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('加载失败: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToForm(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('新建账本'),
      ),
    );
  }

  void _navigateToForm(BuildContext context, WidgetRef ref,
      {LedgerEntity? ledger}) {
    HapticService.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LedgerFormPage(editLedger: ledger),
      ),
    );
  }
}

/// 账本列表项
class _LedgerListItem extends ConsumerWidget {
  final LedgerEntity ledger;
  final VoidCallback onTap;

  const _LedgerListItem({
    required this.ledger,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: ledger.photo != null && ledger.photo!.isNotEmpty
            ? AppIconWidget.fromString(ledger.photo!, size: 40)
            : CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  Icons.book,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
        title: Text(
          ledger.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: ledger.description.isNotEmpty
            ? Text(
                ledger.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : Text(
                '本币: ${ledger.currencyCode}',
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 显示标签
            if (ledger.autoAccount)
              _buildChip(context, '自动账户', theme.colorScheme.primary),
            if (ledger.autoCategory)
              _buildChip(context, '自动分类', theme.colorScheme.secondary),
            const SizedBox(width: 8),
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

  Widget _buildChip(BuildContext context, String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// 账本表单页面
class LedgerFormPage extends ConsumerStatefulWidget {
  final LedgerEntity? editLedger;

  const LedgerFormPage({super.key, this.editLedger});

  @override
  ConsumerState<LedgerFormPage> createState() => _LedgerFormPageState();
}

class _LedgerFormPageState extends ConsumerState<LedgerFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _noteController;

  String? _photo;
  String _currencyCode = 'CNY';
  bool _autoAccount = true;
  bool _autoCategory = true;

  bool get isEditing => widget.editLedger != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.editLedger?.name);
    _descriptionController =
        TextEditingController(text: widget.editLedger?.description);
    _noteController = TextEditingController(text: widget.editLedger?.note);

    if (widget.editLedger != null) {
      _photo = widget.editLedger!.photo;
      _currencyCode = widget.editLedger!.currencyCode;
      _autoAccount = widget.editLedger!.autoAccount;
      _autoCategory = widget.editLedger!.autoCategory;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _selectIcon() async {
    HapticService.lightImpact();
    final result = await Navigator.of(context).push<AppIcon>(
      MaterialPageRoute(
        builder: (_) => IconPickerPage(
          initialIcon: _photo != null ? AppIcon.fromString(_photo!) : null,
          title: '选择账本图标',
          showFlags: false,
        ),
      ),
    );

    if (result != null) {
      setState(() => _photo = result.toStorageString());
    }
  }

  Future<void> _selectCurrency() async {
    HapticService.lightImpact();
    final currenciesAsync = ref.read(allCurrenciesProvider);
    final currencies = currenciesAsync.value ?? [];

    // 只显示系统货币
    final systemCurrencies = currencies
        .where((c) => c.source == CurrencySource.system)
        .toList();

    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => _CurrencyPickerSheet(
        currencies: systemCurrencies,
        selectedCode: _currencyCode,
      ),
    );

    if (selected != null) {
      setState(() => _currencyCode = selected);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final ledgerDao = ref.read(ledgerDaoProvider);
      final now = DateTime.now().millisecondsSinceEpoch;

      if (isEditing) {
        // 更新账本
        final updated = widget.editLedger!.copyWith(
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim(),
          photo: drift.Value(_photo),
          currencyCode: _currencyCode,
          autoAccount: _autoAccount,
          autoCategory: _autoCategory,
          note: _noteController.text.trim(),
          updatedAt: now,
        );
        await ledgerDao.updateLedger(updated);
      } else {
        // 创建新账本
        await ledgerDao.insertLedger(
          LedgerCompanion.insert(
            name: _nameController.text.trim(),
            currencyCode: _currencyCode,
            description: drift.Value(_descriptionController.text.trim()),
            photo: drift.Value(_photo),
            autoAccount: drift.Value(_autoAccount),
            autoCategory: drift.Value(_autoCategory),
            createdAt: now,
            updatedAt: now,
            note: drift.Value(_noteController.text.trim()),
          ),
        );
      }

      ref.invalidate(allLedgersProvider);

      if (mounted) {
        HapticService.mediumImpact();
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(isEditing ? '账本已更新' : '账本已创建')),
        );
      }
    } catch (e) {
      if (mounted) {
        HapticService.heavyImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('保存失败：$e'),
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

  Future<void> _delete() async {
    if (widget.editLedger == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除账本'),
        content: Text('确定要删除账本"${widget.editLedger!.name}"吗？\n\n此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isLoading = true);

    try {
      final ledgerDao = ref.read(ledgerDaoProvider);
      await ledgerDao.deleteLedger(widget.editLedger!.ledgerId);

      ref.invalidate(allLedgersProvider);

      if (mounted) {
        HapticService.mediumImpact();
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('账本已删除')),
        );
      }
    } catch (e) {
      if (mounted) {
        HapticService.heavyImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('删除失败：$e'),
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

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? '编辑账本' : '新建账本'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _isLoading ? null : _save,
            icon: const Icon(Icons.save_outlined),
            tooltip: '保存',
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 图标选择
            Center(
              child: InkWell(
                onTap: _selectIcon,
                borderRadius: BorderRadius.circular(48),
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.outline.withAlpha(100),
                      width: 2,
                    ),
                  ),
                  child: _photo != null
                      ? Center(
                          child: AppIconWidget.fromString(_photo!, size: 48),
                        )
                      : Icon(
                          Icons.book,
                          size: 48,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                ),
              ),
            ),
            Center(
              child: TextButton.icon(
                onPressed: _selectIcon,
                icon: const Icon(Icons.edit, size: 16),
                label: const Text('选择图标'),
              ),
            ),
            const SizedBox(height: 24),

            // 账本名称
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '账本名称',
                hintText: '输入账本名称',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.label_outline),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请输入账本名称';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 本币选择
            ListTile(
              leading: const Icon(Icons.currency_exchange),
              title: const Text('本币'),
              subtitle: Text(_currencyCode),
              trailing: const Icon(Icons.chevron_right),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: theme.colorScheme.outline),
              ),
              onTap: _selectCurrency,
            ),
            const SizedBox(height: 16),

            // 描述
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '描述（可选）',
                hintText: '输入账本描述',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description_outlined),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 24),

            // 自动选项
            Text('自动设置', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    value: _autoAccount,
                    onChanged: (value) => setState(() => _autoAccount = value),
                    title: const Text('自动包含新账户'),
                    subtitle: const Text('新创建的账户将自动关联到此账本'),
                    secondary: const Icon(Icons.account_balance_wallet_outlined),
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    value: _autoCategory,
                    onChanged: (value) => setState(() => _autoCategory = value),
                    title: const Text('自动包含新分类'),
                    subtitle: const Text('新创建的分类将自动关联到此账本'),
                    secondary: const Icon(Icons.category_outlined),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 备注
            TextFormField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: '备注（可选）',
                hintText: '输入备注信息',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.note_outlined),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            // 删除按钮（仅编辑模式）
            if (isEditing)
              OutlinedButton.icon(
                onPressed: _isLoading ? null : _delete,
                icon: const Icon(Icons.delete_outline),
                label: const Text('删除账本'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                  side: BorderSide(color: theme.colorScheme.error),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 货币选择器
class _CurrencyPickerSheet extends StatelessWidget {
  final List<CurrencyEntity> currencies;
  final String selectedCode;

  const _CurrencyPickerSheet({
    required this.currencies,
    required this.selectedCode,
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
            child: Text(
              '选择本币',
              style: theme.textTheme.titleMedium,
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                final isSelected = currency.currencyCode == selectedCode;

                return ListTile(
                  title: Text('${currency.currencyCode} - ${currency.name}'),
                  subtitle: Text(currency.symbol),
                  trailing: isSelected
                      ? Icon(Icons.check, color: theme.colorScheme.primary)
                      : null,
                  selected: isSelected,
                  onTap: () => Navigator.pop(context, currency.currencyCode),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
