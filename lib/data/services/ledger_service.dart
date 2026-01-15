import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 账本元数据
class LedgerMeta {
  /// 账本唯一标识
  final String id;

  /// 账本名称
  final String name;

  /// 账本货币代码
  final String currencyCode;

  /// 账本描述
  final String description;

  /// 账本图标
  final String? icon;

  /// 创建时间 (毫秒时间戳)
  final int createdAt;

  /// 更新时间 (毫秒时间戳)
  final int updatedAt;

  /// 数据库文件名
  String get dbFileName => 'ledger_$id.db';

  const LedgerMeta({
    required this.id,
    required this.name,
    required this.currencyCode,
    this.description = '',
    this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 从 JSON 创建
  factory LedgerMeta.fromJson(Map<String, dynamic> json) {
    return LedgerMeta(
      id: json['id'] as String,
      name: json['name'] as String,
      currencyCode: json['currencyCode'] as String,
      description: json['description'] as String? ?? '',
      icon: json['icon'] as String?,
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'currencyCode': currencyCode,
      'description': description,
      'icon': icon,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  /// 复制并修改
  LedgerMeta copyWith({
    String? name,
    String? currencyCode,
    String? description,
    String? icon,
    int? updatedAt,
  }) {
    return LedgerMeta(
      id: this.id,
      name: name ?? this.name,
      currencyCode: currencyCode ?? this.currencyCode,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      createdAt: createdAt,
      updatedAt: updatedAt ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LedgerMeta && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'LedgerMeta(id: $id, name: $name)';
}

/// 账本管理服务
/// 
/// 使用 SharedPreferences 存储账本列表元数据
class LedgerService {
  static const String _ledgersKey = 'ledgers_list';
  static const String _currentLedgerKey = 'current_ledger_id';

  final SharedPreferences _prefs;

  LedgerService(this._prefs);

  /// 工厂方法创建实例
  static Future<LedgerService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return LedgerService(prefs);
  }

  /// 获取所有账本列表
  List<LedgerMeta> getAllLedgers() {
    final jsonStr = _prefs.getString(_ledgersKey);
    if (jsonStr == null || jsonStr.isEmpty) {
      return [];
    }

    try {
      final List<dynamic> jsonList = jsonDecode(jsonStr);
      return jsonList
          .map((json) => LedgerMeta.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// 保存账本列表
  Future<bool> _saveLedgers(List<LedgerMeta> ledgers) async {
    final jsonStr = jsonEncode(ledgers.map((l) => l.toJson()).toList());
    return _prefs.setString(_ledgersKey, jsonStr);
  }

  /// 获取当前选中的账本ID
  String? getCurrentLedgerId() {
    return _prefs.getString(_currentLedgerKey);
  }

  /// 设置当前选中的账本ID
  Future<bool> setCurrentLedgerId(String ledgerId) async {
    return _prefs.setString(_currentLedgerKey, ledgerId);
  }

  /// 获取当前选中的账本
  LedgerMeta? getCurrentLedger() {
    final currentId = getCurrentLedgerId();
    if (currentId == null) return null;

    final ledgers = getAllLedgers();
    try {
      return ledgers.firstWhere((l) => l.id == currentId);
    } catch (e) {
      return ledgers.isNotEmpty ? ledgers.first : null;
    }
  }

  /// 创建新账本
  Future<LedgerMeta> createLedger({
    required String name,
    required String currencyCode,
    String description = '',
    String? icon,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final id = _generateId();

    final ledger = LedgerMeta(
      id: id,
      name: name,
      currencyCode: currencyCode,
      description: description,
      icon: icon,
      createdAt: now,
      updatedAt: now,
    );

    final ledgers = getAllLedgers();
    ledgers.add(ledger);
    await _saveLedgers(ledgers);

    // 如果是第一个账本，自动设置为当前账本
    if (ledgers.length == 1) {
      await setCurrentLedgerId(id);
    }

    return ledger;
  }

  /// 更新账本
  Future<LedgerMeta?> updateLedger(LedgerMeta updatedLedger) async {
    final ledgers = getAllLedgers();
    final index = ledgers.indexWhere((l) => l.id == updatedLedger.id);

    if (index == -1) return null;

    final updated = updatedLedger.copyWith(
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
    ledgers[index] = updated;
    await _saveLedgers(ledgers);

    return updated;
  }

  /// 删除账本
  Future<bool> deleteLedger(String ledgerId) async {
    final ledgers = getAllLedgers();
    final initialLength = ledgers.length;
    ledgers.removeWhere((l) => l.id == ledgerId);

    if (ledgers.length == initialLength) return false;

    await _saveLedgers(ledgers);

    // 如果删除的是当前账本，切换到第一个账本
    final currentId = getCurrentLedgerId();
    if (currentId == ledgerId && ledgers.isNotEmpty) {
      await setCurrentLedgerId(ledgers.first.id);
    } else if (ledgers.isEmpty) {
      await _prefs.remove(_currentLedgerKey);
    }

    return true;
  }

  /// 通过ID获取账本
  LedgerMeta? getLedgerById(String id) {
    final ledgers = getAllLedgers();
    try {
      return ledgers.firstWhere((l) => l.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 检查账本名称是否存在
  bool isNameExists(String name, {String? excludeId}) {
    final ledgers = getAllLedgers();
    return ledgers.any((l) => l.name == name && l.id != excludeId);
  }

  /// 生成唯一ID
  String _generateId() {
    final now = DateTime.now();
    final timestamp = now.millisecondsSinceEpoch;
    final random = now.microsecond;
    return '$timestamp$random';
  }
}
