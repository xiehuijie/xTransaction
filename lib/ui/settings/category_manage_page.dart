/// 分类管理页面
///
/// 用于管理交易分类的新增、编辑和删除
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/data.dart';
import '../../data/constants/icon_data.dart';
import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../common/app_icon_widget.dart';
import '../common/icon_picker_page.dart';

/// 分类类型信息
class CategoryTypeInfo {
  final CategoryType type;
  final String name;
  final IconData icon;
  final String description;

  const CategoryTypeInfo({
    required this.type,
    required this.name,
    required this.icon,
    required this.description,
  });
}

/// 分类类型列表
const categoryTypeInfos = [
  CategoryTypeInfo(
    type: CategoryType.expense,
    name: '支出',
    icon: Icons.trending_down,
    description: '日常消费、支付等支出类型',
  ),
  CategoryTypeInfo(
    type: CategoryType.income,
    name: '收入',
    icon: Icons.trending_up,
    description: '工资、奖金等收入类型',
  ),
  CategoryTypeInfo(
    type: CategoryType.discount,
    name: '优惠',
    icon: Icons.local_offer,
    description: '折扣、优惠券等减免类型',
  ),
  CategoryTypeInfo(
    type: CategoryType.cost,
    name: '成本',
    icon: Icons.receipt_long,
    description: '手续费、利息等成本类型',
  ),
];

/// 获取分类类型信息
CategoryTypeInfo getCategoryTypeInfo(CategoryType type) {
  return categoryTypeInfos.firstWhere(
    (info) => info.type == type,
    orElse: () => categoryTypeInfos.first,
  );
}

/// 所有分类 Provider
final allCategoriesProvider = StreamProvider<List<CategoryEntity>>((ref) {
  final categoryDao = ref.watch(categoryDaoProvider);
  return categoryDao.watchAllCategories();
});

/// 分类管理页面
class CategoryManagePage extends ConsumerStatefulWidget {
  const CategoryManagePage({super.key});

  @override
  ConsumerState<CategoryManagePage> createState() => _CategoryManagePageState();
}

class _CategoryManagePageState extends ConsumerState<CategoryManagePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: categoryTypeInfos.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(allCategoriesProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.categoryManagement),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: categoryTypeInfos.map((info) {
            return Tab(
              icon: Icon(info.icon, size: 20),
              text: info.name,
              iconMargin: const EdgeInsets.only(bottom: 4),
            );
          }).toList(),
        ),
      ),
      body: categoriesAsync.when(
        data: (categories) {
          // 按类型分组
          final groupedCategories = <CategoryType, List<CategoryEntity>>{};
          for (final type in CategoryType.values) {
            groupedCategories[type] =
                categories
                    .where((c) => c.type == type && c.parentId == null)
                    .toList()
                  ..sort((a, b) => a.order.compareTo(b.order));
          }

          // 构建子分类映射
          final childrenMap = <int, List<CategoryEntity>>{};
          for (final category in categories) {
            if (category.parentId != null) {
              childrenMap.putIfAbsent(category.parentId!, () => []);
              childrenMap[category.parentId!]!.add(category);
            }
          }
          // 对子分类排序
          for (final children in childrenMap.values) {
            children.sort((a, b) => a.order.compareTo(b.order));
          }

          return TabBarView(
            controller: _tabController,
            children: categoryTypeInfos.map((info) {
              final list = groupedCategories[info.type] ?? [];
              return _CategoryTypeListView(
                typeInfo: info,
                categories: list,
                childrenMap: childrenMap,
                onCategoryTap: (category) =>
                    _navigateToForm(context, category: category),
                onAddCategory: () => _navigateToForm(context, type: info.type),
                onAddSubCategory: (parent) =>
                    _navigateToForm(context, type: info.type, parent: parent),
              );
            }).toList(),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final currentType = categoryTypeInfos[_tabController.index].type;
          _navigateToForm(context, type: currentType);
        },
        icon: const Icon(Icons.add),
        label: Text(l10n.newCategory),
      ),
    );
  }

  void _navigateToForm(
    BuildContext context, {
    CategoryEntity? category,
    CategoryType? type,
    CategoryEntity? parent,
  }) {
    HapticService.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CategoryFormPage(
          editCategory: category,
          initialType: type,
          parentCategory: parent,
        ),
      ),
    );
  }
}

/// 分类类型列表视图
class _CategoryTypeListView extends StatelessWidget {
  final CategoryTypeInfo typeInfo;
  final List<CategoryEntity> categories;
  final Map<int, List<CategoryEntity>> childrenMap;
  final void Function(CategoryEntity) onCategoryTap;
  final VoidCallback onAddCategory;
  final void Function(CategoryEntity) onAddSubCategory;

  const _CategoryTypeListView({
    required this.typeInfo,
    required this.categories,
    required this.childrenMap,
    required this.onCategoryTap,
    required this.onAddCategory,
    required this.onAddSubCategory,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (categories.isEmpty) {
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
              '暂无${typeInfo.name}分类',
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
              onPressed: onAddCategory,
              icon: const Icon(Icons.add),
              label: Text('添加${typeInfo.name}分类'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final children = childrenMap[category.categoryId] ?? [];
        return _CategoryListItem(
          category: category,
          children: children,
          onTap: () => onCategoryTap(category),
          onChildTap: onCategoryTap,
          onAddSubCategory: () => onAddSubCategory(category),
        );
      },
    );
  }
}

/// 分类列表项（支持展开子分类）
class _CategoryListItem extends StatefulWidget {
  final CategoryEntity category;
  final List<CategoryEntity> children;
  final VoidCallback onTap;
  final void Function(CategoryEntity) onChildTap;
  final VoidCallback onAddSubCategory;

  const _CategoryListItem({
    required this.category,
    required this.children,
    required this.onTap,
    required this.onChildTap,
    required this.onAddSubCategory,
  });

  @override
  State<_CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<_CategoryListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typeInfo = getCategoryTypeInfo(widget.category.type);
    final hasChildren = widget.children.isNotEmpty;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: [
          ListTile(
            leading: widget.category.icon.isNotEmpty
                ? AppIconWidget.fromString(widget.category.icon, size: 40)
                : CircleAvatar(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Icon(
                      typeInfo.icon,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
            title: Text(
              widget.category.name,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: hasChildren
                ? Text(
                    '${widget.children.length} 个子分类',
                    style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                  )
                : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 添加子分类按钮
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: theme.colorScheme.primary,
                  ),
                  onPressed: () {
                    HapticService.lightImpact();
                    widget.onAddSubCategory();
                  },
                  tooltip: '添加子分类',
                ),
                if (hasChildren)
                  IconButton(
                    icon: Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () {
                      HapticService.selectionClick();
                      setState(() => _isExpanded = !_isExpanded);
                    },
                  )
                else
                  Icon(
                    Icons.chevron_right,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
              ],
            ),
            onTap: () {
              HapticService.selectionClick();
              widget.onTap();
            },
          ),
          // 子分类列表
          if (_isExpanded && hasChildren)
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withAlpha(50),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: widget.children.map((child) {
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 56, right: 16),
                    leading: child.icon.isNotEmpty
                        ? AppIconWidget.fromString(child.icon, size: 32)
                        : CircleAvatar(
                            radius: 16,
                            backgroundColor:
                                theme.colorScheme.secondaryContainer,
                            child: Icon(
                              typeInfo.icon,
                              size: 16,
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                    title: Text(child.name),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    onTap: () {
                      HapticService.selectionClick();
                      widget.onChildTap(child);
                    },
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

/// 分类表单页面
class CategoryFormPage extends ConsumerStatefulWidget {
  final CategoryEntity? editCategory;
  final CategoryType? initialType;
  final CategoryEntity? parentCategory;

  const CategoryFormPage({
    super.key,
    this.editCategory,
    this.initialType,
    this.parentCategory,
  });

  @override
  ConsumerState<CategoryFormPage> createState() => _CategoryFormPageState();
}

class _CategoryFormPageState extends ConsumerState<CategoryFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  late TextEditingController _nameController;
  late TextEditingController _orderController;

  String? _icon;
  CategoryType _type = CategoryType.expense;
  int? _parentId;
  String? _parentName;

  bool get isEditing => widget.editCategory != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.editCategory?.name);
    _orderController = TextEditingController(
      text: widget.editCategory?.order.toString() ?? '0',
    );

    if (widget.editCategory != null) {
      _icon = widget.editCategory!.icon;
      _type = widget.editCategory!.type;
      _parentId = widget.editCategory!.parentId;
    } else if (widget.initialType != null) {
      _type = widget.initialType!;
    }

    if (widget.parentCategory != null) {
      _parentId = widget.parentCategory!.categoryId;
      _parentName = widget.parentCategory!.name;
      _type = widget.parentCategory!.type;
    }

    // 如果编辑的分类有父级，加载父级名称
    if (isEditing && _parentId != null) {
      _loadParentName();
    }
  }

  Future<void> _loadParentName() async {
    final categoryDao = ref.read(categoryDaoProvider);
    final parent = await categoryDao.getCategoryById(_parentId!);
    if (parent != null && mounted) {
      setState(() => _parentName = parent.name);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _orderController.dispose();
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

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final categoryDao = ref.read(categoryDaoProvider);

      if (isEditing) {
        // 更新分类
        final updated = widget.editCategory!.copyWith(
          name: _nameController.text.trim(),
          type: _type,
          icon: _icon ?? '',
          order: int.tryParse(_orderController.text) ?? 0,
          parentId: drift.Value(_parentId),
        );
        await categoryDao.updateCategory(updated);
      } else {
        // 创建新分类
        await categoryDao.insertCategory(
          CategoryCompanion(
            name: drift.Value(_nameController.text.trim()),
            type: drift.Value(_type),
            icon: drift.Value(_icon ?? ''),
            order: drift.Value(int.tryParse(_orderController.text) ?? 0),
            parentId: drift.Value(_parentId),
          ),
        );
      }

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
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmDeleteTitle),
        content: Text(l10n.confirmDeleteCategory),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isLoading = true);

    try {
      final categoryDao = ref.read(categoryDaoProvider);
      await categoryDao.deleteCategory(widget.editCategory!.categoryId);

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typeInfo = getCategoryTypeInfo(_type);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? '编辑分类' : '新增分类'),
        centerTitle: true,
        actions: [
          if (isEditing)
            IconButton(
              onPressed: _isLoading ? null : _delete,
              icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
              tooltip: '删除',
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
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: _icon != null && _icon!.isNotEmpty
                      ? ClipOval(
                          child: AppIconWidget.fromString(_icon!, size: 80),
                        )
                      : Icon(
                          typeInfo.icon,
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
                child: Text(AppLocalizations.of(context)!.selectIcon),
              ),
            ),
            const SizedBox(height: 24),

            // 分类名称
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.categoryName,
                hintText: AppLocalizations.of(context)!.categoryNameHint,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return AppLocalizations.of(context)!.categoryNameHint;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 分类类型（新建时可选，编辑时只读）
            if (!isEditing && _parentId == null) ...[
              DropdownButtonFormField<CategoryType>(
                initialValue: _type,
                decoration: const InputDecoration(
                  labelText: '分类类型',
                  border: OutlineInputBorder(),
                ),
                items: categoryTypeInfos.map((info) {
                  return DropdownMenuItem(
                    value: info.type,
                    child: Row(
                      children: [
                        Icon(info.icon, size: 20),
                        const SizedBox(width: 12),
                        Text(info.name),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _type = value);
                  }
                },
              ),
              const SizedBox(height: 16),
            ],

            // 父级分类显示
            if (_parentId != null) ...[
              InputDecorator(
                decoration: const InputDecoration(
                  labelText: '父级分类',
                  border: OutlineInputBorder(),
                ),
                child: Row(
                  children: [
                    Icon(typeInfo.icon, size: 20),
                    const SizedBox(width: 12),
                    Text(_parentName ?? '加载中...'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            // 排序值
            TextFormField(
              controller: _orderController,
              decoration: const InputDecoration(
                labelText: '排序值',
                hintText: '数值越小越靠前',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
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
              label: Text(isEditing ? '保存修改' : '创建分类'),
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
