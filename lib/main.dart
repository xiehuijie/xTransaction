import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animations/animations.dart';

import 'providers/providers.dart';
import 'ui/onboarding/onboarding_page.dart';
import 'ui/home/home_page.dart';
import 'utils/app_theme.dart';
import 'utils/biometric_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听主题设置
    final themeMode = ref.watch(themeModeProvider);
    final themeColor = ref.watch(themeColorProvider);

    return MaterialApp(
      title: 'X Transaction',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(themeColor),
      darkTheme: AppTheme.darkTheme(themeColor),
      themeMode: themeMode,
      home: const AppStartupHandler(),
    );
  }
}

/// 应用启动处理器
/// 检查是否已初始化，决定进入初始化流程还是主页
class AppStartupHandler extends ConsumerWidget {
  const AppStartupHandler({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInitializedAsync = ref.watch(isInitializedProvider);
    final enableBiometricAsync = ref.watch(enableBiometricProvider);

    // 初始化主题设置
    ref.watch(initThemeProvider);

    return isInitializedAsync.when(
      data: (isInitialized) {
        if (!isInitialized) {
          return const OnboardingPage();
        }

        // 如果启用了生物识别，显示生物识别页面
        final enableBiometric = enableBiometricAsync.valueOrNull ?? false;
        if (enableBiometric) {
          return const BiometricLockScreen();
        }

        return PageTransitionSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: const HomePage(),
        );
      },
      loading: () => const _SplashScreen(),
      error: (error, stack) => _ErrorScreen(error: error),
    );
  }
}

/// 生物识别锁屏页面
class BiometricLockScreen extends StatefulWidget {
  const BiometricLockScreen({super.key});

  @override
  State<BiometricLockScreen> createState() => _BiometricLockScreenState();
}

class _BiometricLockScreenState extends State<BiometricLockScreen> {
  bool _isAuthenticated = false;
  bool _isAuthenticating = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _authenticate();
  }

  Future<void> _authenticate() async {
    if (_isAuthenticating) return;

    setState(() {
      _isAuthenticating = true;
      _errorMessage = null;
    });

    final result = await BiometricService.authenticate(
      localizedReason: '请验证身份以解锁应用',
    );

    if (!mounted) return;

    setState(() {
      _isAuthenticating = false;
    });

    switch (result) {
      case BiometricResult.success:
        setState(() {
          _isAuthenticated = true;
        });
        break;
      case BiometricResult.failed:
        setState(() {
          _errorMessage = '验证失败，请重试';
        });
        break;
      case BiometricResult.notSupported:
        // 设备不支持，直接进入应用
        setState(() {
          _isAuthenticated = true;
        });
        break;
      case BiometricResult.notAvailable:
        setState(() {
          _errorMessage = '生物识别不可用';
        });
        break;
      case BiometricResult.notEnrolled:
        setState(() {
          _errorMessage = '请先在设备上设置生物识别';
        });
        break;
      case BiometricResult.lockedOut:
        setState(() {
          _errorMessage = '验证次数过多，请稍后重试';
        });
        break;
      case BiometricResult.permanentlyLockedOut:
        setState(() {
          _errorMessage = '验证已被锁定，请使用设备密码';
        });
        break;
      case BiometricResult.error:
        setState(() {
          _errorMessage = '发生错误，请重试';
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isAuthenticated) {
      return const HomePage();
    }

    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_rounded,
                  size: 56,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'X Transaction',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '应用已锁定',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 48),
              if (_isAuthenticating)
                const Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('正在验证...'),
                  ],
                )
              else ...[
                if (_errorMessage != null) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: theme.colorScheme.onErrorContainer,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          _errorMessage!,
                          style: TextStyle(
                            color: theme.colorScheme.onErrorContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                FilledButton.icon(
                  onPressed: _authenticate,
                  icon: const Icon(Icons.fingerprint),
                  label: const Text('重新验证'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// 启动屏幕
class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_balance_wallet_rounded,
                size: 56,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'X Transaction',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

/// 错误屏幕
class _ErrorScreen extends StatelessWidget {
  final Object error;

  const _ErrorScreen({required this.error});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 80,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 24),
              Text(
                '应用启动失败',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                error.toString(),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
