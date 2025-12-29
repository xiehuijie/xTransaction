/// 账户元数据编辑器
///
/// 用于编辑账户的系统级和用户级元数据
library;

import 'package:flutter/material.dart';

import '../../../data/constants/account_types.dart';
import '../../../utils/haptic_service.dart';

/// 账户元数据编辑页面
class AccountMetaEditorPage extends StatefulWidget {
  /// 系统级元数据
  final Map<String, String> systemMeta;

  /// 用户自定义元数据
  final Map<String, String> customMeta;

  const AccountMetaEditorPage({
    super.key,
    required this.systemMeta,
    required this.customMeta,
  });

  @override
  State<AccountMetaEditorPage> createState() => _AccountMetaEditorPageState();
}

class _AccountMetaEditorPageState extends State<AccountMetaEditorPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Map<String, String> _systemMeta;
  late Map<String, String> _customMeta;

  /// 预定义的系统级元数据键名和描述
  static const Map<String, _MetaKeyInfo> _systemMetaKeys = {
    AccountMetaKeys.bankCardNumber: _MetaKeyInfo(
      label: '银行卡号',
      hint: '请输入银行卡号',
      icon: Icons.credit_card,
      keyboardType: TextInputType.number,
    ),
    AccountMetaKeys.bankName: _MetaKeyInfo(
      label: '银行名称',
      hint: '如：中国工商银行',
      icon: Icons.account_balance,
    ),
    AccountMetaKeys.bankBranch: _MetaKeyInfo(
      label: '开户行',
      hint: '如：某某支行',
      icon: Icons.location_city,
    ),
    AccountMetaKeys.cardHolderName: _MetaKeyInfo(
      label: '持卡人姓名',
      hint: '请输入持卡人姓名',
      icon: Icons.person_outline,
    ),
    AccountMetaKeys.cardExpiry: _MetaKeyInfo(
      label: '卡片有效期',
      hint: '如：12/28',
      icon: Icons.date_range,
    ),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _systemMeta = Map.from(widget.systemMeta);
    _customMeta = Map.from(widget.customMeta);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _saveAndReturn() {
    HapticService.mediumImpact();
    Navigator.pop(context, {
      'system': _systemMeta,
      'custom': _customMeta,
    });
  }

  void _addSystemMeta() async {
    HapticService.lightImpact();
    
    // 过滤掉已添加的键
    final availableKeys = _systemMetaKeys.entries
        .where((e) => !_systemMeta.containsKey(e.key))
        .toList();

    if (availableKeys.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('所有系统字段都已添加')),
      );
      return;
    }

    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => _SystemMetaPickerSheet(
        availableKeys: availableKeys.map((e) => MapEntry(e.key, e.value)).toList(),
      ),
    );

    if (selected != null) {
      setState(() {
        _systemMeta[selected] = '';
      });
    }
  }

  void _addCustomMeta() async {
    HapticService.lightImpact();
    
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => const _AddCustomMetaDialog(),
    );

    if (result != null) {
      setState(() {
        _customMeta[result['key']!] = result['value']!;
      });
    }
  }

  void _removeSystemMeta(String key) {
    HapticService.lightImpact();
    setState(() {
      _systemMeta.remove(key);
    });
  }

  void _removeCustomMeta(String key) {
    HapticService.lightImpact();
    setState(() {
      _customMeta.remove(key);
    });
  }

  void _editCustomMeta(String key, String currentValue) async {
    HapticService.lightImpact();
    
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => _AddCustomMetaDialog(
        initialKey: key,
        initialValue: currentValue,
        isEditing: true,
      ),
    );

    if (result != null) {
      setState(() {
        // 如果键名改变，删除旧的
        if (result['key'] != key) {
          _customMeta.remove(key);
        }
        _customMeta[result['key']!] = result['value']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('扩展信息'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _saveAndReturn,
            child: const Text('保存'),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '系统字段'),
            Tab(text: '自定义字段'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 系统级元数据
          _buildSystemMetaList(theme),
          
          // 用户自定义元数据
          _buildCustomMetaList(theme),
        ],
      ),
    );
  }

  Widget _buildSystemMetaList(ThemeData theme) {
    return Column(
      children: [
        // 说明
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: theme.colorScheme.surfaceContainerHighest.withAlpha(100),
          child: Text(
            '系统字段是预定义的扩展信息，如银行卡号、持卡人等，用于特殊功能适配。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        
        // 列表
        Expanded(
          child: _systemMeta.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        size: 64,
                        color: theme.colorScheme.onSurfaceVariant.withAlpha(128),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '暂无系统字段',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '点击下方按钮添加',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant.withAlpha(180),
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _systemMeta.length,
                  itemBuilder: (context, index) {
                    final entry = _systemMeta.entries.elementAt(index);
                    final keyInfo = _systemMetaKeys[entry.key];
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  keyInfo?.icon ?? Icons.info_outline,
                                  size: 20,
                                  color: theme.colorScheme.primary,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    keyInfo?.label ?? entry.key,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => _removeSystemMeta(entry.key),
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: theme.colorScheme.error,
                                    size: 20,
                                  ),
                                  tooltip: '删除',
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              initialValue: entry.value,
                              decoration: InputDecoration(
                                hintText: keyInfo?.hint ?? '请输入值',
                                isDense: true,
                              ),
                              keyboardType: keyInfo?.keyboardType,
                              onChanged: (value) {
                                _systemMeta[entry.key] = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        
        // 添加按钮
        Container(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: _addSystemMeta,
            icon: const Icon(Icons.add),
            label: const Text('添加系统字段'),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomMetaList(ThemeData theme) {
    return Column(
      children: [
        // 说明
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: theme.colorScheme.surfaceContainerHighest.withAlpha(100),
          child: Text(
            '自定义字段是用户自由添加的键值对信息，可用于记录任意扩展数据。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        
        // 列表
        Expanded(
          child: _customMeta.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.tune,
                        size: 64,
                        color: theme.colorScheme.onSurfaceVariant.withAlpha(128),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '暂无自定义字段',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '点击下方按钮添加',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant.withAlpha(180),
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _customMeta.length,
                  itemBuilder: (context, index) {
                    final entry = _customMeta.entries.elementAt(index);
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        title: Text(entry.key),
                        subtitle: Text(
                          entry.value.isEmpty ? '(空)' : entry.value,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => _editCustomMeta(entry.key, entry.value),
                              icon: const Icon(Icons.edit_outlined),
                              tooltip: '编辑',
                            ),
                            IconButton(
                              onPressed: () => _removeCustomMeta(entry.key),
                              icon: Icon(
                                Icons.delete_outline,
                                color: theme.colorScheme.error,
                              ),
                              tooltip: '删除',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        
        // 添加按钮
        Container(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: _addCustomMeta,
            icon: const Icon(Icons.add),
            label: const Text('添加自定义字段'),
          ),
        ),
      ],
    );
  }
}

/// 元数据键信息
class _MetaKeyInfo {
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;

  const _MetaKeyInfo({
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
  });
}

/// 系统元数据选择底部弹窗
class _SystemMetaPickerSheet extends StatelessWidget {
  final List<MapEntry<String, _MetaKeyInfo>> availableKeys;

  const _SystemMetaPickerSheet({
    required this.availableKeys,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '选择系统字段',
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
          ...availableKeys.map((entry) => ListTile(
                leading: Icon(entry.value.icon),
                title: Text(entry.value.label),
                subtitle: Text(entry.value.hint),
                onTap: () {
                  HapticService.selectionClick();
                  Navigator.pop(context, entry.key);
                },
              )),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// 添加自定义元数据对话框
class _AddCustomMetaDialog extends StatefulWidget {
  final String? initialKey;
  final String? initialValue;
  final bool isEditing;

  const _AddCustomMetaDialog({
    this.initialKey,
    this.initialValue,
    this.isEditing = false,
  });

  @override
  State<_AddCustomMetaDialog> createState() => _AddCustomMetaDialogState();
}

class _AddCustomMetaDialogState extends State<_AddCustomMetaDialog> {
  late TextEditingController _keyController;
  late TextEditingController _valueController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _keyController = TextEditingController(text: widget.initialKey);
    _valueController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEditing ? '编辑字段' : '添加自定义字段'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _keyController,
              decoration: const InputDecoration(
                labelText: '字段名',
                hintText: '如：备注信息',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请输入字段名';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _valueController,
              decoration: const InputDecoration(
                labelText: '字段值',
                hintText: '请输入值',
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pop(context, {
                'key': _keyController.text.trim(),
                'value': _valueController.text.trim(),
              });
            }
          },
          child: Text(widget.isEditing ? '保存' : '添加'),
        ),
      ],
    );
  }
}
