import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Category, RelationCategoryLedger])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  // ==================== Category CRUD ====================

  /// 获取所有分类
  Future<List<CategoryEntity>> getAllCategories() => select(category).get();

  /// 根据ID获取分类
  Future<CategoryEntity?> getCategoryById(int id) => (select(
    category,
  )..where((t) => t.categoryId.equals(id))).getSingleOrNull();

  /// 根据类型获取分类
  Future<List<CategoryEntity>> getCategoriesByType(CategoryType type) =>
      (select(category)
            ..where((t) => t.type.equalsValue(type))
            ..orderBy([(t) => OrderingTerm.asc(t.order)]))
          .get();

  /// 获取顶级分类（无父级）
  Future<List<CategoryEntity>> getRootCategories() =>
      (select(category)
            ..where((t) => t.parentId.isNull())
            ..orderBy([(t) => OrderingTerm.asc(t.order)]))
          .get();

  /// 获取顶级分类（按类型）
  Future<List<CategoryEntity>> getRootCategoriesByType(CategoryType type) =>
      (select(category)
            ..where((t) => t.parentId.isNull() & t.type.equalsValue(type))
            ..orderBy([(t) => OrderingTerm.asc(t.order)]))
          .get();

  /// 获取子分类
  Future<List<CategoryEntity>> getChildCategories(int parentId) =>
      (select(category)
            ..where((t) => t.parentId.equals(parentId))
            ..orderBy([(t) => OrderingTerm.asc(t.order)]))
          .get();

  /// 添加分类
  Future<int> insertCategory(CategoryCompanion entry) =>
      into(category).insert(entry);

  /// 更新分类
  Future<bool> updateCategory(CategoryEntity entry) =>
      update(category).replace(entry);

  /// 删除分类
  Future<int> deleteCategory(int id) =>
      (delete(category)..where((t) => t.categoryId.equals(id))).go();

  /// 更新分类排序
  Future<void> updateCategoryOrder(int id, int newOrder) =>
      (update(category)..where((t) => t.categoryId.equals(id))).write(
        CategoryCompanion(order: Value(newOrder)),
      );

  /// 监听所有分类变化
  Stream<List<CategoryEntity>> watchAllCategories() => select(category).watch();

  /// 监听特定类型分类变化
  Stream<List<CategoryEntity>> watchCategoriesByType(CategoryType type) =>
      (select(category)
            ..where((t) => t.type.equalsValue(type))
            ..orderBy([(t) => OrderingTerm.asc(t.order)]))
          .watch();

  // ==================== Category-Ledger Relation ====================

  /// 获取分类关联的账本
  Future<List<LedgerCategoryRelationEntity>> getCategoryLedgers(
    int categoryId,
  ) => (select(
    relationCategoryLedger,
  )..where((t) => t.categoryId.equals(categoryId))).get();

  /// 获取账本下的分类ID列表
  Future<List<int>> getCategoryIdsByLedgerId(int ledgerId) async {
    final relations = await (select(
      relationCategoryLedger,
    )..where((t) => t.ledgerId.equals(ledgerId))).get();
    return relations.map((r) => r.categoryId).toList();
  }

  /// 获取账本下的分类（按类型）
  Future<List<CategoryEntity>> getCategoriesByLedgerAndType(
    int ledgerId,
    CategoryType type,
  ) async {
    final categoryIds = await getCategoryIdsByLedgerId(ledgerId);
    if (categoryIds.isEmpty) return [];

    return (select(category)
          ..where(
            (t) => t.categoryId.isIn(categoryIds) & t.type.equalsValue(type),
          )
          ..orderBy([(t) => OrderingTerm.asc(t.order)]))
        .get();
  }
}
