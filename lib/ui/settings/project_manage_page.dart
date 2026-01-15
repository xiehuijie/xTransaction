/// 项目管理页面
///
/// 用于管理项目的新增、编辑和删除
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

/// 当前账本的项目列表 Provider
final allProjectsProvider = StreamProvider<List<ProjectEntity>>((ref) {
  final projectDao = ref.watch(projectDaoProvider);
  if (projectDao == null) return const Stream.empty();
  return projectDao.watchAllProjects();
});

/// 项目管理页面
class ProjectManagePage extends ConsumerStatefulWidget {
  const ProjectManagePage({super.key});

  @override
  ConsumerState<ProjectManagePage> createState() => _ProjectManagePageState();
}

class _ProjectManagePageState extends ConsumerState<ProjectManagePage> {
  bool _showArchived = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final projectsAsync = ref.watch(allProjectsProvider);
    final currentLedgerId = ref.watch(currentLedgerIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('项目管理'),
        actions: [
          // 显示/隐藏归档项目切换
          IconButton(
            icon: Icon(
              _showArchived ? Icons.visibility_off : Icons.visibility,
              color: _showArchived ? theme.colorScheme.primary : null,
            ),
            tooltip: _showArchived ? '隐藏已归档' : '显示已归档',
            onPressed: () {
              setState(() => _showArchived = !_showArchived);
              HapticService.lightImpact();
            },
          ),
        ],
      ),
      body: currentLedgerId == null
          ? _buildNoLedgerView(context)
          : projectsAsync.when(
              data: (projects) {
                final filteredProjects = _showArchived
                    ? projects
                    : projects.where((p) => !p.archived).toList();

                if (filteredProjects.isEmpty) {
                  return _buildEmptyView(context);
                }

                return _buildProjectList(context, filteredProjects);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('加载失败: $e')),
            ),
      floatingActionButton: currentLedgerId != null
          ? FloatingActionButton.extended(
              onPressed: () => _navigateToForm(context, null),
              icon: const Icon(Icons.add),
              label: const Text('新增项目'),
            )
          : null,
    );
  }

  Widget _buildNoLedgerView(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.book_outlined, size: 64, color: theme.colorScheme.outline),
          const SizedBox(height: 16),
          Text('请先选择账本', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            '在概览页面选择或创建一个账本',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_outlined,
            size: 64,
            color: theme.colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            _showArchived ? '暂无项目' : '暂无活跃项目',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            '点击右下角按钮创建新项目',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectList(BuildContext context, List<ProjectEntity> projects) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return _ProjectCard(
          project: project,
          onTap: () => _navigateToForm(context, project),
          onArchive: () => _toggleArchive(project),
          onDelete: () => _confirmDelete(project),
        );
      },
    );
  }

  Future<void> _navigateToForm(BuildContext context, ProjectEntity? project) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectFormPage(editProject: project),
      ),
    );
    if (result == true) {
      ref.invalidate(allProjectsProvider);
    }
  }

  Future<void> _toggleArchive(ProjectEntity project) async {
    final projectDao = ref.read(projectDaoProvider);
    if (projectDao == null) return;

    await projectDao.updateProject(
      project.copyWith(archived: !project.archived),
    );
    ref.invalidate(allProjectsProvider);
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(project.archived ? '已取消归档' : '已归档'),
        ),
      );
    }
  }

  Future<void> _confirmDelete(ProjectEntity project) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: Text('确定要删除项目 "${project.name}" 吗？此操作不可撤销。'),
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
      final projectDao = ref.read(projectDaoProvider);
      if (projectDao == null) return;

      await projectDao.deleteProject(project.id);
      ref.invalidate(allProjectsProvider);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('项目已删除')),
        );
      }
    }
  }
}

/// 项目卡片
class _ProjectCard extends StatelessWidget {
  final ProjectEntity project;
  final VoidCallback onTap;
  final VoidCallback onArchive;
  final VoidCallback onDelete;

  const _ProjectCard({
    required this.project,
    required this.onTap,
    required this.onArchive,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // 图标
              project.icon?.isNotEmpty == true
                  ? AppIconWidget.fromString(project.icon!, size: 48)
                  : Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.folder,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
              const SizedBox(width: 16),
              // 信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          project.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            decoration: project.archived ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        if (project.archived)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '已归档',
                              style: theme.textTheme.labelSmall,
                            ),
                          ),
                      ],
                    ),
                    if (project.description?.isNotEmpty == true) ...[
                      const SizedBox(height: 4),
                      Text(
                        project.description!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              // 操作按钮
              PopupMenuButton<String>(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'archive',
                    child: Row(
                      children: [
                        Icon(project.archived ? Icons.unarchive : Icons.archive),
                        const SizedBox(width: 8),
                        Text(project.archived ? '取消归档' : '归档'),
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
                onSelected: (value) {
                  if (value == 'archive') {
                    onArchive();
                  } else if (value == 'delete') {
                    onDelete();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 项目表单页面
class ProjectFormPage extends ConsumerStatefulWidget {
  final ProjectEntity? editProject;

  const ProjectFormPage({super.key, this.editProject});

  @override
  ConsumerState<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends ConsumerState<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  String? _icon;
  bool _isSubmitting = false;

  bool get isEditing => widget.editProject != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.editProject?.name ?? '');
    _descriptionController = TextEditingController(text: widget.editProject?.description ?? '');
    _icon = widget.editProject?.icon;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? '编辑项目' : '新增项目'),
        actions: [
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: _confirmDelete,
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
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: theme.colorScheme.outline.withValues(alpha: 0.3),
                    ),
                  ),
                  child: _icon?.isNotEmpty == true
                      ? AppIconWidget.fromString(_icon!, size: 48)
                      : Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 32,
                          color: theme.colorScheme.outline,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                '点击选择图标',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 项目名称
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '项目名称',
                hintText: '输入项目名称',
                prefixIcon: Icon(Icons.folder),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请输入项目名称';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 项目描述
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '描述（可选）',
                hintText: '输入项目描述',
                prefixIcon: Icon(Icons.description),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 32),

            // 提交按钮
            FilledButton(
              onPressed: _isSubmitting ? null : _submit,
              child: _isSubmitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(isEditing ? '保存' : '创建'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectIcon() async {
    final result = await Navigator.push<AppIcon>(
      context,
      MaterialPageRoute(
        builder: (context) => IconPickerPage(
          initialIcon: _icon != null ? AppIcon.fromString(_icon!) : null,
        ),
      ),
    );
    if (result != null) {
      setState(() => _icon = result.toStorageString());
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final projectDao = ref.read(projectDaoProvider);
      if (projectDao == null) {
        throw Exception('请先选择账本');
      }

      final now = DateTime.now().millisecondsSinceEpoch;

      if (isEditing) {
        await projectDao.updateProject(
          widget.editProject!.copyWith(
            name: _nameController.text.trim(),
            description: drift.Value(_descriptionController.text.trim()),
            icon: drift.Value(_icon),
            updatedAt: now,
          ),
        );
      } else {
        await projectDao.insertProject(
          ProjectCompanion.insert(
            name: _nameController.text.trim(),
            description: drift.Value(_descriptionController.text.trim()),
            icon: drift.Value(_icon),
            createdAt: now,
            updatedAt: now,
          ),
        );
      }

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('保存失败: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _confirmDelete() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: Text('确定要删除项目 "${widget.editProject!.name}" 吗？此操作不可撤销。'),
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
      try {
        final projectDao = ref.read(projectDaoProvider);
        if (projectDao == null) return;

        await projectDao.deleteProject(widget.editProject!.id);
        
        if (mounted) {
          Navigator.pop(context, true);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('删除失败: $e')),
          );
        }
      }
    }
  }
}
