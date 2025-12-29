/// 投资账户表单组件
///
/// 投资账户可以绑定股票、基金或虚拟货币
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data.dart';
import '../../../data/constants/account_types.dart';
import '../../../providers/providers.dart';
import '../../../providers/account_provider.dart';
import '../../../utils/haptic_service.dart';

/// 投资账户表单数据
class InvestAccountFormData {
  /// 投资类型
  final InvestType investType;

  /// 投资代码（股票/基金/虚拟货币代号）
  final String? investCode;

  const InvestAccountFormData({
    required this.investType,
    this.investCode,
  });
}

/// 投资账户表单
class InvestAccountForm extends ConsumerStatefulWidget {
  /// 编辑的账户ID
  final int? editAccountId;

  /// 选中的货币代码
  final String selectedCurrencyCode;

  const InvestAccountForm({
    super.key,
    this.editAccountId,
    required this.selectedCurrencyCode,
  });

  @override
  ConsumerState<InvestAccountForm> createState() => InvestAccountFormState();
}

class InvestAccountFormState extends ConsumerState<InvestAccountForm> {
  /// 投资类型
  InvestType _investType = InvestType.stock;

  /// 投资代码
  late TextEditingController _investCodeController;

  /// 是否绑定特定资产
  bool _bindAsset = false;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _investCodeController = TextEditingController();

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
            case AccountMetaKeys.investType:
              _investType = InvestType.values.firstWhere(
                (e) => e.name == meta.value,
                orElse: () => InvestType.stock,
              );
              break;
            case AccountMetaKeys.investCode:
              _investCodeController.text = meta.value;
              _bindAsset = meta.value.isNotEmpty;
              break;
          }
        }
      }
    } catch (e) {
      debugPrint('加载投资账户数据失败: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _investCodeController.dispose();
    super.dispose();
  }

  /// 获取表单数据
  InvestAccountFormData? getFormData() {
    return InvestAccountFormData(
      investType: _investType,
      investCode: _bindAsset ? _investCodeController.text.trim() : null,
    );
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
        // 投资账户配置
        Text(
          '投资账户配置',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '设置投资类型和资产绑定',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),

        // 投资类型选择
        Text(
          '投资类型',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: InvestType.values.map((type) {
            final isSelected = _investType == type;
            return ChoiceChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getInvestTypeIcon(type),
                    size: 18,
                    color: isSelected
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface,
                  ),
                  const SizedBox(width: 4),
                  Text(investTypeNames[type] ?? type.name),
                ],
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  HapticService.selectionClick();
                  setState(() {
                    _investType = type;
                  });
                }
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),

        // 说明文字
        Card(
          color: theme.colorScheme.surfaceContainerHighest.withAlpha(100),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _getInvestTypeDescription(_investType),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // 资产绑定开关
        SwitchListTile(
          title: const Text('绑定特定资产'),
          subtitle: Text(_getBindAssetHint(_investType)),
          value: _bindAsset,
          onChanged: (value) {
            HapticService.selectionClick();
            setState(() {
              _bindAsset = value;
            });
          },
          contentPadding: EdgeInsets.zero,
        ),

        // 资产代码输入（仅在绑定时显示）
        if (_bindAsset) ...[
          const SizedBox(height: 16),
          TextFormField(
            controller: _investCodeController,
            decoration: InputDecoration(
              labelText: _getCodeLabel(_investType),
              hintText: _getCodeHint(_investType),
              prefixIcon: Icon(_getInvestTypeIcon(_investType)),
              helperText: _getCodeHelper(_investType),
              helperMaxLines: 2,
            ),
          ),
          const SizedBox(height: 16),

          // 绑定资产说明
          Card(
            color: theme.colorScheme.primaryContainer.withAlpha(100),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        size: 20,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '绑定资产功能',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '绑定后可自动获取实时价格，计算资产价值。'
                    '\n账户将使用特定代币（自定义货币）记录持仓数量，并以账户本币计算价值。',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

        if (!_bindAsset) ...[
          const SizedBox(height: 16),
          Card(
            color: theme.colorScheme.surfaceContainerHighest.withAlpha(100),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        size: 20,
                        color: theme.colorScheme.secondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '普通模式',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '不绑定特定资产时，将直接以账户本币进行交易和计算价值。'
                    '\n适合追踪整体投资组合或不需要实时价格同步的场景。',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  IconData _getInvestTypeIcon(InvestType type) {
    switch (type) {
      case InvestType.stock:
        return Icons.show_chart;
      case InvestType.fund:
        return Icons.pie_chart;
      case InvestType.crypto:
        return Icons.currency_bitcoin;
      case InvestType.other:
        return Icons.trending_up;
    }
  }

  String _getInvestTypeDescription(InvestType type) {
    switch (type) {
      case InvestType.stock:
        return '股票账户用于记录股票投资，可绑定特定股票代码获取实时行情。';
      case InvestType.fund:
        return '基金账户用于记录基金投资，可绑定基金代码追踪净值变化。';
      case InvestType.crypto:
        return '虚拟货币账户用于记录加密货币投资，可绑定代币符号获取实时价格。';
      case InvestType.other:
        return '其他投资账户用于记录其他类型的投资，如贵金属、收藏品等。';
    }
  }

  String _getBindAssetHint(InvestType type) {
    switch (type) {
      case InvestType.stock:
        return '绑定股票代码以获取实时行情';
      case InvestType.fund:
        return '绑定基金代码以追踪净值';
      case InvestType.crypto:
        return '绑定代币符号以获取实时价格';
      case InvestType.other:
        return '绑定资产代码以追踪价格';
    }
  }

  String _getCodeLabel(InvestType type) {
    switch (type) {
      case InvestType.stock:
        return '股票代码';
      case InvestType.fund:
        return '基金代码';
      case InvestType.crypto:
        return '代币符号';
      case InvestType.other:
        return '资产代码';
    }
  }

  String _getCodeHint(InvestType type) {
    switch (type) {
      case InvestType.stock:
        return '如：AAPL, 600519.SH';
      case InvestType.fund:
        return '如：161725, 110011';
      case InvestType.crypto:
        return '如：BTC, ETH';
      case InvestType.other:
        return '请输入资产代码';
    }
  }

  String _getCodeHelper(InvestType type) {
    switch (type) {
      case InvestType.stock:
        return '输入股票代码，美股直接输入代码，A股需带后缀（.SH或.SZ）';
      case InvestType.fund:
        return '输入基金代码，用于获取基金净值';
      case InvestType.crypto:
        return '输入代币符号，将从主流交易所获取价格';
      case InvestType.other:
        return '输入资产标识代码';
    }
  }
}
