import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_transaction/data/services/ledger_service.dart';

void main() {
  group('LedgerService Tests', () {
    late LedgerService ledgerService;

    setUp(() async {
      // 使用 SharedPreferences 的测试模式
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      ledgerService = LedgerService(prefs);
    });

    test('should create a new ledger', () async {
      final ledger = await ledgerService.createLedger(
        name: 'Test Ledger',
        currencyCode: 'CNY',
        description: 'Test description',
      );

      expect(ledger.name, equals('Test Ledger'));
      expect(ledger.currencyCode, equals('CNY'));
      expect(ledger.description, equals('Test description'));
      expect(ledger.id, isNotEmpty);
    });

    test('should get all ledgers', () async {
      await ledgerService.createLedger(
        name: 'Ledger 1',
        currencyCode: 'CNY',
      );
      await ledgerService.createLedger(
        name: 'Ledger 2',
        currencyCode: 'USD',
      );

      final ledgers = ledgerService.getAllLedgers();
      expect(ledgers.length, equals(2));
    });

    test('should set current ledger automatically for first ledger', () async {
      final ledger = await ledgerService.createLedger(
        name: 'First Ledger',
        currencyCode: 'CNY',
      );

      final currentId = ledgerService.getCurrentLedgerId();
      expect(currentId, equals(ledger.id));
    });

    test('should get ledger by id', () async {
      final created = await ledgerService.createLedger(
        name: 'Find Me',
        currencyCode: 'EUR',
      );

      final found = ledgerService.getLedgerById(created.id);
      expect(found, isNotNull);
      expect(found!.name, equals('Find Me'));
    });

    test('should update ledger', () async {
      final created = await ledgerService.createLedger(
        name: 'Original',
        currencyCode: 'CNY',
      );

      final updated = await ledgerService.updateLedger(
        created.copyWith(name: 'Updated'),
      );

      expect(updated, isNotNull);
      expect(updated!.name, equals('Updated'));

      final found = ledgerService.getLedgerById(created.id);
      expect(found!.name, equals('Updated'));
    });

    test('should delete ledger', () async {
      final ledger = await ledgerService.createLedger(
        name: 'To Delete',
        currencyCode: 'CNY',
      );

      final deleted = await ledgerService.deleteLedger(ledger.id);
      expect(deleted, isTrue);

      final found = ledgerService.getLedgerById(ledger.id);
      expect(found, isNull);
    });

    test('should switch current ledger when current is deleted', () async {
      final ledger1 = await ledgerService.createLedger(
        name: 'Ledger 1',
        currencyCode: 'CNY',
      );
      final ledger2 = await ledgerService.createLedger(
        name: 'Ledger 2',
        currencyCode: 'USD',
      );

      await ledgerService.setCurrentLedgerId(ledger1.id);
      await ledgerService.deleteLedger(ledger1.id);

      final currentId = ledgerService.getCurrentLedgerId();
      expect(currentId, equals(ledger2.id));
    });

    test('should check name exists', () async {
      await ledgerService.createLedger(
        name: 'Unique Name',
        currencyCode: 'CNY',
      );

      expect(ledgerService.isNameExists('Unique Name'), isTrue);
      expect(ledgerService.isNameExists('Other Name'), isFalse);
    });

    test('should get current ledger', () async {
      final ledger = await ledgerService.createLedger(
        name: 'Current',
        currencyCode: 'CNY',
      );

      final current = ledgerService.getCurrentLedger();
      expect(current, isNotNull);
      expect(current!.id, equals(ledger.id));
    });

    test('should generate correct db file name', () async {
      final ledger = await ledgerService.createLedger(
        name: 'DB Test',
        currencyCode: 'CNY',
      );

      expect(ledger.dbFileName, equals('ledger_${ledger.id}.db'));
    });
  });

  group('LedgerMeta Tests', () {
    test('should create from json', () {
      final json = {
        'id': '123',
        'name': 'Test',
        'currencyCode': 'CNY',
        'description': 'Desc',
        'icon': 'book',
        'createdAt': 1234567890,
        'updatedAt': 1234567890,
      };

      final meta = LedgerMeta.fromJson(json);
      expect(meta.id, equals('123'));
      expect(meta.name, equals('Test'));
      expect(meta.currencyCode, equals('CNY'));
      expect(meta.icon, equals('book'));
    });

    test('should convert to json', () {
      final meta = LedgerMeta(
        id: '456',
        name: 'Json Test',
        currencyCode: 'USD',
        createdAt: 1234567890,
        updatedAt: 1234567890,
      );

      final json = meta.toJson();
      expect(json['id'], equals('456'));
      expect(json['name'], equals('Json Test'));
      expect(json['currencyCode'], equals('USD'));
    });

    test('should copy with modifications', () {
      final original = LedgerMeta(
        id: '789',
        name: 'Original',
        currencyCode: 'EUR',
        createdAt: 1234567890,
        updatedAt: 1234567890,
      );

      final copied = original.copyWith(name: 'Copied');
      expect(copied.id, equals(original.id));
      expect(copied.name, equals('Copied'));
      expect(copied.currencyCode, equals(original.currencyCode));
    });

    test('should compare equality by id', () {
      final meta1 = LedgerMeta(
        id: 'same',
        name: 'Name 1',
        currencyCode: 'CNY',
        createdAt: 1,
        updatedAt: 1,
      );

      final meta2 = LedgerMeta(
        id: 'same',
        name: 'Name 2',
        currencyCode: 'USD',
        createdAt: 2,
        updatedAt: 2,
      );

      expect(meta1, equals(meta2));
    });
  });
}
