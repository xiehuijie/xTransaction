import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'currency_dao.g.dart';

@DriftAccessor(tables: [Currency])
class CurrencyDao extends DatabaseAccessor<AppDatabase>
    with _$CurrencyDaoMixin {
  CurrencyDao(super.db);

  /// 获取所有货币
  Future<List<CurrencyEntity>> getAllCurrencies() => select(currency).get();

  /// 根据货币代码获取货币
  Future<CurrencyEntity?> getCurrencyByCode(String code) =>
      (select(currency)..where((t) => t.currencyCode.equals(code)))
          .getSingleOrNull();

  /// 获取系统内置货币
  Future<List<CurrencyEntity>> getSystemCurrencies() => (select(currency)
        ..where((t) => t.source.equalsValue(CurrencySource.system)))
      .get();

  /// 获取用户自定义货币
  Future<List<CurrencyEntity>> getCustomCurrencies() => (select(currency)
        ..where((t) => t.source.equalsValue(CurrencySource.custom)))
      .get();

  /// 添加货币
  Future<void> insertCurrency(CurrencyCompanion entry) =>
      into(currency).insert(entry);

  /// 更新货币
  Future<bool> updateCurrency(CurrencyCompanion entry) =>
      update(currency).replace(CurrencyEntity(
        currencyCode: entry.currencyCode.value,
        name: entry.name.value,
        symbol: entry.symbol.value,
        position: entry.position.value,
        decimal: entry.decimal.value,
        icon: entry.icon.value,
        source: entry.source.value,
      ));

  /// 删除货币
  Future<int> deleteCurrencyByCode(String code) =>
      (delete(currency)..where((t) => t.currencyCode.equals(code))).go();

  /// 监听所有货币变化
  Stream<List<CurrencyEntity>> watchAllCurrencies() => select(currency).watch();
}
