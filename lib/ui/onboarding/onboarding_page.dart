import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../home/home_page.dart';

/// 初始化配置状态
class InitConfigState {
  final bool enableAssetManagement;
  final bool enableBudgetManagement;
  final bool enableMultiCurrency;
  final bool enableMultiLedger;
  final bool enableBiometric;

  const InitConfigState({
    this.enableAssetManagement = true,
    this.enableBudgetManagement = true,
    this.enableMultiCurrency = false,
    this.enableMultiLedger = false,
    this.enableBiometric = false,
  });

  InitConfigState copyWith({
    bool? enableAssetManagement,
    bool? enableBudgetManagement,
    bool? enableMultiCurrency,
    bool? enableMultiLedger,
    bool? enableBiometric,
  }) {
    return InitConfigState(
      enableAssetManagement:
          enableAssetManagement ?? this.enableAssetManagement,
      enableBudgetManagement:
          enableBudgetManagement ?? this.enableBudgetManagement,
      enableMultiCurrency: enableMultiCurrency ?? this.enableMultiCurrency,
      enableMultiLedger: enableMultiLedger ?? this.enableMultiLedger,
      enableBiometric: enableBiometric ?? this.enableBiometric,
    );
  }
}

/// 初始化配置 Notifier
class InitConfigNotifier extends StateNotifier<InitConfigState> {
  InitConfigNotifier() : super(const InitConfigState());

  void setEnableAssetManagement(bool value) {
    state = state.copyWith(enableAssetManagement: value);
  }

  void setEnableBudgetManagement(bool value) {
    state = state.copyWith(enableBudgetManagement: value);
  }

  void setEnableMultiCurrency(bool value) {
    state = state.copyWith(enableMultiCurrency: value);
  }

  void setEnableMultiLedger(bool value) {
    state = state.copyWith(enableMultiLedger: value);
  }

  void setEnableBiometric(bool value) {
    state = state.copyWith(enableBiometric: value);
  }
}

final initConfigProvider =
    StateNotifierProvider<InitConfigNotifier, InitConfigState>(
      (ref) => InitConfigNotifier(),
    );

/// 应用初始化页面
class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  int _currentStep = 0;
  bool _isReverse = false;
  bool _isSaving = false;

  final List<_StepConfig> _steps = const [
    _StepConfig(
      title: '欢迎使用',
      subtitle: '让我们开始配置您的记账应用',
      icon: Icons.waving_hand_rounded,
    ),
    _StepConfig(
      title: '资产管理',
      subtitle: '启用资产管理功能，查看您的账户余额和资产分布',
      icon: Icons.account_balance_wallet_rounded,
      configKey: 'enableAssetManagement',
    ),
    _StepConfig(
      title: '预算管理',
      subtitle: '启用预算管理功能，帮助您控制支出',
      icon: Icons.pie_chart_rounded,
      configKey: 'enableBudgetManagement',
    ),
    _StepConfig(
      title: '多货币支持',
      subtitle: '启用多货币功能，支持不同币种的记账和汇率转换',
      icon: Icons.currency_exchange_rounded,
      configKey: 'enableMultiCurrency',
    ),
    _StepConfig(
      title: '多账本',
      subtitle: '启用多账本功能，分开管理个人、家庭或项目账目',
      icon: Icons.library_books_rounded,
      configKey: 'enableMultiLedger',
    ),
    _StepConfig(
      title: '生物识别',
      subtitle: '启用生物识别解锁，使用指纹或面容保护您的财务数据',
      icon: Icons.fingerprint_rounded,
      configKey: 'enableBiometric',
    ),
    _StepConfig(
      title: '配置完成',
      subtitle: '一切就绪，开始您的记账之旅！',
      icon: Icons.check_circle_rounded,
    ),
  ];

  void _nextStep() {
    if (_currentStep < _steps.length - 1) {
      HapticService.lightImpact();
      setState(() {
        _isReverse = false;
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      HapticService.lightImpact();
      setState(() {
        _isReverse = true;
        _currentStep--;
      });
    }
  }

  Future<void> _completeSetup() async {
    setState(() => _isSaving = true);

    try {
      final prefs = await ref.read(appPreferencesProvider.future);
      final config = ref.read(initConfigProvider);

      await prefs.saveInitConfig(
        enableAssetManagement: config.enableAssetManagement,
        enableBudgetManagement: config.enableBudgetManagement,
        enableMultiCurrency: config.enableMultiCurrency,
        enableMultiLedger: config.enableMultiLedger,
        enableBiometric: config.enableBiometric,
      );

      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final config = ref.watch(initConfigProvider);
    final step = _steps[_currentStep];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // 进度指示器
              _buildProgressIndicator(theme),
              const SizedBox(height: 32),

              // 内容区域 - 使用共享轴动画
              Expanded(
                child: PageTransitionSwitcher(
                  reverse: _isReverse,
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation, secondaryAnimation) {
                    return SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                      child: child,
                    );
                  },
                  child: _buildStepContent(step, config, theme),
                ),
              ),

              // 底部按钮
              _buildBottomButtons(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(ThemeData theme) {
    return Row(
      children: List.generate(_steps.length, (index) {
        final isActive = index <= _currentStep;
        final isCurrent = index == _currentStep;

        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 4,
            decoration: BoxDecoration(
              color: isActive
                  ? theme.colorScheme.primary
                  : theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(2),
            ),
            child: isCurrent
                ? TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, value, child) {
                      return FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: value,
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      );
                    },
                  )
                : null,
          ),
        );
      }),
    );
  }

  Widget _buildStepContent(
    _StepConfig step,
    InitConfigState config,
    ThemeData theme,
  ) {
    return KeyedSubtree(
      key: ValueKey(_currentStep),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 图标
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              step.icon,
              size: 64,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 32),

          // 标题
          Text(
            step.title,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // 描述
          Text(
            step.subtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),

          // 配置开关
          if (step.configKey != null) ...[
            const SizedBox(height: 48),
            _buildConfigSwitch(step.configKey!, config, theme),
          ],
        ],
      ),
    );
  }

  Widget _buildConfigSwitch(
    String configKey,
    InitConfigState config,
    ThemeData theme,
  ) {
    bool value;
    void Function(bool) onChanged;

    switch (configKey) {
      case 'enableAssetManagement':
        value = config.enableAssetManagement;
        onChanged = ref
            .read(initConfigProvider.notifier)
            .setEnableAssetManagement;
        break;
      case 'enableBudgetManagement':
        value = config.enableBudgetManagement;
        onChanged = ref
            .read(initConfigProvider.notifier)
            .setEnableBudgetManagement;
        break;
      case 'enableMultiCurrency':
        value = config.enableMultiCurrency;
        onChanged = ref
            .read(initConfigProvider.notifier)
            .setEnableMultiCurrency;
        break;
      case 'enableMultiLedger':
        value = config.enableMultiLedger;
        onChanged = ref.read(initConfigProvider.notifier).setEnableMultiLedger;
        break;
      case 'enableBiometric':
        value = config.enableBiometric;
        onChanged = ref.read(initConfigProvider.notifier).setEnableBiometric;
        break;
      default:
        return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value ? '已启用' : '未启用', style: theme.textTheme.titleMedium),
          Switch.adaptive(
            value: value,
            onChanged: (v) {
              HapticService.selectionClick();
              onChanged(v);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(ThemeData theme) {
    final isFirstStep = _currentStep == 0;
    final isLastStep = _currentStep == _steps.length - 1;

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          // 返回按钮
          if (!isFirstStep)
            Expanded(
              child: OutlinedButton(
                onPressed: _previousStep,
                child: const Text('上一步'),
              ),
            ),
          if (!isFirstStep) const SizedBox(width: 16),

          // 下一步/完成按钮
          Expanded(
            flex: isFirstStep ? 1 : 1,
            child: FilledButton(
              onPressed: _isSaving
                  ? null
                  : (isLastStep ? _completeSetup : _nextStep),
              child: _isSaving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(isLastStep ? '开始使用' : (isFirstStep ? '开始配置' : '下一步')),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepConfig {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? configKey;

  const _StepConfig({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.configKey,
  });
}
