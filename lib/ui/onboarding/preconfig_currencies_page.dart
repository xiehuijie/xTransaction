import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/haptic_service.dart';
import 'onboarding_config.dart';

/// 系统内置货币列表
const List<PreConfigCurrency> _systemCurrencies = [
  PreConfigCurrency(currencyCode: 'CNY', name: '人民币', symbol: '¥'),
  PreConfigCurrency(currencyCode: 'USD', name: '美元', symbol: '\$'),
  PreConfigCurrency(currencyCode: 'EUR', name: '欧元', symbol: '€'),
  PreConfigCurrency(currencyCode: 'JPY', name: '日元', symbol: '¥', decimal: 0),
  PreConfigCurrency(currencyCode: 'GBP', name: '英镑', symbol: '£'),
  PreConfigCurrency(currencyCode: 'HKD', name: '港元', symbol: 'HK\$'),
];

/// 预配置货币管理页面
class PreConfigCurrenciesPage extends ConsumerStatefulWidget {
  const PreConfigCurrenciesPage({super.key});

  @override
  ConsumerState<PreConfigCurrenciesPage> createState() =>
      _PreConfigCurrenciesPageState();
}

class _PreConfigCurrenciesPageState
    extends ConsumerState<PreConfigCurrenciesPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final config = ref.watch(initConfigProvider);
    final customCurrencies = config.preConfigCurrencies;

    return Scaffold(
      appBar: AppBar(title: const Text('货币配置'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 默认货币选择
          Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '默认货币',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '选择您最常使用的货币',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: config.defaultCurrencyCode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: _systemCurrencies
                        .map(
                          (c) => DropdownMenuItem(
                            value: c.currencyCode,
                            child: Text('${c.name} (${c.currencyCode})'),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        HapticService.selectionClick();
                        ref
                            .read(initConfigProvider.notifier)
                            .setDefaultCurrency(value);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),

          // 系统货币
          Text(
            '系统货币',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ..._systemCurrencies.map(
            (currency) => _buildCurrencyCard(currency, false, -1, theme),
          ),

          const SizedBox(height: 24),

          // 自定义货币
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '自定义货币',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                onPressed: () => _showAddCurrencyDialog(context),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('添加'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (customCurrencies.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Text(
                    '暂无自定义货币',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            )
          else
            ...customCurrencies.asMap().entries.map(
              (entry) =>
                  _buildCurrencyCard(entry.value, true, entry.key, theme),
            ),
        ],
      ),
    );
  }

  Widget _buildCurrencyCard(
    PreConfigCurrency currency,
    bool isCustom,
    int index,
    ThemeData theme,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCustom
              ? theme.colorScheme.tertiaryContainer
              : theme.colorScheme.primaryContainer,
          child: Text(
            currency.symbol,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isCustom
                  ? theme.colorScheme.onTertiaryContainer
                  : theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        title: Text(currency.name),
        subtitle: Text('${currency.currencyCode} · 小数位: ${currency.decimal}'),
        trailing: isCustom
            ? PopupMenuButton<String>(
                onSelected: (value) {
                  HapticService.selectionClick();
                  if (value == 'edit') {
                    _showEditCurrencyDialog(context, currency, index);
                  } else if (value == 'delete') {
                    _confirmDelete(context, index);
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
              )
            : Icon(
                Icons.lock_outlined,
                size: 20,
                color: theme.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.5,
                ),
              ),
      ),
    );
  }

  void _showAddCurrencyDialog(BuildContext context) {
    _showCurrencyDialog(context, null, null);
  }

  void _showEditCurrencyDialog(
    BuildContext context,
    PreConfigCurrency currency,
    int index,
  ) {
    _showCurrencyDialog(context, currency, index);
  }

  void _showCurrencyDialog(
    BuildContext context,
    PreConfigCurrency? currency,
    int? index,
  ) {
    final theme = Theme.of(context);
    final isEdit = currency != null;
    final codeController = TextEditingController(
      text: currency?.currencyCode ?? '',
    );
    final nameController = TextEditingController(text: currency?.name ?? '');
    final symbolController = TextEditingController(
      text: currency?.symbol ?? '',
    );
    int decimal = currency?.decimal ?? 2;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(isEdit ? '编辑货币' : '添加货币'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: '货币代码',
                    hintText: '例如：KRW',
                    border: OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.characters,
                  enabled: !isEdit,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '货币名称',
                    hintText: '例如：韩元',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: symbolController,
                  decoration: const InputDecoration(
                    labelText: '货币符号',
                    hintText: '例如：₩',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<int>(
                  value: decimal,
                  decoration: const InputDecoration(
                    labelText: '小数位数',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 0, child: Text('0 位')),
                    DropdownMenuItem(value: 1, child: Text('1 位')),
                    DropdownMenuItem(value: 2, child: Text('2 位')),
                    DropdownMenuItem(value: 3, child: Text('3 位')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => decimal = value);
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                HapticService.lightImpact();
                Navigator.pop(context);
              },
              child: const Text('取消'),
            ),
            FilledButton(
              onPressed: () {
                HapticService.mediumImpact();
                final code = codeController.text.trim().toUpperCase();
                final name = nameController.text.trim();
                final symbol = symbolController.text.trim();

                if (code.isEmpty || name.isEmpty || symbol.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('请填写所有必填字段'),
                      backgroundColor: theme.colorScheme.error,
                    ),
                  );
                  return;
                }

                // 检查是否与系统货币冲突
                if (!isEdit &&
                    _systemCurrencies.any((c) => c.currencyCode == code)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('货币代码已被系统货币使用'),
                      backgroundColor: theme.colorScheme.error,
                    ),
                  );
                  return;
                }

                // 检查是否与已有自定义货币冲突
                final existingCustom = ref
                    .read(initConfigProvider)
                    .preConfigCurrencies;
                final conflictIndex = existingCustom.indexWhere(
                  (c) => c.currencyCode == code,
                );
                if (conflictIndex >= 0 && (!isEdit || conflictIndex != index)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('货币代码已被使用'),
                      backgroundColor: theme.colorScheme.error,
                    ),
                  );
                  return;
                }

                final newCurrency = PreConfigCurrency(
                  currencyCode: code,
                  name: name,
                  symbol: symbol,
                  decimal: decimal,
                  isCustom: true,
                );

                if (isEdit && index != null) {
                  ref
                      .read(initConfigProvider.notifier)
                      .updateCurrency(index, newCurrency);
                } else {
                  ref
                      .read(initConfigProvider.notifier)
                      .addCurrency(newCurrency);
                }
                Navigator.pop(context);
              },
              child: Text(isEdit ? '保存' : '添加'),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除货币'),
        content: const Text('确定要删除这个自定义货币吗？'),
        actions: [
          TextButton(
            onPressed: () {
              HapticService.lightImpact();
              Navigator.pop(context);
            },
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              HapticService.mediumImpact();
              ref.read(initConfigProvider.notifier).removeCurrency(index);
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}
