# X Transaction - AI Coding Instructions

## Project Overview

个人记账应用，使用 **Flutter + Riverpod + Drift ORM**，支持多账本、多货币、多账户类型管理。

## 架构设计

### 分层结构
```
lib/
├── main.dart          # 应用入口 + 启动流程控制
├── data/              # 数据层
│   ├── database/      # Drift ORM (tables.dart定义表, daos/具体操作)
│   ├── preferences/   # SharedPreferences键值存储
│   ├── constants/     # 枚举/常量定义
│   └── services/      # 数据导出等服务
├── providers/         # Riverpod状态管理
├── ui/                # 页面组件 (按功能模块划分)
├── utils/             # 工具类 (主题、触感反馈、生物识别)
└── l10n/              # 国际化 (ARB格式, 支持en/zh/ja)
```

### 核心数据流
1. **UI层** 通过 `ref.watch(xxxProvider)` 获取数据
2. **Provider层** 依赖 `databaseProvider` 获取 `AppDatabase` 实例
3. **DAO层** 封装 Drift 查询操作，返回 `Stream` 或 `Future`

## 关键约定

### 数据库 (Drift ORM)
- 表定义集中在 [lib/data/database/tables.dart](lib/data/database/tables.dart)
- 每个表对应一个 DAO 文件，使用 `@DriftAccessor` 注解
- **金额字段** 以最小货币单位的整数存储 (如 CNY 97.63 → 9763)
- **时间戳字段** 以毫秒级 UNIX 时间戳整数存储
- **日期字段** 以 1900 日期系统天数整数存储
- 修改表结构后运行: `dart run build_runner build --delete-conflicting-outputs`

### Riverpod 状态管理
- Provider 定义集中在 [lib/providers/providers.dart](lib/providers/providers.dart)
- 数据库 Provider 示例:
  ```dart
  final accountDaoProvider = Provider((ref) {
    final db = ref.watch(databaseProvider);
    return db.accountDao;
  });
  ```
- 使用 `FutureProvider` 处理异步配置，`StreamProvider` 监听实时数据变化
- 使用 `FutureProvider.family` 处理带参数的查询

### 国际化
- ARB 文件位于 `lib/l10n/app_*.arb`，模板文件为 `app_en.arb`
- 添加新文本后运行 `flutter gen-l10n`
- 使用方式: `AppLocalizations.of(context)?.keyName`

### UI 模式
- 页面使用 `ConsumerWidget` 或 `ConsumerStatefulWidget`
- 表单页面参考 [lib/ui/account/account_form_page.dart](lib/ui/account/account_form_page.dart) 的模式
- 使用 `animations` 包的 `SharedAxisTransition` / `FadeThroughTransition` 实现页面过渡
- 触感反馈调用 `HapticService.lightImpact()` 等方法

### 账户类型架构
账户采用 **基表+扩展表** 模式:
- `Account` 基表存储通用字段 (名称、货币、图标等)
- 扩展表如 `AccountCredit`, `AccountLoan` 存储类型特有字段
- 账户类型: `balance`, `credit`, `loan`, `invest`, `prepaid`, `bonus`

## 开发命令

```powershell
# 运行应用
flutter run

# 生成 Drift 代码 (修改表结构后必须运行)
dart run build_runner build --delete-conflicting-outputs

# 生成国际化文件
flutter gen-l10n

# 分析代码
flutter analyze
```

## 重要文件参考

| 用途 | 文件 |
|------|------|
| 数据库表定义 | [lib/data/database/tables.dart](lib/data/database/tables.dart) |
| 数据库设计文档 | [docs/db.md](docs/db.md) |
| 所有 Provider | [lib/providers/providers.dart](lib/providers/providers.dart) |
| 应用配置键 | [lib/data/preferences/app_preferences.dart](lib/data/preferences/app_preferences.dart) |
| 主题定义 | [lib/utils/app_theme.dart](lib/utils/app_theme.dart) |
| 账户表单示例 | [lib/ui/account/account_form_page.dart](lib/ui/account/account_form_page.dart) |

## 注意事项

- **不要**直接操作数据库，始终通过 DAO 和 Provider
- 新增 DAO 方法后需更新 `lib/data/data.dart` 的 export
- 所有货币金额计算保持整数运算，仅在显示时转换
- 遵循现有的中文注释风格，代码注释使用中文
