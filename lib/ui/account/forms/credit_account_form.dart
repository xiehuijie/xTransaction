/// 信用账户表单组件
///
/// 信用账户需要配置额度、账单日、还款日
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data.dart';
import '../../../providers/providers.dart';

/// 信用账户表单数据
class CreditAccountFormData {
  /// 信用额度（以最小货币单位存储）
  final int creditLimit;

  /// 账单日（1-28）
  final int billingCycleDay;

  /// 还款日（1-28）
  final int paymentDueDay;

  const CreditAccountFormData({
    required this.creditLimit,
    required this.billingCycleDay,
    required this.paymentDueDay,
  });
}

/// 信用账户表单
class CreditAccountForm extends ConsumerStatefulWidget {
  /// 编辑的账户ID
  final int? editAccountId;

  const CreditAccountForm({
    super.key,
    this.editAccountId,
  });

  @override
  ConsumerState<CreditAccountForm> createState() => CreditAccountFormState();
}

class CreditAccountFormState extends ConsumerState<CreditAccountForm> {
  /// 信用额度
  late TextEditingController _creditLimitController;

  /// 账单日
  int _billingCycleDay = 1;

  /// 还款日
  int _paymentDueDay = 20;

  /// 银行卡号
  late TextEditingController _bankCardNumberController;

  /// 银行名称
  late TextEditingController _bankNameController;

  /// 卡片有效期
  late TextEditingController _cardExpiryController;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _creditLimitController = TextEditingController();
    _bankCardNumberController = TextEditingController();
    _bankNameController = TextEditingController();
    _cardExpiryController = TextEditingController();

    if (widget.editAccountId != null) {
      _loadExistingData();
    } else {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadExistingData() async {
    try {
      final accountDao = ref.read(accountDaoProvider);

      // 加载信用账户详情
      final creditAccount =
          await accountDao.getCreditAccount(widget.editAccountId!);
      if (creditAccount != null) {
        _creditLimitController.text = creditAccount.creditLimit.toString();
        _billingCycleDay = creditAccount.billingCycleDay;
        _paymentDueDay = creditAccount.paymentDueDay;
      }

      // 加载账户元数据
      final metaList = await accountDao.getAccountMeta(widget.editAccountId!);
      for (final meta in metaList) {
        if (meta.scope == AccountMetaScope.system) {
          switch (meta.key) {
            case AccountMetaKeys.bankCardNumber:
              _bankCardNumberController.text = meta.value;
              break;
            case AccountMetaKeys.bankName:
              _bankNameController.text = meta.value;
              break;
            case AccountMetaKeys.cardExpiry:
              _cardExpiryController.text = meta.value;
              break;
          }
        }
      }
    } catch (e) {
      debugPrint('加载信用账户数据失败: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _creditLimitController.dispose();
    _bankCardNumberController.dispose();
    _bankNameController.dispose();
    _cardExpiryController.dispose();
    super.dispose();
  }

  /// 获取表单数据
  CreditAccountFormData? getFormData() {
    final creditLimit = int.tryParse(_creditLimitController.text);
    if (creditLimit == null || creditLimit <= 0) {
      return null;
    }

    return CreditAccountFormData(
      creditLimit: creditLimit,
      billingCycleDay: _billingCycleDay,
      paymentDueDay: _paymentDueDay,
    );
  }

  /// 获取系统元数据
  Map<String, String> getSystemMeta() {
    final meta = <String, String>{};
    if (_bankCardNumberController.text.isNotEmpty) {
      meta[AccountMetaKeys.bankCardNumber] = _bankCardNumberController.text;
    }
    if (_bankNameController.text.isNotEmpty) {
      meta[AccountMetaKeys.bankName] = _bankNameController.text;
    }
    if (_cardExpiryController.text.isNotEmpty) {
      meta[AccountMetaKeys.cardExpiry] = _cardExpiryController.text;
    }
    return meta;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
        // 信用账户配置
        Text(
          '信用账户配置',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '设置信用额度和还款周期',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),

        // 信用额度
        TextFormField(
          controller: _creditLimitController,
          decoration: const InputDecoration(
            labelText: '信用额度 *',
            hintText: '请输入信用额度',
            prefixIcon: Icon(Icons.monetization_on_outlined),
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '请输入信用额度';
            }
            final limit = int.tryParse(value);
            if (limit == null || limit <= 0) {
              return '请输入有效的额度';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // 账单日选择
        _buildDayPicker(
          context,
          label: '账单日',
          value: _billingCycleDay,
          onChanged: (day) => setState(() => _billingCycleDay = day),
          icon: Icons.calendar_today,
          description: '每月生成账单的日期',
        ),
        const SizedBox(height: 16),

        // 还款日选择
        _buildDayPicker(
          context,
          label: '还款日',
          value: _paymentDueDay,
          onChanged: (day) => setState(() => _paymentDueDay = day),
          icon: Icons.event,
          description: '每月还款截止日期',
        ),
        const SizedBox(height: 24),

        // 银行卡信息（可选）
        Text(
          '银行卡信息（可选）',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),

        // 银行名称
        TextFormField(
          controller: _bankNameController,
          decoration: const InputDecoration(
            labelText: '发卡银行',
            hintText: '如：招商银行',
            prefixIcon: Icon(Icons.account_balance),
          ),
        ),
        const SizedBox(height: 12),

        // 银行卡号
        TextFormField(
          controller: _bankCardNumberController,
          decoration: const InputDecoration(
            labelText: '卡号',
            hintText: '请输入信用卡号',
            prefixIcon: Icon(Icons.credit_card),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),

        // 有效期
        TextFormField(
          controller: _cardExpiryController,
          decoration: const InputDecoration(
            labelText: '有效期',
            hintText: '如：12/28',
            prefixIcon: Icon(Icons.date_range),
          ),
        ),
      ],
    );
  }

  Widget _buildDayPicker(
    BuildContext context, {
    required String label,
    required int value,
    required void Function(int) onChanged,
    required IconData icon,
    String? description,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async {
            final selected = await showModalBottomSheet<int>(
              context: context,
              builder: (context) => _DayPickerSheet(
                title: label,
                selectedDay: value,
              ),
            );
            if (selected != null) {
              onChanged(selected);
            }
          },
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: '$label *',
              prefixIcon: Icon(icon),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('每月 $value 日'),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16),
            child: Text(
              description,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }
}

/// 日期选择底部弹窗
class _DayPickerSheet extends StatelessWidget {
  final String title;
  final int selectedDay;

  const _DayPickerSheet({
    required this.title,
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 400,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '选择$title',
                  style: theme.textTheme.titleLarge,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: 28,
              itemBuilder: (context, index) {
                final day = index + 1;
                final isSelected = day == selectedDay;

                return InkWell(
                  onTap: () => Navigator.pop(context, day),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$day',
                      style: TextStyle(
                        color: isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurface,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
