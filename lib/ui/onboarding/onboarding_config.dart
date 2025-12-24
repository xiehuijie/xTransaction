import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 预配置账户数据
class PreConfigAccount {
  final String name;
  final String currencyCode;
  final String type; // balance, credit, etc.
  final String? icon;

  const PreConfigAccount({
    required this.name,
    required this.currencyCode,
    this.type = 'balance',
    this.icon,
  });

  PreConfigAccount copyWith({
    String? name,
    String? currencyCode,
    String? type,
    String? icon,
  }) {
    return PreConfigAccount(
      name: name ?? this.name,
      currencyCode: currencyCode ?? this.currencyCode,
      type: type ?? this.type,
      icon: icon ?? this.icon,
    );
  }
}

/// 预配置账本数据
class PreConfigLedger {
  final String name;
  final String currencyCode;
  final String? description;

  const PreConfigLedger({
    required this.name,
    required this.currencyCode,
    this.description,
  });

  PreConfigLedger copyWith({
    String? name,
    String? currencyCode,
    String? description,
  }) {
    return PreConfigLedger(
      name: name ?? this.name,
      currencyCode: currencyCode ?? this.currencyCode,
      description: description ?? this.description,
    );
  }
}

/// 预配置货币数据
class PreConfigCurrency {
  final String currencyCode;
  final String name;
  final String symbol;
  final int decimal;
  final bool isCustom;

  const PreConfigCurrency({
    required this.currencyCode,
    required this.name,
    required this.symbol,
    this.decimal = 2,
    this.isCustom = false,
  });

  PreConfigCurrency copyWith({
    String? currencyCode,
    String? name,
    String? symbol,
    int? decimal,
    bool? isCustom,
  }) {
    return PreConfigCurrency(
      currencyCode: currencyCode ?? this.currencyCode,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      decimal: decimal ?? this.decimal,
      isCustom: isCustom ?? this.isCustom,
    );
  }
}

/// 初始化配置状态
class InitConfigState {
  final bool enableAssetManagement;
  final bool enableBudgetManagement;
  final bool enableMultiCurrency;
  final bool enableMultiLedger;
  final bool enableBiometric;
  
  // 预配置数据
  final List<PreConfigAccount> preConfigAccounts;
  final List<PreConfigLedger> preConfigLedgers;
  final List<PreConfigCurrency> preConfigCurrencies;
  final String defaultCurrencyCode;

  const InitConfigState({
    this.enableAssetManagement = true,
    this.enableBudgetManagement = true,
    this.enableMultiCurrency = false,
    this.enableMultiLedger = false,
    this.enableBiometric = false,
    this.preConfigAccounts = const [],
    this.preConfigLedgers = const [],
    this.preConfigCurrencies = const [],
    this.defaultCurrencyCode = 'CNY',
  });

  /// 默认初始状态
  factory InitConfigState.initial() {
    return const InitConfigState(
      preConfigAccounts: [
        PreConfigAccount(
          name: '我的账户',
          currencyCode: 'CNY',
          type: 'balance',
        ),
      ],
      preConfigLedgers: [
        PreConfigLedger(
          name: '默认账本',
          currencyCode: 'CNY',
          description: '我的记账账本',
        ),
      ],
    );
  }

  InitConfigState copyWith({
    bool? enableAssetManagement,
    bool? enableBudgetManagement,
    bool? enableMultiCurrency,
    bool? enableMultiLedger,
    bool? enableBiometric,
    List<PreConfigAccount>? preConfigAccounts,
    List<PreConfigLedger>? preConfigLedgers,
    List<PreConfigCurrency>? preConfigCurrencies,
    String? defaultCurrencyCode,
  }) {
    return InitConfigState(
      enableAssetManagement:
          enableAssetManagement ?? this.enableAssetManagement,
      enableBudgetManagement:
          enableBudgetManagement ?? this.enableBudgetManagement,
      enableMultiCurrency: enableMultiCurrency ?? this.enableMultiCurrency,
      enableMultiLedger: enableMultiLedger ?? this.enableMultiLedger,
      enableBiometric: enableBiometric ?? this.enableBiometric,
      preConfigAccounts: preConfigAccounts ?? this.preConfigAccounts,
      preConfigLedgers: preConfigLedgers ?? this.preConfigLedgers,
      preConfigCurrencies: preConfigCurrencies ?? this.preConfigCurrencies,
      defaultCurrencyCode: defaultCurrencyCode ?? this.defaultCurrencyCode,
    );
  }
}

/// 初始化配置 Notifier
class InitConfigNotifier extends StateNotifier<InitConfigState> {
  InitConfigNotifier() : super(InitConfigState.initial());

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

  // 账户管理
  void addAccount(PreConfigAccount account) {
    state = state.copyWith(
      preConfigAccounts: [...state.preConfigAccounts, account],
    );
  }

  void updateAccount(int index, PreConfigAccount account) {
    final accounts = List<PreConfigAccount>.from(state.preConfigAccounts);
    if (index >= 0 && index < accounts.length) {
      accounts[index] = account;
      state = state.copyWith(preConfigAccounts: accounts);
    }
  }

  void removeAccount(int index) {
    final accounts = List<PreConfigAccount>.from(state.preConfigAccounts);
    if (index >= 0 && index < accounts.length) {
      accounts.removeAt(index);
      state = state.copyWith(preConfigAccounts: accounts);
    }
  }

  // 账本管理
  void addLedger(PreConfigLedger ledger) {
    state = state.copyWith(
      preConfigLedgers: [...state.preConfigLedgers, ledger],
    );
  }

  void updateLedger(int index, PreConfigLedger ledger) {
    final ledgers = List<PreConfigLedger>.from(state.preConfigLedgers);
    if (index >= 0 && index < ledgers.length) {
      ledgers[index] = ledger;
      state = state.copyWith(preConfigLedgers: ledgers);
    }
  }

  void removeLedger(int index) {
    final ledgers = List<PreConfigLedger>.from(state.preConfigLedgers);
    if (index >= 0 && index < ledgers.length) {
      ledgers.removeAt(index);
      state = state.copyWith(preConfigLedgers: ledgers);
    }
  }

  // 货币管理
  void addCurrency(PreConfigCurrency currency) {
    state = state.copyWith(
      preConfigCurrencies: [...state.preConfigCurrencies, currency],
    );
  }

  void updateCurrency(int index, PreConfigCurrency currency) {
    final currencies = List<PreConfigCurrency>.from(state.preConfigCurrencies);
    if (index >= 0 && index < currencies.length) {
      currencies[index] = currency;
      state = state.copyWith(preConfigCurrencies: currencies);
    }
  }

  void removeCurrency(int index) {
    final currencies = List<PreConfigCurrency>.from(state.preConfigCurrencies);
    if (index >= 0 && index < currencies.length) {
      currencies.removeAt(index);
      state = state.copyWith(preConfigCurrencies: currencies);
    }
  }

  void setDefaultCurrency(String currencyCode) {
    state = state.copyWith(defaultCurrencyCode: currencyCode);
  }

  void reset() {
    state = InitConfigState.initial();
  }
}

final initConfigProvider =
    StateNotifierProvider<InitConfigNotifier, InitConfigState>(
      (ref) => InitConfigNotifier(),
    );
