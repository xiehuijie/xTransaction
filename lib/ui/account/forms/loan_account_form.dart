/// 借贷账户表单组件
///
/// 借贷账户需要设置借贷详情和还款计划
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/data.dart';
import '../../../providers/providers.dart';
import '../../../utils/haptic_service.dart';

/// 借贷账户表单数据
class LoanAccountFormData {
  /// 相关方ID
  final int stakeholderId;

  /// 借贷类型
  final AccountLoanType loanType;

  /// 借贷金额
  final int amount;

  /// 年化利率（基点）
  final int rate;

  /// 开始日期
  final int startDate;

  /// 结束日期
  final int endDate;

  /// 借贷备注
  final String loanNote;

  /// 还款计划
  final List<LoanPlanData>? plans;

  const LoanAccountFormData({
    required this.stakeholderId,
    required this.loanType,
    required this.amount,
    required this.rate,
    required this.startDate,
    required this.endDate,
    this.loanNote = '',
    this.plans,
  });
}

/// 借贷账户表单
class LoanAccountForm extends ConsumerStatefulWidget {
  /// 编辑的账户ID
  final int? editAccountId;

  const LoanAccountForm({
    super.key,
    this.editAccountId,
  });

  @override
  ConsumerState<LoanAccountForm> createState() => LoanAccountFormState();
}

class LoanAccountFormState extends ConsumerState<LoanAccountForm> {
  /// 借贷类型
  AccountLoanType _loanType = AccountLoanType.borrow;

  /// 借贷金额
  late TextEditingController _amountController;

  /// 年化利率
  late TextEditingController _rateController;

  /// 开始日期
  DateTime _startDate = DateTime.now();

  /// 结束日期
  DateTime _endDate = DateTime.now().add(const Duration(days: 365));

  /// 借贷备注
  late TextEditingController _loanNoteController;

  /// 还款计划列表
  List<LoanPlanEditData> _plans = [];

  /// 选中的相关方
  StakeholderEntity? _selectedStakeholder;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _rateController = TextEditingController();
    _loanNoteController = TextEditingController();

    if (widget.editAccountId != null) {
      _loadExistingData();
    } else {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadExistingData() async {
    try {
      final accountDao = ref.read(accountDaoProvider);
      final stakeholderDao = ref.read(stakeholderDaoProvider);

      // 加载借贷账户详情
      final loanAccount =
          await accountDao.getLoanAccount(widget.editAccountId!);
      if (loanAccount != null) {
        _loanType = loanAccount.type;
        _amountController.text = loanAccount.amount.toString();
        _rateController.text = (loanAccount.rate / 100).toStringAsFixed(2);
        _startDate = _dateFromDays(loanAccount.startDate);
        _endDate = _dateFromDays(loanAccount.endDate);
        _loanNoteController.text = loanAccount.note;

        // 加载相关方
        _selectedStakeholder =
            await stakeholderDao.getStakeholderById(loanAccount.stakeholderId);
      }

      // 加载还款计划
      final plans = await accountDao.getLoanPlansByAccountId(widget.editAccountId!);
      _plans = plans.map((p) => LoanPlanEditData(
            id: p.loanPlanId,
            amount: p.amount,
            dueDate: _dateFromDays(p.dueDate),
            note: p.note,
          )).toList();
    } catch (e) {
      debugPrint('加载借贷账户数据失败: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _rateController.dispose();
    _loanNoteController.dispose();
    super.dispose();
  }

  /// 获取表单数据
  LoanAccountFormData? getFormData() {
    if (_selectedStakeholder == null) {
      return null;
    }

    final amount = int.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      return null;
    }

    final ratePercent = double.tryParse(_rateController.text) ?? 0;
    final rate = (ratePercent * 100).round(); // 转换为基点

    return LoanAccountFormData(
      stakeholderId: _selectedStakeholder!.stakeholderId,
      loanType: _loanType,
      amount: amount,
      rate: rate,
      startDate: _dateToDays(_startDate),
      endDate: _dateToDays(_endDate),
      loanNote: _loanNoteController.text.trim(),
      plans: _plans.isNotEmpty
          ? _plans
              .map((p) => LoanPlanData(
                    amount: p.amount,
                    dueDate: _dateToDays(p.dueDate),
                    note: p.note,
                  ))
              .toList()
          : null,
    );
  }

  /// 将日期转换为1900日期系统天数
  int _dateToDays(DateTime date) {
    final epoch = DateTime(1900, 1, 1);
    return date.difference(epoch).inDays;
  }

  /// 将1900日期系统天数转换为日期
  DateTime _dateFromDays(int days) {
    final epoch = DateTime(1900, 1, 1);
    return epoch.add(Duration(days: days));
  }

  Future<void> _selectStakeholder() async {
    HapticService.lightImpact();
    final stakeholdersAsync = ref.read(allStakeholdersProvider);
    final stakeholders = stakeholdersAsync.value ?? [];

    final selected = await showModalBottomSheet<StakeholderEntity>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _StakeholderPickerSheet(
        stakeholders: stakeholders,
        selectedId: _selectedStakeholder?.stakeholderId,
      ),
    );

    if (selected != null) {
      setState(() {
        _selectedStakeholder = selected;
      });
    }
  }

  Future<void> _selectDate(bool isStartDate) async {
    HapticService.lightImpact();
    final initialDate = isStartDate ? _startDate : _endDate;
    final firstDate = isStartDate
        ? DateTime(2000)
        : _startDate.add(const Duration(days: 1));
    final lastDate = DateTime(2100);

    final selected = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selected != null) {
      setState(() {
        if (isStartDate) {
          _startDate = selected;
          if (_endDate.isBefore(_startDate)) {
            _endDate = _startDate.add(const Duration(days: 30));
          }
        } else {
          _endDate = selected;
        }
      });
    }
  }

  void _navigateToPlanConfig() {
    HapticService.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LoanPlanConfigPage(
          plans: _plans,
          onSave: (plans) {
            setState(() {
              _plans = plans;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('yyyy-MM-dd');

    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 借贷账户配置
        Text(
          '借贷账户配置',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '设置借贷详情和还款计划',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),

        // 借贷类型
        SegmentedButton<AccountLoanType>(
          segments: const [
            ButtonSegment(
              value: AccountLoanType.borrow,
              label: Text('借入'),
              icon: Icon(Icons.arrow_downward),
            ),
            ButtonSegment(
              value: AccountLoanType.lend,
              label: Text('借出'),
              icon: Icon(Icons.arrow_upward),
            ),
          ],
          selected: {_loanType},
          onSelectionChanged: (selected) {
            HapticService.selectionClick();
            setState(() {
              _loanType = selected.first;
            });
          },
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            _loanType == AccountLoanType.borrow
                ? '记录您向他人借入的款项'
                : '记录您借给他人的款项',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 相关方选择
        InkWell(
          onTap: _selectStakeholder,
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: _loanType == AccountLoanType.borrow ? '债权人 *' : '债务人 *',
              prefixIcon: const Icon(Icons.person_outline),
              errorText: _selectedStakeholder == null ? '请选择相关方' : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedStakeholder?.name ?? '点击选择'),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 借贷金额
        TextFormField(
          controller: _amountController,
          decoration: const InputDecoration(
            labelText: '借贷金额 *',
            hintText: '请输入借贷金额',
            prefixIcon: Icon(Icons.monetization_on_outlined),
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '请输入借贷金额';
            }
            final amount = int.tryParse(value);
            if (amount == null || amount <= 0) {
              return '请输入有效的金额';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // 年化利率
        TextFormField(
          controller: _rateController,
          decoration: const InputDecoration(
            labelText: '年化利率（%）',
            hintText: '如：5.00',
            prefixIcon: Icon(Icons.percent),
            suffixText: '%',
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 16),
          child: Text(
            '可选，用于计算利息',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 开始日期
        InkWell(
          onTap: () => _selectDate(true),
          child: InputDecorator(
            decoration: const InputDecoration(
              labelText: '开始日期 *',
              prefixIcon: Icon(Icons.calendar_today),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dateFormat.format(_startDate)),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 结束日期
        InkWell(
          onTap: () => _selectDate(false),
          child: InputDecorator(
            decoration: const InputDecoration(
              labelText: '结束日期 *',
              prefixIcon: Icon(Icons.event),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dateFormat.format(_endDate)),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 借贷备注
        TextFormField(
          controller: _loanNoteController,
          decoration: const InputDecoration(
            labelText: '借贷备注',
            hintText: '如：借款用途、还款方式等',
            prefixIcon: Icon(Icons.notes),
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 24),

        // 还款计划
        Row(
          children: [
            Expanded(
              child: Text(
                '还款计划',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: _navigateToPlanConfig,
              icon: const Icon(Icons.edit_calendar, size: 18),
              label: Text(_plans.isEmpty ? '配置计划' : '编辑计划 (${_plans.length})'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          '设置分期还款计划，便于追踪还款进度',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),

        // 计划预览
        if (_plans.isNotEmpty) ...[
          const SizedBox(height: 12),
          Card(
            color: theme.colorScheme.surfaceContainerHighest.withAlpha(100),
            child: Column(
              children: [
                for (var i = 0; i < _plans.length && i < 3; i++)
                  ListTile(
                    leading: CircleAvatar(
                      radius: 16,
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    title: Text('${_plans[i].amount}'),
                    subtitle: Text(dateFormat.format(_plans[i].dueDate)),
                    dense: true,
                  ),
                if (_plans.length > 3)
                  ListTile(
                    leading: const SizedBox(width: 32),
                    title: Text(
                      '还有 ${_plans.length - 3} 期...',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    dense: true,
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

/// 借贷计划编辑数据
class LoanPlanEditData {
  int? id;
  int amount;
  DateTime dueDate;
  String note;

  LoanPlanEditData({
    this.id,
    required this.amount,
    required this.dueDate,
    this.note = '',
  });
}

/// 相关方选择底部弹窗
class _StakeholderPickerSheet extends StatelessWidget {
  final List<StakeholderEntity> stakeholders;
  final int? selectedId;

  const _StakeholderPickerSheet({
    required this.stakeholders,
    this.selectedId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '选择相关方',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            if (stakeholders.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_outline,
                        size: 64,
                        color: theme.colorScheme.onSurfaceVariant.withAlpha(128),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '暂无相关方',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '请先在相关方管理中添加',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant.withAlpha(180),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: stakeholders.length,
                  itemBuilder: (context, index) {
                    final stakeholder = stakeholders[index];
                    final isSelected = stakeholder.stakeholderId == selectedId;

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isSelected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.surfaceContainerHighest,
                        child: Icon(
                          Icons.person,
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      title: Text(stakeholder.name),
                      subtitle: Text(_getStakeholderTypeLabel(stakeholder.type)),
                      trailing: isSelected
                          ? Icon(
                              Icons.check_circle,
                              color: theme.colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        HapticService.selectionClick();
                        Navigator.pop(context, stakeholder);
                      },
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }

  String _getStakeholderTypeLabel(StakeholderType type) {
    switch (type) {
      case StakeholderType.person:
        return '个人';
      case StakeholderType.merchant:
        return '商户';
      case StakeholderType.company:
        return '公司';
      case StakeholderType.other:
        return '其他';
    }
  }
}

/// 借贷计划配置页面
class LoanPlanConfigPage extends StatefulWidget {
  final List<LoanPlanEditData> plans;
  final void Function(List<LoanPlanEditData>) onSave;

  const LoanPlanConfigPage({
    super.key,
    required this.plans,
    required this.onSave,
  });

  @override
  State<LoanPlanConfigPage> createState() => _LoanPlanConfigPageState();
}

class _LoanPlanConfigPageState extends State<LoanPlanConfigPage> {
  late List<LoanPlanEditData> _plans;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _plans = widget.plans.map((p) => LoanPlanEditData(
          id: p.id,
          amount: p.amount,
          dueDate: p.dueDate,
          note: p.note,
        )).toList();
  }

  void _addPlan() {
    HapticService.lightImpact();
    setState(() {
      final lastDate = _plans.isNotEmpty
          ? _plans.last.dueDate.add(const Duration(days: 30))
          : DateTime.now().add(const Duration(days: 30));
      _plans.add(LoanPlanEditData(
        amount: 0,
        dueDate: lastDate,
        note: '',
      ));
    });
  }

  void _removePlan(int index) {
    HapticService.lightImpact();
    setState(() {
      _plans.removeAt(index);
    });
  }

  void _generatePlans() async {
    HapticService.lightImpact();
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => const _GeneratePlansDialog(),
    );

    if (result != null) {
      final count = result['count'] as int;
      final amount = result['amount'] as int;
      final interval = result['interval'] as int; // 月数

      setState(() {
        _plans.clear();
        DateTime date = DateTime.now();
        for (int i = 0; i < count; i++) {
          date = DateTime(date.year, date.month + interval, date.day);
          _plans.add(LoanPlanEditData(
            amount: amount,
            dueDate: date,
            note: '第 ${i + 1} 期',
          ));
        }
      });
    }
  }

  void _savePlans() {
    if (_formKey.currentState!.validate()) {
      HapticService.mediumImpact();
      widget.onSave(_plans);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('yyyy-MM-dd');

    return Scaffold(
      appBar: AppBar(
        title: const Text('还款计划配置'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _savePlans,
            child: const Text('保存'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // 操作按钮
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _generatePlans,
                      icon: const Icon(Icons.auto_fix_high),
                      label: const Text('自动生成'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _addPlan,
                      icon: const Icon(Icons.add),
                      label: const Text('添加一期'),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // 计划列表
            Expanded(
              child: _plans.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event_note_outlined,
                            size: 72,
                            color: theme.colorScheme.onSurfaceVariant.withAlpha(128),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '暂无还款计划',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '点击上方按钮添加或自动生成',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant.withAlpha(180),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ReorderableListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _plans.length,
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          if (newIndex > oldIndex) {
                            newIndex -= 1;
                          }
                          final plan = _plans.removeAt(oldIndex);
                          _plans.insert(newIndex, plan);
                        });
                      },
                      itemBuilder: (context, index) {
                        final plan = _plans[index];
                        return Card(
                          key: ValueKey(plan.hashCode),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: theme.colorScheme.primaryContainer,
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: theme.colorScheme.onPrimaryContainer,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        '第 ${index + 1} 期',
                                        style: theme.textTheme.titleSmall,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => _removePlan(index),
                                      icon: Icon(
                                        Icons.delete_outline,
                                        color: theme.colorScheme.error,
                                      ),
                                      tooltip: '删除',
                                    ),
                                    const Icon(Icons.drag_handle),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        initialValue: plan.amount > 0 ? plan.amount.toString() : '',
                                        decoration: const InputDecoration(
                                          labelText: '金额',
                                          isDense: true,
                                        ),
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          plan.amount = int.tryParse(value) ?? 0;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return '必填';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          final selected = await showDatePicker(
                                            context: context,
                                            initialDate: plan.dueDate,
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                          );
                                          if (selected != null) {
                                            setState(() {
                                              plan.dueDate = selected;
                                            });
                                          }
                                        },
                                        child: InputDecorator(
                                          decoration: const InputDecoration(
                                            labelText: '到期日',
                                            isDense: true,
                                          ),
                                          child: Text(dateFormat.format(plan.dueDate)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  initialValue: plan.note,
                                  decoration: const InputDecoration(
                                    labelText: '备注',
                                    isDense: true,
                                  ),
                                  onChanged: (value) {
                                    plan.note = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 自动生成计划对话框
class _GeneratePlansDialog extends StatefulWidget {
  const _GeneratePlansDialog();

  @override
  State<_GeneratePlansDialog> createState() => _GeneratePlansDialogState();
}

class _GeneratePlansDialogState extends State<_GeneratePlansDialog> {
  final _countController = TextEditingController(text: '12');
  final _amountController = TextEditingController();
  int _interval = 1; // 月

  @override
  void dispose() {
    _countController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('自动生成还款计划'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _countController,
            decoration: const InputDecoration(
              labelText: '期数',
              suffixText: '期',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(
              labelText: '每期金额',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            initialValue: _interval,
            decoration: const InputDecoration(
              labelText: '还款间隔',
            ),
            items: const [
              DropdownMenuItem(value: 1, child: Text('每月')),
              DropdownMenuItem(value: 2, child: Text('每两月')),
              DropdownMenuItem(value: 3, child: Text('每季度')),
              DropdownMenuItem(value: 6, child: Text('每半年')),
              DropdownMenuItem(value: 12, child: Text('每年')),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _interval = value;
                });
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: () {
            final count = int.tryParse(_countController.text);
            final amount = int.tryParse(_amountController.text);
            if (count != null && count > 0 && amount != null && amount > 0) {
              Navigator.pop(context, {
                'count': count,
                'amount': amount,
                'interval': _interval,
              });
            }
          },
          child: const Text('生成'),
        ),
      ],
    );
  }
}
