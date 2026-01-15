import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'currency_dao.g.dart';

/// 货币 DAO
@DriftAccessor(tables: [Currency])
class CurrencyDao extends DatabaseAccessor<LedgerDatabase>
    with _$CurrencyDaoMixin {
  CurrencyDao(super.db);

  /// 获取所有货币
  Future<List<CurrencyEntity>> getAllCurrencies() => select(currency).get();

  /// 根据货币代码获取货币
  Future<CurrencyEntity?> getCurrencyByCode(String code) => (select(
    currency,
  )..where((t) => t.code.equals(code))).getSingleOrNull();

  /// 获取系统内置货币
  Future<List<CurrencyEntity>> getSystemCurrencies() => (select(
    currency,
  )..where((t) => t.source.equalsValue(CurrencySource.system))).get();

  /// 获取用户自定义货币
  Future<List<CurrencyEntity>> getCustomCurrencies() => (select(
    currency,
  )..where((t) => t.source.equalsValue(CurrencySource.custom))).get();

  /// 添加货币
  Future<void> insertCurrency(CurrencyCompanion entry) =>
      into(currency).insert(entry);

  /// 批量添加货币
  Future<void> insertCurrencies(List<CurrencyCompanion> entries) =>
      batch((batch) => batch.insertAll(currency, entries));

  /// 更新货币
  Future<bool> updateCurrency(CurrencyEntity entry) =>
      update(currency).replace(entry);

  /// 删除货币
  Future<int> deleteCurrencyByCode(String code) =>
      (delete(currency)..where((t) => t.code.equals(code))).go();

  /// 监听所有货币变化
  Stream<List<CurrencyEntity>> watchAllCurrencies() => select(currency).watch();

  /// 监听系统货币变化
  Stream<List<CurrencyEntity>> watchSystemCurrencies() =>
      (select(currency)..where((t) => t.source.equalsValue(CurrencySource.system))).watch();

  /// 监听自定义货币变化
  Stream<List<CurrencyEntity>> watchCustomCurrencies() =>
      (select(currency)..where((t) => t.source.equalsValue(CurrencySource.custom))).watch();
}
