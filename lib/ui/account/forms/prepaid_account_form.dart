/// 预付款账户表单组件
///
/// 预付款账户可以关联赠送金账户，支持自定义货币
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data.dart';
import '../../../data/constants/account_types.dart';
import '../../../providers/providers.dart';
import '../../../providers/account_provider.dart';
import '../../../utils/haptic_service.dart';

/// 赠送金扣减模式
enum BonusDeductMode {
  first('first', '优先使用', '消费时优先扣减赠送金'),
  last('last', '最后使用', '消费时最后扣减赠送金'),
  same('same', '等比例扣减', '按预付款和赠送金比例扣减');

  final String value;
  final String label;
  final String description;

  const BonusDeductMode(this.value, this.label, this.description);

  static BonusDeductMode fromValue(String value) {
    return BonusDeductMode.values.firstWhere(
      (e) => e.value == value,
      orElse: () => BonusDeductMode.first,
    );
  }
}

/// 预付款账户表单数据
class PrepaidAccountFormData {
  /// 是否启用赠送金
  final bool enableBonus;

  /// 赠送金扣减模式
  final String bonusDeductMode;

  /// 赠送金账户名称
  final String? bonusName;

  /// 赠送金账户货币
  final String? bonusCurrencyCode;

  /// 赠送金初始余额
  final int? bonusInitialBalance;

  const PrepaidAccountFormData({
    required this.enableBonus,
    required this.bonusDeductMode,
    this.bonusName,
    this.bonusCurrencyCode,
    this.bonusInitialBalance,
  });
}

/// 预付款账户表单
class PrepaidAccountForm extends ConsumerStatefulWidget {
  /// 编辑的账户ID
  final int? editAccountId;

  /// 选中的货币代码（用于赠送金默认货币）
  final String selectedCurrencyCode;

  const PrepaidAccountForm({
    super.key,
    this.editAccountId,
    required this.selectedCurrencyCode,
  });

  @override
  ConsumerState<PrepaidAccountForm> createState() => PrepaidAccountFormState();
}

class PrepaidAccountFormState extends ConsumerState<PrepaidAccountForm> {
  /// 是否启用赠送金
  bool _enableBonus = false;

  /// 赠送金扣减模式
  BonusDeductMode _bonusDeductMode = BonusDeductMode.first;

  /// 赠送金账户名称
  late TextEditingController _bonusNameController;

  /// 赠送金初始余额
  late TextEditingController _bonusInitialBalanceController;

  /// 赠送金货币代码
  String _bonusCurrencyCode = 'CNY';

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _bonusNameController = TextEditingController();
    _bonusInitialBalanceController = TextEditingController();
    _bonusCurrencyCode = widget.selectedCurrencyCode;

    if (widget.editAccountId != null) {
      _loadExistingData();
    } else {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadExistingData() async {
    try {
      final accountDao = ref.read(accountDaoProvider);

      // 加载账户元数据
      final metaList = await accountDao.getAccountMeta(widget.editAccountId!);
      for (final meta in metaList) {
        if (meta.scope == AccountMetaScope.system) {
          switch (meta.key) {
            case AccountMetaKeys.enableBonus:
              _enableBonus = meta.value.toLowerCase() == 'true';
              break;
            case AccountMetaKeys.bonusDeductMode:
              _bonusDeductMode = BonusDeductMode.fromValue(meta.value);
              break;
          }
        }
      }

      // 加载关联的赠送金账户信息
      final bonusAccounts =
          await accountDao.getBonusAccountsByPrepaidId(widget.editAccountId!);
      if (bonusAccounts.isNotEmpty) {
        final bonusAccount =
            await accountDao.getAccountById(bonusAccounts.first.bonusAccountId);
        if (bonusAccount != null) {
          _bonusNameController.text = bonusAccount.name;
          _bonusCurrencyCode = bonusAccount.currencyCode;

          // 获取赠送金初始余额
          final bonusMeta =
              await accountDao.getAccountMeta(bonusAccount.accountId);
          for (final meta in bonusMeta) {
            if (meta.scope == AccountMetaScope.system &&
                meta.key == AccountMetaKeys.initialBalance) {
              _bonusInitialBalanceController.text = meta.value;
              break;
            }
          }
        }
      }
    } catch (e) {
      debugPrint('加载预付款账户数据失败: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void didUpdateWidget(PrepaidAccountForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCurrencyCode != widget.selectedCurrencyCode &&
        !_enableBonus) {
      _bonusCurrencyCode = widget.selectedCurrencyCode;
    }
  }

  @override
  void dispose() {
    _bonusNameController.dispose();
    _bonusInitialBalanceController.dispose();
    super.dispose();
  }

  /// 获取表单数据
  PrepaidAccountFormData? getFormData() {
    return PrepaidAccountFormData(
      enableBonus: _enableBonus,
      bonusDeductMode: _bonusDeductMode.value,
      bonusName: _enableBonus ? _bonusNameController.text.trim() : null,
      bonusCurrencyCode: _enableBonus ? _bonusCurrencyCode : null,
      bonusInitialBalance: _enableBonus
          ? int.tryParse(_bonusInitialBalanceController.text)
          : null,
    );
  }

  Future<void> _selectBonusCurrency() async {
    HapticService.lightImpact();
    final currenciesAsync = ref.read(allCurrenciesProvider);
    final currencies = currenciesAsync.value ?? [];

    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => _CurrencyPickerSheet(
        currencies: currencies,
        selectedCode: _bonusCurrencyCode,
      ),
    );

    if (selected != null) {
      setState(() {
        _bonusCurrencyCode = selected;
      });
    }
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
        // 预付款账户说明
        Text(
          '预付款账户配置',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '预付款账户可用于记录会员卡、储值卡等预付款项',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),

        // 赠送金开关
        SwitchListTile(
          title: const Text('启用赠送金'),
          subtitle: const Text('为此预付款账户关联一个赠送金账户'),
          value: _enableBonus,
          onChanged: (value) {
            HapticService.selectionClick();
            setState(() {
              _enableBonus = value;
            });
          },
          contentPadding: EdgeInsets.zero,
        ),

        // 赠送金配置（仅在启用时显示）
        if (_enableBonus) ...[
          const Divider(),
          const SizedBox(height: 16),

          Text(
            '赠送金账户配置',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 16),

          // 赠送金扣减模式
          DropdownButtonFormField<BonusDeductMode>(
            value: _bonusDeductMode,
            decoration: const InputDecoration(
              labelText: '扣减模式',
              prefixIcon: Icon(Icons.swap_vert),
            ),
            items: BonusDeductMode.values.map((mode) {
              return DropdownMenuItem(
                value: mode,
                child: Text(mode.label),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                HapticService.selectionClick();
                setState(() {
                  _bonusDeductMode = value;
                });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16),
            child: Text(
              _bonusDeductMode.description,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 赠送金账户名称
          TextFormField(
            controller: _bonusNameController,
            decoration: const InputDecoration(
              labelText: '赠送金账户名称',
              hintText: '留空则自动生成',
              prefixIcon: Icon(Icons.redeem),
            ),
          ),
          const SizedBox(height: 16),

          // 赠送金货币（预付款账户支持自定义货币）
          InkWell(
            onTap: _selectBonusCurrency,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: '赠送金货币',
                prefixIcon: Icon(Icons.currency_exchange),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_bonusCurrencyCode),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16),
            child: Text(
              '赠送金可以使用不同的货币单位',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 赠送金初始余额
          TextFormField(
            controller: _bonusInitialBalanceController,
            decoration: InputDecoration(
              labelText: '赠送金初始余额',
              hintText: '创建时的赠送金金额',
              prefixIcon: const Icon(Icons.card_giftcard),
              suffixText: _bonusCurrencyCode,
            ),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
          ),
        ],
      ],
    );
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
