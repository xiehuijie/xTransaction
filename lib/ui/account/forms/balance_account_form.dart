/// 余额账户表单组件
///
/// 余额账户是最基础的账户类型，配置项最少
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data.dart';
import '../../../data/constants/account_types.dart';

/// 余额账户表单数据
class BalanceAccountFormData {
  /// 没有额外配置，余额账户使用基础表单即可
  const BalanceAccountFormData();
}

/// 余额账户表单
class BalanceAccountForm extends ConsumerStatefulWidget {
  /// 编辑的账户
  final AccountEntity? editAccount;

  /// 系统元数据
  final Map<String, String> systemMeta;

  const BalanceAccountForm({
    super.key,
    this.editAccount,
    this.systemMeta = const {},
  });

  @override
  ConsumerState<BalanceAccountForm> createState() => BalanceAccountFormState();
}

class BalanceAccountFormState extends ConsumerState<BalanceAccountForm> {
  /// 银行卡号
  late TextEditingController _bankCardNumberController;

  /// 银行名称
  late TextEditingController _bankNameController;

  /// 开户行
  late TextEditingController _bankBranchController;

  /// 持卡人姓名
  late TextEditingController _cardHolderNameController;

  @override
  void initState() {
    super.initState();
    _bankCardNumberController = TextEditingController(
      text: widget.systemMeta[AccountMetaKeys.bankCardNumber],
    );
    _bankNameController = TextEditingController(
      text: widget.systemMeta[AccountMetaKeys.bankName],
    );
    _bankBranchController = TextEditingController(
      text: widget.systemMeta[AccountMetaKeys.bankBranch],
    );
    _cardHolderNameController = TextEditingController(
      text: widget.systemMeta[AccountMetaKeys.cardHolderName],
    );
  }

  @override
  void dispose() {
    _bankCardNumberController.dispose();
    _bankNameController.dispose();
    _bankBranchController.dispose();
    _cardHolderNameController.dispose();
    super.dispose();
  }

  /// 获取表单数据
  BalanceAccountFormData? getFormData() {
    return const BalanceAccountFormData();
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
    if (_bankBranchController.text.isNotEmpty) {
      meta[AccountMetaKeys.bankBranch] = _bankBranchController.text;
    }
    if (_cardHolderNameController.text.isNotEmpty) {
      meta[AccountMetaKeys.cardHolderName] = _cardHolderNameController.text;
    }
    return meta;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 银行卡信息（可选）
        Text(
          '银行卡信息（可选）',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '如果是银行卡账户，可以填写以下信息便于管理',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),

        // 银行名称
        TextFormField(
          controller: _bankNameController,
          decoration: const InputDecoration(
            labelText: '银行名称',
            hintText: '如：中国工商银行',
            prefixIcon: Icon(Icons.account_balance),
          ),
        ),
        const SizedBox(height: 12),

        // 银行卡号
        TextFormField(
          controller: _bankCardNumberController,
          decoration: const InputDecoration(
            labelText: '银行卡号',
            hintText: '请输入银行卡号',
            prefixIcon: Icon(Icons.credit_card),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),

        // 开户行
        TextFormField(
          controller: _bankBranchController,
          decoration: const InputDecoration(
            labelText: '开户行',
            hintText: '如：某某支行',
            prefixIcon: Icon(Icons.location_city),
          ),
        ),
        const SizedBox(height: 12),

        // 持卡人姓名
        TextFormField(
          controller: _cardHolderNameController,
          decoration: const InputDecoration(
            labelText: '持卡人姓名',
            hintText: '请输入持卡人姓名',
            prefixIcon: Icon(Icons.person_outline),
          ),
        ),
      ],
    );
  }
}
