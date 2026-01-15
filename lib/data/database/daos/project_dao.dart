import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'project_dao.g.dart';

/// 项目 DAO
@DriftAccessor(tables: [Project])
class ProjectDao extends DatabaseAccessor<LedgerDatabase>
    with _$ProjectDaoMixin {
  ProjectDao(super.db);

  /// 获取所有项目
  Future<List<ProjectEntity>> getAllProjects() => select(project).get();

  /// 获取所有未归档的项目
  Future<List<ProjectEntity>> getActiveProjects() =>
      (select(project)..where((t) => t.archived.equals(false))).get();

  /// 获取所有归档的项目
  Future<List<ProjectEntity>> getArchivedProjects() =>
      (select(project)..where((t) => t.archived.equals(true))).get();

  /// 根据ID获取项目
  Future<ProjectEntity?> getProjectById(int id) =>
      (select(project)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 根据ID列表获取项目
  Future<List<ProjectEntity>> getProjectsByIds(List<int> ids) =>
      (select(project)..where((t) => t.id.isIn(ids))).get();

  /// 添加项目
  Future<int> insertProject(ProjectCompanion entry) =>
      into(project).insert(entry);

  /// 更新项目
  Future<bool> updateProject(ProjectEntity entry) =>
      update(project).replace(entry);

  /// 删除项目
  Future<int> deleteProject(int id) =>
      (delete(project)..where((t) => t.id.equals(id))).go();

  /// 归档项目
  Future<bool> archiveProject(int id, bool archived) async {
    final proj = await getProjectById(id);
    if (proj == null) return false;
    return updateProject(proj.copyWith(archived: archived));
  }

  /// 搜索项目
  Future<List<ProjectEntity>> searchProjects(String query) =>
      (select(project)..where((t) => t.name.like('%$query%'))).get();

  /// 监听所有项目变化
  Stream<List<ProjectEntity>> watchAllProjects() => select(project).watch();

  /// 监听未归档项目变化
  Stream<List<ProjectEntity>> watchActiveProjects() =>
      (select(project)..where((t) => t.archived.equals(false))).watch();
}
