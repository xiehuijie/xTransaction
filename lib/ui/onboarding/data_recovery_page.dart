/// 数据恢复页面（从备份恢复）
///
/// 允许用户从本地备份或云端恢复数据

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/haptic_service.dart';

/// 数据恢复页面
class DataRecoveryPage extends ConsumerWidget {
  const DataRecoveryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('从备份恢复'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_download_outlined,
              size: 100,
              color: theme.colorScheme.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 32),
            Text(
              '从备份恢复数据',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '您可以从之前创建的备份文件中恢复数据。\n此功能正在开发中，敬请期待。',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 48),

            // 选择备份文件按钮（暂不可用）
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  HapticService.lightImpact();
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('备份恢复功能正在开发中')));
                },
                icon: const Icon(Icons.folder_open_outlined),
                label: const Text('选择备份文件'),
              ),
            ),
            const SizedBox(height: 16),

            // 云端恢复按钮（暂不可用）
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  HapticService.lightImpact();
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('云端备份功能正在开发中')));
                },
                icon: const Icon(Icons.cloud_outlined),
                label: const Text('从云端恢复'),
              ),
            ),

            const SizedBox(height: 48),

            // 提示信息
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: theme.colorScheme.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '备份文件包含所有账户、交易记录和设置信息',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
