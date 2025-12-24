import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../database/database.dart';

/// 数据库导入导出服务
class DatabaseExportService {
  final AppDatabase _db;

  DatabaseExportService(this._db);

  /// 导出数据库为JSON文件
  /// 返回导出文件的路径
  Future<String> exportToJsonFile({String? customFileName}) async {
    final data = await _db.exportToJson();

    // 将实体转换为可序列化的Map
    final exportData = <String, dynamic>{};

    for (final entry in data.entries) {
      if (entry.value is List) {
        exportData[entry.key] = (entry.value as List)
            .map((e) => _entityToMap(e))
            .toList();
      } else {
        exportData[entry.key] = entry.value;
      }
    }

    exportData['exportedAt'] = DateTime.now().toIso8601String();
    exportData['version'] = 1;

    final jsonString = const JsonEncoder.withIndent('  ').convert(exportData);

    final directory = await getApplicationDocumentsDirectory();
    final fileName =
        customFileName ??
        'x_transaction_backup_${DateTime.now().millisecondsSinceEpoch}.json';
    final filePath = p.join(directory.path, 'backups', fileName);

    final file = File(filePath);
    await file.parent.create(recursive: true);
    await file.writeAsString(jsonString);

    return filePath;
  }

  /// 从JSON文件导入数据
  Future<void> importFromJsonFile(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception('文件不存在: $filePath');
    }

    final jsonString = await file.readAsString();
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    // 验证版本
    final version = data['version'] as int?;
    if (version == null || version > 1) {
      throw Exception('不支持的备份版本');
    }

    // TODO: 实现具体的导入逻辑
    // 需要按照表的依赖顺序导入数据
  }

  /// 获取备份文件列表
  Future<List<File>> getBackupFiles() async {
    final directory = await getApplicationDocumentsDirectory();
    final backupDir = Directory(p.join(directory.path, 'backups'));

    if (!await backupDir.exists()) {
      return [];
    }

    final files = await backupDir
        .list()
        .where((entity) => entity is File && entity.path.endsWith('.json'))
        .cast<File>()
        .toList();

    // 按修改时间排序，最新的在前
    files.sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));

    return files;
  }

  /// 删除备份文件
  Future<void> deleteBackupFile(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// 获取数据库文件大小
  Future<int> getDatabaseFileSize() async {
    final dbPath = await AppDatabase.getDatabasePath();
    final file = File(dbPath);
    if (await file.exists()) {
      return await file.length();
    }
    return 0;
  }

  /// 将实体对象转换为Map（用于JSON序列化）
  Map<String, dynamic> _entityToMap(dynamic entity) {
    // Drift生成的实体类都有toJson方法或可以通过反射获取属性
    // 这里需要根据具体实体类型进行处理
    if (entity is Map) {
      return Map<String, dynamic>.from(entity);
    }

    // 尝试调用toJson方法（如果存在）
    try {
      // ignore: avoid_dynamic_calls
      return entity.toJson() as Map<String, dynamic>;
    } catch (_) {
      // 如果没有toJson方法，返回空Map或抛出异常
      return {};
    }
  }
}

/// 数据库备份信息
class BackupInfo {
  final String filePath;
  final String fileName;
  final DateTime createdAt;
  final int fileSize;

  BackupInfo({
    required this.filePath,
    required this.fileName,
    required this.createdAt,
    required this.fileSize,
  });

  static Future<BackupInfo> fromFile(File file) async {
    return BackupInfo(
      filePath: file.path,
      fileName: p.basename(file.path),
      createdAt: await file.lastModified(),
      fileSize: await file.length(),
    );
  }

  String get formattedSize {
    if (fileSize < 1024) {
      return '$fileSize B';
    } else if (fileSize < 1024 * 1024) {
      return '${(fileSize / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }
}
