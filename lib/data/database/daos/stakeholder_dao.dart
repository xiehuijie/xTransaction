import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'stakeholder_dao.g.dart';

/// 相关方 DAO
@DriftAccessor(tables: [Stakeholder])
class StakeholderDao extends DatabaseAccessor<LedgerDatabase>
    with _$StakeholderDaoMixin {
  StakeholderDao(super.db);

  /// 获取所有相关方
  Future<List<StakeholderEntity>> getAllStakeholders() =>
      select(stakeholder).get();

  /// 根据ID获取相关方
  Future<StakeholderEntity?> getStakeholderById(int id) => (select(
    stakeholder,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 根据ID列表获取相关方
  Future<List<StakeholderEntity>> getStakeholdersByIds(List<int> ids) =>
      (select(stakeholder)..where((t) => t.id.isIn(ids))).get();

  /// 根据类型获取相关方
  Future<List<StakeholderEntity>> getStakeholdersByType(StakeholderType type) =>
      (select(stakeholder)..where((t) => t.type.equalsValue(type))).get();

  /// 搜索相关方
  Future<List<StakeholderEntity>> searchStakeholders(String query) =>
      (select(stakeholder)..where((t) => t.name.like('%$query%'))).get();

  /// 获取未归档的相关方
  Future<List<StakeholderEntity>> getActiveStakeholders() =>
      (select(stakeholder)..where((t) => t.archived.equals(false))).get();

  /// 获取归档的相关方
  Future<List<StakeholderEntity>> getArchivedStakeholders() =>
      (select(stakeholder)..where((t) => t.archived.equals(true))).get();

  /// 添加相关方
  Future<int> insertStakeholder(StakeholderCompanion entry) =>
      into(stakeholder).insert(entry);

  /// 更新相关方
  Future<bool> updateStakeholder(StakeholderEntity entry) =>
      update(stakeholder).replace(entry);

  /// 删除相关方
  Future<int> deleteStakeholder(int id) =>
      (delete(stakeholder)..where((t) => t.id.equals(id))).go();

  /// 归档相关方
  Future<bool> archiveStakeholder(int id, bool archived) async {
    final sh = await getStakeholderById(id);
    if (sh == null) return false;
    return updateStakeholder(sh.copyWith(archived: archived));
  }

  /// 监听所有相关方变化
  Stream<List<StakeholderEntity>> watchAllStakeholders() =>
      select(stakeholder).watch();

  /// 监听特定类型相关方变化
  Stream<List<StakeholderEntity>> watchStakeholdersByType(
    StakeholderType type,
  ) => (select(stakeholder)..where((t) => t.type.equalsValue(type))).watch();

  /// 监听未归档相关方变化
  Stream<List<StakeholderEntity>> watchActiveStakeholders() =>
      (select(stakeholder)..where((t) => t.archived.equals(false))).watch();
}
