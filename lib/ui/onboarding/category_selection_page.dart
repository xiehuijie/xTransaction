import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/app_icon_widget.dart';
import 'onboarding_state.dart';

/// 分类选择页面
/// 用于在账本配置时选择关联的分类，支持层级显示
class CategorySelectionPage extends ConsumerStatefulWidget {
  final Set<String> initialSelectedIds;
  final String title;

  const CategorySelectionPage({
    super.key,
    required this.initialSelectedIds,
    this.title = '选择分类',
  });

  @override
  ConsumerState<CategorySelectionPage> createState() =>
      _CategorySelectionPageState();
}

class _CategorySelectionPageState extends ConsumerState<CategorySelectionPage>
    with SingleTickerProviderStateMixin {
  late Set<String> _selectedIds;
  bool _selectAll = false;
  late TabController _tabController;

  // 展开状态
  final Set<String> _expandedCategories = {};

  @override
  void initState() {
    super.initState();
    _selectedIds = Set.from(widget.initialSelectedIds);
    _selectAll = _selectedIds.isEmpty;
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleSelectAll() {
    setState(() {
      _selectAll = !_selectAll;
      if (_selectAll) {
        _selectedIds.clear();
      }
    });
  }

  void _toggleCategory(String id) {
    setState(() {
      if (_selectAll) {
        // 从全选切换到选择模式
        _selectedIds = _buildAllCategoryIds();
        _selectedIds.remove(id);
        _selectAll = false;
      } else if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        if (_selectedIds.isEmpty) {
          _selectAll = true;
        }
      } else {
        _selectedIds.add(id);
      }
    });
  }

  Set<String> _buildAllCategoryIds() {
    final ids = <String>{};
    final state = ref.read(onboardingProvider);

    void addIds(List<PreConfigCategory> categories, String prefix, int depth) {
      for (var i = 0; i < categories.length; i++) {
        ids.add('${prefix}_${depth}_$i');
        if (categories[i].children.isNotEmpty) {
          addIds(categories[i].children, prefix, depth + 1);
        }
      }
    }

    addIds(state.expenseCategories, 'expense', 0);
    addIds(state.incomeCategories, 'income', 0);
    addIds(state.discountCategories, 'discount', 0);
    addIds(state.costCategories, 'cost', 0);

    return ids;
  }

  void _toggleExpand(String id) {
    setState(() {
      if (_expandedCategories.contains(id)) {
        _expandedCategories.remove(id);
      } else {
        _expandedCategories.add(id);
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '支出'),
            Tab(text: '收入'),
            Tab(text: '折扣'),
            Tab(text: '费用'),
          ],
        ),
      ),
      body: Column(
        children: [
          // 全选选项
          Material(
            color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
            child: CheckboxListTile(
              value: _selectAll,
              onChanged: (_) => _toggleSelectAll(),
              title: const Text('全部分类'),
              subtitle: Text(
                '自动包含所有分类（包括后续新增）',
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
          // 分类列表
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildCategoryList(state.expenseCategories, 'expense'),
                _buildCategoryList(state.incomeCategories, 'income'),
                _buildCategoryList(state.discountCategories, 'discount'),
                _buildCategoryList(state.costCategories, 'cost'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList(List<PreConfigCategory> categories, String prefix) {
    if (categories.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.category_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              '暂无分类',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildCategoryItem(
          categories[index],
          '${prefix}_0_$index',
          prefix,
          0,
          index,
        );
      },
    );
  }

  Widget _buildCategoryItem(
    PreConfigCategory category,
    String id,
    String prefix,
    int depth,
    int index,
  ) {
    final theme = Theme.of(context);
    final isSelected = _selectAll || _selectedIds.contains(id);
    final hasChildren = category.children.isNotEmpty;
    final isExpanded = _expandedCategories.contains(id);

    return Column(
      children: [
        Material(
          color: depth > 0
              ? theme.colorScheme.surfaceContainerHighest.withOpacity(
                  0.1 * depth,
                )
              : null,
          child: InkWell(
            onTap: _selectAll ? null : () => _toggleCategory(id),
            child: Padding(
              padding: EdgeInsets.only(left: 16.0 + (depth * 24.0), right: 8.0),
              child: Row(
                children: [
                  // 展开/折叠按钮
                  if (hasChildren)
                    IconButton(
                      icon: Icon(
                        isExpanded ? Icons.expand_more : Icons.chevron_right,
                        size: 20,
                      ),
                      onPressed: () => _toggleExpand(id),
                      constraints: const BoxConstraints(
                        minWidth: 32,
                        minHeight: 32,
                      ),
                      padding: EdgeInsets.zero,
                    )
                  else
                    const SizedBox(width: 32),

                  // 图标
                  if (category.icon != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: AppIconWidget.fromString(category.icon!, size: 32),
                    )
                  else
                    Container(
                      width: 32,
                      height: 32,
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          category.name.isNotEmpty ? category.name[0] : '?',
                          style: TextStyle(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(width: 12),

                  // 名称
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(category.name),
                        if (hasChildren)
                          Text(
                            '${category.children.length} 个子分类',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.outline,
                            ),
                          ),
                      ],
                    ),
                  ),

                  // 复选框
                  Checkbox(
                    value: isSelected,
                    onChanged: _selectAll ? null : (_) => _toggleCategory(id),
                  ),
                ],
              ),
            ),
          ),
        ),

        // 子分类
        if (hasChildren && isExpanded)
          ...category.children.asMap().entries.map((entry) {
            final childIndex = entry.key;
            final childCategory = entry.value;
            final childId = '${prefix}_${depth + 1}_$childIndex';

            return _buildCategoryItem(
              childCategory,
              childId,
              prefix,
              depth + 1,
              childIndex,
            );
          }),

        // 分隔线（仅顶级分类）
        if (depth == 0) const Divider(height: 1),
      ],
    );
  }
}
