import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/database.dart';
import '../../utils/haptic_service.dart';
import 'database_browser_page.dart';

/// 开发者工具页面
class DeveloperToolsPage extends ConsumerWidget {
  const DeveloperToolsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('开发者工具'),
        backgroundColor: theme.colorScheme.errorContainer,
        foregroundColor: theme.colorScheme.onErrorContainer,
      ),
      body: ListView(
        children: [
          // 警告横幅
          Container(
            color: theme.colorScheme.errorContainer,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: theme.colorScheme.onErrorContainer,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '警告：开发者工具仅供调试使用，不当操作可能导致数据损坏！',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // 数据库工具
          _buildSection(
            context,
            title: '数据库',
            children: [
              _buildToolItem(
                context,
                icon: Icons.storage_rounded,
                title: '数据库浏览器',
                subtitle: '浏览、编辑数据库表，管理账本',
                onTap: () {
                  HapticService.lightImpact();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DatabaseBrowserPage(),
                    ),
                  );
                },
              ),
              _buildToolItem(
                context,
                icon: Icons.folder_open_rounded,
                title: '数据库文件',
                subtitle: '查看所有账本的数据库文件信息',
                onTap: () {
                  HapticService.lightImpact();
                  _showDatabaseFilesDialog(context);
                },
              ),
            ],
          ),

          // 调试工具（预留）
          _buildSection(
            context,
            title: '调试',
            children: [
              _buildToolItem(
                context,
                icon: Icons.bug_report_rounded,
                title: '日志查看器',
                subtitle: '查看应用运行日志',
                enabled: false,
                onTap: () {},
              ),
              _buildToolItem(
                context,
                icon: Icons.memory_rounded,
                title: '性能监控',
                subtitle: '查看内存和CPU使用情况',
                enabled: false,
                onTap: () {},
              ),
            ],
          ),

          // 实验性功能（预留）
          _buildSection(
            context,
            title: '实验性功能',
            children: [
              _buildToolItem(
                context,
                icon: Icons.science_rounded,
                title: '功能开关',
                subtitle: '启用或禁用实验性功能',
                enabled: false,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showDatabaseFilesDialog(BuildContext context) async {
    try {
      final files = await DatabaseManager.listDatabaseFiles();
      
      if (!context.mounted) return;
      
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            children: [
              const Icon(Icons.folder_open),
              const SizedBox(width: 8),
              const Text('数据库文件'),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: files.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: Text('暂无数据库文件')),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: files.length,
                    itemBuilder: (context, index) {
                      final file = files[index];
                      final size = _formatFileSize(file['size'] as int);
                      final modified = file['modified'] as DateTime;
                      
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: const Icon(Icons.storage, color: Colors.teal),
                          title: Text(
                            file['name'] as String,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('大小: $size'),
                              Text(
                                '修改: ${_formatDateTime(modified)}',
                                style: const TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                          isThreeLine: true,
                          trailing: IconButton(
                            icon: const Icon(Icons.copy, size: 20),
                            tooltip: '复制路径',
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: file['path'] as String),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('路径已复制到剪贴板')),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
          actions: [
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('关闭'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('获取文件列表失败: $e')),
        );
      }
    }
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  String _formatDateTime(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildToolItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool enabled = true,
  }) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        color: enabled
            ? theme.colorScheme.onSurfaceVariant
            : theme.colorScheme.outline,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: enabled ? null : theme.colorScheme.outline,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: enabled
              ? theme.colorScheme.onSurfaceVariant
              : theme.colorScheme.outline.withValues(alpha: 0.7),
        ),
      ),
      trailing: enabled
          ? const Icon(Icons.chevron_right)
          : Chip(
              label: Text(
                '即将推出',
                style: theme.textTheme.labelSmall,
              ),
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
      enabled: enabled,
      onTap: enabled ? onTap : null,
    );
  }
}
