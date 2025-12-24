import 'package:flutter/material.dart';

/// 数据恢复页面（从备份恢复）
class DataRecoveryPage extends StatelessWidget {
  const DataRecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('从备份恢复'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction_outlined,
              size: 100,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 32),
            Text(
              '功能开发中',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '备份与恢复功能正在开发中，敬请期待。\n完成后您可以从本地文件或云端恢复数据。',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 48),

            // 选择备份文件按钮（禁用状态）
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: null, // 禁用按钮
                icon: const Icon(Icons.folder_open_outlined),
                label: const Text('选择备份文件（即将推出）'),
              ),
            ),
            const SizedBox(height: 16),

            // 云端恢复按钮（禁用状态）
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: null, // 禁用按钮
                icon: const Icon(Icons.cloud_outlined),
                label: const Text('从云端恢复（即将推出）'),
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
                      '备份文件将包含所有账户、交易记录和设置信息',
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
