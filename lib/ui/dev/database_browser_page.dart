import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/database/database.dart';
import '../../data/services/ledger_service.dart';
import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';

/// 表信息
class _TableMeta {
  final String name;
  final String displayName;
  final TableInfo table;

  const _TableMeta(this.name, this.displayName, this.table);
}

/// 数据库浏览器页面
class DatabaseBrowserPage extends ConsumerStatefulWidget {
  const DatabaseBrowserPage({super.key});

  @override
  ConsumerState<DatabaseBrowserPage> createState() => _DatabaseBrowserPageState();
}

class _DatabaseBrowserPageState extends ConsumerState<DatabaseBrowserPage> {
  List<_TableMeta> _getTables(LedgerDatabase db) => [
        _TableMeta('currency', '货币', db.currency),
        _TableMeta('account', '账户', db.account),
        _TableMeta('account_meta', '账户元数据', db.accountMeta),
        _TableMeta('account_credit', '信用账户', db.accountCredit),
        _TableMeta('account_prepaid', '预付账户', db.accountPrepaid),
        _TableMeta('account_plan_loan', '计划借贷账户', db.accountPlanLoan),
        _TableMeta('account_flex_loan', '灵活借贷账户', db.accountFlexLoan),
        _TableMeta('account_invest', '投资账户', db.accountInvest),
        _TableMeta('loan_plan', '借贷计划', db.loanPlan),
        _TableMeta('loan_record', '借贷记录', db.loanRecord),
        _TableMeta('project', '项目', db.project),
        _TableMeta('category', '分类', db.category),
        _TableMeta('stakeholder', '相关方', db.stakeholder),
        _TableMeta('transactions', '交易', db.transactions),
        _TableMeta('transaction_meta', '交易元数据', db.transactionMeta),
        _TableMeta('transaction_amount_detail', '交易金额明细', db.transactionAmountDetail),
        _TableMeta('transaction_count_detail', '交易数量明细', db.transactionCountDetail),
        _TableMeta('transaction_reduce', '交易减免', db.transactionReduce),
        _TableMeta('transaction_refund', '交易退款', db.transactionRefund),
        _TableMeta('transaction_relation', '交易关联', db.transactionRelation),
        _TableMeta('reimbursement', '报销', db.reimbursement),
        _TableMeta('reimbursement_expectation', '报销预期', db.reimbursementExpectation),
        _TableMeta('reimbursement_actual', '报销实际', db.reimbursementActual),
      ];

  @override
  Widget build(BuildContext context) {
    final ledgerService = ref.watch(ledgerServiceProvider);
    final currentLedgerId = ref.watch(currentLedgerIdProvider);
    final db = ref.watch(currentDatabaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('数据库浏览器'),
        actions: [
          IconButton(
            icon: const Icon(Icons.import_export),
            tooltip: '导入/导出',
            onPressed: db != null ? () => _showImportExportDialog(db) : null,
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: '数据库信息',
            onPressed: db != null ? () => _showDatabaseInfo(db) : null,
          ),
        ],
      ),
      body: ledgerService.when(
        data: (service) {
          final ledgers = service.getAllLedgers();
          
          if (ledgers.isEmpty) {
            return _buildNoLedgerView(service);
          }

          if (db == null) {
            return const Center(child: Text('请选择账本'));
          }

          return Column(
            children: [
              // 账本选择器
              _LedgerSelector(
                ledgers: ledgers,
                currentId: currentLedgerId,
                onSelect: (id) {
                  ref.read(currentLedgerIdProvider.notifier).state = id;
                  service.setCurrentLedgerId(id);
                },
                onCreateLedger: () => _showCreateLedgerDialog(service),
              ),
              const Divider(height: 1),
              // 表列表
              Expanded(
                child: ListView.builder(
                  itemCount: _getTables(db).length,
                  itemBuilder: (context, index) {
                    final meta = _getTables(db)[index];
                    return _TableListTile(db: db, meta: meta);
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
      ),
    );
  }

  Widget _buildNoLedgerView(LedgerService service) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.book_outlined,
              size: 64,
              color: theme.colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              '暂无账本',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '创建一个账本开始使用',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _showCreateLedgerDialog(service),
              icon: const Icon(Icons.add),
              label: const Text('创建账本'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showCreateLedgerDialog(LedgerService service) async {
    final nameController = TextEditingController();
    final currencyController = TextEditingController(text: 'CNY');
    final descController = TextEditingController();

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('创建账本'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '账本名称',
                hintText: '例如：日常开支',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: currencyController,
              decoration: const InputDecoration(
                labelText: '默认货币',
                hintText: '例如：CNY',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: '描述（可选）',
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('创建'),
          ),
        ],
      ),
    );

    if (result == true && nameController.text.isNotEmpty) {
      final ledger = await service.createLedger(
        name: nameController.text,
        currencyCode: currencyController.text,
        description: descController.text,
      );
      
      if (mounted) {
        ref.read(currentLedgerIdProvider.notifier).state = ledger.id;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('账本 "${ledger.name}" 创建成功')),
        );
        setState(() {});
      }
    }
  }

  Future<void> _showImportExportDialog(LedgerDatabase db) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.upload),
              title: const Text('导出数据库'),
              subtitle: const Text('将当前账本导出为文件'),
              onTap: () {
                Navigator.pop(context);
                _exportDatabase(db);
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_download),
              title: const Text('导出为 JSON'),
              subtitle: const Text('将数据导出为 JSON 格式'),
              onTap: () {
                Navigator.pop(context);
                _exportAsJson(db);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete_forever, color: Colors.red),
              title: const Text('重置数据库', style: TextStyle(color: Colors.red)),
              subtitle: const Text('清空所有数据并重新初始化'),
              onTap: () {
                Navigator.pop(context);
                _confirmResetDatabase(db);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportDatabase(LedgerDatabase db) async {
    try {
      final dbPath = await db.getDatabasePath();
      final file = File(dbPath);
      
      if (!await file.exists()) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('数据库文件不存在')),
          );
        }
        return;
      }

      // 复制到临时目录
      final tempDir = await getTemporaryDirectory();
      final exportPath = '${tempDir.path}/export_${db.ledgerId}.db';
      await file.copy(exportPath);

      // 提示用户文件位置
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('数据库已导出到: $exportPath'),
            action: SnackBarAction(
              label: '复制路径',
              onPressed: () {
                Clipboard.setData(ClipboardData(text: exportPath));
              },
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('导出失败: $e')),
        );
      }
    }
  }

  Future<void> _exportAsJson(LedgerDatabase db) async {
    try {
      final data = await db.exportToJson();
      final jsonStr = const JsonEncoder.withIndent('  ').convert(
        data.map((key, value) {
          if (value is List) {
            return MapEntry(key, value.map((e) => e.toString()).toList());
          }
          return MapEntry(key, value.toString());
        }),
      );

      final tempDir = await getTemporaryDirectory();
      final exportPath = '${tempDir.path}/export_${db.ledgerId}.json';
      await File(exportPath).writeAsString(jsonStr);

      // 提示用户文件位置
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('JSON已导出到: $exportPath'),
            action: SnackBarAction(
              label: '复制路径',
              onPressed: () {
                Clipboard.setData(ClipboardData(text: exportPath));
              },
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('导出失败: $e')),
        );
      }
    }
  }

  Future<void> _confirmResetDatabase(LedgerDatabase db) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认重置'),
        content: const Text('此操作将清空当前账本的所有数据，此操作不可撤销。确定要继续吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('重置'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await db.resetDatabase();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('数据库已重置')),
          );
          setState(() {});
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('重置失败: $e')),
          );
        }
      }
    }
  }

  Future<void> _showDatabaseInfo(LedgerDatabase db) async {
    final dbPath = await db.getDatabasePath();
    final file = File(dbPath);
    final exists = await file.exists();
    final size = exists ? await file.length() : 0;
    final sizeStr = _formatFileSize(size);

    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('数据库信息'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoRow('账本 ID', db.ledgerId),
            _InfoRow('数据库版本', '${db.schemaVersion}'),
            _InfoRow('文件大小', sizeStr),
            _InfoRow('文件路径', dbPath),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: dbPath));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('路径已复制')),
              );
            },
            child: const Text('复制路径'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ),
          Expanded(
            child: SelectableText(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

/// 账本选择器
class _LedgerSelector extends StatelessWidget {
  final List<LedgerMeta> ledgers;
  final String? currentId;
  final ValueChanged<String> onSelect;
  final VoidCallback onCreateLedger;

  const _LedgerSelector({
    required this.ledgers,
    required this.currentId,
    required this.onSelect,
    required this.onCreateLedger,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentLedger = ledgers.where((l) => l.id == currentId).firstOrNull;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: theme.colorScheme.surfaceContainerLow,
      child: Row(
        children: [
          Icon(Icons.book, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButton<String>(
              value: currentId,
              isExpanded: true,
              underline: const SizedBox(),
              hint: const Text('选择账本'),
              items: ledgers.map((ledger) {
                return DropdownMenuItem(
                  value: ledger.id,
                  child: Text(ledger.name),
                );
              }).toList(),
              onChanged: (id) {
                if (id != null) {
                  HapticService.lightImpact();
                  onSelect(id);
                }
              },
            ),
          ),
          if (currentLedger != null)
            Text(
              currentLedger.currencyCode,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: '创建账本',
            onPressed: onCreateLedger,
          ),
        ],
      ),
    );
  }
}

class _TableListTile extends StatelessWidget {
  final LedgerDatabase db;
  final _TableMeta meta;

  const _TableListTile({required this.db, required this.meta});

  Future<int> _getRowCount() async {
    final query = db.selectOnly(meta.table)..addColumns([countAll()]);
    final result = await query.getSingle();
    return result.read(countAll()) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FutureBuilder<int>(
      future: _getRowCount(),
      builder: (context, snapshot) {
        final count = snapshot.data ?? 0;

        return ListTile(
          title: Text(meta.displayName),
          subtitle: Text(meta.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$count',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right),
            ],
          ),
          onTap: () {
            HapticService.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => _TableDataPage(db: db, meta: meta),
              ),
            );
          },
        );
      },
    );
  }
}

/// 表数据页面
class _TableDataPage extends StatefulWidget {
  final LedgerDatabase db;
  final _TableMeta meta;

  const _TableDataPage({required this.db, required this.meta});

  @override
  State<_TableDataPage> createState() => _TableDataPageState();
}

class _TableDataPageState extends State<_TableDataPage> {
  List<TypedResult> _rows = [];
  bool _loading = true;
  String? _error;

  LedgerDatabase get db => widget.db;
  TableInfo get table => widget.meta.table;
  List<GeneratedColumn> get columns => table.$columns;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final query = db.selectOnly(table)..addColumns(columns);
      final results = await query.get();

      setState(() {
        _rows = results;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.meta.displayName),
            Text(
              widget.meta.name,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: '刷新',
            onPressed: _loadData,
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: '新增',
            onPressed: _showInsertDialog,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final theme = Theme.of(context);

    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
              const SizedBox(height: 16),
              Text('加载失败', style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(_error!, style: theme.textTheme.bodySmall),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _loadData,
                icon: const Icon(Icons.refresh),
                label: const Text('重试'),
              ),
            ],
          ),
        ),
      );
    }

    if (_rows.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 48, color: theme.colorScheme.outline),
            const SizedBox(height: 16),
            Text('暂无数据', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _showInsertDialog,
              icon: const Icon(Icons.add),
              label: const Text('新增'),
            ),
          ],
        ),
      );
    }

    // 横向滚动的数据表
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          columns: columns.map((col) {
            return DataColumn(
              label: Text(
                col.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
          rows: _rows.map((row) {
            return DataRow(
              cells: columns.map((col) {
                final value = row.read(col);
                return DataCell(
                  Text(
                    _formatValue(value),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => _showCellDetail(col.name, value),
                );
              }).toList(),
              onLongPress: () => _showRowOptions(row),
            );
          }).toList(),
        ),
      ),
    );
  }

  String _formatValue(dynamic value) {
    if (value == null) return 'NULL';
    if (value is String && value.isEmpty) return '(empty)';
    return value.toString();
  }

  void _showCellDetail(String colName, dynamic value) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(colName),
        content: SelectableText(_formatValue(value)),
        actions: [
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: _formatValue(value)));
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('已复制到剪贴板')),
              );
            },
            child: const Text('复制'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _showRowOptions(TypedResult row) {
    final map = <String, dynamic>{};
    for (final col in columns) {
      map[col.name] = row.read(col);
    }

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('复制为 JSON'),
              onTap: () {
                Navigator.pop(context);
                final json = const JsonEncoder.withIndent('  ').convert(map);
                Clipboard.setData(ClipboardData(text: json));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('已复制到剪贴板')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('删除此行', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _confirmDeleteRow(map);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDeleteRow(Map<String, dynamic> row) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除这条数据吗？此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('删除功能需要根据表主键实现')),
      );
    }
  }

  void _showInsertDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('新增功能需要根据表结构动态生成表单')),
    );
  }
}
