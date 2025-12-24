/// 初始化流程主页面
///
/// 重新设计的初始化流程，采用分步配置模式

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/haptic_service.dart';
import '../../utils/biometric_service.dart';
import '../home/home_page.dart';
import 'data_recovery_page.dart';
import 'currency_config_page.dart';
import 'account_config_page.dart';
import 'category_config_page.dart';
import 'ledger_config_page.dart';
import 'onboarding_state.dart';

/// 步骤类型
enum StepType {
  welcome,
  config,
  complete,
}

/// 预配置类型
enum PreConfigType {
  currencies,
  accounts,
  categories,
  ledgers,
}

/// 步骤配置
class _StepConfig {
  final String title;
  final String subtitle;
  final IconData icon;
  final StepType stepType;
  final String? configKey;
  final PreConfigType? preConfigType;

  const _StepConfig({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.stepType,
    this.configKey,
    this.preConfigType,
  });
}

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
      stepType: StepType.welcome,
    ),
    _StepConfig(
      title: '货币设置',
      subtitle: '配置您需要使用的货币和默认货币',
      icon: Icons.currency_exchange_rounded,
      stepType: StepType.config,
      preConfigType: PreConfigType.currencies,
    ),
    _StepConfig(
      title: '账户设置',
      subtitle: '添加您的银行卡、钱包等账户',
      icon: Icons.account_balance_wallet_rounded,
      stepType: StepType.config,
      preConfigType: PreConfigType.accounts,
    ),
    _StepConfig(
      title: '分类设置',
      subtitle: '配置收支分类，支持多层级结构',
      icon: Icons.category_rounded,
      stepType: StepType.config,
      preConfigType: PreConfigType.categories,
    ),
    _StepConfig(
      title: '账本设置',
      subtitle: '创建账本并选择关联的账户和分类',
      icon: Icons.library_books_rounded,
      stepType: StepType.config,
      preConfigType: PreConfigType.ledgers,
    ),
    _StepConfig(
      title: '生物识别',
      subtitle: '启用指纹或面容保护您的财务数据',
      icon: Icons.fingerprint_rounded,
      configKey: 'enableBiometric',
      stepType: StepType.config,
    ),
    _StepConfig(
      title: '配置完成',
      subtitle: '一切就绪，开始您的记账之旅！',
      icon: Icons.check_circle_rounded,
      stepType: StepType.complete,
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

  void _goToDataRecovery() {
    HapticService.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DataRecoveryPage(),
      ),
    );
  }

  void _goToPreConfig(PreConfigType type) {
    HapticService.lightImpact();
    Widget page;
    switch (type) {
      case PreConfigType.currencies:
        page = const CurrencyConfigPage();
        break;
      case PreConfigType.accounts:
        page = const AccountConfigPage();
        break;
      case PreConfigType.categories:
        page = const CategoryConfigPage();
        break;
      case PreConfigType.ledgers:
        page = const LedgerConfigPage();
        break;
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<void> _completeSetup() async {
    setState(() => _isSaving = true);

    try {
      // TODO: 保存所有配置到数据库
      await Future.delayed(const Duration(milliseconds: 500));

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
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('初始化失败: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
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
    final state = ref.watch(onboardingProvider);
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
                  child: _buildStepContent(step, state, theme),
                ),
              ),

              // 底部按钮
              _buildBottomButtons(theme, step),
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
    OnboardingState state,
    ThemeData theme,
  ) {
    return KeyedSubtree(
      key: ValueKey(_currentStep),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
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

            // 欢迎页面特殊内容
            if (step.stepType == StepType.welcome) ...[
              const SizedBox(height: 48),
              _buildStartupOptions(theme),
            ],

            // 配置按钮
            if (step.preConfigType != null) ...[
              const SizedBox(height: 32),
              _buildPreConfigButton(step, state, theme),
            ],

            // 生物识别开关
            if (step.configKey == 'enableBiometric') ...[
              const SizedBox(height: 32),
              _buildBiometricSwitch(state.enableBiometric, theme),
            ],

            // 完成页面摘要
            if (step.stepType == StepType.complete) ...[
              const SizedBox(height: 32),
              _buildCompleteSummary(state, theme),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStartupOptions(ThemeData theme) {
    return Column(
      children: [
        Card(
          child: InkWell(
            onTap: _nextStep,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '从新开始',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '创建全新的记账环境',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: InkWell(
            onTap: _goToDataRecovery,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.tertiaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.restore,
                      color: theme.colorScheme.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '从备份恢复',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '从备份文件恢复数据',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreConfigButton(
    _StepConfig step,
    OnboardingState state,
    ThemeData theme,
  ) {
    String buttonText;
    int itemCount;
    String statusText;
    bool isConfigured;

    switch (step.preConfigType!) {
      case PreConfigType.currencies:
        buttonText = '配置货币';
        itemCount = state.availableCurrencies.length;
        statusText = '已选择 $itemCount 种货币';
        isConfigured = itemCount >= 1;
        break;
      case PreConfigType.accounts:
        buttonText = '配置账户';
        itemCount = state.accounts.length;
        statusText = '已添加 $itemCount 个账户';
        isConfigured = itemCount >= 1;
        break;
      case PreConfigType.categories:
        buttonText = '配置分类';
        final expenseCount = _countCategories(state.expenseCategories);
        final incomeCount = _countCategories(state.incomeCategories);
        itemCount = expenseCount + incomeCount;
        statusText = '支出 $expenseCount 个, 收入 $incomeCount 个';
        isConfigured = itemCount >= 1;
        break;
      case PreConfigType.ledgers:
        buttonText = '配置账本';
        itemCount = state.ledgers.length;
        statusText = '已创建 $itemCount 个账本';
        isConfigured = itemCount >= 1;
        break;
    }

    return Column(
      children: [
        // 状态显示
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    isConfigured ? Icons.check_circle : Icons.info_outline,
                    color: isConfigured
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    statusText,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isConfigured
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // 配置按钮
        OutlinedButton.icon(
          onPressed: () => _goToPreConfig(step.preConfigType!),
          icon: const Icon(Icons.settings_outlined),
          label: Text(buttonText),
        ),
      ],
    );
  }

  int _countCategories(List<PreConfigCategory> categories) {
    int count = categories.length;
    for (final cat in categories) {
      count += _countCategories(cat.children);
    }
    return count;
  }

  Widget _buildBiometricSwitch(bool value, ThemeData theme) {
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
            onChanged: (v) async {
              HapticService.selectionClick();

              if (v) {
                // 检查生物识别可用性
                final canCheck = await BiometricService.canCheckBiometrics();
                if (!canCheck) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('设备不支持生物识别或未设置生物识别')),
                    );
                  }
                  return;
                }

                // 验证生物识别
                final result = await BiometricService.authenticate(
                  localizedReason: '验证身份以启用生物识别解锁',
                );

                if (result != BiometricResult.success) {
                  if (mounted) {
                    String message;
                    switch (result) {
                      case BiometricResult.failed:
                        message = '验证失败';
                        break;
                      case BiometricResult.notEnrolled:
                        message = '请先在设备上设置生物识别';
                        break;
                      case BiometricResult.lockedOut:
                        message = '验证次数过多，请稍后重试';
                        break;
                      default:
                        message = '无法启用生物识别';
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  }
                  return;
                }
              }

              ref.read(onboardingProvider.notifier).setEnableBiometric(v);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCompleteSummary(OnboardingState state, ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '配置摘要',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSummaryRow(
              theme,
              '货币',
              '${state.availableCurrencies.length} 种',
              state.availableCurrencies.isNotEmpty,
            ),
            _buildSummaryRow(
              theme,
              '账户',
              '${state.accounts.length} 个',
              state.accounts.isNotEmpty,
            ),
            _buildSummaryRow(
              theme,
              '分类',
              '${_countCategories(state.expenseCategories) + _countCategories(state.incomeCategories)} 个',
              state.expenseCategories.isNotEmpty || state.incomeCategories.isNotEmpty,
            ),
            _buildSummaryRow(
              theme,
              '账本',
              '${state.ledgers.length} 个',
              state.ledgers.isNotEmpty,
            ),
            _buildSummaryRow(
              theme,
              '生物识别',
              state.enableBiometric ? '已启用' : '未启用',
              state.enableBiometric,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    ThemeData theme,
    String label,
    String value,
    bool isEnabled,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(
            isEnabled ? Icons.check_circle : Icons.circle_outlined,
            size: 18,
            color: isEnabled
                ? theme.colorScheme.primary
                : theme.colorScheme.outline,
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(
              color: isEnabled
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(ThemeData theme, _StepConfig step) {
    // 欢迎页面没有按钮
    if (step.stepType == StepType.welcome) {
      return const SizedBox(height: 56);
    }

    return Row(
      children: [
        // 返回按钮
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _previousStep,
            icon: const Icon(Icons.arrow_back),
            label: const Text('上一步'),
          ),
        ),
        const SizedBox(width: 16),
        // 下一步或完成按钮
        Expanded(
          child: step.stepType == StepType.complete
              ? FilledButton.icon(
                  onPressed: _isSaving ? null : _completeSetup,
                  icon: _isSaving
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.check),
                  label: Text(_isSaving ? '保存中...' : '开始使用'),
                )
              : FilledButton.icon(
                  onPressed: _nextStep,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('下一步'),
                ),
        ),
      ],
    );
  }
}
