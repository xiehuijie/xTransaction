/// 账本分类关联管理页面
///
/// 用于管理账本与分类的关联关系
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data.dart';
import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../common/app_icon_widget.dart';

/// 账本关联分类列表 Provider
final ledgerCategoriesProvider = FutureProvider.family<List<CategoryEntity>, int>(
  (ref, ledgerId) async {
    final ledgerDao = ref.watch(ledgerDaoProvider);
    final categoryDao = ref.watch(categoryDaoProvider);

    final categoryIds = await ledgerDao.getCategoryIdsByLedgerId(ledgerId);
    if (categoryIds.isEmpty) return [];

    final categories = await categoryDao.getCategoriesByIds(categoryIds);
    return categories;
  },
);

/// 未关联到账本的分类列表 Provider
final unlinkedCategoriesProvider = FutureProvider.family<List<CategoryEntity>, int>(
  (ref, ledgerId) async {
    final ledgerDao = ref.watch(ledgerDaoProvider);
    final categoryDao = ref.watch(categoryDaoProvider);

    final linkedCategoryIds = await ledgerDao.getCategoryIdsByLedgerId(ledgerId);
    final allCategories = await categoryDao.getAllCategories();

    return allCategories
        .where((c) => !linkedCategoryIds.contains(c.categoryId))
        .toList();
  },
);

/// 账本分类关联管理页面
class LedgerCategoriesPage extends ConsumerStatefulWidget {
  final LedgerEntity ledger;

  const LedgerCategoriesPage({super.key, required this.ledger});

  @override
  ConsumerState<LedgerCategoriesPage> createState() => _LedgerCategoriesPageState();
}

class _LedgerCategoriesPageState extends ConsumerState<LedgerCategoriesPage>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _addCategory() async {
    HapticService.lightImpact();

    final unlinkedAsync = ref.read(unlinkedCategoriesProvider(widget.ledger.ledgerId));
    final unlinkedCategories = unlinkedAsync.valueOrNull ?? [];

    if (unlinkedCategories.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('没有可添加的分类')),
        );
      }
      return;
    }

    final selectedCategory = await showModalBottomSheet<CategoryEntity>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _CategoryPickerSheet(
        categories: unlinkedCategories,
        title: '选择要关联的分类',
      ),
    );

    if (selectedCategory == null) return;

    await _linkCategory(selectedCategory);
  }

  Future<void> _linkCategory(CategoryEntity category) async {
    setState(() => _isLoading = true);

    try {
      final ledgerDao = ref.read(ledgerDaoProvider);
      await ledgerDao.linkCategoryToLedger(
        category.categoryId,
        widget.ledger.ledgerId,
      );

      // 刷新列表
      ref.invalidate(ledgerCategoriesProvider(widget.ledger.ledgerId));
      ref.invalidate(unlinkedCategoriesProvider(widget.ledger.ledgerId));

      if (mounted) {
        HapticService.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已关联分类"${category.name}"')),
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

  Future<void> _removeCategory(CategoryEntity category) async {
    HapticService.lightImpact();

    // 检查分类是否有依赖
    final hasDependency = await _checkCategoryDependency(category);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('移除关联'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('确定要解除分类"${category.name}"与此账本的关联吗？'),
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
                        '此分类在账本中已有交易记录，解除关联将清除相关交易的分类信息',
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

    await _unlinkCategory(category, forceDelete: hasDependency);
  }

  Future<bool> _checkCategoryDependency(CategoryEntity category) async {
    final transactionDao = ref.read(transactionDaoProvider);
    final count = await transactionDao.getTransactionCountByCategoryInLedger(
      category.categoryId,
      widget.ledger.ledgerId,
    );
    return count > 0;
  }

  Future<void> _unlinkCategory(CategoryEntity category, {bool forceDelete = false}) async {
    setState(() => _isLoading = true);

    try {
      final ledgerDao = ref.read(ledgerDaoProvider);

      if (forceDelete) {
        // 清除相关交易的分类信息
        final transactionDao = ref.read(transactionDaoProvider);
        await transactionDao.clearCategoryFromTransactionsInLedger(
          category.categoryId,
          widget.ledger.ledgerId,
        );
      }

      await ledgerDao.unlinkCategoryFromLedger(
        category.categoryId,
        widget.ledger.ledgerId,
      );

      // 刷新列表
      ref.invalidate(ledgerCategoriesProvider(widget.ledger.ledgerId));
      ref.invalidate(unlinkedCategoriesProvider(widget.ledger.ledgerId));

      if (mounted) {
        HapticService.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已解除分类"${category.name}"的关联')),
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
    final categoriesAsync = ref.watch(ledgerCategoriesProvider(widget.ledger.ledgerId));

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.ledger.name} - 关联分类'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '支出分类'),
            Tab(text: '收入分类'),
          ],
        ),
      ),
      body: categoriesAsync.when(
        data: (categories) {
          final expenseCategories = categories
              .where((c) => c.type == CategoryType.expense)
              .toList();
          final incomeCategories = categories
              .where((c) => c.type == CategoryType.income)
              .toList();

          return TabBarView(
            controller: _tabController,
            children: [
              _buildCategoryList(expenseCategories, CategoryType.expense),
              _buildCategoryList(incomeCategories, CategoryType.income),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isLoading ? null : _addCategory,
        icon: const Icon(Icons.add),
        label: const Text('添加分类'),
      ),
    );
  }

  Widget _buildCategoryList(List<CategoryEntity> categories, CategoryType type) {
    final theme = Theme.of(context);

    if (categories.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.category_outlined,
              size: 72,
              color: theme.colorScheme.onSurfaceVariant.withAlpha(128),
            ),
            const SizedBox(height: 16),
            Text(
              type == CategoryType.expense ? '暂无支出分类' : '暂无收入分类',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
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
        return _CategoryListItem(
          category: category,
          onRemove: () => _removeCategory(category),
        );
      },
    );
  }
}

/// 分类列表项
class _CategoryListItem extends StatelessWidget {
  final CategoryEntity category;
  final VoidCallback onRemove;

  const _CategoryListItem({
    required this.category,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: category.icon.isNotEmpty
            ? AppIconWidget.fromString(category.icon, size: 40)
            : CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  category.type == CategoryType.expense
                      ? Icons.remove
                      : Icons.add,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
        title: Text(
          category.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: category.parentId != null
            ? const Text('子分类')
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

/// 分类选择底部弹窗
class _CategoryPickerSheet extends StatefulWidget {
  final List<CategoryEntity> categories;
  final String title;

  const _CategoryPickerSheet({
    required this.categories,
    required this.title,
  });

  @override
  State<_CategoryPickerSheet> createState() => _CategoryPickerSheetState();
}

class _CategoryPickerSheetState extends State<_CategoryPickerSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final expenseCategories = widget.categories
        .where((c) => c.type == CategoryType.expense)
        .toList();
    final incomeCategories = widget.categories
        .where((c) => c.type == CategoryType.income)
        .toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
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
                    widget.title,
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
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: '支出 (${expenseCategories.length})'),
              Tab(text: '收入 (${incomeCategories.length})'),
            ],
          ),
          const Divider(height: 1),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildCategoryPickerList(expenseCategories),
                _buildCategoryPickerList(incomeCategories),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryPickerList(List<CategoryEntity> categories) {
    final theme = Theme.of(context);

    if (categories.isEmpty) {
      return const Center(child: Text('没有可添加的分类'));
    }

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return ListTile(
          leading: category.icon.isNotEmpty
              ? AppIconWidget.fromString(category.icon, size: 40)
              : CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(
                    category.type == CategoryType.expense
                        ? Icons.remove
                        : Icons.add,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
          title: Text(category.name),
          onTap: () {
            HapticService.selectionClick();
            Navigator.pop(context, category);
          },
        );
      },
    );
  }
}
