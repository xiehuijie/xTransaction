/// 账本相关方关联管理页面
///
/// 用于管理账本与相关方的关联关系
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data.dart';
import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../common/app_icon_widget.dart';

/// 账本关联相关方列表 Provider
final ledgerStakeholdersProvider = FutureProvider.family<List<StakeholderEntity>, int>(
  (ref, ledgerId) async {
    final ledgerDao = ref.watch(ledgerDaoProvider);
    final stakeholderDao = ref.watch(stakeholderDaoProvider);

    final stakeholderIds = await ledgerDao.getStakeholderIdsByLedgerId(ledgerId);
    if (stakeholderIds.isEmpty) return [];

    final stakeholders = await stakeholderDao.getStakeholdersByIds(stakeholderIds);
    return stakeholders;
  },
);

/// 未关联到账本的相关方列表 Provider
final unlinkedStakeholdersProvider = FutureProvider.family<List<StakeholderEntity>, int>(
  (ref, ledgerId) async {
    final ledgerDao = ref.watch(ledgerDaoProvider);
    final stakeholderDao = ref.watch(stakeholderDaoProvider);

    final linkedStakeholderIds = await ledgerDao.getStakeholderIdsByLedgerId(ledgerId);
    final allStakeholders = await stakeholderDao.getAllStakeholders();

    return allStakeholders
        .where((s) => !linkedStakeholderIds.contains(s.stakeholderId))
        .toList();
  },
);

/// 账本相关方关联管理页面
class LedgerStakeholdersPage extends ConsumerStatefulWidget {
  final LedgerEntity ledger;

  const LedgerStakeholdersPage({super.key, required this.ledger});

  @override
  ConsumerState<LedgerStakeholdersPage> createState() => _LedgerStakeholdersPageState();
}

class _LedgerStakeholdersPageState extends ConsumerState<LedgerStakeholdersPage> {
  bool _isLoading = false;

  Future<void> _addStakeholder() async {
    HapticService.lightImpact();

    final unlinkedAsync = ref.read(unlinkedStakeholdersProvider(widget.ledger.ledgerId));
    final unlinkedStakeholders = unlinkedAsync.valueOrNull ?? [];

    if (unlinkedStakeholders.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('没有可添加的相关方')),
        );
      }
      return;
    }

    final selectedStakeholder = await showModalBottomSheet<StakeholderEntity>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _StakeholderPickerSheet(
        stakeholders: unlinkedStakeholders,
        title: '选择要关联的相关方',
      ),
    );

    if (selectedStakeholder == null) return;

    await _linkStakeholder(selectedStakeholder);
  }

  Future<void> _linkStakeholder(StakeholderEntity stakeholder) async {
    setState(() => _isLoading = true);

    try {
      final ledgerDao = ref.read(ledgerDaoProvider);
      await ledgerDao.linkStakeholderToLedger(
        stakeholder.stakeholderId,
        widget.ledger.ledgerId,
      );

      // 刷新列表
      ref.invalidate(ledgerStakeholdersProvider(widget.ledger.ledgerId));
      ref.invalidate(unlinkedStakeholdersProvider(widget.ledger.ledgerId));

      if (mounted) {
        HapticService.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已关联相关方"${stakeholder.name}"')),
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

  Future<void> _removeStakeholder(StakeholderEntity stakeholder) async {
    HapticService.lightImpact();

    // 检查相关方是否有依赖
    final hasDependency = await _checkStakeholderDependency(stakeholder);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('移除关联'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('确定要解除相关方"${stakeholder.name}"与此账本的关联吗？'),
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
                        '此相关方在账本中已有交易记录，解除关联将清除相关交易的相关方信息',
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

    await _unlinkStakeholder(stakeholder, forceDelete: hasDependency);
  }

  Future<bool> _checkStakeholderDependency(StakeholderEntity stakeholder) async {
    final transactionDao = ref.read(transactionDaoProvider);
    final count = await transactionDao.getTransactionCountByStakeholderInLedger(
      stakeholder.stakeholderId,
      widget.ledger.ledgerId,
    );
    return count > 0;
  }

  Future<void> _unlinkStakeholder(StakeholderEntity stakeholder, {bool forceDelete = false}) async {
    setState(() => _isLoading = true);

    try {
      final ledgerDao = ref.read(ledgerDaoProvider);

      if (forceDelete) {
        // 清除相关交易的相关方信息
        final transactionDao = ref.read(transactionDaoProvider);
        await transactionDao.clearStakeholderFromTransactionsInLedger(
          stakeholder.stakeholderId,
          widget.ledger.ledgerId,
        );
      }

      await ledgerDao.unlinkStakeholderFromLedger(
        stakeholder.stakeholderId,
        widget.ledger.ledgerId,
      );

      // 刷新列表
      ref.invalidate(ledgerStakeholdersProvider(widget.ledger.ledgerId));
      ref.invalidate(unlinkedStakeholdersProvider(widget.ledger.ledgerId));

      if (mounted) {
        HapticService.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已解除相关方"${stakeholder.name}"的关联')),
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
    final stakeholdersAsync = ref.watch(ledgerStakeholdersProvider(widget.ledger.ledgerId));

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.ledger.name} - 关联相关方'),
        centerTitle: true,
      ),
      body: stakeholdersAsync.when(
        data: (stakeholders) {
          if (stakeholders.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 72,
                    color: theme.colorScheme.onSurfaceVariant.withAlpha(128),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '暂无关联相关方',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: _isLoading ? null : _addStakeholder,
                    icon: const Icon(Icons.add),
                    label: const Text('添加相关方'),
                  ),
                ],
              ),
            );
          }

          // 按类型分组
          final grouped = <StakeholderType, List<StakeholderEntity>>{};
          for (final s in stakeholders) {
            grouped.putIfAbsent(s.type, () => []).add(s);
          }

          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              for (final type in grouped.keys) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    _getTypeName(type),
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                ...grouped[type]!.map((s) => _StakeholderListItem(
                  stakeholder: s,
                  onRemove: () => _removeStakeholder(s),
                )),
              ],
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
      floatingActionButton: stakeholdersAsync.maybeWhen(
        data: (stakeholders) => stakeholders.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: _isLoading ? null : _addStakeholder,
                icon: const Icon(Icons.add),
                label: const Text('添加相关方'),
              )
            : null,
        orElse: () => null,
      ),
    );
  }

  String _getTypeName(StakeholderType type) {
    return switch (type) {
      StakeholderType.person => '个人',
      StakeholderType.merchant => '商户',
      StakeholderType.company => '公司',
      StakeholderType.other => '其他',
    };
  }
}

/// 相关方列表项
class _StakeholderListItem extends StatelessWidget {
  final StakeholderEntity stakeholder;
  final VoidCallback onRemove;

  const _StakeholderListItem({
    required this.stakeholder,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: stakeholder.avatar != null && stakeholder.avatar!.isNotEmpty
            ? AppIconWidget.fromString(stakeholder.avatar!, size: 40)
            : CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  Icons.person,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
        title: Text(
          stakeholder.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: stakeholder.description.isNotEmpty
            ? Text(
                stakeholder.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: IconButton(
          onPressed: onRemove,
          icon: const Icon(Icons.link_off),
          tooltip: '解除关联',
        ),
      ),
    );
  }
}

/// 相关方选择底部弹窗
class _StakeholderPickerSheet extends StatelessWidget {
  final List<StakeholderEntity> stakeholders;
  final String title;

  const _StakeholderPickerSheet({
    required this.stakeholders,
    required this.title,
  });

  String _getTypeName(StakeholderType type) {
    return switch (type) {
      StakeholderType.person => '个人',
      StakeholderType.merchant => '商户',
      StakeholderType.company => '公司',
      StakeholderType.other => '其他',
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 按类型分组
    final grouped = <StakeholderType, List<StakeholderEntity>>{};
    for (final s in stakeholders) {
      grouped.putIfAbsent(s.type, () => []).add(s);
    }

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
            child: ListView(
              controller: scrollController,
              children: [
                for (final type in grouped.keys) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Text(
                      _getTypeName(type),
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  ...grouped[type]!.map((stakeholder) => ListTile(
                    leading: stakeholder.avatar != null && stakeholder.avatar!.isNotEmpty
                        ? AppIconWidget.fromString(stakeholder.avatar!, size: 40)
                        : CircleAvatar(
                            backgroundColor: theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.person,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                    title: Text(stakeholder.name),
                    subtitle: stakeholder.description.isNotEmpty
                        ? Text(
                            stakeholder.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        : null,
                    onTap: () {
                      HapticService.selectionClick();
                      Navigator.pop(context, stakeholder);
                    },
                  )),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
