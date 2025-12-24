import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

/// 生物识别认证服务
class BiometricService {
  BiometricService._();

  static final LocalAuthentication _auth = LocalAuthentication();

  /// 检查设备是否支持生物识别
  static Future<bool> isDeviceSupported() async {
    try {
      return await _auth.isDeviceSupported();
    } on PlatformException {
      return false;
    }
  }

  /// 检查是否可以进行生物识别认证
  static Future<bool> canCheckBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  /// 获取可用的生物识别类型
  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException {
      return [];
    }
  }

  /// 检查是否有任何可用的生物识别方式
  static Future<bool> hasBiometrics() async {
    final biometrics = await getAvailableBiometrics();
    return biometrics.isNotEmpty;
  }

  /// 执行生物识别认证
  /// 
  /// [localizedReason] - 显示给用户的认证原因
  /// [useErrorDialogs] - 是否使用系统错误对话框
  /// [stickyAuth] - 认证是否持久（应用切换后继续）
  static Future<BiometricResult> authenticate({
    String localizedReason = '请验证身份以继续使用',
    bool useErrorDialogs = true,
    bool stickyAuth = true,
  }) async {
    try {
      // 先检查是否支持生物识别
      final isSupported = await isDeviceSupported();
      if (!isSupported) {
        return BiometricResult.notSupported;
      }

      final canCheck = await canCheckBiometrics();
      if (!canCheck) {
        return BiometricResult.notAvailable;
      }

      final didAuthenticate = await _auth.authenticate(
        localizedReason: localizedReason,
        options: AuthenticationOptions(
          stickyAuth: stickyAuth,
          useErrorDialogs: useErrorDialogs,
          biometricOnly: false, // 允许使用PIN/密码作为备选
        ),
      );

      return didAuthenticate 
          ? BiometricResult.success 
          : BiometricResult.failed;
    } on PlatformException catch (e) {
      if (e.code == 'NotAvailable') {
        return BiometricResult.notAvailable;
      } else if (e.code == 'NotEnrolled') {
        return BiometricResult.notEnrolled;
      } else if (e.code == 'LockedOut') {
        return BiometricResult.lockedOut;
      } else if (e.code == 'PermanentlyLockedOut') {
        return BiometricResult.permanentlyLockedOut;
      }
      return BiometricResult.error;
    }
  }

  /// 停止当前的认证过程
  static Future<bool> stopAuthentication() async {
    try {
      return await _auth.stopAuthentication();
    } on PlatformException {
      return false;
    }
  }

  /// 获取生物识别类型的显示名称
  static String getBiometricTypeName(BiometricType type) {
    switch (type) {
      case BiometricType.face:
        return '面容识别';
      case BiometricType.fingerprint:
        return '指纹识别';
      case BiometricType.iris:
        return '虹膜识别';
      case BiometricType.strong:
        return '强生物识别';
      case BiometricType.weak:
        return '弱生物识别';
    }
  }
}

/// 生物识别认证结果
enum BiometricResult {
  /// 认证成功
  success,
  
  /// 认证失败（用户取消或验证失败）
  failed,
  
  /// 设备不支持生物识别
  notSupported,
  
  /// 生物识别不可用
  notAvailable,
  
  /// 未注册生物识别信息
  notEnrolled,
  
  /// 认证被临时锁定
  lockedOut,
  
  /// 认证被永久锁定
  permanentlyLockedOut,
  
  /// 发生错误
  error,
}
