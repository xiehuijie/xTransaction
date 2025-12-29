/// 相关方管理页面
///
/// 用于管理相关方（人员、商户、企业等）的新增、编辑和删除
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

/// 相关方类型信息
class StakeholderTypeInfo {
  final StakeholderType type;
  final String name;
  final IconData icon;
  final String description;

  const StakeholderTypeInfo({
    required this.type,
    required this.name,
    required this.icon,
    required this.description,
  });
}

/// 相关方类型列表
const stakeholderTypeInfos = [
  StakeholderTypeInfo(
    type: StakeholderType.person,
    name: '个人',
    icon: Icons.person,
    description: '个人、亲友等',
  ),
  StakeholderTypeInfo(
    type: StakeholderType.merchant,
    name: '商户',
    icon: Icons.store,
    description: '店铺、商家等',
  ),
  StakeholderTypeInfo(
    type: StakeholderType.company,
    name: '公司',
    icon: Icons.business,
    description: '企业、机构等',
  ),
  StakeholderTypeInfo(
    type: StakeholderType.other,
    name: '其他',
    icon: Icons.category,
    description: '其他类型实体',
  ),
];

/// 获取相关方类型信息
StakeholderTypeInfo getStakeholderTypeInfo(StakeholderType type) {
  return stakeholderTypeInfos.firstWhere(
    (info) => info.type == type,
    orElse: () => stakeholderTypeInfos.last,
  );
}

/// 相关方管理页面
class StakeholderManagePage extends ConsumerStatefulWidget {
  const StakeholderManagePage({super.key});

  @override
  ConsumerState<StakeholderManagePage> createState() =>
      _StakeholderManagePageState();
}

class _StakeholderManagePageState extends ConsumerState<StakeholderManagePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: stakeholderTypeInfos.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stakeholdersAsync = ref.watch(allStakeholdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('相关方管理'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: stakeholderTypeInfos.map((info) {
            return Tab(
              icon: Icon(info.icon),
              text: info.name,
            );
          }).toList(),
        ),
      ),
      body: stakeholdersAsync.when(
        data: (stakeholders) {
          // 按类型分组
          final groupedStakeholders = <StakeholderType, List<StakeholderEntity>>{};
          for (final type in StakeholderType.values) {
            groupedStakeholders[type] = stakeholders
                .where((s) => s.type == type)
                .toList();
          }

          return TabBarView(
            controller: _tabController,
            children: stakeholderTypeInfos.map((info) {
              final list = groupedStakeholders[info.type] ?? [];
              return _StakeholderTypeListView(
                typeInfo: info,
                stakeholders: list,
                onStakeholderTap: (stakeholder) =>
                    _navigateToForm(context, stakeholder: stakeholder),
                onAddStakeholder: () =>
                    _navigateToForm(context, type: info.type),
              );
            }).toList(),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final currentType =
              stakeholderTypeInfos[_tabController.index].type;
          _navigateToForm(context, type: currentType);
        },
        icon: const Icon(Icons.add),
        label: const Text('新增相关方'),
      ),
    );
  }

  void _navigateToForm(
    BuildContext context, {
    StakeholderEntity? stakeholder,
    StakeholderType? type,
  }) {
    HapticService.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => StakeholderFormPage(
          editStakeholder: stakeholder,
          initialType: type,
        ),
      ),
    );
  }
}

/// 相关方类型列表视图
class _StakeholderTypeListView extends StatelessWidget {
  final StakeholderTypeInfo typeInfo;
  final List<StakeholderEntity> stakeholders;
  final void Function(StakeholderEntity) onStakeholderTap;
  final VoidCallback onAddStakeholder;

  const _StakeholderTypeListView({
    required this.typeInfo,
    required this.stakeholders,
    required this.onStakeholderTap,
    required this.onAddStakeholder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (stakeholders.isEmpty) {
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
              onPressed: onAddStakeholder,
              icon: const Icon(Icons.add),
              label: Text('添加${typeInfo.name}'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: stakeholders.length,
      itemBuilder: (context, index) {
        final stakeholder = stakeholders[index];
        return _StakeholderListItem(
          stakeholder: stakeholder,
          onTap: () => onStakeholderTap(stakeholder),
        );
      },
    );
  }
}

/// 相关方列表项
class _StakeholderListItem extends StatelessWidget {
  final StakeholderEntity stakeholder;
  final VoidCallback onTap;

  const _StakeholderListItem({
    required this.stakeholder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typeInfo = getStakeholderTypeInfo(stakeholder.type);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: stakeholder.avatar != null && stakeholder.avatar!.isNotEmpty
            ? AppIconWidget.fromString(stakeholder.avatar!, size: 40)
            : CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  typeInfo.icon,
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
            : stakeholder.contact != null && stakeholder.contact!.isNotEmpty
                ? Text(
                    stakeholder.contact!,
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  )
                : null,
        trailing: Icon(
          Icons.chevron_right,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        onTap: () {
          HapticService.selectionClick();
          onTap();
        },
      ),
    );
  }
}

/// 相关方表单页面
class StakeholderFormPage extends ConsumerStatefulWidget {
  final StakeholderEntity? editStakeholder;
  final StakeholderType? initialType;

  const StakeholderFormPage({
    super.key,
    this.editStakeholder,
    this.initialType,
  });

  @override
  ConsumerState<StakeholderFormPage> createState() =>
      _StakeholderFormPageState();
}

class _StakeholderFormPageState extends ConsumerState<StakeholderFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _contactController;
  late TextEditingController _noteController;

  String? _avatar;
  StakeholderType _type = StakeholderType.person;

  bool get isEditing => widget.editStakeholder != null;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.editStakeholder?.name);
    _descriptionController =
        TextEditingController(text: widget.editStakeholder?.description);
    _contactController =
        TextEditingController(text: widget.editStakeholder?.contact);
    _noteController =
        TextEditingController(text: widget.editStakeholder?.note);

    if (widget.editStakeholder != null) {
      _avatar = widget.editStakeholder!.avatar;
      _type = widget.editStakeholder!.type;
    } else if (widget.initialType != null) {
      _type = widget.initialType!;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _contactController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _selectAvatar() async {
    HapticService.lightImpact();
    final result = await Navigator.of(context).push<AppIcon>(
      MaterialPageRoute(
        builder: (_) => IconPickerPage(
          initialIcon: _avatar != null ? AppIcon.fromString(_avatar!) : null,
          title: '选择头像',
          showFlags: false,
        ),
      ),
    );

    if (result != null) {
      setState(() => _avatar = result.toStorageString());
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final stakeholderDao = ref.read(stakeholderDaoProvider);
      final now = DateTime.now().millisecondsSinceEpoch;

      if (isEditing) {
        // 更新相关方
        final updated = widget.editStakeholder!.copyWith(
          name: _nameController.text.trim(),
          type: _type,
          avatar: drift.Value(_avatar),
          description: _descriptionController.text.trim(),
          contact: drift.Value(_contactController.text.trim()),
          note: _noteController.text.trim(),
          updatedAt: now,
        );
        await stakeholderDao.updateStakeholder(updated);
      } else {
        // 创建新相关方
        await stakeholderDao.insertStakeholder(
          StakeholderCompanion(
            name: drift.Value(_nameController.text.trim()),
            type: drift.Value(_type),
            avatar: drift.Value(_avatar),
            description: drift.Value(_descriptionController.text.trim()),
            contact: drift.Value(_contactController.text.trim()),
            createdAt: drift.Value(now),
            updatedAt: drift.Value(now),
            note: drift.Value(_noteController.text.trim()),
          ),
        );
      }

      ref.invalidate(allStakeholdersProvider);

      if (mounted) {
        HapticService.mediumImpact();
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(isEditing ? '相关方已更新' : '相关方已创建')),
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
    if (widget.editStakeholder == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除相关方'),
        content: Text('确定要删除"${widget.editStakeholder!.name}"吗？\n\n此操作不可撤销。'),
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
      final stakeholderDao = ref.read(stakeholderDaoProvider);
      await stakeholderDao
          .deleteStakeholder(widget.editStakeholder!.stakeholderId);

      ref.invalidate(allStakeholdersProvider);

      if (mounted) {
        HapticService.mediumImpact();
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('相关方已删除')),
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
    final typeInfo = getStakeholderTypeInfo(_type);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? '编辑相关方' : '新建相关方'),
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
            // 头像选择
            Center(
              child: InkWell(
                onTap: _selectAvatar,
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
                  child: _avatar != null
                      ? Center(
                          child: AppIconWidget.fromString(_avatar!, size: 48),
                        )
                      : Icon(
                          typeInfo.icon,
                          size: 48,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                ),
              ),
            ),
            Center(
              child: TextButton.icon(
                onPressed: _selectAvatar,
                icon: const Icon(Icons.edit, size: 16),
                label: const Text('选择头像'),
              ),
            ),
            const SizedBox(height: 24),

            // 类型选择
            Text('类型', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            SegmentedButton<StakeholderType>(
              segments: stakeholderTypeInfos.map((info) {
                return ButtonSegment(
                  value: info.type,
                  label: Text(info.name),
                  icon: Icon(info.icon),
                );
              }).toList(),
              selected: {_type},
              onSelectionChanged: (value) {
                setState(() => _type = value.first);
              },
            ),
            const SizedBox(height: 24),

            // 名称
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '名称',
                hintText: '输入相关方名称',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.label_outline),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请输入名称';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 描述
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '描述（可选）',
                hintText: '输入描述信息',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description_outlined),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),

            // 联系方式
            TextFormField(
              controller: _contactController,
              decoration: const InputDecoration(
                labelText: '联系方式（可选）',
                hintText: '输入联系方式',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone_outlined),
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
                label: const Text('删除相关方'),
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
