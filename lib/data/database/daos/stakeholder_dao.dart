import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'stakeholder_dao.g.dart';

@DriftAccessor(tables: [Stakeholder])
class StakeholderDao extends DatabaseAccessor<AppDatabase>
    with _$StakeholderDaoMixin {
  StakeholderDao(super.db);

  /// 获取所有相关方
  Future<List<StakeholderEntity>> getAllStakeholders() =>
      select(stakeholder).get();

  /// 根据ID获取相关方
  Future<StakeholderEntity?> getStakeholderById(int id) => (select(
    stakeholder,
  )..where((t) => t.stakeholderId.equals(id))).getSingleOrNull();

  /// 根据类型获取相关方
  Future<List<StakeholderEntity>> getStakeholdersByType(StakeholderType type) =>
      (select(stakeholder)..where((t) => t.type.equalsValue(type))).get();

  /// 搜索相关方
  Future<List<StakeholderEntity>> searchStakeholders(String query) =>
      (select(stakeholder)..where((t) => t.name.like('%$query%'))).get();

  /// 添加相关方
  Future<int> insertStakeholder(StakeholderCompanion entry) =>
      into(stakeholder).insert(entry);

  /// 更新相关方
  Future<bool> updateStakeholder(StakeholderEntity entry) =>
      update(stakeholder).replace(entry);

  /// 删除相关方
  Future<int> deleteStakeholder(int id) =>
      (delete(stakeholder)..where((t) => t.stakeholderId.equals(id))).go();

  /// 监听所有相关方变化
  Stream<List<StakeholderEntity>> watchAllStakeholders() =>
      select(stakeholder).watch();

  /// 监听特定类型相关方变化
  Stream<List<StakeholderEntity>> watchStakeholdersByType(
    StakeholderType type,
  ) => (select(stakeholder)..where((t) => t.type.equalsValue(type))).watch();
}
