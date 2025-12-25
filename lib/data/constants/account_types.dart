/// 账户类型相关常量与配置
///
/// 定义各种账户类型的默认配置和说明

import 'package:flutter/material.dart';
import '../database/tables.dart';

/// 账户类型信息
class AccountTypeInfo {
  /// 账户类型
  final AccountType type;

  /// 显示名称
  final String name;

  /// 描述
  final String description;

  /// 图标
  final IconData icon;

  /// 是否支持自定义货币
  final bool supportsCustomCurrency;

  /// 是否需要额外配置
  final bool requiresExtraConfig;

  const AccountTypeInfo({
    required this.type,
    required this.name,
    required this.description,
    required this.icon,
    this.supportsCustomCurrency = false,
    this.requiresExtraConfig = false,
  });
}

/// 所有账户类型信息
const Map<AccountType, AccountTypeInfo> accountTypeInfoMap = {
  AccountType.balance: AccountTypeInfo(
    type: AccountType.balance,
    name: '余额账户',
    description: '最基础的账户类型，用于记录现金、银行卡等可用余额',
    icon: Icons.account_balance_wallet,
  ),
  AccountType.credit: AccountTypeInfo(
    type: AccountType.credit,
    name: '信用账户',
    description: '用于记录信用卡等需要按期还款的账户',
    icon: Icons.credit_card,
    requiresExtraConfig: true,
  ),
  AccountType.prepaid: AccountTypeInfo(
    type: AccountType.prepaid,
    name: '预付账户',
    description: '用于记录会员卡、储值卡等预付款项，可关联赠送金账户',
    icon: Icons.card_giftcard,
    supportsCustomCurrency: true,
    requiresExtraConfig: true,
  ),
  AccountType.loan: AccountTypeInfo(
    type: AccountType.loan,
    name: '借贷账户',
    description: '用于记录借入或借出的款项，支持设置还款计划',
    icon: Icons.handshake,
    requiresExtraConfig: true,
  ),
  AccountType.invest: AccountTypeInfo(
    type: AccountType.invest,
    name: '投资账户',
    description: '用于记录股票、基金、虚拟货币等投资账户',
    icon: Icons.trending_up,
    supportsCustomCurrency: true,
    requiresExtraConfig: true,
  ),
  AccountType.bonus: AccountTypeInfo(
    type: AccountType.bonus,
    name: '赠送金账户',
    description: '与预付账户关联的赠送金，不可单独创建',
    icon: Icons.redeem,
  ),
};

/// 获取账户类型信息
AccountTypeInfo getAccountTypeInfo(AccountType type) {
  return accountTypeInfoMap[type] ?? accountTypeInfoMap[AccountType.balance]!;
}

/// 可由用户创建的账户类型列表（不包含bonus，因为它是自动创建的）
const List<AccountType> creatableAccountTypes = [
  AccountType.balance,
  AccountType.credit,
  AccountType.prepaid,
  AccountType.loan,
  AccountType.invest,
];

/// 账户元数据系统级键名
class AccountMetaKeys {
  AccountMetaKeys._();

  /// 银行卡号
  static const String bankCardNumber = 'bank_card_number';

  /// 银行名称
  static const String bankName = 'bank_name';

  /// 开户行
  static const String bankBranch = 'bank_branch';

  /// 持卡人姓名
  static const String cardHolderName = 'card_holder_name';

  /// 卡片有效期
  static const String cardExpiry = 'card_expiry';

  /// 初始余额（用于初始化时记录）
  static const String initialBalance = 'initial_balance';

  /// 投资账户：绑定的股票/基金代码
  static const String investCode = 'invest_code';

  /// 投资账户：投资类型（stock/fund/crypto/other）
  static const String investType = 'invest_type';

  /// 预付账户：是否启用赠送金
  static const String enableBonus = 'enable_bonus';

  /// 预付账户：赠送金扣减模式
  static const String bonusDeductMode = 'bonus_deduct_mode';
}

/// 投资类型枚举
enum InvestType {
  stock, // 股票
  fund, // 基金
  crypto, // 虚拟货币
  other, // 其他
}

/// 投资类型信息
const Map<InvestType, String> investTypeNames = {
  InvestType.stock: '股票',
  InvestType.fund: '基金',
  InvestType.crypto: '虚拟货币',
  InvestType.other: '其他',
};
