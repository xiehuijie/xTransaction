/// 分类预配置页面
///
/// 初始化流程的第三步，配置交易分类
/// 支持4种分类类型：支出、收入、折扣/优惠、税收/手续费

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/tables.dart';
import '../common/icon_picker_page.dart';
import '../common/app_icon_widget.dart';
import '../../data/constants/icon_data.dart';
import 'onboarding_state.dart';

/// 分类预配置页面
class CategoryConfigPage extends ConsumerStatefulWidget {
  const CategoryConfigPage({super.key});

  @override
  ConsumerState<CategoryConfigPage> createState() => _CategoryConfigPageState();
}

class _CategoryConfigPageState extends ConsumerState<CategoryConfigPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分类配置'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: const [
            Tab(text: '支出'),
            Tab(text: '收入'),
            Tab(text: '折扣/优惠'),
            Tab(text: '税收/手续费'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _CategoryListTab(type: CategoryType.expense),
          _CategoryListTab(type: CategoryType.income),
          _CategoryListTab(type: CategoryType.discount),
          _CategoryListTab(type: CategoryType.cost),
        ],
      ),
    );
  }
}

/// 分类列表标签页
class _CategoryListTab extends ConsumerStatefulWidget {
  final CategoryType type;

  const _CategoryListTab({required this.type});

  @override
  ConsumerState<_CategoryListTab> createState() => _CategoryListTabState();
}

class _CategoryListTabState extends ConsumerState<_CategoryListTab> {
  // 展开状态管理
  final Set<int> _expandedIndices = {};

  String get _typeName {
    switch (widget.type) {
      case CategoryType.expense:
        return '支出';
      case CategoryType.income:
        return '收入';
      case CategoryType.discount:
        return '折扣/优惠';
      case CategoryType.cost:
        return '税收/手续费';
    }
  }

  String get _typeDescription {
    switch (widget.type) {
      case CategoryType.expense:
        return '用于记录日常支出，如餐饮、交通等';
      case CategoryType.income:
        return '用于记录收入来源，如工资、投资收益等';
      case CategoryType.discount:
        return '用于支出交易中的优惠减免部分';
      case CategoryType.cost:
        return '用于收入交易中的税费扣除部分';
    }
  }

  List<PreConfigCategory> _getCategories(OnboardingState state) {
    switch (widget.type) {
      case CategoryType.expense:
        return state.expenseCategories;
      case CategoryType.income:
        return state.incomeCategories;
      case CategoryType.discount:
        return state.discountCategories;
      case CategoryType.cost:
        return state.costCategories;
    }
  }

  void _addCategory(PreConfigCategory category) {
    final notifier = ref.read(onboardingProvider.notifier);
    switch (widget.type) {
      case CategoryType.expense:
        notifier.addExpenseCategory(category);
        break;
      case CategoryType.income:
        notifier.addIncomeCategory(category);
        break;
      case CategoryType.discount:
        notifier.addDiscountCategory(category);
        break;
      case CategoryType.cost:
        notifier.addCostCategory(category);
        break;
    }
  }

  void _updateCategory(int index, PreConfigCategory category) {
    final notifier = ref.read(onboardingProvider.notifier);
    switch (widget.type) {
      case CategoryType.expense:
        notifier.updateExpenseCategory(index, category);
        break;
      case CategoryType.income:
        notifier.updateIncomeCategory(index, category);
        break;
      case CategoryType.discount:
        notifier.updateDiscountCategory(index, category);
        break;
      case CategoryType.cost:
        notifier.updateCostCategory(index, category);
        break;
    }
  }

  void _removeCategory(int index) {
    final notifier = ref.read(onboardingProvider.notifier);
    switch (widget.type) {
      case CategoryType.expense:
        notifier.removeExpenseCategory(index);
        break;
      case CategoryType.income:
        notifier.removeIncomeCategory(index);
        break;
      case CategoryType.discount:
        notifier.removeDiscountCategory(index);
        break;
      case CategoryType.cost:
        notifier.removeCostCategory(index);
        break;
    }
  }

  void _reorderCategory(int oldIndex, int newIndex) {
    final notifier = ref.read(onboardingProvider.notifier);
    switch (widget.type) {
      case CategoryType.expense:
        notifier.reorderExpenseCategory(oldIndex, newIndex);
        break;
      case CategoryType.income:
        notifier.reorderIncomeCategory(oldIndex, newIndex);
        break;
      case CategoryType.discount:
        notifier.reorderDiscountCategory(oldIndex, newIndex);
        break;
      case CategoryType.cost:
        notifier.reorderCostCategory(oldIndex, newIndex);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingProvider);
    final categories = _getCategories(state);

    return Column(
      children: [
        // 说明
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline,
                size: 18,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _typeDescription,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '支持多层级结构（最多5层），长按可拖动排序',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const Divider(height: 1),

        // 分类列表
        Expanded(
          child: categories.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getTypeIcon(),
                        size: 64,
                        color: theme.colorScheme.outline,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '暂无$_typeName分类',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                )
              : ReorderableListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: categories.length,
                  onReorder: (oldIndex, newIndex) {
                    if (newIndex > oldIndex) newIndex--;
                    _reorderCategory(oldIndex, newIndex);
                  },
                  itemBuilder: (context, index) {
                    return _CategoryItemTile(
                      key: ValueKey('cat_${widget.type.name}_$index'),
                      category: categories[index],
                      index: index,
                      depth: 0,
                      isExpanded: _expandedIndices.contains(index),
                      onToggleExpand: () {
                        setState(() {
                          if (_expandedIndices.contains(index)) {
                            _expandedIndices.remove(index);
                          } else {
                            _expandedIndices.add(index);
                          }
                        });
                      },
                      onEdit: () =>
                          _showEditDialog(context, categories[index], index),
                      onDelete: () =>
                          _confirmDelete(context, categories[index], index),
                      onAddChild: () => _showAddChildDialog(
                        context,
                        categories[index],
                        index,
                      ),
                      onUpdateCategory: (category) =>
                          _updateCategory(index, category),
                    );
                  },
                ),
        ),

        // 添加按钮
        Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: () => _showAddDialog(context),
            icon: const Icon(Icons.add),
            label: Text('添加$_typeName分类'),
          ),
        ),
      ],
    );
  }

  IconData _getTypeIcon() {
    switch (widget.type) {
      case CategoryType.expense:
        return Icons.shopping_cart_outlined;
      case CategoryType.income:
        return Icons.attach_money;
      case CategoryType.discount:
        return Icons.local_offer_outlined;
      case CategoryType.cost:
        return Icons.receipt_long_outlined;
    }
  }

  void _showAddDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => _CategoryEditor(
        type: widget.type,
        onSave: (category) {
          _addCategory(category);
        },
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    PreConfigCategory category,
    int index,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => _CategoryEditor(
        type: widget.type,
        category: category,
        onSave: (newCategory) {
          _updateCategory(
            index,
            newCategory.copyWith(children: category.children),
          );
        },
      ),
    );
  }

  void _showAddChildDialog(
    BuildContext context,
    PreConfigCategory parent,
    int parentIndex,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => _CategoryEditor(
        type: widget.type,
        onSave: (newCategory) {
          final updatedParent = parent.copyWith(
            children: [...parent.children, newCategory],
          );
          _updateCategory(parentIndex, updatedParent);
          // 自动展开父分类
          setState(() {
            _expandedIndices.add(parentIndex);
          });
        },
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    PreConfigCategory category,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除分类'),
        content: Text(
          category.children.isNotEmpty
              ? '此分类包含 ${category.children.length} 个子分类，删除后将一并删除。确定要删除吗？'
              : '确定要删除"${category.name}"分类吗？',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              _removeCategory(index);
              Navigator.of(context).pop();
            },
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}

/// 分类项组件
class _CategoryItemTile extends StatelessWidget {
  final PreConfigCategory category;
  final int index;
  final int depth;
  final bool isExpanded;
  final VoidCallback onToggleExpand;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onAddChild;
  final void Function(PreConfigCategory) onUpdateCategory;

  const _CategoryItemTile({
    super.key,
    required this.category,
    required this.index,
    required this.depth,
    required this.isExpanded,
    required this.onToggleExpand,
    required this.onEdit,
    required this.onDelete,
    required this.onAddChild,
    required this.onUpdateCategory,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasChildren = category.children.isNotEmpty;

    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 16 + depth * 24.0, right: 8),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 展开/收起按钮
                if (hasChildren)
                  IconButton(
                    icon: Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      size: 20,
                    ),
                    onPressed: onToggleExpand,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                    padding: EdgeInsets.zero,
                  )
                else
                  const SizedBox(width: 32),
                // 图标
                category.icon != null
                    ? AppIconWidget.fromString(
                        category.icon!,
                        size: 24,
                        showBackground: true,
                      )
                    : CircleAvatar(
                        backgroundColor: theme.colorScheme.primaryContainer,
                        radius: 16,
                        child: Icon(
                          Icons.category,
                          size: 16,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
              ],
            ),
            title: Text(category.name),
            subtitle: hasChildren
                ? Text('${category.children.length} 个子分类')
                : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 添加子分类按钮（深度小于5时显示）
                if (depth < 4)
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline, size: 20),
                    onPressed: onAddChild,
                    tooltip: '添加子分类',
                  ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      onEdit();
                    } else if (value == 'delete') {
                      onDelete();
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
              ],
            ),
          ),
        ),
        // 子分类列表
        if (hasChildren && isExpanded)
          ...category.children.asMap().entries.map((entry) {
            final childIndex = entry.key;
            final child = entry.value;
            return _ChildCategoryItem(
              category: child,
              parentCategory: category,
              childIndex: childIndex,
              depth: depth + 1,
              onUpdateParent: onUpdateCategory,
            );
          }),
      ],
    );
  }
}

/// 子分类项组件（递归）
class _ChildCategoryItem extends StatefulWidget {
  final PreConfigCategory category;
  final PreConfigCategory parentCategory;
  final int childIndex;
  final int depth;
  final void Function(PreConfigCategory) onUpdateParent;

  const _ChildCategoryItem({
    required this.category,
    required this.parentCategory,
    required this.childIndex,
    required this.depth,
    required this.onUpdateParent,
  });

  @override
  State<_ChildCategoryItem> createState() => _ChildCategoryItemState();
}

class _ChildCategoryItemState extends State<_ChildCategoryItem> {
  bool _isExpanded = false;

  void _updateChild(PreConfigCategory newChild) {
    final newChildren = List<PreConfigCategory>.from(
      widget.parentCategory.children,
    );
    newChildren[widget.childIndex] = newChild;
    widget.onUpdateParent(
      widget.parentCategory.copyWith(children: newChildren),
    );
  }

  void _removeChild() {
    final newChildren = List<PreConfigCategory>.from(
      widget.parentCategory.children,
    );
    newChildren.removeAt(widget.childIndex);
    widget.onUpdateParent(
      widget.parentCategory.copyWith(children: newChildren),
    );
  }

  void _addGrandChild(PreConfigCategory grandChild) {
    final newChild = widget.category.copyWith(
      children: [...widget.category.children, grandChild],
    );
    _updateChild(newChild);
    setState(() => _isExpanded = true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasChildren = widget.category.children.isNotEmpty;

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(
            left: 16 + widget.depth * 24.0,
            right: 8,
          ),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasChildren)
                IconButton(
                  icon: Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 20,
                  ),
                  onPressed: () => setState(() => _isExpanded = !_isExpanded),
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  padding: EdgeInsets.zero,
                )
              else
                const SizedBox(width: 32),
              widget.category.icon != null
                  ? AppIconWidget.fromString(
                      widget.category.icon!,
                      size: 24,
                      showBackground: true,
                    )
                  : CircleAvatar(
                      backgroundColor: theme.colorScheme.secondaryContainer,
                      radius: 16,
                      child: Icon(
                        Icons.category,
                        size: 16,
                        color: theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
            ],
          ),
          title: Text(widget.category.name),
          subtitle: hasChildren
              ? Text('${widget.category.children.length} 个子分类')
              : null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.depth < 4)
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, size: 20),
                  onPressed: () => _showAddChildDialog(context),
                  tooltip: '添加子分类',
                ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    _showEditDialog(context);
                  } else if (value == 'delete') {
                    _confirmDelete(context);
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
            ],
          ),
        ),
        // 递归渲染子分类
        if (hasChildren && _isExpanded)
          ...widget.category.children.asMap().entries.map((entry) {
            final childIndex = entry.key;
            final child = entry.value;
            return _ChildCategoryItem(
              category: child,
              parentCategory: widget.category,
              childIndex: childIndex,
              depth: widget.depth + 1,
              onUpdateParent: _updateChild,
            );
          }),
      ],
    );
  }

  void _showEditDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => _CategoryEditor(
        type: widget.category.type,
        category: widget.category,
        onSave: (newCategory) {
          _updateChild(
            newCategory.copyWith(children: widget.category.children),
          );
        },
      ),
    );
  }

  void _showAddChildDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) =>
          _CategoryEditor(type: widget.category.type, onSave: _addGrandChild),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除分类'),
        content: Text(
          widget.category.children.isNotEmpty
              ? '此分类包含 ${widget.category.children.length} 个子分类，删除后将一并删除。确定要删除吗？'
              : '确定要删除"${widget.category.name}"分类吗？',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              _removeChild();
              Navigator.of(context).pop();
            },
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}

/// 分类编辑器
class _CategoryEditor extends StatefulWidget {
  final CategoryType type;
  final PreConfigCategory? category;
  final void Function(PreConfigCategory) onSave;

  const _CategoryEditor({
    required this.type,
    this.category,
    required this.onSave,
  });

  @override
  State<_CategoryEditor> createState() => _CategoryEditorState();
}

class _CategoryEditorState extends State<_CategoryEditor> {
  late TextEditingController _nameController;
  String? _icon;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category?.name);
    _icon = widget.category?.icon;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _isValid => _nameController.text.isNotEmpty;

  void _save() {
    if (!_isValid) return;

    final category = PreConfigCategory(
      name: _nameController.text,
      type: widget.type,
      icon: _icon,
    );

    widget.onSave(category);
    Navigator.of(context).pop();
  }

  Future<void> _pickIcon() async {
    final result = await Navigator.of(context).push<AppIcon>(
      MaterialPageRoute(
        builder: (_) => IconPickerPage(
          initialIcon: _icon != null ? AppIcon.fromString(_icon!) : null,
          title: '选择分类图标',
        ),
      ),
    );
    if (result != null) {
      setState(() => _icon = result.toStorageString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.category == null ? '添加分类' : '编辑分类',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 24),

          // 图标选择
          Row(
            children: [
              AppIconButton(
                icon: _icon != null ? AppIcon.fromString(_icon!) : null,
                size: 64,
                onTap: _pickIcon,
                hintText: '图标',
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: '分类名称',
                    hintText: '如: 餐饮、工资',
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                  onChanged: (_) => setState(() {}),
                  onSubmitted: (_) => _isValid ? _save() : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 保存按钮
          FilledButton(
            onPressed: _isValid ? _save : null,
            child: Text(widget.category == null ? '添加' : '保存'),
          ),
        ],
      ),
    );
  }
}
