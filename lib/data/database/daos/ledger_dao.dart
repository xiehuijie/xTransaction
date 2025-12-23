import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'ledger_dao.g.dart';

@DriftAccessor(tables: [
  Ledger,
  Project,
  RelationAccountLedger,
  RelationCategoryLedger,
])
class LedgerDao extends DatabaseAccessor<AppDatabase> with _$LedgerDaoMixin {
  LedgerDao(super.db);

  // ==================== Ledger CRUD ====================

  /// 获取所有账本
  Future<List<LedgerEntity>> getAllLedgers() => select(ledger).get();

  /// 根据ID获取账本
  Future<LedgerEntity?> getLedgerById(int id) =>
      (select(ledger)..where((t) => t.ledgerId.equals(id))).getSingleOrNull();

  /// 添加账本
  Future<int> insertLedger(LedgerCompanion entry) =>
      into(ledger).insert(entry);

  /// 更新账本
  Future<bool> updateLedger(LedgerEntity entry) =>
      update(ledger).replace(entry);

  /// 删除账本
  Future<int> deleteLedger(int id) =>
      (delete(ledger)..where((t) => t.ledgerId.equals(id))).go();

  /// 监听所有账本变化
  Stream<List<LedgerEntity>> watchAllLedgers() => select(ledger).watch();

  // ==================== Project CRUD ====================

  /// 获取账本下的所有项目
  Future<List<ProjectEntity>> getProjectsByLedgerId(int ledgerId) =>
      (select(project)..where((t) => t.ledgerId.equals(ledgerId))).get();

  /// 获取所有未归档的项目
  Future<List<ProjectEntity>> getActiveProjects(int ledgerId) =>
      (select(project)
            ..where(
                (t) => t.ledgerId.equals(ledgerId) & t.archived.equals(false)))
          .get();

  /// 根据ID获取项目
  Future<ProjectEntity?> getProjectById(int id) =>
      (select(project)..where((t) => t.projectId.equals(id))).getSingleOrNull();

  /// 添加项目
  Future<int> insertProject(ProjectCompanion entry) =>
      into(project).insert(entry);

  /// 更新项目
  Future<bool> updateProject(ProjectEntity entry) =>
      update(project).replace(entry);

  /// 删除项目
  Future<int> deleteProject(int id) =>
      (delete(project)..where((t) => t.projectId.equals(id))).go();

  /// 归档项目
  Future<bool> archiveProject(int id, bool archived) async {
    final proj = await getProjectById(id);
    if (proj == null) return false;
    return updateProject(proj.copyWith(archived: archived));
  }

  /// 监听账本下的项目变化
  Stream<List<ProjectEntity>> watchProjectsByLedgerId(int ledgerId) =>
      (select(project)..where((t) => t.ledgerId.equals(ledgerId))).watch();

  // ==================== Account-Ledger Relation ====================

  /// 获取账本关联的所有账户ID
  Future<List<int>> getAccountIdsByLedgerId(int ledgerId) async {
    final relations = await (select(relationAccountLedger)
          ..where((t) => t.ledgerId.equals(ledgerId)))
        .get();
    return relations.map((r) => r.accountId).toList();
  }

  /// 获取账本关联的账户数量
  Future<int> getAccountCountByLedgerId(int ledgerId) async {
    final count = countAll();
    final query = selectOnly(relationAccountLedger)
      ..addColumns([count])
      ..where(relationAccountLedger.ledgerId.equals(ledgerId));
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  // ==================== Category-Ledger Relation ====================

  /// 获取账本关联的所有分类ID
  Future<List<int>> getCategoryIdsByLedgerId(int ledgerId) async {
    final relations = await (select(relationCategoryLedger)
          ..where((t) => t.ledgerId.equals(ledgerId)))
        .get();
    return relations.map((r) => r.categoryId).toList();
  }

  /// 将分类关联到账本
  Future<void> linkCategoryToLedger(int categoryId, int ledgerId) =>
      into(relationCategoryLedger).insert(
        RelationCategoryLedgerCompanion.insert(
          categoryId: categoryId,
          ledgerId: ledgerId,
        ),
        mode: InsertMode.insertOrIgnore,
      );

  /// 解除分类与账本的关联
  Future<int> unlinkCategoryFromLedger(int categoryId, int ledgerId) =>
      (delete(relationCategoryLedger)
            ..where((t) =>
                t.categoryId.equals(categoryId) & t.ledgerId.equals(ledgerId)))
          .go();
}
