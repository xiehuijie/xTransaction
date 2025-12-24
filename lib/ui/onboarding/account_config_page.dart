/// 多账户预配置页面
///
/// 初始化流程的第二步，配置多账户功能

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/constants/account_types.dart';
import '../../data/constants/currency_data.dart';
import '../../data/database/tables.dart';
import '../common/icon_picker_page.dart';
import '../common/app_icon_widget.dart';
import '../../data/constants/icon_data.dart';
import 'onboarding_state.dart';

/// 账户预配置页面
class AccountConfigPage extends ConsumerWidget {
  const AccountConfigPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('账户配置'), centerTitle: true),
      body: Column(
        children: [
          // 说明
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      state.accounts.isNotEmpty
                          ? Icons.check_circle
                          : Icons.info_outline,
                      size: 18,
                      color: state.accounts.isNotEmpty
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '至少需要一个账户才能继续。当前有 ${state.accounts.length} 个账户。',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // 账户列表
          Expanded(
            child: state.accounts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          size: 64,
                          color: theme.colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '暂无账户',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '点击下方按钮添加账户',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  )
                : ReorderableListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: state.accounts.length,
                    onReorder: (oldIndex, newIndex) {
                      // TODO: 实现排序功能
                    },
                    itemBuilder: (context, index) {
                      final account = state.accounts[index];
                      final typeInfo = getAccountTypeInfo(account.type);
                      final currency = findCurrencyByCode(account.currencyCode);

                      return Card(
                        key: ValueKey(index),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: account.icon != null
                              ? AppIconWidget.fromString(
                                  account.icon!,
                                  size: 24,
                                  showBackground: true,
                                )
                              : CircleAvatar(
                                  backgroundColor:
                                      theme.colorScheme.primaryContainer,
                                  child: Icon(
                                    typeInfo.icon,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                ),
                          title: Text(account.name),
                          subtitle: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  typeInfo.name,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color:
                                        theme.colorScheme.onSecondaryContainer,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                currency?.nameCN ?? account.currencyCode,
                                style: theme.textTheme.bodySmall,
                              ),
                              if (account.initialBalance != 0) ...[
                                const SizedBox(width: 8),
                                Text(
                                  '初始: ${_formatAmount(account.initialBalance, currency?.decimal ?? 2)}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.outline,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          trailing: PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'edit') {
                                _editAccount(context, ref, account, index);
                              } else if (value == 'delete') {
                                _confirmDelete(context, ref, index);
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    Icon(Icons.edit_outlined),
                                    SizedBox(width: 12),
                                    Text('编辑'),
                                  ],
                                ),
                              ),
                              if (state.accounts.length > 1)
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete_outline),
                                      SizedBox(width: 12),
                                      Text('删除'),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // 添加按钮
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton.icon(
              onPressed: () => _showAccountTypeSelector(context, ref),
              icon: const Icon(Icons.add),
              label: const Text('添加账户'),
            ),
          ),
        ],
      ),
    );
  }

  String _formatAmount(int amount, int decimal) {
    final value = amount / (decimal > 0 ? (10 * decimal) : 1);
    return value.toStringAsFixed(decimal);
  }

  void _showAccountTypeSelector(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _AccountTypeSelectorSheet(
        onSelect: (type) {
          Navigator.of(context).pop();
          _showAccountEditor(context, ref, type, null, -1);
        },
      ),
    );
  }

  void _editAccount(
    BuildContext context,
    WidgetRef ref,
    PreConfigAccount account,
    int index,
  ) {
    _showAccountEditor(context, ref, account.type, account, index);
  }

  void _showAccountEditor(
    BuildContext context,
    WidgetRef ref,
    AccountType type,
    PreConfigAccount? account,
    int index,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AccountEditorPage(
          type: type,
          account: account,
          onSave: (newAccount) {
            if (index < 0) {
              ref.read(onboardingProvider.notifier).addAccount(newAccount);
            } else {
              ref
                  .read(onboardingProvider.notifier)
                  .updateAccount(index, newAccount);
            }
          },
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除账户'),
        content: const Text('确定要删除这个账户吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              ref.read(onboardingProvider.notifier).removeAccount(index);
              Navigator.of(context).pop();
            },
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}

/// 账户类型选择器
class _AccountTypeSelectorSheet extends StatelessWidget {
  final void Function(AccountType) onSelect;

  const _AccountTypeSelectorSheet({required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('选择账户类型', style: theme.textTheme.titleLarge),
          ),
          const Divider(height: 1),
          ...creatableAccountTypes.map((type) {
            final info = getAccountTypeInfo(type);
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  info.icon,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              title: Text(info.name),
              subtitle: Text(info.description),
              onTap: () => onSelect(type),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// 账户编辑页面
class AccountEditorPage extends ConsumerStatefulWidget {
  final AccountType type;
  final PreConfigAccount? account;
  final void Function(PreConfigAccount) onSave;

  const AccountEditorPage({
    super.key,
    required this.type,
    this.account,
    required this.onSave,
  });

  @override
  ConsumerState<AccountEditorPage> createState() => _AccountEditorPageState();
}

class _AccountEditorPageState extends ConsumerState<AccountEditorPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _initialBalanceController;

  String? _currencyCode;
  String? _icon;

  // 信用账户字段
  late TextEditingController _creditLimitController;
  int _billingCycleDay = 1;
  int _paymentDueDay = 20;

  // 预付账户字段
  bool _enableBonus = false;
  String _bonusDeductMode = 'first';
  late TextEditingController _bonusInitialBalanceController;

  // 投资账户字段
  InvestType _investType = InvestType.stock;
  late TextEditingController _investCodeController;

  // 借贷账户字段
  AccountLoanType _loanType = AccountLoanType.borrow;
  late TextEditingController _loanAmountController;
  late TextEditingController _loanRateController;

  @override
  void initState() {
    super.initState();
    final account = widget.account;

    _nameController = TextEditingController(text: account?.name);
    _descriptionController = TextEditingController(text: account?.description);
    _initialBalanceController = TextEditingController(
      text: account?.initialBalance != 0
          ? (account!.initialBalance / 100).toString()
          : '',
    );

    _currencyCode = account?.currencyCode;
    _icon = account?.icon;

    // 信用账户
    _creditLimitController = TextEditingController(
      text: account?.creditLimit != null
          ? (account!.creditLimit! / 100).toString()
          : '',
    );
    _billingCycleDay = account?.billingCycleDay ?? 1;
    _paymentDueDay = account?.paymentDueDay ?? 20;

    // 预付账户
    _enableBonus = account?.enableBonus ?? false;
    _bonusDeductMode = account?.bonusDeductMode ?? 'first';
    _bonusInitialBalanceController = TextEditingController(
      text: account?.bonusInitialBalance != null
          ? (account!.bonusInitialBalance! / 100).toString()
          : '',
    );

    // 投资账户
    _investType = account?.investType ?? InvestType.stock;
    _investCodeController = TextEditingController(text: account?.investCode);

    // 借贷账户
    _loanType = account?.loanType ?? AccountLoanType.borrow;
    _loanAmountController = TextEditingController(
      text: account?.loanAmount != null
          ? (account!.loanAmount! / 100).toString()
          : '',
    );
    _loanRateController = TextEditingController(
      text: account?.loanRate?.toString() ?? '',
    );
  }

  bool _didInitCurrency = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 在第一次 didChangeDependencies 时初始化货币代码
    if (!_didInitCurrency && _currencyCode == null) {
      _didInitCurrency = true;
      final state = ref.read(onboardingProvider);
      final typeInfo = getAccountTypeInfo(widget.type);

      // 获取可用货币列表
      List<PreConfigCurrency> availableCurrencies;
      if (typeInfo.supportsCustomCurrency) {
        availableCurrencies = state.allAvailableCurrencies;
      } else {
        availableCurrencies = state.availableCurrencies
            .map((code) => findCurrencyByCode(code))
            .where((c) => c != null)
            .map((c) => PreConfigCurrency.fromTemplate(c!))
            .toList();
      }

      // 设置默认货币
      if (availableCurrencies.isNotEmpty) {
        if (state.defaultCurrency != null &&
            availableCurrencies.any(
              (c) => c.currencyCode == state.defaultCurrency,
            )) {
          _currencyCode = state.defaultCurrency;
        } else {
          _currencyCode = availableCurrencies.first.currencyCode;
        }
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _initialBalanceController.dispose();
    _creditLimitController.dispose();
    _bonusInitialBalanceController.dispose();
    _investCodeController.dispose();
    _loanAmountController.dispose();
    _loanRateController.dispose();
    super.dispose();
  }

  bool get _isValid => _nameController.text.isNotEmpty && _currencyCode != null;

  int _parseAmount(String text, int decimal) {
    if (text.isEmpty) return 0;
    final value = double.tryParse(text) ?? 0;
    return (value * (decimal > 0 ? (10 * decimal) : 1)).round();
  }

  void _save() {
    if (!_isValid || _currencyCode == null) return;

    final currency = findCurrencyByCode(_currencyCode!);
    final decimal = currency?.decimal ?? 2;

    final account = PreConfigAccount(
      name: _nameController.text,
      currencyCode: _currencyCode!,
      type: widget.type,
      icon: _icon,
      description: _descriptionController.text,
      initialBalance: _parseAmount(_initialBalanceController.text, decimal),
      creditLimit: widget.type == AccountType.credit
          ? _parseAmount(_creditLimitController.text, decimal)
          : null,
      billingCycleDay: widget.type == AccountType.credit
          ? _billingCycleDay
          : null,
      paymentDueDay: widget.type == AccountType.credit ? _paymentDueDay : null,
      enableBonus: widget.type == AccountType.prepaid ? _enableBonus : false,
      bonusDeductMode: widget.type == AccountType.prepaid && _enableBonus
          ? _bonusDeductMode
          : null,
      bonusInitialBalance: widget.type == AccountType.prepaid && _enableBonus
          ? _parseAmount(_bonusInitialBalanceController.text, decimal)
          : null,
      investType: widget.type == AccountType.invest ? _investType : null,
      investCode: widget.type == AccountType.invest
          ? _investCodeController.text.isNotEmpty
                ? _investCodeController.text
                : null
          : null,
      loanType: widget.type == AccountType.loan ? _loanType : null,
      loanAmount: widget.type == AccountType.loan
          ? _parseAmount(_loanAmountController.text, decimal)
          : null,
      loanRate: widget.type == AccountType.loan
          ? int.tryParse(_loanRateController.text)
          : null,
    );

    widget.onSave(account);
    Navigator.of(context).pop();
  }

  Future<void> _pickIcon() async {
    final result = await Navigator.of(context).push<AppIcon>(
      MaterialPageRoute(
        builder: (_) => IconPickerPage(
          initialIcon: _icon != null ? AppIcon.fromString(_icon!) : null,
          title: '选择账户图标',
        ),
      ),
    );
    if (result != null) {
      setState(() => _icon = result.toStorageString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingProvider);
    final typeInfo = getAccountTypeInfo(widget.type);

    // 可用货币列表
    List<PreConfigCurrency> availableCurrencies;
    if (typeInfo.supportsCustomCurrency) {
      availableCurrencies = state.allAvailableCurrencies;
    } else {
      availableCurrencies = state.availableCurrencies
          .map((code) => findCurrencyByCode(code))
          .where((c) => c != null)
          .map((c) => PreConfigCurrency.fromTemplate(c!))
          .toList();
    }

    // 确保 currencyCode 在可用列表中
    String? effectiveCurrencyCode = _currencyCode;
    if (effectiveCurrencyCode == null ||
        !availableCurrencies.any(
          (c) => c.currencyCode == effectiveCurrencyCode,
        )) {
      if (availableCurrencies.isNotEmpty) {
        effectiveCurrencyCode = state.defaultCurrency;
        // 再次检查默认货币是否在列表中
        if (effectiveCurrencyCode == null ||
            !availableCurrencies.any(
              (c) => c.currencyCode == effectiveCurrencyCode,
            )) {
          effectiveCurrencyCode = availableCurrencies.first.currencyCode;
        }
        // 使用 addPostFrameCallback 来更新状态
        if (_currencyCode != effectiveCurrencyCode) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() => _currencyCode = effectiveCurrencyCode);
            }
          });
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.account == null ? '添加${typeInfo.name}' : '编辑${typeInfo.name}',
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _isValid ? _save : null,
            child: const Text('保存'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 图标和名称
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIconButton(
                icon: _icon != null ? AppIcon.fromString(_icon!) : null,
                size: 72,
                onTap: _pickIcon,
                hintText: '图标',
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: '账户名称',
                        hintText: '如: 工商银行储蓄卡',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 货币选择
          if (availableCurrencies.isNotEmpty)
            DropdownButtonFormField<String>(
              value: effectiveCurrencyCode,
              decoration: const InputDecoration(
                labelText: '账户货币',
                border: OutlineInputBorder(),
              ),
              items: availableCurrencies
                  .map(
                    (c) => DropdownMenuItem(
                      value: c.currencyCode,
                      child: Text('${c.name} (${c.currencyCode})'),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _currencyCode = value);
                }
              },
            )
          else
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.error),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '请先配置可用货币',
                style: TextStyle(color: theme.colorScheme.error),
              ),
            ),
          const SizedBox(height: 16),

          // 初始余额
          TextField(
            controller: _initialBalanceController,
            decoration: InputDecoration(
              labelText: '初始余额',
              hintText: '0.00',
              border: const OutlineInputBorder(),
              prefixText: effectiveCurrencyCode != null
                  ? (findCurrencyByCode(effectiveCurrencyCode)?.symbol ?? '')
                  : '',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 16),

          // 账户描述
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: '账户描述（可选）',
              border: OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 24),

          // 根据账户类型显示额外字段
          ..._buildTypeSpecificFields(theme, effectiveCurrencyCode),
        ],
      ),
    );
  }

  List<Widget> _buildTypeSpecificFields(ThemeData theme, String? currencyCode) {
    switch (widget.type) {
      case AccountType.credit:
        return _buildCreditFields(theme, currencyCode);
      case AccountType.prepaid:
        return _buildPrepaidFields(theme, currencyCode);
      case AccountType.invest:
        return _buildInvestFields(theme);
      case AccountType.loan:
        return _buildLoanFields(theme, currencyCode);
      default:
        return [];
    }
  }

  List<Widget> _buildCreditFields(ThemeData theme, String? currencyCode) {
    return [
      Text(
        '信用账户设置',
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16),
      TextField(
        controller: _creditLimitController,
        decoration: InputDecoration(
          labelText: '信用额度',
          border: const OutlineInputBorder(),
          prefixText: currencyCode != null
              ? (findCurrencyByCode(currencyCode)?.symbol ?? '')
              : '',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
      ),
      const SizedBox(height: 16),
      Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<int>(
              value: _billingCycleDay,
              decoration: const InputDecoration(
                labelText: '账单日',
                border: OutlineInputBorder(),
              ),
              items: List.generate(
                28,
                (i) =>
                    DropdownMenuItem(value: i + 1, child: Text('每月${i + 1}日')),
              ),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _billingCycleDay = value);
                }
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DropdownButtonFormField<int>(
              value: _paymentDueDay,
              decoration: const InputDecoration(
                labelText: '还款日',
                border: OutlineInputBorder(),
              ),
              items: List.generate(
                28,
                (i) =>
                    DropdownMenuItem(value: i + 1, child: Text('每月${i + 1}日')),
              ),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _paymentDueDay = value);
                }
              },
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildPrepaidFields(ThemeData theme, String? currencyCode) {
    return [
      Text(
        '预付账户设置',
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16),
      SwitchListTile(
        title: const Text('启用赠送金账户'),
        subtitle: const Text('为此预付账户关联一个赠送金账户'),
        value: _enableBonus,
        onChanged: (value) {
          setState(() => _enableBonus = value);
        },
        contentPadding: EdgeInsets.zero,
      ),
      if (_enableBonus) ...[
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _bonusDeductMode,
          decoration: const InputDecoration(
            labelText: '赠送金扣减方式',
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(value: 'first', child: Text('优先使用赠送金')),
            DropdownMenuItem(value: 'last', child: Text('最后使用赠送金')),
            DropdownMenuItem(value: 'same', child: Text('等比例扣减')),
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() => _bonusDeductMode = value);
            }
          },
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _bonusInitialBalanceController,
          decoration: InputDecoration(
            labelText: '赠送金初始余额',
            border: const OutlineInputBorder(),
            prefixText: currencyCode != null
                ? (findCurrencyByCode(currencyCode)?.symbol ?? '')
                : '',
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
      ],
    ];
  }

  List<Widget> _buildInvestFields(ThemeData theme) {
    return [
      Text(
        '投资账户设置',
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16),
      DropdownButtonFormField<InvestType>(
        value: _investType,
        decoration: const InputDecoration(
          labelText: '投资类型',
          border: OutlineInputBorder(),
        ),
        items: InvestType.values
            .map(
              (type) => DropdownMenuItem(
                value: type,
                child: Text(investTypeNames[type] ?? type.name),
              ),
            )
            .toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() => _investType = value);
          }
        },
      ),
      const SizedBox(height: 16),
      TextField(
        controller: _investCodeController,
        decoration: InputDecoration(
          labelText: '投资代码（可选）',
          hintText: _investType == InvestType.stock
              ? '如: AAPL, 600519'
              : _investType == InvestType.crypto
              ? '如: BTC, ETH'
              : '输入投资标的代码',
          border: const OutlineInputBorder(),
          helperText: '填写代码后可自动同步价格（需联网）',
        ),
      ),
    ];
  }

  List<Widget> _buildLoanFields(ThemeData theme, String? currencyCode) {
    return [
      Text(
        '借贷账户设置',
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16),
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
        onSelectionChanged: (value) {
          setState(() => _loanType = value.first);
        },
      ),
      const SizedBox(height: 16),
      TextField(
        controller: _loanAmountController,
        decoration: InputDecoration(
          labelText: '借贷金额',
          border: const OutlineInputBorder(),
          prefixText: currencyCode != null
              ? (findCurrencyByCode(currencyCode)?.symbol ?? '')
              : '',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
      ),
      const SizedBox(height: 16),
      TextField(
        controller: _loanRateController,
        decoration: const InputDecoration(
          labelText: '年化利率（基点）',
          hintText: '如: 500 表示 5%',
          border: OutlineInputBorder(),
          suffixText: '基点',
        ),
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 16),
      OutlinedButton.icon(
        onPressed: () {
          // TODO: 实现借贷计划配置
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('借贷计划配置功能开发中...')));
        },
        icon: const Icon(Icons.calendar_month),
        label: const Text('配置还款计划'),
      ),
    ];
  }
}
