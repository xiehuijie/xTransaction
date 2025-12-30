/// 余额账户表单组件
///
/// 余额账户是最基础的账户类型，配置项最少
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data.dart';

/// 余额账户表单数据
class BalanceAccountFormData {
  /// 没有额外配置，余额账户使用基础表单即可
  const BalanceAccountFormData();
}

/// 余额账户表单
class BalanceAccountForm extends ConsumerStatefulWidget {
  /// 编辑的账户
  final AccountEntity? editAccount;

  const BalanceAccountForm({
    super.key,
    this.editAccount,
  });

  @override
  ConsumerState<BalanceAccountForm> createState() => BalanceAccountFormState();
}

class BalanceAccountFormState extends ConsumerState<BalanceAccountForm> {
  /// 获取表单数据
  BalanceAccountFormData? getFormData() {
    return const BalanceAccountFormData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 余额账户无额外配置，显示说明信息
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '余额账户',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '余额账户是最基础的账户类型，适用于现金、储蓄卡等账户',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
