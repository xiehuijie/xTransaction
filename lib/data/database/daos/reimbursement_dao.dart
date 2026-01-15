import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'reimbursement_dao.g.dart';

/// 报销 DAO
@DriftAccessor(
  tables: [Reimbursement, ReimbursementExpectation, ReimbursementActual],
)
class ReimbursementDao extends DatabaseAccessor<LedgerDatabase>
    with _$ReimbursementDaoMixin {
  ReimbursementDao(super.db);

  // ==================== Reimbursement CRUD ====================

  /// 获取所有报销计划
  Future<List<ReimbursementEntity>> getAllReimbursements() =>
      select(reimbursement).get();

  /// 根据ID获取报销计划
  Future<ReimbursementEntity?> getReimbursementById(int id) => (select(
    reimbursement,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 获取未完成的报销计划
  Future<List<ReimbursementEntity>> getPendingReimbursements() =>
      (select(reimbursement)..where((t) => t.status.equals(false))).get();

  /// 获取已完成的报销计划
  Future<List<ReimbursementEntity>> getCompletedReimbursements() =>
      (select(reimbursement)..where((t) => t.status.equals(true))).get();

  /// 添加报销计划
  Future<int> insertReimbursement(ReimbursementCompanion entry) =>
      into(reimbursement).insert(entry);

  /// 更新报销计划
  Future<bool> updateReimbursement(ReimbursementEntity entry) =>
      update(reimbursement).replace(entry);

  /// 删除报销计划
  Future<int> deleteReimbursement(int id) =>
      (delete(reimbursement)..where((t) => t.id.equals(id))).go();

  /// 标记报销完成
  Future<bool> completeReimbursement(int id) async {
    final reimb = await getReimbursementById(id);
    if (reimb == null) return false;
    return updateReimbursement(reimb.copyWith(status: true));
  }

  /// 监听所有报销计划变化
  Stream<List<ReimbursementEntity>> watchAllReimbursements() =>
      select(reimbursement).watch();

  /// 监听未完成的报销计划变化
  Stream<List<ReimbursementEntity>> watchPendingReimbursements() =>
      (select(reimbursement)..where((t) => t.status.equals(false))).watch();

  // ==================== ReimbursementExpectation CRUD ====================

  /// 获取报销计划的预期项
  Future<List<ReimbursementExpectationEntity>> getExpectations(
    int reimbursementId,
  ) => (select(
    reimbursementExpectation,
  )..where((t) => t.reimbursementId.equals(reimbursementId))).get();

  /// 根据ID获取预期项
  Future<ReimbursementExpectationEntity?> getExpectationById(int id) => (select(
    reimbursementExpectation,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 添加报销预期项
  Future<int> insertExpectation(ReimbursementExpectationCompanion entry) =>
      into(reimbursementExpectation).insert(entry);

  /// 批量添加报销预期项
  Future<void> insertExpectations(List<ReimbursementExpectationCompanion> entries) =>
      batch((batch) => batch.insertAll(reimbursementExpectation, entries));

  /// 更新报销预期项
  Future<bool> updateExpectation(ReimbursementExpectationEntity entry) =>
      update(reimbursementExpectation).replace(entry);

  /// 删除报销预期项
  Future<int> deleteExpectation(int id) => (delete(
    reimbursementExpectation,
  )..where((t) => t.id.equals(id))).go();

  /// 删除报销计划的所有预期项
  Future<int> deleteExpectationsByReimbursementId(int reimbursementId) =>
      (delete(
        reimbursementExpectation,
      )..where((t) => t.reimbursementId.equals(reimbursementId))).go();

  // ==================== ReimbursementActual CRUD ====================

  /// 获取报销计划的实际到账项
  Future<List<ReimbursementActualEntity>> getActuals(int reimbursementId) =>
      (select(reimbursementActual)
            ..where((t) => t.reimbursementId.equals(reimbursementId))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get();

  /// 根据ID获取实际到账项
  Future<ReimbursementActualEntity?> getActualById(int id) => (select(
    reimbursementActual,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 添加报销实际到账项
  Future<int> insertActual(ReimbursementActualCompanion entry) =>
      into(reimbursementActual).insert(entry);

  /// 更新报销实际到账项
  Future<bool> updateActual(ReimbursementActualEntity entry) =>
      update(reimbursementActual).replace(entry);

  /// 删除报销实际到账项
  Future<int> deleteActual(int id) => (delete(
    reimbursementActual,
  )..where((t) => t.id.equals(id))).go();

  /// 删除报销计划的所有实际到账项
  Future<int> deleteActualsByReimbursementId(int reimbursementId) => (delete(
    reimbursementActual,
  )..where((t) => t.reimbursementId.equals(reimbursementId))).go();

  // ==================== 统计方法 ====================

  /// 计算报销计划的预期总金额
  Future<int> calculateExpectedAmount(int reimbursementId) async {
    final expectations = await getExpectations(reimbursementId);
    return expectations.fold<int>(0, (sum, e) => sum + e.amount);
  }

  /// 计算报销计划的实际到账总金额
  Future<int> calculateActualAmount(int reimbursementId) async {
    final actuals = await getActuals(reimbursementId);
    return actuals.fold<int>(0, (sum, a) => sum + a.amount);
  }
}
