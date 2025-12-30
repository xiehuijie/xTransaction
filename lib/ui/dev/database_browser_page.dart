import 'dart:convert';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/database.dart';
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
class DatabaseBrowserPage extends ConsumerWidget {
  const DatabaseBrowserPage({super.key});

  List<_TableMeta> _getTables(AppDatabase db) => [
        _TableMeta('currency', '货币', db.currency),
        _TableMeta('account', '账户', db.account),
        _TableMeta('account_meta', '账户元数据', db.accountMeta),
        _TableMeta('account_credit', '信用账户', db.accountCredit),
        _TableMeta('account_bonus', '赠送金账户', db.accountBonus),
        _TableMeta('account_loan', '借贷账户', db.accountLoan),
        _TableMeta('account_plan_loan', '计划借贷账户', db.accountPlanLoan),
        _TableMeta('account_flex_loan', '灵活借贷账户', db.accountFlexLoan),
        _TableMeta('account_invest', '投资账户', db.accountInvest),
        _TableMeta('loan_plan', '借贷计划', db.loanPlan),
        _TableMeta('loan_record', '借贷记录', db.loanRecord),
        _TableMeta('ledger', '账本', db.ledger),
        _TableMeta('relation_account_ledger', '账户账本关联', db.relationAccountLedger),
        _TableMeta('project', '项目', db.project),
        _TableMeta('category', '分类', db.category),
        _TableMeta('relation_category_ledger', '分类账本关联', db.relationCategoryLedger),
        _TableMeta('stakeholder', '相关方', db.stakeholder),
        _TableMeta('relation_stakeholder_ledger', '相关方账本关联', db.relationStakeholderLedger),
        _TableMeta('transactions', '交易', db.transactions),
        _TableMeta('transaction_meta', '交易元数据', db.transactionMeta),
        _TableMeta('transaction_amount_detail', '交易金额明细', db.transactionAmountDetail),
        _TableMeta('transaction_category_detail', '交易分类明细', db.transactionCategoryDetail),
        _TableMeta('transaction_installment_plan', '交易分期计划', db.transactionInstallmentPlan),
        _TableMeta('transaction_installment_item', '交易分期项', db.transactionInstallmentItem),
        _TableMeta('transaction_reduce', '交易减免', db.transactionReduce),
        _TableMeta('transaction_refund', '交易退款', db.transactionRefund),
        _TableMeta('relation_project_transaction', '项目交易关联', db.relationProjectTransaction),
        _TableMeta('relation_transaction', '交易关联', db.relationTransaction),
        _TableMeta('reimbursement', '报销', db.reimbursement),
        _TableMeta('reimbursement_expectation', '报销预期', db.reimbursementExpectation),
        _TableMeta('reimbursement_actual', '报销实际', db.reimbursementActual),
      ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final tables = _getTables(db);

    return Scaffold(
      appBar: AppBar(
        title: const Text('数据库浏览器'),
      ),
      body: ListView.builder(
        itemCount: tables.length,
        itemBuilder: (context, index) {
          final meta = tables[index];
          return _TableListTile(db: db, meta: meta);
        },
      ),
    );
  }
}

class _TableListTile extends StatelessWidget {
  final AppDatabase db;
  final _TableMeta meta;

  const _TableListTile({required this.db, required this.meta});

  Future<int> _getRowCount() async {
    final query = db.selectOnly(meta.table)
      ..addColumns([countAll()]);
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
  final AppDatabase db;
  final _TableMeta meta;

  const _TableDataPage({required this.db, required this.meta});

  @override
  State<_TableDataPage> createState() => _TableDataPageState();
}

class _TableDataPageState extends State<_TableDataPage> {
  List<TypedResult> _rows = [];
  bool _loading = true;
  String? _error;

  AppDatabase get db => widget.db;
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

  Map<String, dynamic> _rowToMap(TypedResult row) {
    final map = <String, dynamic>{};
    for (final col in columns) {
      map[col.name] = row.read(col);
    }
    return map;
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

  void _showCellDetail(String columnName, dynamic value) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(columnName, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SelectableText(
                _formatValue(value),
                style: theme.textTheme.bodyMedium?.copyWith(fontFamily: 'monospace'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _formatValue(value)));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已复制')));
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text('复制'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showRowOptions(TypedResult row) {
    HapticService.lightImpact();
    final rowMap = _rowToMap(row);
    final jsonStr = const JsonEncoder.withIndent('  ').convert(rowMap);

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.visibility),
              title: const Text('查看JSON'),
              onTap: () {
                Navigator.pop(context);
                _showJsonViewer(jsonStr);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('编辑'),
              onTap: () {
                Navigator.pop(context);
                _showEditDialog(rowMap);
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('复制JSON'),
              onTap: () {
                Navigator.pop(context);
                Clipboard.setData(ClipboardData(text: jsonStr));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已复制')));
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
              title: Text('删除', style: TextStyle(color: Theme.of(context).colorScheme.error)),
              onTap: () {
                Navigator.pop(context);
                _confirmDelete(rowMap);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showJsonViewer(String jsonStr) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(child: Text('JSON', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold))),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: jsonStr));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已复制')));
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SelectableText(
                    jsonStr,
                    style: theme.textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInsertDialog() {
    // 生成空的JSON模板
    final template = <String, dynamic>{};
    for (final col in columns) {
      if (col.hasAutoIncrement) {
        template[col.name] = '(auto)';
      } else {
        template[col.name] = null;
      }
    }
    final jsonStr = const JsonEncoder.withIndent('  ').convert(template);

    _showJsonEditor(
      title: '新增记录',
      initialJson: jsonStr,
      onSave: (json) => _insertRow(json),
    );
  }

  void _showEditDialog(Map<String, dynamic> rowMap) {
    final jsonStr = const JsonEncoder.withIndent('  ').convert(rowMap);

    _showJsonEditor(
      title: '编辑记录',
      initialJson: jsonStr,
      onSave: (json) => _updateRow(rowMap, json),
    );
  }

  void _showJsonEditor({
    required String title,
    required String initialJson,
    required Future<void> Function(Map<String, dynamic>) onSave,
  }) {
    final controller = TextEditingController(text: initialJson);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: TextField(
            controller: controller,
            maxLines: null,
            expands: true,
            style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '输入JSON...',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                final json = jsonDecode(controller.text) as Map<String, dynamic>;
                Navigator.pop(dialogContext);
                await onSave(json);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('JSON格式错误: $e'), backgroundColor: Theme.of(context).colorScheme.error),
                );
              }
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  Future<void> _insertRow(Map<String, dynamic> json) async {
    try {
      final values = <String, Expression>{};

      for (final col in columns) {
        final value = json[col.name];
        if (value == '(auto)' || (col.hasAutoIncrement && value == null)) {
          continue; // 跳过自增列
        }
        values[col.name] = _toExpression(value);
      }

      await db.into(table).insert(RawValuesInsertable(values));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('新增成功')));
        _loadData();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('新增失败: $e'), backgroundColor: Theme.of(context).colorScheme.error),
        );
      }
    }
  }

  Future<void> _updateRow(Map<String, dynamic> oldRow, Map<String, dynamic> newRow) async {
    try {
      final primaryKeys = table.primaryKey.toList();
      final values = <String, Expression>{};

      for (final col in columns) {
        // 跳过主键
        if (primaryKeys.any((pk) => pk.name == col.name)) continue;
        final value = newRow[col.name];
        values[col.name] = _toExpression(value);
      }

      final updateStmt = db.update(table);

      // 添加主键条件
      for (final pk in primaryKeys) {
        final pkValue = oldRow[pk.name];
        if (pkValue != null) {
          updateStmt.where((tbl) => pk.equals(pkValue));
        }
      }

      await updateStmt.write(RawValuesInsertable(values));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('更新成功')));
        _loadData();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('更新失败: $e'), backgroundColor: Theme.of(context).colorScheme.error),
        );
      }
    }
  }

  void _confirmDelete(Map<String, dynamic> rowMap) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除这条记录吗？此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('取消'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: theme.colorScheme.error),
            onPressed: () {
              Navigator.pop(dialogContext);
              _deleteRow(rowMap);
            },
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteRow(Map<String, dynamic> rowMap) async {
    try {
      final primaryKeys = table.primaryKey.toList();
      final deleteStmt = db.delete(table);

      for (final pk in primaryKeys) {
        final pkValue = rowMap[pk.name];
        if (pkValue != null) {
          deleteStmt.where((tbl) => pk.equals(pkValue));
        }
      }

      await deleteStmt.go();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('删除成功')));
        _loadData();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('删除失败: $e'), backgroundColor: Theme.of(context).colorScheme.error),
        );
      }
    }
  }

  Expression _toExpression(dynamic value) {
    if (value == null) return const Constant(null);
    if (value is int) return Variable(value);
    if (value is double) return Variable(value);
    if (value is bool) return Variable(value);
    if (value is String) {
      // 尝试解析为数字
      final intVal = int.tryParse(value);
      if (intVal != null) return Variable(intVal);
      final doubleVal = double.tryParse(value);
      if (doubleVal != null) return Variable(doubleVal);
      if (value.toLowerCase() == 'true') return Variable(true);
      if (value.toLowerCase() == 'false') return Variable(false);
      return Variable(value);
    }
    return Variable(value.toString());
  }
}
