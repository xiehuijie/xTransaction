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
final projectsByLedgerProvider =
    FutureProvider.family<List<ProjectEntity>, int>((ref, ledgerId) async {
      final ledgerDao = ref.watch(ledgerDaoProvider);
      return ledgerDao.getProjectsByLedgerId(ledgerId);
    });

/// 所有账本的项目列表 Provider
final allProjectsProvider = FutureProvider<List<ProjectEntity>>((ref) async {
  final ledgerDao = ref.watch(ledgerDaoProvider);
  final ledgers = await ledgerDao.getAllLedgers();

  final allProjects = <ProjectEntity>[];
  for (final ledger in ledgers) {
    final projects = await ledgerDao.getProjectsByLedgerId(ledger.ledgerId);
    allProjects.addAll(projects);
  }
  return allProjects;
});

/// 项目管理页面
class ProjectManagePage extends ConsumerStatefulWidget {
  const ProjectManagePage({super.key});

  @override
  ConsumerState<ProjectManagePage> createState() => _ProjectManagePageState();
}

class _ProjectManagePageState extends ConsumerState<ProjectManagePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showArchived = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    setState(() {
      _showArchived = _tabController.index == 1;
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final projectsAsync = ref.watch(allProjectsProvider);
    final ledgersAsync = ref.watch(allLedgersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('项目管理'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '进行中'),
            Tab(text: '已归档'),
          ],
        ),
      ),
      body: projectsAsync.when(
        data: (projects) {
          return ledgersAsync.when(
            data: (ledgers) {
              // 创建账本 ID 到名称的映射
              final ledgerNameMap = <int, String>{};
              for (final ledger in ledgers) {
                ledgerNameMap[ledger.ledgerId] = ledger.name;
              }

              // 分离活跃和归档项目
              final activeProjects = projects
                  .where((p) => !p.archived)
                  .toList();
              final archivedProjects = projects
                  .where((p) => p.archived)
                  .toList();

              return TabBarView(
                controller: _tabController,
                children: [
                  _ProjectListView(
                    projects: activeProjects,
                    ledgerNameMap: ledgerNameMap,
                    emptyMessage: '暂无进行中的项目',
                    emptyDescription: '创建项目来归类和预算管理您的交易',
                    onProjectTap: (project) =>
                        _navigateToForm(context, project: project),
                    onAddProject: () => _navigateToForm(context),
                  ),
                  _ProjectListView(
                    projects: archivedProjects,
                    ledgerNameMap: ledgerNameMap,
                    emptyMessage: '暂无已归档的项目',
                    emptyDescription: '完成的项目可以归档以保持列表整洁',
                    onProjectTap: (project) =>
                        _navigateToForm(context, project: project),
                    onAddProject: null,
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('加载账本失败: $error')),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
      floatingActionButton: _showArchived
          ? null
          : FloatingActionButton.extended(
              onPressed: () => _navigateToForm(context),
              icon: const Icon(Icons.add),
              label: const Text('新建项目'),
            ),
    );
  }

  void _navigateToForm(BuildContext context, {ProjectEntity? project}) {
    HapticService.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ProjectFormPage(editProject: project)),
    );
  }
}

/// 项目列表视图
class _ProjectListView extends StatelessWidget {
  final List<ProjectEntity> projects;
  final Map<int, String> ledgerNameMap;
  final String emptyMessage;
  final String emptyDescription;
  final void Function(ProjectEntity) onProjectTap;
  final VoidCallback? onAddProject;

  const _ProjectListView({
    required this.projects,
    required this.ledgerNameMap,
    required this.emptyMessage,
    required this.emptyDescription,
    required this.onProjectTap,
    this.onAddProject,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (projects.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_outlined,
              size: 72,
              color: theme.colorScheme.onSurfaceVariant.withAlpha(128),
            ),
            const SizedBox(height: 16),
            Text(
              emptyMessage,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              emptyDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withAlpha(180),
              ),
              textAlign: TextAlign.center,
            ),
            if (onAddProject != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onAddProject,
                icon: const Icon(Icons.add),
                label: const Text('创建项目'),
              ),
            ],
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        final ledgerName = ledgerNameMap[project.ledgerId] ?? '未知账本';
        return _ProjectListItem(
          project: project,
          ledgerName: ledgerName,
          onTap: () => onProjectTap(project),
        );
      },
    );
  }
}

/// 项目列表项
class _ProjectListItem extends StatelessWidget {
  final ProjectEntity project;
  final String ledgerName;
  final VoidCallback onTap;

  const _ProjectListItem({
    required this.project,
    required this.ledgerName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 计算项目进度（如果有日期范围）
    Widget? progressIndicator;
    if (project.startDate != null && project.endDate != null) {
      final now = DateTime.now();
      final startDate = _dateFromDayNumber(project.startDate!);
      final endDate = _dateFromDayNumber(project.endDate!);

      if (now.isAfter(startDate) && now.isBefore(endDate)) {
        final totalDays = endDate.difference(startDate).inDays;
        final elapsedDays = now.difference(startDate).inDays;
        final progress = totalDays > 0 ? elapsedDays / totalDays : 0.0;

        progressIndicator = LinearProgressIndicator(
          value: progress,
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
        );
      }
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () {
          HapticService.selectionClick();
          onTap();
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // 项目图标
                  project.icon.isNotEmpty
                      ? AppIconWidget.fromString(project.icon, size: 48)
                      : CircleAvatar(
                          radius: 24,
                          backgroundColor: theme.colorScheme.primaryContainer,
                          child: Icon(
                            Icons.folder,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                  const SizedBox(width: 16),
                  // 项目信息
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                project.name,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            if (project.archived)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      theme.colorScheme.surfaceContainerHighest,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '已归档',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          ledgerName,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        if (project.description.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            project.description,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              // 预算信息
              if (project.budget > 0) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '预算: ${_formatAmount(project.budget)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
              // 日期信息
              if (project.startDate != null || project.endDate != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatDateRange(project.startDate, project.endDate),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
              // 进度条
              if (progressIndicator != null) ...[
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: progressIndicator,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatAmount(int amount) {
    // 假设金额以分为单位存储
    final value = amount / 100;
    return '¥${value.toStringAsFixed(2)}';
  }

  String _formatDateRange(int? startDate, int? endDate) {
    final start = startDate != null ? _formatDate(startDate) : '未设置';
    final end = endDate != null ? _formatDate(endDate) : '未设置';
    return '$start - $end';
  }

  String _formatDate(int dayNumber) {
    final date = _dateFromDayNumber(dayNumber);
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }

  DateTime _dateFromDayNumber(int dayNumber) {
    // 1900日期系统：天数从1900年1月1日开始
    return DateTime(1900, 1, 1).add(Duration(days: dayNumber));
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
  bool _isLoading = false;

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _budgetController;

  String? _icon;
  int? _ledgerId;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _archived = false;

  bool get isEditing => widget.editProject != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.editProject?.name);
    _descriptionController = TextEditingController(
      text: widget.editProject?.description,
    );
    _budgetController = TextEditingController(
      text: widget.editProject != null
          ? (widget.editProject!.budget / 100).toStringAsFixed(2)
          : '',
    );

    if (widget.editProject != null) {
      _icon = widget.editProject!.icon;
      _ledgerId = widget.editProject!.ledgerId;
      _archived = widget.editProject!.archived;
      if (widget.editProject!.startDate != null) {
        _startDate = _dateFromDayNumber(widget.editProject!.startDate!);
      }
      if (widget.editProject!.endDate != null) {
        _endDate = _dateFromDayNumber(widget.editProject!.endDate!);
      }
    }
  }

  DateTime _dateFromDayNumber(int dayNumber) {
    return DateTime(1900, 1, 1).add(Duration(days: dayNumber));
  }

  int _dateToDayNumber(DateTime date) {
    return date.difference(DateTime(1900, 1, 1)).inDays;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  Future<void> _selectIcon() async {
    HapticService.lightImpact();
    final result = await Navigator.of(context).push<AppIcon>(
      MaterialPageRoute(
        builder: (_) => IconPickerPage(
          initialIcon: _icon != null ? AppIcon.fromString(_icon!) : null,
          title: '选择图标',
        ),
      ),
    );

    if (result != null) {
      setState(() => _icon = result.toStorageString());
    }
  }

  Future<void> _selectDate(bool isStart) async {
    HapticService.lightImpact();
    final initialDate = isStart
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? _startDate ?? DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          // 如果结束日期早于开始日期，清除结束日期
          if (_endDate != null && _endDate!.isBefore(_startDate!)) {
            _endDate = null;
          }
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    if (_ledgerId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择所属账本')));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final ledgerDao = ref.read(ledgerDaoProvider);
      final now = DateTime.now().millisecondsSinceEpoch;
      final budgetValue = ((double.tryParse(_budgetController.text) ?? 0) * 100)
          .round();

      if (isEditing) {
        // 更新项目
        final updated = widget.editProject!.copyWith(
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim(),
          budget: budgetValue,
          icon: _icon ?? '',
          archived: _archived,
          updatedAt: now,
          startDate: drift.Value(
            _startDate != null ? _dateToDayNumber(_startDate!) : null,
          ),
          endDate: drift.Value(
            _endDate != null ? _dateToDayNumber(_endDate!) : null,
          ),
        );
        await ledgerDao.updateProject(updated);
      } else {
        // 创建新项目
        await ledgerDao.insertProject(
          ProjectCompanion(
            ledgerId: drift.Value(_ledgerId!),
            name: drift.Value(_nameController.text.trim()),
            description: drift.Value(_descriptionController.text.trim()),
            budget: drift.Value(budgetValue),
            icon: drift.Value(_icon ?? ''),
            archived: drift.Value(_archived),
            createdAt: drift.Value(now),
            updatedAt: drift.Value(now),
            startDate: drift.Value(
              _startDate != null ? _dateToDayNumber(_startDate!) : null,
            ),
            endDate: drift.Value(
              _endDate != null ? _dateToDayNumber(_endDate!) : null,
            ),
          ),
        );
      }

      // 刷新项目列表
      ref.invalidate(allProjectsProvider);

      if (mounted) {
        HapticService.mediumImpact();
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('保存失败: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _delete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除这个项目吗？此操作不可恢复。'),
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
      await ledgerDao.deleteProject(widget.editProject!.projectId);

      // 刷新项目列表
      ref.invalidate(allProjectsProvider);

      if (mounted) {
        HapticService.mediumImpact();
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('删除失败: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _toggleArchive() async {
    final newArchived = !_archived;
    final action = newArchived ? '归档' : '取消归档';

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('确认$action'),
        content: Text('确定要$action这个项目吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(action),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() {
      _archived = newArchived;
    });

    // 如果是编辑模式，立即保存
    if (isEditing) {
      await _save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ledgersAsync = ref.watch(allLedgersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? '编辑项目' : '新建项目'),
        centerTitle: true,
        actions: [
          if (isEditing) ...[
            IconButton(
              onPressed: _isLoading ? null : _toggleArchive,
              icon: Icon(
                _archived ? Icons.unarchive_outlined : Icons.archive_outlined,
              ),
              tooltip: _archived ? '取消归档' : '归档',
            ),
            IconButton(
              onPressed: _isLoading ? null : _delete,
              icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
              tooltip: '删除',
            ),
          ],
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
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: _icon != null && _icon!.isNotEmpty
                      ? ClipOval(
                          child: AppIconWidget.fromString(_icon!, size: 80),
                        )
                      : Icon(
                          Icons.folder,
                          size: 40,
                          color: theme.colorScheme.onPrimaryContainer,
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
            const SizedBox(height: 24),

            // 项目名称
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '项目名称',
                hintText: '请输入项目名称',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请输入项目名称';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 所属账本
            ledgersAsync.when(
              data: (ledgers) {
                // 如果没有选择账本且有账本列表，默认选择第一个
                if (_ledgerId == null && ledgers.isNotEmpty && !isEditing) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted && _ledgerId == null) {
                      setState(() => _ledgerId = ledgers.first.ledgerId);
                    }
                  });
                }

                return DropdownButtonFormField<int>(
                  initialValue: _ledgerId,
                  decoration: const InputDecoration(
                    labelText: '所属账本',
                    border: OutlineInputBorder(),
                  ),
                  items: ledgers.map((ledger) {
                    return DropdownMenuItem(
                      value: ledger.ledgerId,
                      child: Text(ledger.name),
                    );
                  }).toList(),
                  onChanged: isEditing
                      ? null
                      : (value) {
                          setState(() => _ledgerId = value);
                        },
                  validator: (value) {
                    if (value == null) {
                      return '请选择所属账本';
                    }
                    return null;
                  },
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (error, stack) => Text('加载账本失败: $error'),
            ),
            const SizedBox(height: 16),

            // 项目描述
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '项目描述',
                hintText: '请输入项目描述（可选）',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // 预算
            TextFormField(
              controller: _budgetController,
              decoration: const InputDecoration(
                labelText: '预算金额',
                hintText: '请输入预算金额（可选）',
                prefixText: '¥ ',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 16),

            // 日期范围
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(true),
                    borderRadius: BorderRadius.circular(8),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: '开始日期',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      child: Text(
                        _startDate != null
                            ? '${_startDate!.year}/${_startDate!.month.toString().padLeft(2, '0')}/${_startDate!.day.toString().padLeft(2, '0')}'
                            : '未设置',
                        style: _startDate == null
                            ? TextStyle(color: theme.hintColor)
                            : null,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(false),
                    borderRadius: BorderRadius.circular(8),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: '结束日期',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      child: Text(
                        _endDate != null
                            ? '${_endDate!.year}/${_endDate!.month.toString().padLeft(2, '0')}/${_endDate!.day.toString().padLeft(2, '0')}'
                            : '未设置',
                        style: _endDate == null
                            ? TextStyle(color: theme.hintColor)
                            : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // 保存按钮
            FilledButton.icon(
              onPressed: _isLoading ? null : _save,
              icon: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save),
              label: Text(isEditing ? '保存修改' : '创建项目'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 账本列表 Provider（从 ledger_manage_page.dart 引用）
final allLedgersProvider = StreamProvider<List<LedgerEntity>>((ref) {
  final ledgerDao = ref.watch(ledgerDaoProvider);
  return ledgerDao.watchAllLedgers();
});
