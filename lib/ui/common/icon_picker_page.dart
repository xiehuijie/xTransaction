/// 通用图标选择页
/// 
/// 支持多种图标源的选择：
/// - Emoji表情
/// - Material图标
/// - 国旗图标
/// 
/// 使用方式：
/// ```dart
/// final result = await Navigator.of(context).push<AppIcon>(
///   MaterialPageRoute(builder: (_) => const IconPickerPage()),
/// );
/// if (result != null) {
///   // 使用选中的图标
///   print(result.toStorageString());
/// }
/// ```

import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:country_flags/country_flags.dart';

import '../../data/constants/icon_data.dart';
import '../../utils/haptic_service.dart';

/// 图标选择结果
class IconPickerResult {
  final AppIcon icon;
  
  const IconPickerResult({required this.icon});
}

/// 图标选择页面
class IconPickerPage extends StatefulWidget {
  /// 初始选中的图标
  final AppIcon? initialIcon;
  
  /// 页面标题
  final String title;
  
  /// 是否显示国旗图标分类
  final bool showFlags;

  const IconPickerPage({
    super.key,
    this.initialIcon,
    this.title = '选择图标',
    this.showFlags = true,
  });

  @override
  State<IconPickerPage> createState() => _IconPickerPageState();
}

class _IconPickerPageState extends State<IconPickerPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  AppIcon? _selectedIcon;

  // 图标源标签页配置
  late List<_IconSourceTab> _tabs;

  @override
  void initState() {
    super.initState();
    _selectedIcon = widget.initialIcon;
    
    _tabs = [
      const _IconSourceTab(
        id: 'emoji',
        name: 'Emoji',
        icon: Icons.emoji_emotions,
      ),
      const _IconSourceTab(
        id: 'material',
        name: '图标',
        icon: Icons.category,
      ),
      if (widget.showFlags)
        const _IconSourceTab(
          id: 'flags',
          name: '国旗',
          icon: Icons.flag,
        ),
    ];
    
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _selectIcon(AppIcon icon) {
    HapticService.selectionClick();
    setState(() {
      _selectedIcon = icon;
    });
  }

  void _confirmSelection() {
    if (_selectedIcon != null) {
      HapticService.lightImpact();
      Navigator.of(context).pop(_selectedIcon);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((tab) => Tab(
            icon: Icon(tab.icon),
            text: tab.name,
          )).toList(),
        ),
        actions: [
          if (_selectedIcon != null)
            TextButton(
              onPressed: _confirmSelection,
              child: const Text('确定'),
            ),
        ],
      ),
      body: Column(
        children: [
          // 预览区域
          if (_selectedIcon != null)
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: _buildIconPreview(_selectedIcon!, 32),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '已选择',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _selectedIcon!.toStorageString(),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
          const Divider(height: 1),
          
          // 图标选择区域
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _tabs.map((tab) => _buildTabContent(tab.id)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String tabId) {
    switch (tabId) {
      case 'emoji':
        return _EmojiPickerTab(
          onSelect: (emoji) => _selectIcon(AppIcon(
            type: IconType.emoji,
            value: emoji.emoji.runes.map((cp) => cp.toRadixString(16)).join('-'),
          )),
        );
      case 'material':
        return _MaterialIconsTab(
          selectedIcon: _selectedIcon?.type == IconType.material
              ? _selectedIcon!.value
              : null,
          onSelect: (iconKey) => _selectIcon(AppIcon(
            type: IconType.material,
            value: iconKey,
          )),
        );
      case 'flags':
        return _FlagsTab(
          selectedCode: _selectedIcon?.type == IconType.flag
              ? _selectedIcon!.value
              : null,
          onSelect: (countryCode) => _selectIcon(AppIcon(
            type: IconType.flag,
            value: countryCode,
          )),
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildIconPreview(AppIcon icon, double size) {
    switch (icon.type) {
      case IconType.emoji:
        final emoji = icon.emojiChar;
        if (emoji != null) {
          return Text(
            emoji,
            style: TextStyle(fontSize: size),
          );
        }
        return Icon(Icons.help_outline, size: size);
      case IconType.material:
        final iconData = icon.materialIcon;
        if (iconData != null) {
          return Icon(iconData, size: size);
        }
        return Icon(Icons.help_outline, size: size);
      case IconType.flag:
        return CountryFlag.fromCountryCode(
          icon.value,
          theme: ImageTheme(
            width: size * 1.5,
            height: size,
            shape: RoundedRectangle(4),
          ),
        );
    }
  }
}

/// 图标源标签页配置
class _IconSourceTab {
  final String id;
  final String name;
  final IconData icon;

  const _IconSourceTab({
    required this.id,
    required this.name,
    required this.icon,
  });
}

/// Emoji选择标签页
class _EmojiPickerTab extends StatelessWidget {
  final void Function(Emoji emoji) onSelect;

  const _EmojiPickerTab({required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return EmojiPicker(
      onEmojiSelected: (category, emoji) => onSelect(emoji),
      config: Config(
        height: double.infinity,
        checkPlatformCompatibility: true,
        emojiViewConfig: EmojiViewConfig(
          columns: 8,
          emojiSizeMax: 28,
          verticalSpacing: 0,
          horizontalSpacing: 0,
          gridPadding: const EdgeInsets.all(8),
          backgroundColor: theme.scaffoldBackgroundColor,
          noRecents: const Text(
            '暂无最近使用',
            style: TextStyle(fontSize: 14),
          ),
        ),
        categoryViewConfig: CategoryViewConfig(
          initCategory: Category.SMILEYS,
          backgroundColor: theme.scaffoldBackgroundColor,
          indicatorColor: theme.colorScheme.primary,
          iconColor: theme.colorScheme.onSurfaceVariant,
          iconColorSelected: theme.colorScheme.primary,
          categoryIcons: const CategoryIcons(),
        ),
        bottomActionBarConfig: const BottomActionBarConfig(
          enabled: false,
        ),
        searchViewConfig: SearchViewConfig(
          backgroundColor: theme.scaffoldBackgroundColor,
          buttonIconColor: theme.colorScheme.primary,
          hintText: '搜索 Emoji...',
        ),
        skinToneConfig: SkinToneConfig(
          dialogBackgroundColor: isDark ? Colors.grey[800]! : Colors.white,
        ),
      ),
    );
  }
}

/// Material图标选择标签页
class _MaterialIconsTab extends StatefulWidget {
  final String? selectedIcon;
  final void Function(String iconKey) onSelect;

  const _MaterialIconsTab({
    this.selectedIcon,
    required this.onSelect,
  });

  @override
  State<_MaterialIconsTab> createState() => _MaterialIconsTabState();
}

class _MaterialIconsTabState extends State<_MaterialIconsTab> {
  String _selectedCategoryId = 'finance';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedCategory = materialIconCategories.firstWhere(
      (c) => c.id == _selectedCategoryId,
      orElse: () => materialIconCategories.first,
    );

    return Column(
      children: [
        // 分类选择
        SizedBox(
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: materialIconCategories.length,
            itemBuilder: (context, index) {
              final category = materialIconCategories[index];
              final isSelected = category.id == _selectedCategoryId;
              
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: FilterChip(
                  selected: isSelected,
                  label: Text(category.name),
                  avatar: Icon(
                    category.icon,
                    size: 18,
                    color: isSelected
                        ? theme.colorScheme.onPrimaryContainer
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  onSelected: (_) {
                    setState(() => _selectedCategoryId = category.id);
                  },
                ),
              );
            },
          ),
        ),
        
        const Divider(height: 1),
        
        // 图标网格
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: selectedCategory.iconKeys.length,
            itemBuilder: (context, index) {
              final iconKey = selectedCategory.iconKeys[index];
              final iconData = materialIconsMap[iconKey];
              final isSelected = widget.selectedIcon == iconKey;
              
              if (iconData == null) return const SizedBox();
              
              return InkWell(
                onTap: () => widget.onSelect(iconKey),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primaryContainer
                        : theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                    border: isSelected
                        ? Border.all(
                            color: theme.colorScheme.primary,
                            width: 2,
                          )
                        : null,
                  ),
                  child: Icon(
                    iconData,
                    color: isSelected
                        ? theme.colorScheme.onPrimaryContainer
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// 国旗选择标签页
class _FlagsTab extends StatefulWidget {
  final String? selectedCode;
  final void Function(String countryCode) onSelect;

  const _FlagsTab({
    this.selectedCode,
    required this.onSelect,
  });

  @override
  State<_FlagsTab> createState() => _FlagsTabState();
}

class _FlagsTabState extends State<_FlagsTab> {
  String _searchQuery = '';
  
  // 常用国家/地区代码
  static const List<_CountryInfo> _countries = [
    _CountryInfo('CN', '中国'),
    _CountryInfo('US', '美国'),
    _CountryInfo('GB', '英国'),
    _CountryInfo('JP', '日本'),
    _CountryInfo('KR', '韩国'),
    _CountryInfo('DE', '德国'),
    _CountryInfo('FR', '法国'),
    _CountryInfo('IT', '意大利'),
    _CountryInfo('ES', '西班牙'),
    _CountryInfo('RU', '俄罗斯'),
    _CountryInfo('CA', '加拿大'),
    _CountryInfo('AU', '澳大利亚'),
    _CountryInfo('NZ', '新西兰'),
    _CountryInfo('HK', '中国香港'),
    _CountryInfo('TW', '中国台湾'),
    _CountryInfo('MO', '中国澳门'),
    _CountryInfo('SG', '新加坡'),
    _CountryInfo('MY', '马来西亚'),
    _CountryInfo('TH', '泰国'),
    _CountryInfo('VN', '越南'),
    _CountryInfo('ID', '印度尼西亚'),
    _CountryInfo('PH', '菲律宾'),
    _CountryInfo('IN', '印度'),
    _CountryInfo('AE', '阿联酋'),
    _CountryInfo('SA', '沙特阿拉伯'),
    _CountryInfo('IL', '以色列'),
    _CountryInfo('TR', '土耳其'),
    _CountryInfo('EG', '埃及'),
    _CountryInfo('ZA', '南非'),
    _CountryInfo('BR', '巴西'),
    _CountryInfo('MX', '墨西哥'),
    _CountryInfo('AR', '阿根廷'),
    _CountryInfo('CL', '智利'),
    _CountryInfo('CO', '哥伦比亚'),
    _CountryInfo('PE', '秘鲁'),
    _CountryInfo('NL', '荷兰'),
    _CountryInfo('BE', '比利时'),
    _CountryInfo('CH', '瑞士'),
    _CountryInfo('AT', '奥地利'),
    _CountryInfo('SE', '瑞典'),
    _CountryInfo('NO', '挪威'),
    _CountryInfo('DK', '丹麦'),
    _CountryInfo('FI', '芬兰'),
    _CountryInfo('PL', '波兰'),
    _CountryInfo('CZ', '捷克'),
    _CountryInfo('HU', '匈牙利'),
    _CountryInfo('GR', '希腊'),
    _CountryInfo('PT', '葡萄牙'),
    _CountryInfo('IE', '爱尔兰'),
    _CountryInfo('EU', '欧盟'),
  ];

  List<_CountryInfo> get _filteredCountries {
    if (_searchQuery.isEmpty) return _countries;
    final query = _searchQuery.toLowerCase();
    return _countries.where((c) =>
      c.name.toLowerCase().contains(query) ||
      c.code.toLowerCase().contains(query)
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // 搜索框
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: '搜索国家/地区...',
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
        
        // 国旗网格
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemCount: _filteredCountries.length,
            itemBuilder: (context, index) {
              final country = _filteredCountries[index];
              final isSelected = widget.selectedCode == country.code;
              
              return InkWell(
                onTap: () => widget.onSelect(country.code),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primaryContainer
                        : theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected
                        ? Border.all(
                            color: theme.colorScheme.primary,
                            width: 2,
                          )
                        : null,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CountryFlag.fromCountryCode(
                        country.code,
                        theme: const ImageTheme(
                          width: 40,
                          height: 28,
                          shape: RoundedRectangle(4),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        country.name,
                        style: theme.textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CountryInfo {
  final String code;
  final String name;
  
  const _CountryInfo(this.code, this.name);
}
