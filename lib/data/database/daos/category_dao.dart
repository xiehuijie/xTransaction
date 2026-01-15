import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'category_dao.g.dart';

/// 分类 DAO
@DriftAccessor(tables: [Category])
class CategoryDao extends DatabaseAccessor<LedgerDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  // ==================== Category CRUD ====================

  /// 获取所有分类
  Future<List<CategoryEntity>> getAllCategories() => select(category).get();

  /// 根据ID获取分类
  Future<CategoryEntity?> getCategoryById(int id) => (select(
    category,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 根据ID列表获取分类
  Future<List<CategoryEntity>> getCategoriesByIds(List<int> ids) =>
      (select(category)..where((t) => t.id.isIn(ids))).get();

  /// 根据类型获取分类
  Future<List<CategoryEntity>> getCategoriesByType(CategoryType type) =>
      (select(category)
            ..where((t) => t.type.equalsValue(type))
            ..orderBy([(t) => OrderingTerm.asc(t.weight)]))
          .get();

  /// 获取顶级分类（无父级）
  Future<List<CategoryEntity>> getRootCategories() =>
      (select(category)
            ..where((t) => t.parentId.isNull())
            ..orderBy([(t) => OrderingTerm.asc(t.weight)]))
          .get();

  /// 获取顶级分类（按类型）
  Future<List<CategoryEntity>> getRootCategoriesByType(CategoryType type) =>
      (select(category)
            ..where((t) => t.parentId.isNull() & t.type.equalsValue(type))
            ..orderBy([(t) => OrderingTerm.asc(t.weight)]))
          .get();

  /// 获取子分类
  Future<List<CategoryEntity>> getChildCategories(int parentId) =>
      (select(category)
            ..where((t) => t.parentId.equals(parentId))
            ..orderBy([(t) => OrderingTerm.asc(t.weight)]))
          .get();

  /// 获取所有子孙分类（递归）
  Future<List<CategoryEntity>> getAllDescendants(int parentId) async {
    final children = await getChildCategories(parentId);
    final descendants = <CategoryEntity>[];
    for (final child in children) {
      descendants.add(child);
      descendants.addAll(await getAllDescendants(child.id));
    }
    return descendants;
  }

  /// 添加分类
  Future<int> insertCategory(CategoryCompanion entry) =>
      into(category).insert(entry);

  /// 更新分类
  Future<bool> updateCategory(CategoryEntity entry) =>
      update(category).replace(entry);

  /// 删除分类
  Future<int> deleteCategory(int id) =>
      (delete(category)..where((t) => t.id.equals(id))).go();

  /// 更新分类排序
  Future<void> updateCategoryWeight(int id, int newWeight) =>
      (update(category)..where((t) => t.id.equals(id))).write(
        CategoryCompanion(weight: Value(newWeight)),
      );

  /// 批量更新分类排序权重
  Future<void> updateCategoryWeights(Map<int, int> idWeightMap) async {
    await batch((batch) {
      for (final entry in idWeightMap.entries) {
        batch.update(
          category,
          CategoryCompanion(weight: Value(entry.value)),
          where: (t) => t.id.equals(entry.key),
        );
      }
    });
  }

  /// 监听所有分类变化
  Stream<List<CategoryEntity>> watchAllCategories() => select(category).watch();

  /// 监听特定类型分类变化
  Stream<List<CategoryEntity>> watchCategoriesByType(CategoryType type) =>
      (select(category)
            ..where((t) => t.type.equalsValue(type))
            ..orderBy([(t) => OrderingTerm.asc(t.weight)]))
          .watch();

  /// 监听顶级分类变化
  Stream<List<CategoryEntity>> watchRootCategories() =>
      (select(category)
            ..where((t) => t.parentId.isNull())
            ..orderBy([(t) => OrderingTerm.asc(t.weight)]))
          .watch();

  /// 监听子分类变化
  Stream<List<CategoryEntity>> watchChildCategories(int parentId) =>
      (select(category)
            ..where((t) => t.parentId.equals(parentId))
            ..orderBy([(t) => OrderingTerm.asc(t.weight)]))
          .watch();
}
