/// 预览确认页面
///
/// 初始化流程的最后一步，展示配置摘要并完成初始化

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/app_icon_widget.dart';
import 'onboarding_state.dart';

/// 预览确认页面
class PreviewConfirmPage extends ConsumerStatefulWidget {
  final VoidCallback onConfirm;

  const PreviewConfirmPage({super.key, required this.onConfirm});

  @override
  ConsumerState<PreviewConfirmPage> createState() => _PreviewConfirmPageState();
}

class _PreviewConfirmPageState extends ConsumerState<PreviewConfirmPage>
    with TickerProviderStateMixin {
  bool _isConfirming = false;
  double _progress = 0;
  String _currentStep = '';
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  Future<void> _startConfirmation() async {
    setState(() {
      _isConfirming = true;
      _progress = 0;
      _currentStep = '准备中...';
    });

    final steps = [
      ('创建货币配置...', 0.15),
      ('创建账户...', 0.35),
      ('创建分类...', 0.55),
      ('创建账本...', 0.75),
      ('保存设置...', 0.90),
      ('完成！', 1.0),
    ];

    for (final (step, progress) in steps) {
      if (!mounted) return;

      setState(() {
        _currentStep = step;
      });

      // 动画过渡到新进度
      await _animateProgress(_progress, progress);

      // 模拟处理时间
      await Future.delayed(const Duration(milliseconds: 300));
    }

    // 完成后短暂延迟再跳转
    await Future.delayed(const Duration(milliseconds: 500));

    if (mounted) {
      widget.onConfirm();
    }
  }

  Future<void> _animateProgress(double from, double to) async {
    final completer = Completer<void>();

    final animation = Tween<double>(begin: from, end: to).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    void listener() {
      if (mounted) {
        setState(() {
          _progress = animation.value;
        });
      }
    }

    animation.addListener(listener);
    _progressController.forward(from: 0).then((_) {
      animation.removeListener(listener);
      completer.complete();
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingProvider);

    if (_isConfirming) {
      return _buildProgressView(theme);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('配置预览'), centerTitle: true),
      body: Column(
        children: [
          // 配置摘要
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // 标题
                Text(
                  '即将完成配置',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '请确认以下配置信息，确认后将初始化您的账本系统。',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),

                // 货币配置
                _buildSection(
                  theme,
                  icon: Icons.attach_money,
                  title: '货币',
                  items: [
                    _ConfigItem(
                      '可用货币',
                      '${state.availableCurrencies.length} 种',
                    ),
                    _ConfigItem('自定义货币', '${state.customCurrencies.length} 种'),
                    _ConfigItem(
                      '默认货币',
                      state.defaultCurrency ?? '未设置',
                      isWarning: state.defaultCurrency == null,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 账户配置
                _buildSection(
                  theme,
                  icon: Icons.account_balance_wallet,
                  title: '账户',
                  items: [
                    _ConfigItem('账户数量', '${state.accounts.length} 个'),
                    ...state.accounts
                        .take(3)
                        .map(
                          (a) => _ConfigItem(a.name, a.typeName, icon: a.icon),
                        ),
                    if (state.accounts.length > 3)
                      _ConfigItem('', '还有 ${state.accounts.length - 3} 个账户...'),
                  ],
                ),
                const SizedBox(height: 16),

                // 分类配置
                _buildSection(
                  theme,
                  icon: Icons.category,
                  title: '分类',
                  items: [
                    _ConfigItem(
                      '支出分类',
                      '${_countCategories(state.expenseCategories)} 个',
                    ),
                    _ConfigItem(
                      '收入分类',
                      '${_countCategories(state.incomeCategories)} 个',
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 账本配置
                _buildSection(
                  theme,
                  icon: Icons.book,
                  title: '账本',
                  items: [
                    _ConfigItem('账本数量', '${state.ledgers.length} 个'),
                    ...state.ledgers.map(
                      (l) => _ConfigItem(
                        l.name,
                        l.isDefault ? '默认账本' : '',
                        icon: l.icon,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 确认按钮
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 配置统计
                _buildStats(theme, state),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _startConfirmation,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline),
                      SizedBox(width: 8),
                      Text('确认并开始使用'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressView(ThemeData theme) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 动画图标
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: 0.8 + (value * 0.2),
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child: Icon(
                  _progress >= 1 ? Icons.check_circle : Icons.sync,
                  size: 80,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 32),

              // 进度条
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: _progress,
                  minHeight: 8,
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                ),
              ),
              const SizedBox(height: 16),

              // 百分比
              Text(
                '${(_progress * 100).toInt()}%',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),

              // 当前步骤
              Text(
                _currentStep,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    ThemeData theme, {
    required IconData icon,
    required String title,
    required List<_ConfigItem> items,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    if (item.icon != null) ...[
                      AppIconWidget.fromString(item.icon!, size: 20),
                      const SizedBox(width: 8),
                    ],
                    Expanded(
                      child: Text(
                        item.label,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      item.value,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: item.isWarning
                            ? theme.colorScheme.error
                            : theme.colorScheme.onSurfaceVariant,
                        fontWeight: item.isWarning ? FontWeight.bold : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStats(ThemeData theme, OnboardingState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            theme,
            '${state.availableCurrencies.length + state.customCurrencies.length}',
            '货币',
          ),
          _buildStatItem(theme, '${state.accounts.length}', '账户'),
          _buildStatItem(
            theme,
            '${_countCategories(state.expenseCategories) + _countCategories(state.incomeCategories)}',
            '分类',
          ),
          _buildStatItem(theme, '${state.ledgers.length}', '账本'),
        ],
      ),
    );
  }

  Widget _buildStatItem(ThemeData theme, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  int _countCategories(List<PreConfigCategory> categories) {
    int count = 0;
    void countRecursive(List<PreConfigCategory> cats) {
      for (final cat in cats) {
        count++;
        countRecursive(cat.children);
      }
    }

    countRecursive(categories);
    return count;
  }
}

class _ConfigItem {
  final String label;
  final String value;
  final String? icon;
  final bool isWarning;

  const _ConfigItem(
    this.label,
    this.value, {
    this.icon,
    this.isWarning = false,
  });
}
