/// 账本管理页面
///
/// 用于管理账本的新增、编辑和删除
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/ledger_service.dart';
import '../../data/database/database.dart';
import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';

/// 账本管理页面
class LedgerManagePage extends ConsumerStatefulWidget {
  const LedgerManagePage({super.key});

  @override
  ConsumerState<LedgerManagePage> createState() => _LedgerManagePageState();
}

class _LedgerManagePageState extends ConsumerState<LedgerManagePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ledgerServiceAsync = ref.watch(ledgerServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('账本管理'),
        centerTitle: true,
      ),
      body: ledgerServiceAsync.when(
        data: (service) {
          final ledgers = service.getAllLedgers();
          final currentId = ref.watch(currentLedgerIdProvider);

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
                    onPressed: () => _navigateToForm(context, service),
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
              final isCurrent = ledger.id == currentId;
              return _LedgerListItem(
                ledger: ledger,
                isCurrent: isCurrent,
                onTap: () => _navigateToForm(context, service, ledger: ledger),
                onSetCurrent: () => _setCurrentLedger(service, ledger.id),
                onDelete: () => _deleteLedger(service, ledger),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('加载失败: $error'),
        ),
      ),
      floatingActionButton: ledgerServiceAsync.whenOrNull(
        data: (service) => FloatingActionButton.extended(
          onPressed: () => _navigateToForm(context, service),
          icon: const Icon(Icons.add),
          label: const Text('新建账本'),
        ),
      ),
    );
  }

  void _navigateToForm(BuildContext context, LedgerService service,
      {LedgerMeta? ledger}) {
    HapticService.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LedgerFormPage(
          service: service,
          editLedger: ledger,
          onSaved: () => setState(() {}),
        ),
      ),
    );
  }

  Future<void> _setCurrentLedger(LedgerService service, String ledgerId) async {
    await service.setCurrentLedgerId(ledgerId);
    ref.read(currentLedgerIdProvider.notifier).state = ledgerId;
    HapticService.lightImpact();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('已切换当前账本')),
      );
      setState(() {});
    }
  }

  Future<void> _deleteLedger(LedgerService service, LedgerMeta ledger) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除账本'),
        content: Text('确定要删除账本 "${ledger.name}" 吗？\n\n此操作将同时删除该账本的所有数据，且不可恢复。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      // 关闭数据库连接
      final manager = ref.read(databaseManagerProvider);
      await manager.closeDatabase(ledger.id);

      // 删除数据库文件
      await DatabaseManager.deleteDatabaseFile(ledger.id);

      // 从服务中删除账本
      await service.deleteLedger(ledger.id);

      // 更新当前账本ID
      final newCurrentId = service.getCurrentLedgerId();
      ref.read(currentLedgerIdProvider.notifier).state = newCurrentId;

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('账本 "${ledger.name}" 已删除')),
        );
        setState(() {});
      }
    }
  }
}

/// 账本列表项
class _LedgerListItem extends StatelessWidget {
  final LedgerMeta ledger;
  final bool isCurrent;
  final VoidCallback onTap;
  final VoidCallback onSetCurrent;
  final VoidCallback onDelete;

  const _LedgerListItem({
    required this.ledger,
    required this.isCurrent,
    required this.onTap,
    required this.onSetCurrent,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCurrent
              ? theme.colorScheme.primary
              : theme.colorScheme.primaryContainer,
          child: Icon(
            ledger.icon != null ? _parseIcon(ledger.icon!) : Icons.book,
            color: isCurrent
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onPrimaryContainer,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                ledger.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (isCurrent)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '当前',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ledger.description.isNotEmpty)
              Text(
                ledger.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            Text(
              '货币: ${ledger.currencyCode}',
              style: TextStyle(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'current':
                onSetCurrent();
                break;
              case 'edit':
                onTap();
                break;
              case 'delete':
                onDelete();
                break;
            }
          },
          itemBuilder: (context) => [
            if (!isCurrent)
              const PopupMenuItem(
                value: 'current',
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline),
                    SizedBox(width: 8),
                    Text('设为当前'),
                  ],
                ),
              ),
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 8),
                  Text('编辑'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('删除', style: TextStyle(color: Colors.red)),
                ],
              ),
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

  IconData _parseIcon(String iconStr) {
    // 简单的图标解析，可以根据需要扩展
    switch (iconStr) {
      case 'book':
        return Icons.book;
      case 'wallet':
        return Icons.wallet;
      case 'account_balance':
        return Icons.account_balance;
      case 'savings':
        return Icons.savings;
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'home':
        return Icons.home;
      case 'business':
        return Icons.business;
      case 'travel':
        return Icons.flight;
      default:
        return Icons.book;
    }
  }
}

/// 账本表单页面
class LedgerFormPage extends StatefulWidget {
  final LedgerService service;
  final LedgerMeta? editLedger;
  final VoidCallback? onSaved;

  const LedgerFormPage({
    super.key,
    required this.service,
    this.editLedger,
    this.onSaved,
  });

  @override
  State<LedgerFormPage> createState() => _LedgerFormPageState();
}

class _LedgerFormPageState extends State<LedgerFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _currencyController;
  late final TextEditingController _descController;
  String? _selectedIcon;

  bool get isEditing => widget.editLedger != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.editLedger?.name ?? '');
    _currencyController = TextEditingController(
      text: widget.editLedger?.currencyCode ?? 'CNY',
    );
    _descController = TextEditingController(
      text: widget.editLedger?.description ?? '',
    );
    _selectedIcon = widget.editLedger?.icon;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _currencyController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? '编辑账本' : '创建账本'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _save,
            child: const Text('保存'),
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
              child: GestureDetector(
                onTap: _selectIcon,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    _selectedIcon != null ? _parseIcon(_selectedIcon!) : Icons.book,
                    size: 40,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: _selectIcon,
                child: const Text('选择图标'),
              ),
            ),
            const SizedBox(height: 16),

            // 名称
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '账本名称',
                hintText: '例如：日常开支',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入账本名称';
                }
                if (widget.service.isNameExists(value, excludeId: widget.editLedger?.id)) {
                  return '账本名称已存在';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 货币
            TextFormField(
              controller: _currencyController,
              decoration: const InputDecoration(
                labelText: '默认货币',
                hintText: '例如：CNY',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入货币代码';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 描述
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: '描述（可选）',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  void _selectIcon() async {
    final icons = ['book', 'wallet', 'account_balance', 'savings', 'shopping_bag', 'home', 'business', 'travel'];
    
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择图标'),
        content: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: icons.map((icon) {
            return GestureDetector(
              onTap: () => Navigator.pop(context, icon),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: _selectedIcon == icon
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Icon(
                  _parseIcon(icon),
                  color: _selectedIcon == icon
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
        ],
      ),
    );

    if (selected != null) {
      setState(() {
        _selectedIcon = selected;
      });
    }
  }

  IconData _parseIcon(String iconStr) {
    switch (iconStr) {
      case 'book':
        return Icons.book;
      case 'wallet':
        return Icons.wallet;
      case 'account_balance':
        return Icons.account_balance;
      case 'savings':
        return Icons.savings;
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'home':
        return Icons.home;
      case 'business':
        return Icons.business;
      case 'travel':
        return Icons.flight;
      default:
        return Icons.book;
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      if (isEditing) {
        // 更新
        final updated = widget.editLedger!.copyWith(
          name: _nameController.text,
          currencyCode: _currencyController.text,
          description: _descController.text,
          icon: _selectedIcon,
        );
        await widget.service.updateLedger(updated);
      } else {
        // 创建
        await widget.service.createLedger(
          name: _nameController.text,
          currencyCode: _currencyController.text,
          description: _descController.text,
          icon: _selectedIcon,
        );
      }

      widget.onSaved?.call();

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(isEditing ? '账本已更新' : '账本已创建')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('保存失败: $e')),
        );
      }
    }
  }
}
