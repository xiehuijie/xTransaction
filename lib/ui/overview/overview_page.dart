import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/ledger_service.dart';
import '../../providers/providers.dart';
import '../../l10n/app_localizations.dart';

/// 概览页面 - 账本选择和概览信息
class OverviewPage extends ConsumerStatefulWidget {
  const OverviewPage({super.key});

  @override
  ConsumerState<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends ConsumerState<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currentLedgerId = ref.watch(currentLedgerIdProvider);
    final ledgers = ref.watch(allLedgersProvider);
    final ledgerServiceAsync = ref.watch(ledgerServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.overview ?? '概览'),
        actions: [
          // 账本选择下拉菜单
          if (ledgers.isNotEmpty)
            PopupMenuButton<String>(
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCurrentLedgerIcon(ledgers, currentLedgerId),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
              onSelected: (ledgerId) {
                ref.read(currentLedgerIdProvider.notifier).state = ledgerId;
                ledgerServiceAsync.whenData((s) => s.setCurrentLedgerId(ledgerId));
              },
              itemBuilder: (context) => ledgers.map((ledger) {
                return PopupMenuItem<String>(
                  value: ledger.id,
                  child: Row(
                    children: [
                      if (ledger.icon?.isNotEmpty == true)
                        Text(ledger.icon!, style: const TextStyle(fontSize: 20))
                      else
                        const Icon(Icons.book),
                      const SizedBox(width: 8),
                      Expanded(child: Text(ledger.name)),
                      if (ledger.id == currentLedgerId)
                        const Icon(Icons.check, color: Colors.green),
                    ],
                  ),
                );
              }).toList(),
            ),
        ],
      ),
      body: _buildBody(context, l10n),
    );
  }

  Widget _buildCurrentLedgerIcon(List<LedgerMeta> ledgers, String? currentLedgerId) {
    if (currentLedgerId == null) {
      return const Icon(Icons.book);
    }
    
    final currentLedger = ledgers.firstWhere(
      (l) => l.id == currentLedgerId,
      orElse: () => ledgers.isNotEmpty ? ledgers.first : LedgerMeta(
        id: '', 
        name: '未选择', 
        currencyCode: 'CNY', 
        createdAt: 0, 
        updatedAt: 0,
      ),
    );
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (currentLedger.icon?.isNotEmpty == true)
          Text(currentLedger.icon!, style: const TextStyle(fontSize: 20))
        else
          const Icon(Icons.book),
        const SizedBox(width: 4),
        Text(currentLedger.name),
      ],
    );
  }

  Widget _buildBody(BuildContext context, AppLocalizations? l10n) {
    final currentLedgerId = ref.watch(currentLedgerIdProvider);
    final ledgers = ref.watch(allLedgersProvider);
    final ledgerServiceAsync = ref.watch(ledgerServiceProvider);

    // 等待 LedgerService 加载
    return ledgerServiceAsync.when(
      data: (ledgerService) {
        if (ledgers.isEmpty) {
          return _buildNoLedgerView(context, l10n, ledgerService);
        }
        
        if (currentLedgerId == null && ledgers.isNotEmpty) {
          // 自动选择第一个账本
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(currentLedgerIdProvider.notifier).state = ledgers.first.id;
            ledgerService.setCurrentLedgerId(ledgers.first.id);
          });
          return const Center(child: CircularProgressIndicator());
        }
        
        final currentLedger = ledgers.firstWhere(
          (l) => l.id == currentLedgerId,
          orElse: () => ledgers.first,
        );
        
        return _buildLedgerOverview(context, l10n, currentLedger);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(l10n?.error ?? '错误'),
            const SizedBox(height: 8),
            Text(error.toString(), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildNoLedgerView(BuildContext context, AppLocalizations? l10n, LedgerService ledgerService) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.book_outlined, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            '暂无账本',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            '创建一个账本开始使用',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => _showCreateLedgerDialog(context, l10n, ledgerService),
            icon: const Icon(Icons.add),
            label: Text(l10n?.createLedger ?? '创建账本'),
          ),
        ],
      ),
    );
  }

  Widget _buildLedgerOverview(
    BuildContext context,
    AppLocalizations? l10n,
    LedgerMeta ledger,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(ledgerServiceProvider);
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 账本信息卡片
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (ledger.icon?.isNotEmpty == true)
                        Text(ledger.icon!, style: const TextStyle(fontSize: 32))
                      else
                        const Icon(Icons.book, size: 32),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ledger.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            if (ledger.description.isNotEmpty)
                              Text(
                                ledger.description,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        '${l10n?.currency ?? '货币'}: ${ledger.currencyCode}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      const Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        _formatDate(ledger.createdAt),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // 快速操作区域
          Text(
            '快速操作',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.5,
            children: [
              _buildQuickActionCard(
                context,
                icon: Icons.add_circle,
                label: '添加交易',
                onTap: () {
                  // TODO: 导航到添加交易页面
                },
              ),
              _buildQuickActionCard(
                context,
                icon: Icons.account_balance_wallet,
                label: '账户',
                onTap: () {
                  // TODO: 导航到账户列表页面
                },
              ),
              _buildQuickActionCard(
                context,
                icon: Icons.category,
                label: '分类',
                onTap: () {
                  // TODO: 导航到分类管理页面
                },
              ),
              _buildQuickActionCard(
                context,
                icon: Icons.analytics,
                label: l10n?.statistics ?? '统计',
                onTap: () {
                  // TODO: 导航到统计页面
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // 最近交易占位
          Text(
            '最近交易',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Column(
                  children: [
                    const Icon(Icons.receipt_long, size: 48, color: Colors.grey),
                    const SizedBox(height: 8),
                    Text(
                      '暂无交易记录',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showCreateLedgerDialog(
    BuildContext context,
    AppLocalizations? l10n,
    LedgerService ledgerService,
  ) async {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    String selectedCurrency = 'CNY';
    String selectedIcon = '📒';

    await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n?.createLedger ?? '创建账本'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: '名称',
                    hintText: '例如：日常开支',
                  ),
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: '描述',
                    hintText: '可选',
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                // TODO: 添加货币选择和图标选择
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l10n?.cancel ?? '取消'),
            ),
            FilledButton(
              onPressed: () async {
                if (nameController.text.trim().isEmpty) return;
                
                final ledger = await ledgerService.createLedger(
                  name: nameController.text.trim(),
                  currencyCode: selectedCurrency,
                  description: descriptionController.text.trim(),
                  icon: selectedIcon,
                );
                
                ref.read(currentLedgerIdProvider.notifier).state = ledger.id;
                ref.invalidate(ledgerServiceProvider);
                
                if (context.mounted) {
                  Navigator.pop(context, true);
                }
              },
              child: Text(l10n?.create ?? '创建'),
            ),
          ],
        );
      },
    );
  }

  String _formatDate(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
