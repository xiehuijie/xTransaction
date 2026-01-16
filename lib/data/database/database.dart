import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';
import 'daos/currency_dao.dart';
import 'daos/account_dao.dart';
import 'daos/category_dao.dart';
import 'daos/stakeholder_dao.dart';
import 'daos/project_dao.dart';
import 'daos/transaction_dao.dart';
import 'daos/reimbursement_dao.dart';

part 'database.g.dart';

/// 账本数据库
/// 
/// 每个账本对应一个独立的数据库文件
@DriftDatabase(
  tables: [
    Currency,
    Account,
    AccountMeta,
    AccountCredit,
    AccountPrepaid,
    AccountPlanLoan,
    AccountFlexLoan,
    AccountInvest,
    LoanPlan,
    LoanRecord,
    Project,
    Category,
    Stakeholder,
    Transactions,
    TransactionMeta,
    TransactionAmountDetail,
    TransactionCountDetail,
    TransactionReduce,
    TransactionRefund,
    TransactionRelation,
    Reimbursement,
    ReimbursementExpectation,
    ReimbursementActual,
  ],
  daos: [
    CurrencyDao,
    AccountDao,
    CategoryDao,
    StakeholderDao,
    ProjectDao,
    TransactionDao,
    ReimbursementDao,
  ],
)
class LedgerDatabase extends _$LedgerDatabase {
  /// 账本ID
  final String ledgerId;

  /// 创建账本数据库实例
  LedgerDatabase({required this.ledgerId}) : super(_openConnection(ledgerId));

  /// 用于测试的构造函数
  LedgerDatabase.forTesting(super.e, {this.ledgerId = 'test'});

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _seedInitialData();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // 未来的迁移逻辑
      },
    );
  }

  /// 初始化系统内置数据
  Future<void> _seedInitialData() async {
    // 插入系统内置货币
    await batch((batch) {
      batch.insertAll(currency, [
        CurrencyCompanion.insert(
          code: 'CNY',
          name: '人民币',
          symbol: '¥',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(2),
          source: Value(CurrencySource.system),
        ),
        CurrencyCompanion.insert(
          code: 'USD',
          name: '美元',
          symbol: '\$',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(2),
          source: Value(CurrencySource.system),
        ),
        CurrencyCompanion.insert(
          code: 'EUR',
          name: '欧元',
          symbol: '€',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(2),
          source: Value(CurrencySource.system),
        ),
        CurrencyCompanion.insert(
          code: 'JPY',
          name: '日元',
          symbol: '¥',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(0),
          source: Value(CurrencySource.system),
        ),
        CurrencyCompanion.insert(
          code: 'GBP',
          name: '英镑',
          symbol: '£',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(2),
          source: Value(CurrencySource.system),
        ),
        CurrencyCompanion.insert(
          code: 'HKD',
          name: '港元',
          symbol: 'HK\$',
          position: Value(CurrencyPosition.prefix),
          decimal: const Value(2),
          source: Value(CurrencySource.system),
        ),
      ]);
    });
  }

  /// 重置数据库（清空所有数据并重新初始化）
  Future<void> resetDatabase() async {
    await transaction(() async {
      // 按照依赖顺序删除所有表数据
      await delete(reimbursementActual).go();
      await delete(reimbursementExpectation).go();
      await delete(reimbursement).go();
      await delete(transactionRelation).go();
      await delete(transactionRefund).go();
      await delete(transactionReduce).go();
      await delete(transactionCountDetail).go();
      await delete(transactionAmountDetail).go();
      await delete(transactionMeta).go();
      await delete(transactions).go();
      await delete(stakeholder).go();
      await delete(category).go();
      await delete(project).go();
      await delete(loanRecord).go();
      await delete(loanPlan).go();
      await delete(accountInvest).go();
      await delete(accountFlexLoan).go();
      await delete(accountPlanLoan).go();
      await delete(accountPrepaid).go();
      await delete(accountCredit).go();
      await delete(accountMeta).go();
      await delete(account).go();
      await delete(currency).go();

      // 重新插入初始数据
      await _seedInitialData();
    });
  }

  /// 导出数据库为JSON格式
  Future<Map<String, dynamic>> exportToJson() async {
    final Map<String, dynamic> data = {};

    data['currency'] = await select(currency).get();
    data['account'] = await select(account).get();
    data['accountMeta'] = await select(accountMeta).get();
    data['accountCredit'] = await select(accountCredit).get();
    data['accountPrepaid'] = await select(accountPrepaid).get();
    data['accountPlanLoan'] = await select(accountPlanLoan).get();
    data['accountFlexLoan'] = await select(accountFlexLoan).get();
    data['accountInvest'] = await select(accountInvest).get();
    data['loanPlan'] = await select(loanPlan).get();
    data['loanRecord'] = await select(loanRecord).get();
    data['project'] = await select(project).get();
    data['category'] = await select(category).get();
    data['stakeholder'] = await select(stakeholder).get();
    data['transactions'] = await select(transactions).get();
    data['transactionMeta'] = await select(transactionMeta).get();
    data['transactionAmountDetail'] = await select(transactionAmountDetail).get();
    data['transactionCountDetail'] = await select(transactionCountDetail).get();
    data['transactionReduce'] = await select(transactionReduce).get();
    data['transactionRefund'] = await select(transactionRefund).get();
    data['transactionRelation'] = await select(transactionRelation).get();
    data['reimbursement'] = await select(reimbursement).get();
    data['reimbursementExpectation'] = await select(reimbursementExpectation).get();
    data['reimbursementActual'] = await select(reimbursementActual).get();

    return data;
  }

  /// 获取此账本的数据库文件路径
  Future<String> getDatabasePath() async {
    return await LedgerDatabase.getDatabasePathForLedger(ledgerId);
  }

  /// 获取指定账本的数据库文件路径
  static Future<String> getDatabasePathForLedger(String ledgerId) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return p.join(dbFolder.path, 'ledger_$ledgerId.db');
  }

  /// 获取数据库存储目录
  static Future<Directory> getDatabaseDirectory() async {
    return await getApplicationDocumentsDirectory();
  }
}

/// 创建账本数据库连接
LazyDatabase _openConnection(String ledgerId) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ledger_$ledgerId.db'));
    return NativeDatabase.createInBackground(file);
  });
}

/// 数据库管理器
/// 
/// 管理多个账本数据库实例的创建和切换
class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  factory DatabaseManager() => _instance;
  DatabaseManager._internal();

  /// 缓存的数据库实例
  final Map<String, LedgerDatabase> _databases = {};

  /// 获取指定账本的数据库实例
  LedgerDatabase getDatabase(String ledgerId) {
    if (!_databases.containsKey(ledgerId)) {
      _databases[ledgerId] = LedgerDatabase(ledgerId: ledgerId);
    }
    return _databases[ledgerId]!;
  }

  /// 关闭指定账本的数据库
  Future<void> closeDatabase(String ledgerId) async {
    final db = _databases.remove(ledgerId);
    await db?.close();
  }

  /// 关闭所有数据库
  Future<void> closeAll() async {
    for (final db in _databases.values) {
      await db.close();
    }
    _databases.clear();
  }

  /// 删除账本数据库文件
  static Future<bool> deleteDatabaseFile(String ledgerId) async {
    try {
      final path = await LedgerDatabase.getDatabasePathForLedger(ledgerId);
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
      // 同时删除可能存在的 -wal 和 -shm 文件
      final walFile = File('$path-wal');
      final shmFile = File('$path-shm');
      if (await walFile.exists()) await walFile.delete();
      if (await shmFile.exists()) await shmFile.delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 检查账本数据库文件是否存在
  static Future<bool> databaseExists(String ledgerId) async {
    final path = await LedgerDatabase.getDatabasePathForLedger(ledgerId);
    return File(path).exists();
  }

  /// 复制数据库文件（用于导出）
  static Future<File?> copyDatabase(String ledgerId, String targetPath) async {
    try {
      final sourcePath = await LedgerDatabase.getDatabasePathForLedger(ledgerId);
      final sourceFile = File(sourcePath);
      if (await sourceFile.exists()) {
        return await sourceFile.copy(targetPath);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Validates if file is a valid SQLite database
  /// 
  /// SQLite database files start with fixed magic bytes: 'SQLite format 3\0'
  static Future<bool> isValidSqliteFile(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) return false;
      
      final randomAccess = await file.open(mode: FileMode.read);
      try {
        final header = await randomAccess.read(16);
        // SQLite file header magic bytes: "SQLite format 3\0"
        const sqliteMagic = [
          0x53, 0x51, 0x4c, 0x69, 0x74, 0x65, 0x20, 0x66,
          0x6f, 0x72, 0x6d, 0x61, 0x74, 0x20, 0x33, 0x00
        ];
        
        if (header.length < 16) return false;
        
        for (int i = 0; i < 16; i++) {
          if (header[i] != sqliteMagic[i]) return false;
        }
        return true;
      } finally {
        await randomAccess.close();
      }
    } catch (e) {
      return false;
    }
  }

  /// Creates database backup
  /// 
  /// Returns backup file path, or null if backup fails
  static Future<String?> createBackup(String ledgerId) async {
    try {
      final sourcePath = await LedgerDatabase.getDatabasePathForLedger(ledgerId);
      final sourceFile = File(sourcePath);
      if (!await sourceFile.exists()) return null;
      
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final backupPath = '$sourcePath.backup_$timestamp';
      await sourceFile.copy(backupPath);
      return backupPath;
    } catch (e) {
      return null;
    }
  }

  /// Restores database from backup
  static Future<bool> restoreFromBackup(String ledgerId, String backupPath) async {
    try {
      final targetPath = await LedgerDatabase.getDatabasePathForLedger(ledgerId);
      final backupFile = File(backupPath);
      if (!await backupFile.exists()) return false;
      
      await backupFile.copy(targetPath);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Deletes backup file
  static Future<void> deleteBackup(String backupPath) async {
    try {
      final file = File(backupPath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Ignore delete failures
    }
  }

  /// Imports database file with validation and backup
  /// 
  /// [ledgerId] - Target ledger ID
  /// [sourcePath] - Source database file path
  /// [createBackupFirst] - Whether to create backup before import
  /// 
  /// Returns:
  /// - success: Whether import succeeded
  /// - backupPath: Backup file path (only valid when createBackupFirst is true)
  /// - error: Error message
  static Future<Map<String, dynamic>> importDatabaseWithValidation(
    String ledgerId, 
    String sourcePath, {
    bool createBackupFirst = true,
  }) async {
    try {
      final sourceFile = File(sourcePath);
      if (!await sourceFile.exists()) {
        return {'success': false, 'error': 'Source file does not exist'};
      }

      // Validate it's a valid SQLite file
      if (!await isValidSqliteFile(sourcePath)) {
        return {'success': false, 'error': 'Not a valid SQLite database file'};
      }

      String? backupPath;
      
      // Create backup
      if (createBackupFirst) {
        final targetPath = await LedgerDatabase.getDatabasePathForLedger(ledgerId);
        if (await File(targetPath).exists()) {
          backupPath = await createBackup(ledgerId);
          if (backupPath == null) {
            return {'success': false, 'error': 'Failed to create backup'};
          }
        }
      }

      // Execute import
      final targetPath = await LedgerDatabase.getDatabasePathForLedger(ledgerId);
      await sourceFile.copy(targetPath);
      
      return {
        'success': true, 
        'backupPath': backupPath,
      };
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  /// 导入数据库文件
  static Future<bool> importDatabase(String ledgerId, String sourcePath) async {
    try {
      final targetPath = await LedgerDatabase.getDatabasePathForLedger(ledgerId);
      final sourceFile = File(sourcePath);
      if (await sourceFile.exists()) {
        await sourceFile.copy(targetPath);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// 获取所有数据库文件信息
  static Future<List<Map<String, dynamic>>> listDatabaseFiles() async {
    final dir = await LedgerDatabase.getDatabaseDirectory();
    final files = <Map<String, dynamic>>[];
    
    await for (final entity in dir.list()) {
      if (entity is File && entity.path.endsWith('.db')) {
        final name = p.basename(entity.path);
        if (name.startsWith('ledger_')) {
          final stat = await entity.stat();
          files.add({
            'name': name,
            'path': entity.path,
            'size': stat.size,
            'modified': stat.modified,
          });
        }
      }
    }
    
    return files;
  }
}

// 为了向后兼容，保留 AppDatabase 类型别名
@Deprecated('Use LedgerDatabase instead')
typedef AppDatabase = LedgerDatabase;
