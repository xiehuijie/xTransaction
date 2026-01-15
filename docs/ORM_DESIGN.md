# ORM 设计说明

## 为什么使用 Drift 而不是 Prisma

### Prisma Dart 生成器现状

截至目前，Prisma 官方并没有提供 Dart/Flutter 的官方生成器。社区中有一些非官方的尝试项目：

1. **prisma-dart** - 一个社区维护的 Prisma Dart 客户端，但目前功能不完整，不支持所有 Prisma 特性
2. **orm** - 纯 Dart 实现的 ORM，受 Prisma 启发，但不是真正的 Prisma 生成器

由于这些限制，本项目选择使用 **Drift ORM**，这是 Flutter/Dart 生态系统中最成熟的数据库解决方案。

### Drift ORM 优势

1. **类型安全** - 编译时检查 SQL 查询
2. **响应式** - 内置 Stream 支持，UI 自动更新
3. **代码生成** - 自动生成数据类和查询代码
4. **SQLite 支持** - 完美支持 SQLite，适合移动端
5. **迁移支持** - 内置数据库迁移机制
6. **测试友好** - 支持内存数据库进行单元测试

### Schema 定义对照

`docs/schema.prisma` 文件定义了概念上的数据模型，而 `lib/data/database/tables.dart` 是实际的 Drift 表定义。两者保持一致，但语法不同：

| Prisma 语法 | Drift 语法 |
|------------|-----------|
| `@id` | `autoIncrement()` 或 `primaryKey` |
| `@default(autoincrement())` | `autoIncrement()` |
| `@unique` | `uniqueKeys` |
| `@relation` | `.references()` |
| `Int` | `IntColumn` |
| `String` | `TextColumn` |
| `Boolean` | `BoolColumn` |
| `Float` | `RealColumn` |

## 多账本架构

本应用采用 **一个账本一个数据库** 的架构设计：

### 数据库管理

```dart
// 获取指定账本的数据库
final db = DatabaseManager().getDatabase(ledgerId);

// 通过 Provider 获取当前账本的数据库
final db = ref.watch(currentDatabaseProvider);
```

### 账本元数据存储

账本元数据使用 `SharedPreferences` 存储，而不是存储在数据库中：

```dart
// 存储在 SharedPreferences 的 JSON 格式
{
  "id": "1234567890",
  "name": "日常开支",
  "currencyCode": "CNY",
  "description": "我的第一个账本",
  "icon": "📒",
  "createdAt": 1700000000000,
  "updatedAt": 1700000000000
}
```

### 目录结构

```
Documents/
├── ledger_abc123.db          # 账本1的数据库
├── ledger_def456.db          # 账本2的数据库
└── ledger_ghi789.db          # 账本3的数据库
```

## DAO 层设计

每个 DAO 类都继承自 `DatabaseAccessor<LedgerDatabase>`，确保操作的是当前账本的数据：

```dart
@DriftAccessor(tables: [Account, ...])
class AccountDao extends DatabaseAccessor<LedgerDatabase> {
  AccountDao(super.db);
  
  // 所有操作都是针对当前账本的数据库
}
```

## Provider 层设计

```dart
// 基础 Provider - 数据库管理器
final databaseManagerProvider = Provider<DatabaseManager>((ref) {
  return DatabaseManager();
});

// 当前账本ID（可变状态）
final currentLedgerIdProvider = StateProvider<String?>((ref) {
  // 从 LedgerService 获取默认值
});

// 当前账本数据库
final currentDatabaseProvider = Provider<LedgerDatabase?>((ref) {
  final currentId = ref.watch(currentLedgerIdProvider);
  if (currentId == null) return null;
  return ref.watch(databaseManagerProvider).getDatabase(currentId);
});

// DAO Providers - 返回可空类型
final accountDaoProvider = Provider<AccountDao?>((ref) {
  return ref.watch(currentDatabaseProvider)?.accountDao;
});
```

## 测试

使用内存数据库进行测试：

```dart
LedgerDatabase createTestDatabase() {
  return LedgerDatabase.forTesting(NativeDatabase.memory());
}
```

运行测试：

```bash
flutter test test/data/database/dao_test.dart
```
