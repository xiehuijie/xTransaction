import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide Column;

import '../../data/database/database.dart';
import '../../data/database/tables.dart';
import '../../providers/providers.dart';
import '../../utils/haptic_service.dart';
import '../../utils/biometric_service.dart';
import '../home/home_page.dart';
import 'onboarding_config.dart';
import 'preconfig_accounts_page.dart';
import 'preconfig_ledgers_page.dart';
import 'preconfig_currencies_page.dart';
import 'data_recovery_page.dart';

/// 启动模式
enum StartupMode { fresh, fromBackup }

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
      title: '资产管理',
      subtitle: '启用资产管理功能，查看您的账户余额和资产分布',
      icon: Icons.account_balance_wallet_rounded,
      configKey: 'enableAssetManagement',
      stepType: StepType.config,
      preConfigType: PreConfigType.accounts,
    ),
    _StepConfig(
      title: '预算管理',
      subtitle: '启用预算管理功能，帮助您控制支出',
      icon: Icons.pie_chart_rounded,
      configKey: 'enableBudgetManagement',
      stepType: StepType.config,
    ),
    _StepConfig(
      title: '多货币支持',
      subtitle: '启用多货币功能，支持不同币种的记账和汇率转换',
      icon: Icons.currency_exchange_rounded,
      configKey: 'enableMultiCurrency',
      stepType: StepType.config,
      preConfigType: PreConfigType.currencies,
    ),
    _StepConfig(
      title: '多账本',
      subtitle: '启用多账本功能，分开管理个人、家庭或项目账目',
      icon: Icons.library_books_rounded,
      configKey: 'enableMultiLedger',
      stepType: StepType.config,
      preConfigType: PreConfigType.ledgers,
    ),
    _StepConfig(
      title: '生物识别',
      subtitle: '启用生物识别解锁，使用指纹或面容保护您的财务数据',
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
      case PreConfigType.accounts:
        page = const PreConfigAccountsPage();
        break;
      case PreConfigType.currencies:
        page = const PreConfigCurrenciesPage();
        break;
      case PreConfigType.ledgers:
        page = const PreConfigLedgersPage();
        break;
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<void> _completeSetup() async {
    setState(() => _isSaving = true);

    try {
      final prefs = await ref.read(appPreferencesProvider.future);
      final config = ref.read(initConfigProvider);
      final db = ref.read(databaseProvider);

      // 保存偏好设置
      await prefs.saveInitConfig(
        enableAssetManagement: config.enableAssetManagement,
        enableBudgetManagement: config.enableBudgetManagement,
        enableMultiCurrency: config.enableMultiCurrency,
        enableMultiLedger: config.enableMultiLedger,
        enableBiometric: config.enableBiometric,
      );

      // 保存预配置数据到数据库
      await _savePreConfigToDatabase(db, config);

      // 设置当前账本
      if (config.preConfigLedgers.isNotEmpty) {
        final ledgers = await db.ledgerDao.getAllLedgers();
        if (ledgers.isNotEmpty) {
          await prefs.setCurrentLedgerId(ledgers.first.ledgerId);
        }
      }

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

  Future<void> _savePreConfigToDatabase(AppDatabase db, InitConfigState config) async {
    await db.transaction(() async {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      // 保存自定义货币
      for (final currency in config.preConfigCurrencies) {
        await db.currencyDao.insertCurrency(
          CurrencyCompanion.insert(
            currencyCode: currency.currencyCode,
            name: currency.name,
            symbol: currency.symbol,
            decimal: Value(currency.decimal),
            source: const Value(CurrencySource.custom),
          ),
        );
      }

      // 保存账本
      for (final ledger in config.preConfigLedgers) {
        await db.ledgerDao.insertLedger(
          LedgerCompanion.insert(
            name: ledger.name,
            currencyCode: ledger.currencyCode,
            description: Value(ledger.description ?? ''),
            createdAt: now,
            updatedAt: now,
          ),
        );
      }

      // 获取创建的第一个账本ID
      final ledgers = await db.ledgerDao.getAllLedgers();
      final firstLedgerId = ledgers.isNotEmpty ? ledgers.first.ledgerId : null;

      // 保存账户
      for (final account in config.preConfigAccounts) {
        final accountId = await db.accountDao.insertAccount(
          AccountCompanion.insert(
            name: account.name,
            type: AccountType.values.firstWhere(
              (t) => t.name == account.type,
              orElse: () => AccountType.balance,
            ),
            currencyCode: account.currencyCode,
            createdAt: now,
            updatedAt: now,
          ),
        );

        // 关联到第一个账本
        if (firstLedgerId != null) {
          await db.accountDao.linkAccountToLedger(accountId, firstLedgerId);
        }
      }
    });
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
    InitConfigState config,
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

            // 配置开关
            if (step.configKey != null) ...[
              const SizedBox(height: 32),
              _buildConfigSwitch(step.configKey!, config, theme),
              
              // 预配置按钮
              if (step.preConfigType != null) ...[
                const SizedBox(height: 16),
                _buildPreConfigButton(step, config, theme),
              ],
            ],

            // 完成页面摘要
            if (step.stepType == StepType.complete) ...[
              const SizedBox(height: 32),
              _buildCompleteSummary(config, theme),
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
                          '全新开始',
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
        // 生物识别需要特殊处理
        return _buildBiometricSwitch(value, theme);
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

              ref.read(initConfigProvider.notifier).setEnableBiometric(v);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPreConfigButton(
    _StepConfig step,
    InitConfigState config,
    ThemeData theme,
  ) {
    bool isEnabled;
    String buttonText;
    int itemCount;

    switch (step.preConfigType!) {
      case PreConfigType.accounts:
        isEnabled = config.enableAssetManagement;
        buttonText = '管理预配置账户';
        itemCount = config.preConfigAccounts.length;
        break;
      case PreConfigType.currencies:
        isEnabled = config.enableMultiCurrency;
        buttonText = '管理货币配置';
        itemCount = config.preConfigCurrencies.length;
        break;
      case PreConfigType.ledgers:
        isEnabled = config.enableMultiLedger;
        buttonText = '管理预配置账本';
        itemCount = config.preConfigLedgers.length;
        break;
    }

    if (!isEnabled) {
      return const SizedBox.shrink();
    }

    return OutlinedButton.icon(
      onPressed: () => _goToPreConfig(step.preConfigType!),
      icon: const Icon(Icons.settings_outlined),
      label: Text(
        itemCount > 0 ? '$buttonText ($itemCount)' : buttonText,
      ),
    );
  }

  Widget _buildCompleteSummary(InitConfigState config, ThemeData theme) {
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
              '资产管理',
              config.enableAssetManagement ? '已启用' : '未启用',
              config.enableAssetManagement,
            ),
            _buildSummaryRow(
              theme,
              '预算管理',
              config.enableBudgetManagement ? '已启用' : '未启用',
              config.enableBudgetManagement,
            ),
            _buildSummaryRow(
              theme,
              '多货币',
              config.enableMultiCurrency ? '已启用' : '未启用',
              config.enableMultiCurrency,
            ),
            _buildSummaryRow(
              theme,
              '多账本',
              config.enableMultiLedger ? '已启用' : '未启用',
              config.enableMultiLedger,
            ),
            _buildSummaryRow(
              theme,
              '生物识别',
              config.enableBiometric ? '已启用' : '未启用',
              config.enableBiometric,
            ),
            const Divider(height: 24),
            _buildSummaryRow(
              theme,
              '预配置账户',
              '${config.preConfigAccounts.length} 个',
              true,
            ),
            _buildSummaryRow(
              theme,
              '预配置账本',
              '${config.preConfigLedgers.length} 个',
              true,
            ),
            if (config.preConfigCurrencies.isNotEmpty)
              _buildSummaryRow(
                theme,
                '自定义货币',
                '${config.preConfigCurrencies.length} 个',
                true,
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
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isEnabled
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
              fontWeight: isEnabled ? FontWeight.w500 : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(ThemeData theme, _StepConfig step) {
    final isFirstStep = _currentStep == 0;
    final isLastStep = _currentStep == _steps.length - 1;

    // 欢迎页面不显示按钮（使用卡片选择）
    if (step.stepType == StepType.welcome) {
      return const SizedBox.shrink();
    }

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
                  : Text(isLastStep ? '开始使用' : '下一步'),
            ),
          ),
        ],
      ),
    );
  }
}

enum StepType { welcome, config, complete }
enum PreConfigType { accounts, currencies, ledgers }

class _StepConfig {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? configKey;
  final StepType stepType;
  final PreConfigType? preConfigType;

  const _StepConfig({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.configKey,
    required this.stepType,
    this.preConfigType,
  });
}
