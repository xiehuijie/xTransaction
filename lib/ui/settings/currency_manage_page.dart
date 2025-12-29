/// 货币管理页面
///
/// 用于在设置中管理多货币配置
library;

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_flags/country_flags.dart';

import '../../data/data.dart';
import '../../data/constants/currency_data.dart';
import '../../data/constants/icon_data.dart';
import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../common/app_icon_widget.dart';
import '../common/icon_picker_page.dart';

/// 货币管理页面
class CurrencyManagePage extends ConsumerStatefulWidget {
  const CurrencyManagePage({super.key});

  @override
  ConsumerState<CurrencyManagePage> createState() => _CurrencyManagePageState();
}

class _CurrencyManagePageState extends ConsumerState<CurrencyManagePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('货币管理'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '系统货币'),
            Tab(text: '自定义货币'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _SystemCurrenciesTab(),
          _CustomCurrenciesTab(),
        ],
      ),
    );
  }
}

/// 系统货币标签页
class _SystemCurrenciesTab extends ConsumerStatefulWidget {
  const _SystemCurrenciesTab();

  @override
  ConsumerState<_SystemCurrenciesTab> createState() =>
      _SystemCurrenciesTabState();
}

class _SystemCurrenciesTabState extends ConsumerState<_SystemCurrenciesTab> {
  String _selectedRegion = 'popular';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currenciesAsync = ref.watch(allCurrenciesProvider);

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

    return currenciesAsync.when(
      data: (enabledCurrencies) {
        final enabledCodes = enabledCurrencies
            .where((c) => c.source == CurrencySource.system)
            .map((c) => c.currencyCode)
            .toSet();

        return Column(
          children: [
            // 状态提示
            Container(
              padding: const EdgeInsets.all(12),
              color: theme.colorScheme.primaryContainer.withAlpha(77),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '已启用 ${enabledCodes.length} 种系统货币',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),

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
                        final isEnabled = enabledCodes.contains(currency.code);

                        return ListTile(
                          leading: _buildCurrencyIcon(currency),
                          title: Text('${currency.code} - ${currency.nameCN}'),
                          subtitle: Text(
                            '${currency.symbol} · ${currency.nameEN}',
                            style: theme.textTheme.bodySmall,
                          ),
                          trailing: Switch(
                            value: isEnabled,
                            onChanged: (value) async {
                              HapticService.selectionClick();
                              final currencyDao = ref.read(currencyDaoProvider);
                              if (value) {
                                // 添加货币
                                await currencyDao.insertCurrency(
                                  CurrencyCompanion.insert(
                                    currencyCode: currency.code,
                                    name: currency.nameCN,
                                    symbol: currency.symbol,
                                    position: Value(CurrencyPosition.prefix),
                                    decimal: Value(currency.decimal),
                                    source: Value(CurrencySource.system),
                                  ),
                                );
                              } else {
                                // 移除货币
                                await currencyDao
                                    .deleteCurrencyByCode(currency.code);
                              }
                              ref.invalidate(allCurrenciesProvider);
                            },
                          ),
                          onTap: () async {
                            HapticService.selectionClick();
                            final currencyDao = ref.read(currencyDaoProvider);
                            if (isEnabled) {
                              await currencyDao
                                  .deleteCurrencyByCode(currency.code);
                            } else {
                              await currencyDao.insertCurrency(
                                CurrencyCompanion.insert(
                                  currencyCode: currency.code,
                                  name: currency.nameCN,
                                  symbol: currency.symbol,
                                  position: Value(CurrencyPosition.prefix),
                                  decimal: Value(currency.decimal),
                                  source: Value(CurrencySource.system),
                                ),
                              );
                            }
                            ref.invalidate(allCurrenciesProvider);
                          },
                        );
                      },
                    ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('加载失败: $error')),
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

/// 自定义货币标签页
class _CustomCurrenciesTab extends ConsumerWidget {
  const _CustomCurrenciesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currenciesAsync = ref.watch(allCurrenciesProvider);

    return currenciesAsync.when(
      data: (currencies) {
        final customCurrencies =
            currencies.where((c) => c.source == CurrencySource.custom).toList();

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
              child: customCurrencies.isEmpty
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
                      itemCount: customCurrencies.length,
                      itemBuilder: (context, index) {
                        final currency = customCurrencies[index];
                        return ListTile(
                          leading: currency.icon != null
                              ? AppIconWidget.fromString(currency.icon!,
                                  size: 32)
                              : CircleAvatar(
                                  backgroundColor:
                                      theme.colorScheme.primaryContainer,
                                  child: Text(
                                    currency.symbol,
                                    style: TextStyle(
                                      color:
                                          theme.colorScheme.onPrimaryContainer,
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
                            onSelected: (value) async {
                              if (value == 'edit') {
                                _showEditDialog(context, ref, currency);
                              } else if (value == 'delete') {
                                final confirmed = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('删除货币'),
                                    content: Text(
                                        '确定要删除"${currency.name}"吗？\n\n使用此货币的账户将无法正常显示金额。'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: const Text('取消'),
                                      ),
                                      FilledButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        style: FilledButton.styleFrom(
                                          backgroundColor:
                                              theme.colorScheme.error,
                                        ),
                                        child: const Text('删除'),
                                      ),
                                    ],
                                  ),
                                );
                                if (confirmed == true) {
                                  final currencyDao =
                                      ref.read(currencyDaoProvider);
                                  await currencyDao.deleteCurrencyByCode(
                                      currency.currencyCode);
                                  ref.invalidate(allCurrenciesProvider);
                                }
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
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('加载失败: $error')),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _CustomCurrencyEditorPage(
          onSave: (currency) async {
            final currencyDao = ref.read(currencyDaoProvider);
            await currencyDao.insertCurrency(currency);
            ref.invalidate(allCurrenciesProvider);
          },
        ),
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    WidgetRef ref,
    CurrencyEntity currency,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _CustomCurrencyEditorPage(
          currency: currency,
          onSave: (updated) async {
            final currencyDao = ref.read(currencyDaoProvider);
            await currencyDao.updateCurrency(updated);
            ref.invalidate(allCurrenciesProvider);
          },
        ),
      ),
    );
  }
}

/// 自定义货币编辑页面
class _CustomCurrencyEditorPage extends StatefulWidget {
  final CurrencyEntity? currency;
  final Future<void> Function(CurrencyCompanion) onSave;

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
  CurrencyPosition _position = CurrencyPosition.prefix;
  bool _isLoading = false;

  bool get isEditing => widget.currency != null;

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
    _position = widget.currency?.position ?? CurrencyPosition.prefix;
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

  Future<void> _save() async {
    if (!_isValid || _isLoading) return;

    setState(() => _isLoading = true);

    try {
      final currency = CurrencyCompanion.insert(
        currencyCode: _codeController.text.toUpperCase(),
        name: _nameController.text,
        symbol: _symbolController.text,
        decimal: Value(_decimal),
        icon: Value(_icon),
        position: Value(_position),
        source: Value(CurrencySource.custom),
      );

      await widget.onSave(currency);
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('保存失败: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _pickIcon() async {
    final result = await Navigator.of(context).push<AppIcon>(
      MaterialPageRoute(
        builder: (_) => IconPickerPage(
          initialIcon: _icon != null ? AppIcon.fromString(_icon!) : null,
          title: '选择货币图标',
          showFlags: false,
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
        title: Text(isEditing ? '编辑自定义货币' : '添加自定义货币'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _isValid && !_isLoading ? _save : null,
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('保存'),
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
                  enabled: !isEditing, // 编辑时不能修改代码
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
          SegmentedButton<CurrencyPosition>(
            segments: const [
              ButtonSegment(
                value: CurrencyPosition.prefix,
                label: Text('前缀'),
                icon: Icon(Icons.format_textdirection_l_to_r),
              ),
              ButtonSegment(
                value: CurrencyPosition.suffix,
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
                    _position == CurrencyPosition.prefix
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
            max: 8,
            divisions: 8,
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
