/// 账户表单页面
///
/// 根据账户类型动态展示不同的表单配置
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data.dart';
import '../../data/constants/account_types.dart';
import '../../data/constants/icon_data.dart';
import '../../providers/providers.dart';
import '../../providers/account_provider.dart';
import '../../utils/haptic_service.dart';
import '../common/app_icon_widget.dart';
import '../common/icon_picker_page.dart';

import 'forms/balance_account_form.dart';
import 'forms/credit_account_form.dart';
import 'forms/prepaid_account_form.dart';
import 'forms/loan_account_form.dart';
import 'forms/invest_account_form.dart';
import 'widgets/account_meta_editor.dart';

/// 账户表单页面
class AccountFormPage extends ConsumerStatefulWidget {
  /// 账户类型
  final AccountType accountType;

  /// 编辑的账户（null表示新增）
  final AccountEntity? editAccount;

  const AccountFormPage({
    super.key,
    required this.accountType,
    this.editAccount,
  });

  @override
  ConsumerState<AccountFormPage> createState() => _AccountFormPageState();
}

class _AccountFormPageState extends ConsumerState<AccountFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // 基础字段控制器
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _noteController;
  late TextEditingController _initialBalanceController;

  // 选中的图标
  AppIcon? _selectedIcon;

  // 选中的货币
  String _selectedCurrencyCode = 'CNY';

  // 系统级元数据
  Map<String, String> _systemMeta = {};

  // 自定义元数据
  Map<String, String> _customMeta = {};

  // 子表单的key
  final GlobalKey<BalanceAccountFormState> _balanceFormKey =
      GlobalKey<BalanceAccountFormState>();
  final GlobalKey<CreditAccountFormState> _creditFormKey =
      GlobalKey<CreditAccountFormState>();
  final GlobalKey<PrepaidAccountFormState> _prepaidFormKey =
      GlobalKey<PrepaidAccountFormState>();
  final GlobalKey<LoanAccountFormState> _loanFormKey =
      GlobalKey<LoanAccountFormState>();
  final GlobalKey<InvestAccountFormState> _investFormKey =
      GlobalKey<InvestAccountFormState>();

  bool get isEditing => widget.editAccount != null;

  AccountTypeInfo get typeInfo => getAccountTypeInfo(widget.accountType);

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.editAccount?.name);
    _descriptionController =
        TextEditingController(text: widget.editAccount?.description);
    _noteController = TextEditingController(text: widget.editAccount?.note);
    _initialBalanceController = TextEditingController();

    if (widget.editAccount != null) {
      _selectedCurrencyCode = widget.editAccount!.currencyCode;
      if (widget.editAccount!.icon.isNotEmpty) {
        _selectedIcon = AppIcon.fromString(widget.editAccount!.icon);
      }
      _loadAccountMeta();
    }
  }

  Future<void> _loadAccountMeta() async {
    if (widget.editAccount == null) return;

    final accountDao = ref.read(accountDaoProvider);
    final metaList = await accountDao.getAccountMeta(widget.editAccount!.accountId);

    final systemMeta = <String, String>{};
    final customMeta = <String, String>{};

    for (final meta in metaList) {
      if (meta.scope == AccountMetaScope.system) {
        systemMeta[meta.key] = meta.value;
      } else {
        customMeta[meta.key] = meta.value;
      }
    }

    // 设置初始余额
    if (systemMeta.containsKey(AccountMetaKeys.initialBalance)) {
      _initialBalanceController.text = systemMeta[AccountMetaKeys.initialBalance]!;
      systemMeta.remove(AccountMetaKeys.initialBalance);
    }

    setState(() {
      _systemMeta = systemMeta;
      _customMeta = customMeta;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _noteController.dispose();
    _initialBalanceController.dispose();
    super.dispose();
  }

  Future<void> _selectIcon() async {
    HapticService.lightImpact();
    final result = await Navigator.of(context).push<AppIcon>(
      MaterialPageRoute(
        builder: (_) => IconPickerPage(
          initialIcon: _selectedIcon,
          title: '选择账户图标',
          showFlags: false,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _selectedIcon = result;
      });
    }
  }

  Future<void> _selectCurrency() async {
    HapticService.lightImpact();
    final currenciesAsync = ref.read(allCurrenciesProvider);
    final currencies = currenciesAsync.value ?? [];

    // 根据账户类型过滤可用货币
    List<CurrencyEntity> availableCurrencies;
    if (typeInfo.supportsCustomCurrency) {
      availableCurrencies = currencies;
    } else {
      availableCurrencies = currencies
          .where((c) => c.source == CurrencySource.system)
          .toList();
    }

    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => _CurrencyPickerSheet(
        currencies: availableCurrencies,
        selectedCode: _selectedCurrencyCode,
      ),
    );

    if (selected != null) {
      setState(() {
        _selectedCurrencyCode = selected;
      });
    }
  }

  Future<void> _editMetadata() async {
    HapticService.lightImpact();
    final result = await Navigator.of(context).push<Map<String, Map<String, String>>>(
      MaterialPageRoute(
        builder: (_) => AccountMetaEditorPage(
          systemMeta: Map.from(_systemMeta),
          customMeta: Map.from(_customMeta),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _systemMeta = result['system'] ?? {};
        _customMeta = result['custom'] ?? {};
      });
    }
  }

  Future<void> _saveAccount() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      final accountService = ref.read(accountServiceProvider);
      final name = _nameController.text.trim();
      final description = _descriptionController.text.trim();
      final note = _noteController.text.trim();
      final icon = _selectedIcon?.toStorageString() ?? '';
      final initialBalance = _initialBalanceController.text.isNotEmpty
          ? int.tryParse(_initialBalanceController.text)
          : null;

      if (isEditing) {
        // 更新账户
        await _updateAccount();
      } else {
        // 创建新账户
        switch (widget.accountType) {
          case AccountType.balance:
            await accountService.createBalanceAccount(
              name: name,
              currencyCode: _selectedCurrencyCode,
              description: description,
              icon: icon,
              note: note,
              initialBalance: initialBalance,
              systemMeta: _systemMeta.isNotEmpty ? _systemMeta : null,
              customMeta: _customMeta.isNotEmpty ? _customMeta : null,
            );
            break;

          case AccountType.credit:
            final creditData = _creditFormKey.currentState?.getFormData();
            if (creditData == null) {
              throw Exception('信用账户配置无效');
            }
            await accountService.createCreditAccount(
              name: name,
              currencyCode: _selectedCurrencyCode,
              creditLimit: creditData.creditLimit,
              billingCycleDay: creditData.billingCycleDay,
              paymentDueDay: creditData.paymentDueDay,
              description: description,
              icon: icon,
              note: note,
              initialBalance: initialBalance,
              systemMeta: _systemMeta.isNotEmpty ? _systemMeta : null,
              customMeta: _customMeta.isNotEmpty ? _customMeta : null,
            );
            break;

          case AccountType.prepaid:
            final prepaidData = _prepaidFormKey.currentState?.getFormData();
            if (prepaidData == null) {
              throw Exception('预付款账户配置无效');
            }
            await accountService.createPrepaidAccount(
              name: name,
              currencyCode: _selectedCurrencyCode,
              description: description,
              icon: icon,
              note: note,
              initialBalance: initialBalance,
              enableBonus: prepaidData.enableBonus,
              bonusDeductMode: prepaidData.bonusDeductMode,
              bonusName: prepaidData.bonusName,
              bonusCurrencyCode: prepaidData.bonusCurrencyCode,
              bonusInitialBalance: prepaidData.bonusInitialBalance,
              systemMeta: _systemMeta.isNotEmpty ? _systemMeta : null,
              customMeta: _customMeta.isNotEmpty ? _customMeta : null,
            );
            break;

          case AccountType.loan:
            final loanData = _loanFormKey.currentState?.getFormData();
            if (loanData == null) {
              throw Exception('借贷账户配置无效');
            }
            await accountService.createLoanAccount(
              name: name,
              currencyCode: _selectedCurrencyCode,
              stakeholderId: loanData.stakeholderId,
              loanType: loanData.loanType,
              amount: loanData.amount,
              rate: loanData.rate,
              startDate: loanData.startDate,
              endDate: loanData.endDate,
              description: description,
              icon: icon,
              note: note,
              loanNote: loanData.loanNote,
              plans: loanData.plans,
              systemMeta: _systemMeta.isNotEmpty ? _systemMeta : null,
              customMeta: _customMeta.isNotEmpty ? _customMeta : null,
            );
            break;

          case AccountType.invest:
            final investData = _investFormKey.currentState?.getFormData();
            if (investData == null) {
              throw Exception('投资账户配置无效');
            }
            await accountService.createInvestAccount(
              name: name,
              currencyCode: _selectedCurrencyCode,
              investType: investData.investType,
              investCode: investData.investCode,
              description: description,
              icon: icon,
              note: note,
              initialBalance: initialBalance,
              systemMeta: _systemMeta.isNotEmpty ? _systemMeta : null,
              customMeta: _customMeta.isNotEmpty ? _customMeta : null,
            );
            break;

          case AccountType.bonus:
            // 赠送金账户不允许直接创建
            throw Exception('赠送金账户不允许直接创建');
        }
      }

      // 刷新账户列表
      ref.invalidate(groupedAccountsProvider);
      ref.invalidate(allAccountsProvider);

      if (mounted) {
        HapticService.mediumImpact();
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEditing ? '账户已更新' : '账户已创建'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        HapticService.heavyImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('保存失败：$e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _updateAccount() async {
    if (widget.editAccount == null) return;

    final accountService = ref.read(accountServiceProvider);
    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();
    final note = _noteController.text.trim();
    final icon = _selectedIcon?.toStorageString() ?? '';

    // 更新基础账户信息
    final updatedAccount = widget.editAccount!.copyWith(
      name: name,
      description: description,
      icon: icon,
      currencyCode: _selectedCurrencyCode,
      note: note,
    );
    await accountService.updateAccount(updatedAccount);

    // 更新初始余额元数据
    final initialBalance = _initialBalanceController.text.isNotEmpty
        ? int.tryParse(_initialBalanceController.text)
        : null;
    if (initialBalance != null) {
      await accountService.updateAccountMeta(
        accountId: widget.editAccount!.accountId,
        scope: AccountMetaScope.system,
        key: AccountMetaKeys.initialBalance,
        value: initialBalance.toString(),
      );
    }

    // 根据账户类型更新特定数据
    switch (widget.accountType) {
      case AccountType.credit:
        final creditData = _creditFormKey.currentState?.getFormData();
        if (creditData != null) {
          final creditAccount = CreditAccountEntity(
            accountId: widget.editAccount!.accountId,
            creditLimit: creditData.creditLimit,
            billingCycleDay: creditData.billingCycleDay,
            paymentDueDay: creditData.paymentDueDay,
          );
          await accountService.updateCreditAccount(creditAccount);
        }
        break;

      case AccountType.loan:
        final loanData = _loanFormKey.currentState?.getFormData();
        if (loanData != null) {
          final existingLoan = await ref.read(accountDaoProvider).getLoanAccount(
                widget.editAccount!.accountId,
              );
          if (existingLoan != null) {
            final updatedLoan = existingLoan.copyWith(
              stakeholderId: loanData.stakeholderId,
              type: loanData.loanType,
              amount: loanData.amount,
              rate: loanData.rate,
              startDate: loanData.startDate,
              endDate: loanData.endDate,
              note: loanData.loanNote,
            );
            await accountService.updateLoanAccount(updatedLoan);
          }
        }
        break;

      case AccountType.invest:
        final investData = _investFormKey.currentState?.getFormData();
        if (investData != null) {
          await accountService.updateAccountMeta(
            accountId: widget.editAccount!.accountId,
            scope: AccountMetaScope.system,
            key: AccountMetaKeys.investType,
            value: investData.investType.name,
          );
          if (investData.investCode != null && investData.investCode!.isNotEmpty) {
            await accountService.updateAccountMeta(
              accountId: widget.editAccount!.accountId,
              scope: AccountMetaScope.system,
              key: AccountMetaKeys.investCode,
              value: investData.investCode!,
            );
          }
        }
        break;

      default:
        break;
    }

    // 更新系统级元数据
    for (final entry in _systemMeta.entries) {
      await accountService.updateAccountMeta(
        accountId: widget.editAccount!.accountId,
        scope: AccountMetaScope.system,
        key: entry.key,
        value: entry.value,
      );
    }

    // 更新自定义元数据
    for (final entry in _customMeta.entries) {
      await accountService.updateAccountMeta(
        accountId: widget.editAccount!.accountId,
        scope: AccountMetaScope.custom,
        key: entry.key,
        value: entry.value,
      );
    }
  }

  Future<void> _deleteAccount() async {
    if (widget.editAccount == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除账户'),
        content: Text('确定要删除账户"${widget.editAccount!.name}"吗？\n\n此操作不可撤销，相关的交易记录将保留但不再关联此账户。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isLoading = true);

    try {
      final accountService = ref.read(accountServiceProvider);
      await accountService.deleteAccount(widget.editAccount!.accountId);

      ref.invalidate(groupedAccountsProvider);
      ref.invalidate(allAccountsProvider);

      if (mounted) {
        HapticService.mediumImpact();
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('账户已删除')),
        );
      }
    } catch (e) {
      if (mounted) {
        HapticService.heavyImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('删除失败：$e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? '编辑${typeInfo.name}' : '新建${typeInfo.name}'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _isLoading ? null : _saveAccount,
            icon: const Icon(Icons.save_outlined),
            tooltip: '保存',
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 账户类型提示卡片
            Card(
              color: theme.colorScheme.primaryContainer.withAlpha(100),
              child: ListTile(
                leading: Icon(typeInfo.icon, color: theme.colorScheme.primary),
                title: Text(typeInfo.name),
                subtitle: Text(typeInfo.description),
              ),
            ),
            const SizedBox(height: 24),

            // 图标选择
            Center(
              child: InkWell(
                onTap: _selectIcon,
                borderRadius: BorderRadius.circular(48),
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.outline.withAlpha(100),
                      width: 2,
                    ),
                  ),
                  child: _selectedIcon != null
                      ? Center(
                          child: AppIconWidget(icon: _selectedIcon!, size: 48),
                        )
                      : Icon(
                          typeInfo.icon,
                          size: 48,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                ),
              ),
            ),
            Center(
              child: TextButton.icon(
                onPressed: _selectIcon,
                icon: const Icon(Icons.edit, size: 16),
                label: const Text('选择图标'),
              ),
            ),
            const SizedBox(height: 16),

            // 账户名称
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '账户名称 *',
                hintText: '请输入账户名称',
                prefixIcon: Icon(Icons.badge_outlined),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请输入账户名称';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 货币选择
            InkWell(
              onTap: _selectCurrency,
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: '账户货币 *',
                  prefixIcon: Icon(Icons.currency_exchange),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_selectedCurrencyCode),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            if (typeInfo.supportsCustomCurrency)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 16),
                child: Text(
                  '此类型账户支持自定义货币',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            const SizedBox(height: 16),

            // 初始余额
            TextFormField(
              controller: _initialBalanceController,
              decoration: InputDecoration(
                labelText: '初始余额',
                hintText: '创建时的初始金额',
                prefixIcon: const Icon(Icons.account_balance_wallet_outlined),
                suffixText: _selectedCurrencyCode,
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
            ),
            const SizedBox(height: 16),

            // 账户描述
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '账户描述',
                hintText: '可选，简短描述此账户',
                prefixIcon: Icon(Icons.description_outlined),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 24),

            // 根据账户类型显示额外配置
            _buildTypeSpecificForm(),

            // 元数据编辑入口
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _editMetadata,
              icon: const Icon(Icons.tune),
              label: Text(_systemMeta.isEmpty && _customMeta.isEmpty
                  ? '添加扩展信息'
                  : '编辑扩展信息 (${_systemMeta.length + _customMeta.length})'),
            ),
            const SizedBox(height: 16),

            // 备注
            TextFormField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: '备注',
                hintText: '可选，添加备注信息',
                prefixIcon: Icon(Icons.notes),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 32),

            // 删除按钮（仅编辑模式）
            if (isEditing)
              OutlinedButton.icon(
                onPressed: _isLoading ? null : _deleteAccount,
                icon: const Icon(Icons.delete_outline),
                label: const Text('删除账户'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                  side: BorderSide(color: theme.colorScheme.error),
                ),
              ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeSpecificForm() {
    switch (widget.accountType) {
      case AccountType.balance:
        return BalanceAccountForm(
          key: _balanceFormKey,
          editAccount: widget.editAccount,
          systemMeta: _systemMeta,
        );

      case AccountType.credit:
        return CreditAccountForm(
          key: _creditFormKey,
          editAccountId: widget.editAccount?.accountId,
        );

      case AccountType.prepaid:
        return PrepaidAccountForm(
          key: _prepaidFormKey,
          editAccountId: widget.editAccount?.accountId,
          selectedCurrencyCode: _selectedCurrencyCode,
        );

      case AccountType.loan:
        return LoanAccountForm(
          key: _loanFormKey,
          editAccountId: widget.editAccount?.accountId,
        );

      case AccountType.invest:
        return InvestAccountForm(
          key: _investFormKey,
          editAccountId: widget.editAccount?.accountId,
          selectedCurrencyCode: _selectedCurrencyCode,
        );

      case AccountType.bonus:
        // 赠送金账户不应该有独立表单
        return const SizedBox.shrink();
    }
  }
}

/// 货币选择底部弹窗
class _CurrencyPickerSheet extends StatelessWidget {
  final List<CurrencyEntity> currencies;
  final String selectedCode;

  const _CurrencyPickerSheet({
    required this.currencies,
    required this.selectedCode,
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
                      '选择货币',
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
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  final currency = currencies[index];
                  final isSelected = currency.currencyCode == selectedCode;

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.surfaceContainerHighest,
                      child: Text(
                        currency.symbol,
                        style: TextStyle(
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    title: Text(currency.name),
                    subtitle: Text(currency.currencyCode),
                    trailing: isSelected
                        ? Icon(
                            Icons.check_circle,
                            color: theme.colorScheme.primary,
                          )
                        : null,
                    onTap: () {
                      HapticService.selectionClick();
                      Navigator.pop(context, currency.currencyCode);
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
}
