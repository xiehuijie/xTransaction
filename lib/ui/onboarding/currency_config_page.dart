/// 货币配置页面
///
/// 初始化流程的货币配置步骤

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_flags/country_flags.dart';

import '../../data/constants/currency_data.dart';
import '../common/icon_picker_page.dart';
import '../common/app_icon_widget.dart';
import '../../data/constants/icon_data.dart';
import 'onboarding_state.dart';

/// 货币配置页面 - 多货币预配置
class CurrencyConfigPage extends ConsumerStatefulWidget {
  const CurrencyConfigPage({super.key});

  @override
  ConsumerState<CurrencyConfigPage> createState() => _CurrencyConfigPageState();
}

class _CurrencyConfigPageState extends ConsumerState<CurrencyConfigPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingProvider);
    final isValid =
        state.availableCurrencies.length >= 2 &&
        state.defaultCurrency != null &&
        state.availableCurrencies.contains(state.defaultCurrency);

    return Scaffold(
      appBar: AppBar(
        title: const Text('多货币配置'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '可用货币'),
            Tab(text: '自定义货币'),
            Tab(text: '默认货币'),
          ],
        ),
      ),
      body: Column(
        children: [
          // 状态提示
          _buildStatusBar(context, state, isValid),
          // Tab 内容
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                _AvailableCurrenciesTab(),
                _CustomCurrenciesTab(),
                _DefaultCurrencyTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBar(
    BuildContext context,
    OnboardingState state,
    bool isValid,
  ) {
    final theme = Theme.of(context);
    final currencyCount = state.availableCurrencies.length;

    return Container(
      padding: const EdgeInsets.all(12),
      color: isValid
          ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
          : theme.colorScheme.errorContainer.withValues(alpha: 0.3),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.info_outline,
            size: 20,
            color: isValid
                ? theme.colorScheme.primary
                : theme.colorScheme.error,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              isValid
                  ? '已选择 $currencyCount 种货币，默认货币：${state.defaultCurrency}'
                  : currencyCount < 2
                  ? '请至少选择 2 种货币（当前 $currencyCount 种）'
                  : '请选择默认货币',
              style: theme.textTheme.bodySmall?.copyWith(
                color: isValid
                    ? theme.colorScheme.onPrimaryContainer
                    : theme.colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 可用货币配置标签页
class _AvailableCurrenciesTab extends ConsumerStatefulWidget {
  const _AvailableCurrenciesTab();

  @override
  ConsumerState<_AvailableCurrenciesTab> createState() =>
      _AvailableCurrenciesTabState();
}

class _AvailableCurrenciesTabState
    extends ConsumerState<_AvailableCurrenciesTab> {
  String _selectedRegion = 'popular';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingProvider);

    // 获取当前区域的货币
    final region = currencyRegions.firstWhere(
      (r) => r.id == _selectedRegion,
      orElse: () => currencyRegions.first,
    );

    // 过滤货币
    List<CurrencyTemplate> currencies;
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      currencies = worldCurrencies
          .where(
            (c) =>
                c.code.toLowerCase().contains(query) ||
                c.nameCN.toLowerCase().contains(query) ||
                c.nameEN.toLowerCase().contains(query),
          )
          .toList();
    } else {
      currencies = region.currencyCodes
          .map((code) => findCurrencyByCode(code))
          .whereType<CurrencyTemplate>()
          .toList();
    }

    return Column(
      children: [
        // 搜索框
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: '搜索货币...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            onChanged: (value) {
              setState(() => _searchQuery = value);
            },
          ),
        ),

        // 区域选择（搜索时隐藏）
        if (_searchQuery.isEmpty)
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: currencyRegions.length,
              itemBuilder: (context, index) {
                final r = currencyRegions[index];
                final isSelected = r.id == _selectedRegion;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    selected: isSelected,
                    label: Text(r.name),
                    avatar: Icon(r.icon, size: 18),
                    onSelected: (_) {
                      setState(() => _selectedRegion = r.id);
                    },
                  ),
                );
              },
            ),
          ),

        const Divider(height: 1),

        // 货币列表
        Expanded(
          child: currencies.isEmpty
              ? Center(
                  child: Text(
                    '没有找到匹配的货币',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: currencies.length,
                  itemBuilder: (context, index) {
                    final currency = currencies[index];
                    final isSelected = state.availableCurrencies.contains(
                      currency.code,
                    );
                    final isDefault = state.defaultCurrency == currency.code;

                    return ListTile(
                      leading: _buildCurrencyIcon(currency),
                      title: Text('${currency.code} - ${currency.nameCN}'),
                      subtitle: Text(
                        '${currency.symbol} · ${currency.nameEN}',
                        style: theme.textTheme.bodySmall,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isDefault)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '默认',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                          Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              ref
                                  .read(onboardingProvider.notifier)
                                  .toggleCurrencySelection(currency.code);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        ref
                            .read(onboardingProvider.notifier)
                            .toggleCurrencySelection(currency.code);
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildCurrencyIcon(CurrencyTemplate currency) {
    if (currency.countryCode != null) {
      try {
        return ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            width: 32,
            height: 24,
            child: CountryFlag.fromCountryCode(currency.countryCode!),
          ),
        );
      } catch (_) {}
    }
    return Container(
      width: 32,
      height: 24,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          currency.symbol,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}

/// 自定义货币配置标签页
class _CustomCurrenciesTab extends ConsumerWidget {
  const _CustomCurrenciesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingProvider);

    return Column(
      children: [
        // 说明
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 18,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '自定义货币（代币）仅可用于预付款账户和投资账户',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),

        const Divider(height: 1),

        // 自定义货币列表
        Expanded(
          child: state.customCurrencies.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.token_outlined,
                        size: 64,
                        color: theme.colorScheme.outline,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '暂无自定义货币',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '点击下方按钮添加',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: state.customCurrencies.length,
                  itemBuilder: (context, index) {
                    final currency = state.customCurrencies[index];
                    return ListTile(
                      leading: currency.icon != null
                          ? AppIconWidget.fromString(currency.icon!, size: 32)
                          : CircleAvatar(
                              backgroundColor:
                                  theme.colorScheme.primaryContainer,
                              child: Text(
                                currency.symbol,
                                style: TextStyle(
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                      title: Text(
                        '${currency.currencyCode} - ${currency.name}',
                      ),
                      subtitle: Text(
                        '${currency.symbol} · ${currency.decimal}位小数',
                        style: theme.textTheme.bodySmall,
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            _showEditDialog(context, ref, index, currency);
                          } else if (value == 'delete') {
                            ref
                                .read(onboardingProvider.notifier)
                                .removeCustomCurrency(index);
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
                      ),
                    );
                  },
                ),
        ),

        // 添加按钮
        Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: () => _showAddDialog(context, ref),
            icon: const Icon(Icons.add),
            label: const Text('添加自定义货币'),
          ),
        ),
      ],
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _CustomCurrencyEditorPage(
          onSave: (currency) {
            ref.read(onboardingProvider.notifier).addCustomCurrency(currency);
          },
        ),
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    WidgetRef ref,
    int index,
    PreConfigCurrency currency,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _CustomCurrencyEditorPage(
          currency: currency,
          onSave: (newCurrency) {
            ref
                .read(onboardingProvider.notifier)
                .updateCustomCurrency(index, newCurrency);
          },
        ),
      ),
    );
  }
}

/// 自定义货币编辑页面
class _CustomCurrencyEditorPage extends StatefulWidget {
  final PreConfigCurrency? currency;
  final void Function(PreConfigCurrency) onSave;

  const _CustomCurrencyEditorPage({this.currency, required this.onSave});

  @override
  State<_CustomCurrencyEditorPage> createState() =>
      _CustomCurrencyEditorPageState();
}

class _CustomCurrencyEditorPageState extends State<_CustomCurrencyEditorPage> {
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _symbolController;
  String? _icon;
  int _decimal = 2;
  String _position = 'prefix';

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(
      text: widget.currency?.currencyCode,
    );
    _nameController = TextEditingController(text: widget.currency?.name);
    _symbolController = TextEditingController(text: widget.currency?.symbol);
    _icon = widget.currency?.icon;
    _decimal = widget.currency?.decimal ?? 2;
    _position = widget.currency?.position ?? 'prefix';
  }

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _symbolController.dispose();
    super.dispose();
  }

  bool get _isValid =>
      _codeController.text.isNotEmpty &&
      _nameController.text.isNotEmpty &&
      _symbolController.text.isNotEmpty;

  void _save() {
    if (!_isValid) return;

    final currency = PreConfigCurrency(
      currencyCode: _codeController.text.toUpperCase(),
      name: _nameController.text,
      symbol: _symbolController.text,
      decimal: _decimal,
      icon: _icon,
      isCustom: true,
      position: _position,
    );

    widget.onSave(currency);
    Navigator.of(context).pop();
  }

  Future<void> _pickIcon() async {
    final result = await Navigator.of(context).push<AppIcon>(
      MaterialPageRoute(
        builder: (_) => IconPickerPage(
          initialIcon: _icon != null ? AppIcon.fromString(_icon!) : null,
          title: '选择货币图标',
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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currency == null ? '添加自定义货币' : '编辑自定义货币'),
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
          // 图标和代码
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
                child: TextField(
                  controller: _codeController,
                  decoration: const InputDecoration(
                    labelText: '货币代码',
                    hintText: '如: POINT, TOKEN',
                    border: OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.characters,
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 名称
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: '货币名称',
              hintText: '如: 积分, 代币',
              border: OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),

          // 符号
          TextField(
            controller: _symbolController,
            decoration: const InputDecoration(
              labelText: '货币符号',
              hintText: '如: ¤, ₿',
              border: OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 24),

          // 符号位置
          Text('符号位置', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(
                value: 'prefix',
                label: Text('前缀'),
                icon: Icon(Icons.format_textdirection_l_to_r),
              ),
              ButtonSegment(
                value: 'suffix',
                label: Text('后缀'),
                icon: Icon(Icons.format_textdirection_r_to_l),
              ),
            ],
            selected: {_position},
            onSelectionChanged: (value) {
              setState(() => _position = value.first);
            },
          ),
          const SizedBox(height: 16),

          // 预览
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '金额显示预览',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _position == 'prefix'
                        ? '${_symbolController.text}1,234.${'0' * _decimal}'
                        : '1,234.${'0' * _decimal}${_symbolController.text}',
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 小数位数
          Text('小数位数：$_decimal', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Slider(
            value: _decimal.toDouble(),
            min: 0,
            max: 20,
            divisions: 20,
            label: '$_decimal',
            onChanged: (value) {
              setState(() => _decimal = value.round());
            },
          ),
          Text(
            '小数位数决定了金额的精度，例如 2 位小数可表示 0.01',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}

/// 默认货币选择标签页
class _DefaultCurrencyTab extends ConsumerWidget {
  const _DefaultCurrencyTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingProvider);

    // 只显示系统货币（不包含自定义货币）
    final currencies = state.availableCurrencies
        .map((code) => findCurrencyByCode(code))
        .whereType<CurrencyTemplate>()
        .toList();

    if (currencies.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.currency_exchange,
              size: 64,
              color: theme.colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              '请先选择可用货币',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '在"可用货币"标签页中至少选择2种货币',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // 说明
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 18,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '默认货币将用于新建账本、账户、交易时的默认选择',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),

        const Divider(height: 1),

        // 货币列表
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: currencies.length,
            itemBuilder: (context, index) {
              final currency = currencies[index];
              final isDefault = state.defaultCurrency == currency.code;

              return RadioListTile<String>(
                value: currency.code,
                groupValue: state.defaultCurrency,
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(onboardingProvider.notifier)
                        .setDefaultCurrency(value);
                  }
                },
                title: Text('${currency.code} - ${currency.nameCN}'),
                subtitle: Text(
                  '${currency.symbol} · ${currency.nameEN}',
                  style: theme.textTheme.bodySmall,
                ),
                secondary: _buildCurrencyIcon(context, currency),
                selected: isDefault,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencyIcon(BuildContext context, CurrencyTemplate currency) {
    if (currency.countryCode != null) {
      try {
        return ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            width: 32,
            height: 24,
            child: CountryFlag.fromCountryCode(currency.countryCode!),
          ),
        );
      } catch (_) {}
    }
    return Container(
      width: 32,
      height: 24,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          currency.symbol,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
