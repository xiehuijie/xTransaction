// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CurrencyTable extends Currency
    with TableInfo<$CurrencyTable, CurrencyEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CurrencyPosition, String>
  position = GeneratedColumn<String>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('prefix'),
  ).withConverter<CurrencyPosition>($CurrencyTable.$converterposition);
  static const VerificationMeta _decimalMeta = const VerificationMeta(
    'decimal',
  );
  @override
  late final GeneratedColumn<int> decimal = GeneratedColumn<int>(
    'decimal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2),
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CurrencySource, String> source =
      GeneratedColumn<String>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('system'),
      ).withConverter<CurrencySource>($CurrencyTable.$convertersource);
  @override
  List<GeneratedColumn> get $columns => [
    currencyCode,
    name,
    symbol,
    position,
    decimal,
    icon,
    source,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency';
  @override
  VerificationContext validateIntegrity(
    Insertable<CurrencyEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('decimal')) {
      context.handle(
        _decimalMeta,
        decimal.isAcceptableOrUnknown(data['decimal']!, _decimalMeta),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {currencyCode};
  @override
  CurrencyEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyEntity(
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      )!,
      position: $CurrencyTable.$converterposition.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}position'],
        )!,
      ),
      decimal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}decimal'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
      source: $CurrencyTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}source'],
        )!,
      ),
    );
  }

  @override
  $CurrencyTable createAlias(String alias) {
    return $CurrencyTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CurrencyPosition, String, String>
  $converterposition = const EnumNameConverter<CurrencyPosition>(
    CurrencyPosition.values,
  );
  static JsonTypeConverter2<CurrencySource, String, String> $convertersource =
      const EnumNameConverter<CurrencySource>(CurrencySource.values);
}

class CurrencyEntity extends DataClass implements Insertable<CurrencyEntity> {
  final String currencyCode;
  final String name;
  final String symbol;
  final CurrencyPosition position;
  final int decimal;
  final String? icon;
  final CurrencySource source;
  const CurrencyEntity({
    required this.currencyCode,
    required this.name,
    required this.symbol,
    required this.position,
    required this.decimal,
    this.icon,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['currency_code'] = Variable<String>(currencyCode);
    map['name'] = Variable<String>(name);
    map['symbol'] = Variable<String>(symbol);
    {
      map['position'] = Variable<String>(
        $CurrencyTable.$converterposition.toSql(position),
      );
    }
    map['decimal'] = Variable<int>(decimal);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    {
      map['source'] = Variable<String>(
        $CurrencyTable.$convertersource.toSql(source),
      );
    }
    return map;
  }

  CurrencyCompanion toCompanion(bool nullToAbsent) {
    return CurrencyCompanion(
      currencyCode: Value(currencyCode),
      name: Value(name),
      symbol: Value(symbol),
      position: Value(position),
      decimal: Value(decimal),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      source: Value(source),
    );
  }

  factory CurrencyEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyEntity(
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      name: serializer.fromJson<String>(json['name']),
      symbol: serializer.fromJson<String>(json['symbol']),
      position: $CurrencyTable.$converterposition.fromJson(
        serializer.fromJson<String>(json['position']),
      ),
      decimal: serializer.fromJson<int>(json['decimal']),
      icon: serializer.fromJson<String?>(json['icon']),
      source: $CurrencyTable.$convertersource.fromJson(
        serializer.fromJson<String>(json['source']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'currencyCode': serializer.toJson<String>(currencyCode),
      'name': serializer.toJson<String>(name),
      'symbol': serializer.toJson<String>(symbol),
      'position': serializer.toJson<String>(
        $CurrencyTable.$converterposition.toJson(position),
      ),
      'decimal': serializer.toJson<int>(decimal),
      'icon': serializer.toJson<String?>(icon),
      'source': serializer.toJson<String>(
        $CurrencyTable.$convertersource.toJson(source),
      ),
    };
  }

  CurrencyEntity copyWith({
    String? currencyCode,
    String? name,
    String? symbol,
    CurrencyPosition? position,
    int? decimal,
    Value<String?> icon = const Value.absent(),
    CurrencySource? source,
  }) => CurrencyEntity(
    currencyCode: currencyCode ?? this.currencyCode,
    name: name ?? this.name,
    symbol: symbol ?? this.symbol,
    position: position ?? this.position,
    decimal: decimal ?? this.decimal,
    icon: icon.present ? icon.value : this.icon,
    source: source ?? this.source,
  );
  CurrencyEntity copyWithCompanion(CurrencyCompanion data) {
    return CurrencyEntity(
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      name: data.name.present ? data.name.value : this.name,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      position: data.position.present ? data.position.value : this.position,
      decimal: data.decimal.present ? data.decimal.value : this.decimal,
      icon: data.icon.present ? data.icon.value : this.icon,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyEntity(')
          ..write('currencyCode: $currencyCode, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol, ')
          ..write('position: $position, ')
          ..write('decimal: $decimal, ')
          ..write('icon: $icon, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(currencyCode, name, symbol, position, decimal, icon, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyEntity &&
          other.currencyCode == this.currencyCode &&
          other.name == this.name &&
          other.symbol == this.symbol &&
          other.position == this.position &&
          other.decimal == this.decimal &&
          other.icon == this.icon &&
          other.source == this.source);
}

class CurrencyCompanion extends UpdateCompanion<CurrencyEntity> {
  final Value<String> currencyCode;
  final Value<String> name;
  final Value<String> symbol;
  final Value<CurrencyPosition> position;
  final Value<int> decimal;
  final Value<String?> icon;
  final Value<CurrencySource> source;
  final Value<int> rowid;
  const CurrencyCompanion({
    this.currencyCode = const Value.absent(),
    this.name = const Value.absent(),
    this.symbol = const Value.absent(),
    this.position = const Value.absent(),
    this.decimal = const Value.absent(),
    this.icon = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrencyCompanion.insert({
    required String currencyCode,
    required String name,
    required String symbol,
    this.position = const Value.absent(),
    this.decimal = const Value.absent(),
    this.icon = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : currencyCode = Value(currencyCode),
       name = Value(name),
       symbol = Value(symbol);
  static Insertable<CurrencyEntity> custom({
    Expression<String>? currencyCode,
    Expression<String>? name,
    Expression<String>? symbol,
    Expression<String>? position,
    Expression<int>? decimal,
    Expression<String>? icon,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (currencyCode != null) 'currency_code': currencyCode,
      if (name != null) 'name': name,
      if (symbol != null) 'symbol': symbol,
      if (position != null) 'position': position,
      if (decimal != null) 'decimal': decimal,
      if (icon != null) 'icon': icon,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrencyCompanion copyWith({
    Value<String>? currencyCode,
    Value<String>? name,
    Value<String>? symbol,
    Value<CurrencyPosition>? position,
    Value<int>? decimal,
    Value<String?>? icon,
    Value<CurrencySource>? source,
    Value<int>? rowid,
  }) {
    return CurrencyCompanion(
      currencyCode: currencyCode ?? this.currencyCode,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      position: position ?? this.position,
      decimal: decimal ?? this.decimal,
      icon: icon ?? this.icon,
      source: source ?? this.source,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(
        $CurrencyTable.$converterposition.toSql(position.value),
      );
    }
    if (decimal.present) {
      map['decimal'] = Variable<int>(decimal.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(
        $CurrencyTable.$convertersource.toSql(source.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyCompanion(')
          ..write('currencyCode: $currencyCode, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol, ')
          ..write('position: $position, ')
          ..write('decimal: $decimal, ')
          ..write('icon: $icon, ')
          ..write('source: $source, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountTable extends Account
    with TableInfo<$AccountTable, AccountEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AccountType>($AccountTable.$convertertype);
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES currency (currency_code)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    accountId,
    name,
    description,
    icon,
    type,
    currencyCode,
    createdAt,
    updatedAt,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccountEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {name},
  ];
  @override
  AccountEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountEntity(
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      type: $AccountTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $AccountTable createAlias(String alias) {
    return $AccountTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, String, String> $convertertype =
      const EnumNameConverter<AccountType>(AccountType.values);
}

class AccountEntity extends DataClass implements Insertable<AccountEntity> {
  final int accountId;
  final String name;
  final String description;
  final String icon;
  final AccountType type;
  final String currencyCode;
  final int createdAt;
  final int updatedAt;
  final String note;
  const AccountEntity({
    required this.accountId,
    required this.name,
    required this.description,
    required this.icon,
    required this.type,
    required this.currencyCode,
    required this.createdAt,
    required this.updatedAt,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['icon'] = Variable<String>(icon);
    {
      map['type'] = Variable<String>($AccountTable.$convertertype.toSql(type));
    }
    map['currency_code'] = Variable<String>(currencyCode);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['note'] = Variable<String>(note);
    return map;
  }

  AccountCompanion toCompanion(bool nullToAbsent) {
    return AccountCompanion(
      accountId: Value(accountId),
      name: Value(name),
      description: Value(description),
      icon: Value(icon),
      type: Value(type),
      currencyCode: Value(currencyCode),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      note: Value(note),
    );
  }

  factory AccountEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountEntity(
      accountId: serializer.fromJson<int>(json['accountId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      icon: serializer.fromJson<String>(json['icon']),
      type: $AccountTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'icon': serializer.toJson<String>(icon),
      'type': serializer.toJson<String>(
        $AccountTable.$convertertype.toJson(type),
      ),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'note': serializer.toJson<String>(note),
    };
  }

  AccountEntity copyWith({
    int? accountId,
    String? name,
    String? description,
    String? icon,
    AccountType? type,
    String? currencyCode,
    int? createdAt,
    int? updatedAt,
    String? note,
  }) => AccountEntity(
    accountId: accountId ?? this.accountId,
    name: name ?? this.name,
    description: description ?? this.description,
    icon: icon ?? this.icon,
    type: type ?? this.type,
    currencyCode: currencyCode ?? this.currencyCode,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    note: note ?? this.note,
  );
  AccountEntity copyWithCompanion(AccountCompanion data) {
    return AccountEntity(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      icon: data.icon.present ? data.icon.value : this.icon,
      type: data.type.present ? data.type.value : this.type,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountEntity(')
          ..write('accountId: $accountId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('type: $type, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountId,
    name,
    description,
    icon,
    type,
    currencyCode,
    createdAt,
    updatedAt,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountEntity &&
          other.accountId == this.accountId &&
          other.name == this.name &&
          other.description == this.description &&
          other.icon == this.icon &&
          other.type == this.type &&
          other.currencyCode == this.currencyCode &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.note == this.note);
}

class AccountCompanion extends UpdateCompanion<AccountEntity> {
  final Value<int> accountId;
  final Value<String> name;
  final Value<String> description;
  final Value<String> icon;
  final Value<AccountType> type;
  final Value<String> currencyCode;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String> note;
  const AccountCompanion({
    this.accountId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.type = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.note = const Value.absent(),
  });
  AccountCompanion.insert({
    this.accountId = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    required AccountType type,
    required String currencyCode,
    required int createdAt,
    required int updatedAt,
    this.note = const Value.absent(),
  }) : name = Value(name),
       type = Value(type),
       currencyCode = Value(currencyCode),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<AccountEntity> custom({
    Expression<int>? accountId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? icon,
    Expression<String>? type,
    Expression<String>? currencyCode,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (type != null) 'type': type,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (note != null) 'note': note,
    });
  }

  AccountCompanion copyWith({
    Value<int>? accountId,
    Value<String>? name,
    Value<String>? description,
    Value<String>? icon,
    Value<AccountType>? type,
    Value<String>? currencyCode,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String>? note,
  }) {
    return AccountCompanion(
      accountId: accountId ?? this.accountId,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      type: type ?? this.type,
      currencyCode: currencyCode ?? this.currencyCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $AccountTable.$convertertype.toSql(type.value),
      );
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountCompanion(')
          ..write('accountId: $accountId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('type: $type, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $AccountMetaTable extends AccountMeta
    with TableInfo<$AccountMetaTable, AccountMetaEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountMetaScope, String> scope =
      GeneratedColumn<String>(
        'scope',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AccountMetaScope>($AccountMetaTable.$converterscope);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [accountId, scope, key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccountMetaEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId, scope, key};
  @override
  AccountMetaEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountMetaEntity(
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      scope: $AccountMetaTable.$converterscope.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}scope'],
        )!,
      ),
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $AccountMetaTable createAlias(String alias) {
    return $AccountMetaTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountMetaScope, String, String> $converterscope =
      const EnumNameConverter<AccountMetaScope>(AccountMetaScope.values);
}

class AccountMetaEntity extends DataClass
    implements Insertable<AccountMetaEntity> {
  final int accountId;
  final AccountMetaScope scope;
  final String key;
  final String value;
  const AccountMetaEntity({
    required this.accountId,
    required this.scope,
    required this.key,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    {
      map['scope'] = Variable<String>(
        $AccountMetaTable.$converterscope.toSql(scope),
      );
    }
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AccountMetaCompanion toCompanion(bool nullToAbsent) {
    return AccountMetaCompanion(
      accountId: Value(accountId),
      scope: Value(scope),
      key: Value(key),
      value: Value(value),
    );
  }

  factory AccountMetaEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountMetaEntity(
      accountId: serializer.fromJson<int>(json['accountId']),
      scope: $AccountMetaTable.$converterscope.fromJson(
        serializer.fromJson<String>(json['scope']),
      ),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'scope': serializer.toJson<String>(
        $AccountMetaTable.$converterscope.toJson(scope),
      ),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AccountMetaEntity copyWith({
    int? accountId,
    AccountMetaScope? scope,
    String? key,
    String? value,
  }) => AccountMetaEntity(
    accountId: accountId ?? this.accountId,
    scope: scope ?? this.scope,
    key: key ?? this.key,
    value: value ?? this.value,
  );
  AccountMetaEntity copyWithCompanion(AccountMetaCompanion data) {
    return AccountMetaEntity(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      scope: data.scope.present ? data.scope.value : this.scope,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountMetaEntity(')
          ..write('accountId: $accountId, ')
          ..write('scope: $scope, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accountId, scope, key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountMetaEntity &&
          other.accountId == this.accountId &&
          other.scope == this.scope &&
          other.key == this.key &&
          other.value == this.value);
}

class AccountMetaCompanion extends UpdateCompanion<AccountMetaEntity> {
  final Value<int> accountId;
  final Value<AccountMetaScope> scope;
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AccountMetaCompanion({
    this.accountId = const Value.absent(),
    this.scope = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountMetaCompanion.insert({
    required int accountId,
    required AccountMetaScope scope,
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : accountId = Value(accountId),
       scope = Value(scope),
       key = Value(key),
       value = Value(value);
  static Insertable<AccountMetaEntity> custom({
    Expression<int>? accountId,
    Expression<String>? scope,
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (scope != null) 'scope': scope,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountMetaCompanion copyWith({
    Value<int>? accountId,
    Value<AccountMetaScope>? scope,
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return AccountMetaCompanion(
      accountId: accountId ?? this.accountId,
      scope: scope ?? this.scope,
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(
        $AccountMetaTable.$converterscope.toSql(scope.value),
      );
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountMetaCompanion(')
          ..write('accountId: $accountId, ')
          ..write('scope: $scope, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountCreditTable extends AccountCredit
    with TableInfo<$AccountCreditTable, CreditAccountEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountCreditTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  static const VerificationMeta _creditLimitMeta = const VerificationMeta(
    'creditLimit',
  );
  @override
  late final GeneratedColumn<int> creditLimit = GeneratedColumn<int>(
    'credit_limit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _billingCycleDayMeta = const VerificationMeta(
    'billingCycleDay',
  );
  @override
  late final GeneratedColumn<int> billingCycleDay = GeneratedColumn<int>(
    'billing_cycle_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentDueDayMeta = const VerificationMeta(
    'paymentDueDay',
  );
  @override
  late final GeneratedColumn<int> paymentDueDay = GeneratedColumn<int>(
    'payment_due_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    accountId,
    creditLimit,
    billingCycleDay,
    paymentDueDay,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_credit';
  @override
  VerificationContext validateIntegrity(
    Insertable<CreditAccountEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('credit_limit')) {
      context.handle(
        _creditLimitMeta,
        creditLimit.isAcceptableOrUnknown(
          data['credit_limit']!,
          _creditLimitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_creditLimitMeta);
    }
    if (data.containsKey('billing_cycle_day')) {
      context.handle(
        _billingCycleDayMeta,
        billingCycleDay.isAcceptableOrUnknown(
          data['billing_cycle_day']!,
          _billingCycleDayMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_billingCycleDayMeta);
    }
    if (data.containsKey('payment_due_day')) {
      context.handle(
        _paymentDueDayMeta,
        paymentDueDay.isAcceptableOrUnknown(
          data['payment_due_day']!,
          _paymentDueDayMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentDueDayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId};
  @override
  CreditAccountEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CreditAccountEntity(
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      creditLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}credit_limit'],
      )!,
      billingCycleDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}billing_cycle_day'],
      )!,
      paymentDueDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}payment_due_day'],
      )!,
    );
  }

  @override
  $AccountCreditTable createAlias(String alias) {
    return $AccountCreditTable(attachedDatabase, alias);
  }
}

class CreditAccountEntity extends DataClass
    implements Insertable<CreditAccountEntity> {
  final int accountId;
  final int creditLimit;
  final int billingCycleDay;
  final int paymentDueDay;
  const CreditAccountEntity({
    required this.accountId,
    required this.creditLimit,
    required this.billingCycleDay,
    required this.paymentDueDay,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    map['credit_limit'] = Variable<int>(creditLimit);
    map['billing_cycle_day'] = Variable<int>(billingCycleDay);
    map['payment_due_day'] = Variable<int>(paymentDueDay);
    return map;
  }

  AccountCreditCompanion toCompanion(bool nullToAbsent) {
    return AccountCreditCompanion(
      accountId: Value(accountId),
      creditLimit: Value(creditLimit),
      billingCycleDay: Value(billingCycleDay),
      paymentDueDay: Value(paymentDueDay),
    );
  }

  factory CreditAccountEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CreditAccountEntity(
      accountId: serializer.fromJson<int>(json['accountId']),
      creditLimit: serializer.fromJson<int>(json['creditLimit']),
      billingCycleDay: serializer.fromJson<int>(json['billingCycleDay']),
      paymentDueDay: serializer.fromJson<int>(json['paymentDueDay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'creditLimit': serializer.toJson<int>(creditLimit),
      'billingCycleDay': serializer.toJson<int>(billingCycleDay),
      'paymentDueDay': serializer.toJson<int>(paymentDueDay),
    };
  }

  CreditAccountEntity copyWith({
    int? accountId,
    int? creditLimit,
    int? billingCycleDay,
    int? paymentDueDay,
  }) => CreditAccountEntity(
    accountId: accountId ?? this.accountId,
    creditLimit: creditLimit ?? this.creditLimit,
    billingCycleDay: billingCycleDay ?? this.billingCycleDay,
    paymentDueDay: paymentDueDay ?? this.paymentDueDay,
  );
  CreditAccountEntity copyWithCompanion(AccountCreditCompanion data) {
    return CreditAccountEntity(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      creditLimit: data.creditLimit.present
          ? data.creditLimit.value
          : this.creditLimit,
      billingCycleDay: data.billingCycleDay.present
          ? data.billingCycleDay.value
          : this.billingCycleDay,
      paymentDueDay: data.paymentDueDay.present
          ? data.paymentDueDay.value
          : this.paymentDueDay,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CreditAccountEntity(')
          ..write('accountId: $accountId, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('billingCycleDay: $billingCycleDay, ')
          ..write('paymentDueDay: $paymentDueDay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(accountId, creditLimit, billingCycleDay, paymentDueDay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreditAccountEntity &&
          other.accountId == this.accountId &&
          other.creditLimit == this.creditLimit &&
          other.billingCycleDay == this.billingCycleDay &&
          other.paymentDueDay == this.paymentDueDay);
}

class AccountCreditCompanion extends UpdateCompanion<CreditAccountEntity> {
  final Value<int> accountId;
  final Value<int> creditLimit;
  final Value<int> billingCycleDay;
  final Value<int> paymentDueDay;
  const AccountCreditCompanion({
    this.accountId = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.billingCycleDay = const Value.absent(),
    this.paymentDueDay = const Value.absent(),
  });
  AccountCreditCompanion.insert({
    this.accountId = const Value.absent(),
    required int creditLimit,
    required int billingCycleDay,
    required int paymentDueDay,
  }) : creditLimit = Value(creditLimit),
       billingCycleDay = Value(billingCycleDay),
       paymentDueDay = Value(paymentDueDay);
  static Insertable<CreditAccountEntity> custom({
    Expression<int>? accountId,
    Expression<int>? creditLimit,
    Expression<int>? billingCycleDay,
    Expression<int>? paymentDueDay,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (creditLimit != null) 'credit_limit': creditLimit,
      if (billingCycleDay != null) 'billing_cycle_day': billingCycleDay,
      if (paymentDueDay != null) 'payment_due_day': paymentDueDay,
    });
  }

  AccountCreditCompanion copyWith({
    Value<int>? accountId,
    Value<int>? creditLimit,
    Value<int>? billingCycleDay,
    Value<int>? paymentDueDay,
  }) {
    return AccountCreditCompanion(
      accountId: accountId ?? this.accountId,
      creditLimit: creditLimit ?? this.creditLimit,
      billingCycleDay: billingCycleDay ?? this.billingCycleDay,
      paymentDueDay: paymentDueDay ?? this.paymentDueDay,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (creditLimit.present) {
      map['credit_limit'] = Variable<int>(creditLimit.value);
    }
    if (billingCycleDay.present) {
      map['billing_cycle_day'] = Variable<int>(billingCycleDay.value);
    }
    if (paymentDueDay.present) {
      map['payment_due_day'] = Variable<int>(paymentDueDay.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountCreditCompanion(')
          ..write('accountId: $accountId, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('billingCycleDay: $billingCycleDay, ')
          ..write('paymentDueDay: $paymentDueDay')
          ..write(')'))
        .toString();
  }
}

class $AccountBonusTable extends AccountBonus
    with TableInfo<$AccountBonusTable, BonusAccountEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountBonusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bonusAccountIdMeta = const VerificationMeta(
    'bonusAccountId',
  );
  @override
  late final GeneratedColumn<int> bonusAccountId = GeneratedColumn<int>(
    'bonus_account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  static const VerificationMeta _prepaidAccountIdMeta = const VerificationMeta(
    'prepaidAccountId',
  );
  @override
  late final GeneratedColumn<int> prepaidAccountId = GeneratedColumn<int>(
    'prepaid_account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [bonusAccountId, prepaidAccountId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_bonus';
  @override
  VerificationContext validateIntegrity(
    Insertable<BonusAccountEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bonus_account_id')) {
      context.handle(
        _bonusAccountIdMeta,
        bonusAccountId.isAcceptableOrUnknown(
          data['bonus_account_id']!,
          _bonusAccountIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_bonusAccountIdMeta);
    }
    if (data.containsKey('prepaid_account_id')) {
      context.handle(
        _prepaidAccountIdMeta,
        prepaidAccountId.isAcceptableOrUnknown(
          data['prepaid_account_id']!,
          _prepaidAccountIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_prepaidAccountIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {bonusAccountId, prepaidAccountId};
  @override
  BonusAccountEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BonusAccountEntity(
      bonusAccountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bonus_account_id'],
      )!,
      prepaidAccountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}prepaid_account_id'],
      )!,
    );
  }

  @override
  $AccountBonusTable createAlias(String alias) {
    return $AccountBonusTable(attachedDatabase, alias);
  }
}

class BonusAccountEntity extends DataClass
    implements Insertable<BonusAccountEntity> {
  final int bonusAccountId;
  final int prepaidAccountId;
  const BonusAccountEntity({
    required this.bonusAccountId,
    required this.prepaidAccountId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bonus_account_id'] = Variable<int>(bonusAccountId);
    map['prepaid_account_id'] = Variable<int>(prepaidAccountId);
    return map;
  }

  AccountBonusCompanion toCompanion(bool nullToAbsent) {
    return AccountBonusCompanion(
      bonusAccountId: Value(bonusAccountId),
      prepaidAccountId: Value(prepaidAccountId),
    );
  }

  factory BonusAccountEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BonusAccountEntity(
      bonusAccountId: serializer.fromJson<int>(json['bonusAccountId']),
      prepaidAccountId: serializer.fromJson<int>(json['prepaidAccountId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bonusAccountId': serializer.toJson<int>(bonusAccountId),
      'prepaidAccountId': serializer.toJson<int>(prepaidAccountId),
    };
  }

  BonusAccountEntity copyWith({int? bonusAccountId, int? prepaidAccountId}) =>
      BonusAccountEntity(
        bonusAccountId: bonusAccountId ?? this.bonusAccountId,
        prepaidAccountId: prepaidAccountId ?? this.prepaidAccountId,
      );
  BonusAccountEntity copyWithCompanion(AccountBonusCompanion data) {
    return BonusAccountEntity(
      bonusAccountId: data.bonusAccountId.present
          ? data.bonusAccountId.value
          : this.bonusAccountId,
      prepaidAccountId: data.prepaidAccountId.present
          ? data.prepaidAccountId.value
          : this.prepaidAccountId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BonusAccountEntity(')
          ..write('bonusAccountId: $bonusAccountId, ')
          ..write('prepaidAccountId: $prepaidAccountId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bonusAccountId, prepaidAccountId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BonusAccountEntity &&
          other.bonusAccountId == this.bonusAccountId &&
          other.prepaidAccountId == this.prepaidAccountId);
}

class AccountBonusCompanion extends UpdateCompanion<BonusAccountEntity> {
  final Value<int> bonusAccountId;
  final Value<int> prepaidAccountId;
  final Value<int> rowid;
  const AccountBonusCompanion({
    this.bonusAccountId = const Value.absent(),
    this.prepaidAccountId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountBonusCompanion.insert({
    required int bonusAccountId,
    required int prepaidAccountId,
    this.rowid = const Value.absent(),
  }) : bonusAccountId = Value(bonusAccountId),
       prepaidAccountId = Value(prepaidAccountId);
  static Insertable<BonusAccountEntity> custom({
    Expression<int>? bonusAccountId,
    Expression<int>? prepaidAccountId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (bonusAccountId != null) 'bonus_account_id': bonusAccountId,
      if (prepaidAccountId != null) 'prepaid_account_id': prepaidAccountId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountBonusCompanion copyWith({
    Value<int>? bonusAccountId,
    Value<int>? prepaidAccountId,
    Value<int>? rowid,
  }) {
    return AccountBonusCompanion(
      bonusAccountId: bonusAccountId ?? this.bonusAccountId,
      prepaidAccountId: prepaidAccountId ?? this.prepaidAccountId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bonusAccountId.present) {
      map['bonus_account_id'] = Variable<int>(bonusAccountId.value);
    }
    if (prepaidAccountId.present) {
      map['prepaid_account_id'] = Variable<int>(prepaidAccountId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountBonusCompanion(')
          ..write('bonusAccountId: $bonusAccountId, ')
          ..write('prepaidAccountId: $prepaidAccountId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StakeholderTable extends Stakeholder
    with TableInfo<$StakeholderTable, StakeholderEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StakeholderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _stakeholderIdMeta = const VerificationMeta(
    'stakeholderId',
  );
  @override
  late final GeneratedColumn<int> stakeholderId = GeneratedColumn<int>(
    'stakeholder_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<StakeholderType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<StakeholderType>($StakeholderTable.$convertertype);
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
    'avatar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _contactMeta = const VerificationMeta(
    'contact',
  );
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
    'contact',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    stakeholderId,
    name,
    type,
    avatar,
    description,
    contact,
    createdAt,
    updatedAt,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stakeholder';
  @override
  VerificationContext validateIntegrity(
    Insertable<StakeholderEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('stakeholder_id')) {
      context.handle(
        _stakeholderIdMeta,
        stakeholderId.isAcceptableOrUnknown(
          data['stakeholder_id']!,
          _stakeholderIdMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('contact')) {
      context.handle(
        _contactMeta,
        contact.isAcceptableOrUnknown(data['contact']!, _contactMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {stakeholderId};
  @override
  StakeholderEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StakeholderEntity(
      stakeholderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stakeholder_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: $StakeholderTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      contact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $StakeholderTable createAlias(String alias) {
    return $StakeholderTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<StakeholderType, String, String> $convertertype =
      const EnumNameConverter<StakeholderType>(StakeholderType.values);
}

class StakeholderEntity extends DataClass
    implements Insertable<StakeholderEntity> {
  final int stakeholderId;
  final String name;
  final StakeholderType type;
  final String? avatar;
  final String description;
  final String? contact;
  final int createdAt;
  final int updatedAt;
  final String note;
  const StakeholderEntity({
    required this.stakeholderId,
    required this.name,
    required this.type,
    this.avatar,
    required this.description,
    this.contact,
    required this.createdAt,
    required this.updatedAt,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['stakeholder_id'] = Variable<int>(stakeholderId);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>(
        $StakeholderTable.$convertertype.toSql(type),
      );
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || contact != null) {
      map['contact'] = Variable<String>(contact);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['note'] = Variable<String>(note);
    return map;
  }

  StakeholderCompanion toCompanion(bool nullToAbsent) {
    return StakeholderCompanion(
      stakeholderId: Value(stakeholderId),
      name: Value(name),
      type: Value(type),
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
      description: Value(description),
      contact: contact == null && nullToAbsent
          ? const Value.absent()
          : Value(contact),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      note: Value(note),
    );
  }

  factory StakeholderEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StakeholderEntity(
      stakeholderId: serializer.fromJson<int>(json['stakeholderId']),
      name: serializer.fromJson<String>(json['name']),
      type: $StakeholderTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      avatar: serializer.fromJson<String?>(json['avatar']),
      description: serializer.fromJson<String>(json['description']),
      contact: serializer.fromJson<String?>(json['contact']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'stakeholderId': serializer.toJson<int>(stakeholderId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(
        $StakeholderTable.$convertertype.toJson(type),
      ),
      'avatar': serializer.toJson<String?>(avatar),
      'description': serializer.toJson<String>(description),
      'contact': serializer.toJson<String?>(contact),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'note': serializer.toJson<String>(note),
    };
  }

  StakeholderEntity copyWith({
    int? stakeholderId,
    String? name,
    StakeholderType? type,
    Value<String?> avatar = const Value.absent(),
    String? description,
    Value<String?> contact = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    String? note,
  }) => StakeholderEntity(
    stakeholderId: stakeholderId ?? this.stakeholderId,
    name: name ?? this.name,
    type: type ?? this.type,
    avatar: avatar.present ? avatar.value : this.avatar,
    description: description ?? this.description,
    contact: contact.present ? contact.value : this.contact,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    note: note ?? this.note,
  );
  StakeholderEntity copyWithCompanion(StakeholderCompanion data) {
    return StakeholderEntity(
      stakeholderId: data.stakeholderId.present
          ? data.stakeholderId.value
          : this.stakeholderId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      description: data.description.present
          ? data.description.value
          : this.description,
      contact: data.contact.present ? data.contact.value : this.contact,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StakeholderEntity(')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('avatar: $avatar, ')
          ..write('description: $description, ')
          ..write('contact: $contact, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    stakeholderId,
    name,
    type,
    avatar,
    description,
    contact,
    createdAt,
    updatedAt,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StakeholderEntity &&
          other.stakeholderId == this.stakeholderId &&
          other.name == this.name &&
          other.type == this.type &&
          other.avatar == this.avatar &&
          other.description == this.description &&
          other.contact == this.contact &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.note == this.note);
}

class StakeholderCompanion extends UpdateCompanion<StakeholderEntity> {
  final Value<int> stakeholderId;
  final Value<String> name;
  final Value<StakeholderType> type;
  final Value<String?> avatar;
  final Value<String> description;
  final Value<String?> contact;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String> note;
  const StakeholderCompanion({
    this.stakeholderId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.avatar = const Value.absent(),
    this.description = const Value.absent(),
    this.contact = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.note = const Value.absent(),
  });
  StakeholderCompanion.insert({
    this.stakeholderId = const Value.absent(),
    required String name,
    required StakeholderType type,
    this.avatar = const Value.absent(),
    this.description = const Value.absent(),
    this.contact = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.note = const Value.absent(),
  }) : name = Value(name),
       type = Value(type),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<StakeholderEntity> custom({
    Expression<int>? stakeholderId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? avatar,
    Expression<String>? description,
    Expression<String>? contact,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (stakeholderId != null) 'stakeholder_id': stakeholderId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (avatar != null) 'avatar': avatar,
      if (description != null) 'description': description,
      if (contact != null) 'contact': contact,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (note != null) 'note': note,
    });
  }

  StakeholderCompanion copyWith({
    Value<int>? stakeholderId,
    Value<String>? name,
    Value<StakeholderType>? type,
    Value<String?>? avatar,
    Value<String>? description,
    Value<String?>? contact,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String>? note,
  }) {
    return StakeholderCompanion(
      stakeholderId: stakeholderId ?? this.stakeholderId,
      name: name ?? this.name,
      type: type ?? this.type,
      avatar: avatar ?? this.avatar,
      description: description ?? this.description,
      contact: contact ?? this.contact,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (stakeholderId.present) {
      map['stakeholder_id'] = Variable<int>(stakeholderId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $StakeholderTable.$convertertype.toSql(type.value),
      );
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StakeholderCompanion(')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('avatar: $avatar, ')
          ..write('description: $description, ')
          ..write('contact: $contact, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $AccountLoanTable extends AccountLoan
    with TableInfo<$AccountLoanTable, LoanAccountEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountLoanTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  static const VerificationMeta _stakeholderIdMeta = const VerificationMeta(
    'stakeholderId',
  );
  @override
  late final GeneratedColumn<int> stakeholderId = GeneratedColumn<int>(
    'stakeholder_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stakeholder (stakeholder_id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountLoanType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AccountLoanType>($AccountLoanTable.$convertertype);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<int> rate = GeneratedColumn<int>(
    'rate',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<int> startDate = GeneratedColumn<int>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<int> endDate = GeneratedColumn<int>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _archivedMeta = const VerificationMeta(
    'archived',
  );
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
    'archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    accountId,
    stakeholderId,
    type,
    amount,
    rate,
    startDate,
    endDate,
    archived,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_loan';
  @override
  VerificationContext validateIntegrity(
    Insertable<LoanAccountEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('stakeholder_id')) {
      context.handle(
        _stakeholderIdMeta,
        stakeholderId.isAcceptableOrUnknown(
          data['stakeholder_id']!,
          _stakeholderIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stakeholderIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
        _rateMeta,
        rate.isAcceptableOrUnknown(data['rate']!, _rateMeta),
      );
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('archived')) {
      context.handle(
        _archivedMeta,
        archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId};
  @override
  LoanAccountEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoanAccountEntity(
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      stakeholderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stakeholder_id'],
      )!,
      type: $AccountLoanTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      rate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rate'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_date'],
      )!,
      archived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}archived'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $AccountLoanTable createAlias(String alias) {
    return $AccountLoanTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountLoanType, String, String> $convertertype =
      const EnumNameConverter<AccountLoanType>(AccountLoanType.values);
}

class LoanAccountEntity extends DataClass
    implements Insertable<LoanAccountEntity> {
  final int accountId;
  final int stakeholderId;
  final AccountLoanType type;
  final int amount;
  final int rate;
  final int startDate;
  final int endDate;
  final bool archived;
  final String note;
  const LoanAccountEntity({
    required this.accountId,
    required this.stakeholderId,
    required this.type,
    required this.amount,
    required this.rate,
    required this.startDate,
    required this.endDate,
    required this.archived,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    map['stakeholder_id'] = Variable<int>(stakeholderId);
    {
      map['type'] = Variable<String>(
        $AccountLoanTable.$convertertype.toSql(type),
      );
    }
    map['amount'] = Variable<int>(amount);
    map['rate'] = Variable<int>(rate);
    map['start_date'] = Variable<int>(startDate);
    map['end_date'] = Variable<int>(endDate);
    map['archived'] = Variable<bool>(archived);
    map['note'] = Variable<String>(note);
    return map;
  }

  AccountLoanCompanion toCompanion(bool nullToAbsent) {
    return AccountLoanCompanion(
      accountId: Value(accountId),
      stakeholderId: Value(stakeholderId),
      type: Value(type),
      amount: Value(amount),
      rate: Value(rate),
      startDate: Value(startDate),
      endDate: Value(endDate),
      archived: Value(archived),
      note: Value(note),
    );
  }

  factory LoanAccountEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoanAccountEntity(
      accountId: serializer.fromJson<int>(json['accountId']),
      stakeholderId: serializer.fromJson<int>(json['stakeholderId']),
      type: $AccountLoanTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      amount: serializer.fromJson<int>(json['amount']),
      rate: serializer.fromJson<int>(json['rate']),
      startDate: serializer.fromJson<int>(json['startDate']),
      endDate: serializer.fromJson<int>(json['endDate']),
      archived: serializer.fromJson<bool>(json['archived']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'stakeholderId': serializer.toJson<int>(stakeholderId),
      'type': serializer.toJson<String>(
        $AccountLoanTable.$convertertype.toJson(type),
      ),
      'amount': serializer.toJson<int>(amount),
      'rate': serializer.toJson<int>(rate),
      'startDate': serializer.toJson<int>(startDate),
      'endDate': serializer.toJson<int>(endDate),
      'archived': serializer.toJson<bool>(archived),
      'note': serializer.toJson<String>(note),
    };
  }

  LoanAccountEntity copyWith({
    int? accountId,
    int? stakeholderId,
    AccountLoanType? type,
    int? amount,
    int? rate,
    int? startDate,
    int? endDate,
    bool? archived,
    String? note,
  }) => LoanAccountEntity(
    accountId: accountId ?? this.accountId,
    stakeholderId: stakeholderId ?? this.stakeholderId,
    type: type ?? this.type,
    amount: amount ?? this.amount,
    rate: rate ?? this.rate,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    archived: archived ?? this.archived,
    note: note ?? this.note,
  );
  LoanAccountEntity copyWithCompanion(AccountLoanCompanion data) {
    return LoanAccountEntity(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      stakeholderId: data.stakeholderId.present
          ? data.stakeholderId.value
          : this.stakeholderId,
      type: data.type.present ? data.type.value : this.type,
      amount: data.amount.present ? data.amount.value : this.amount,
      rate: data.rate.present ? data.rate.value : this.rate,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      archived: data.archived.present ? data.archived.value : this.archived,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoanAccountEntity(')
          ..write('accountId: $accountId, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('rate: $rate, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('archived: $archived, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountId,
    stakeholderId,
    type,
    amount,
    rate,
    startDate,
    endDate,
    archived,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanAccountEntity &&
          other.accountId == this.accountId &&
          other.stakeholderId == this.stakeholderId &&
          other.type == this.type &&
          other.amount == this.amount &&
          other.rate == this.rate &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.archived == this.archived &&
          other.note == this.note);
}

class AccountLoanCompanion extends UpdateCompanion<LoanAccountEntity> {
  final Value<int> accountId;
  final Value<int> stakeholderId;
  final Value<AccountLoanType> type;
  final Value<int> amount;
  final Value<int> rate;
  final Value<int> startDate;
  final Value<int> endDate;
  final Value<bool> archived;
  final Value<String> note;
  const AccountLoanCompanion({
    this.accountId = const Value.absent(),
    this.stakeholderId = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.rate = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.archived = const Value.absent(),
    this.note = const Value.absent(),
  });
  AccountLoanCompanion.insert({
    this.accountId = const Value.absent(),
    required int stakeholderId,
    required AccountLoanType type,
    required int amount,
    required int rate,
    required int startDate,
    required int endDate,
    this.archived = const Value.absent(),
    this.note = const Value.absent(),
  }) : stakeholderId = Value(stakeholderId),
       type = Value(type),
       amount = Value(amount),
       rate = Value(rate),
       startDate = Value(startDate),
       endDate = Value(endDate);
  static Insertable<LoanAccountEntity> custom({
    Expression<int>? accountId,
    Expression<int>? stakeholderId,
    Expression<String>? type,
    Expression<int>? amount,
    Expression<int>? rate,
    Expression<int>? startDate,
    Expression<int>? endDate,
    Expression<bool>? archived,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (stakeholderId != null) 'stakeholder_id': stakeholderId,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (rate != null) 'rate': rate,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (archived != null) 'archived': archived,
      if (note != null) 'note': note,
    });
  }

  AccountLoanCompanion copyWith({
    Value<int>? accountId,
    Value<int>? stakeholderId,
    Value<AccountLoanType>? type,
    Value<int>? amount,
    Value<int>? rate,
    Value<int>? startDate,
    Value<int>? endDate,
    Value<bool>? archived,
    Value<String>? note,
  }) {
    return AccountLoanCompanion(
      accountId: accountId ?? this.accountId,
      stakeholderId: stakeholderId ?? this.stakeholderId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      rate: rate ?? this.rate,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      archived: archived ?? this.archived,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (stakeholderId.present) {
      map['stakeholder_id'] = Variable<int>(stakeholderId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $AccountLoanTable.$convertertype.toSql(type.value),
      );
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (rate.present) {
      map['rate'] = Variable<int>(rate.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<int>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<int>(endDate.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountLoanCompanion(')
          ..write('accountId: $accountId, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('rate: $rate, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('archived: $archived, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $LoanPlanTable extends LoanPlan
    with TableInfo<$LoanPlanTable, LoanPlanEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoanPlanTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _loanPlanIdMeta = const VerificationMeta(
    'loanPlanId',
  );
  @override
  late final GeneratedColumn<int> loanPlanId = GeneratedColumn<int>(
    'loan_plan_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<int> dueDate = GeneratedColumn<int>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    loanPlanId,
    accountId,
    amount,
    dueDate,
    createdAt,
    updatedAt,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loan_plan';
  @override
  VerificationContext validateIntegrity(
    Insertable<LoanPlanEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('loan_plan_id')) {
      context.handle(
        _loanPlanIdMeta,
        loanPlanId.isAcceptableOrUnknown(
          data['loan_plan_id']!,
          _loanPlanIdMeta,
        ),
      );
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {loanPlanId};
  @override
  LoanPlanEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoanPlanEntity(
      loanPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}loan_plan_id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $LoanPlanTable createAlias(String alias) {
    return $LoanPlanTable(attachedDatabase, alias);
  }
}

class LoanPlanEntity extends DataClass implements Insertable<LoanPlanEntity> {
  final int loanPlanId;
  final int accountId;
  final int amount;
  final int dueDate;
  final int createdAt;
  final int updatedAt;
  final String note;
  const LoanPlanEntity({
    required this.loanPlanId,
    required this.accountId,
    required this.amount,
    required this.dueDate,
    required this.createdAt,
    required this.updatedAt,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['loan_plan_id'] = Variable<int>(loanPlanId);
    map['account_id'] = Variable<int>(accountId);
    map['amount'] = Variable<int>(amount);
    map['due_date'] = Variable<int>(dueDate);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['note'] = Variable<String>(note);
    return map;
  }

  LoanPlanCompanion toCompanion(bool nullToAbsent) {
    return LoanPlanCompanion(
      loanPlanId: Value(loanPlanId),
      accountId: Value(accountId),
      amount: Value(amount),
      dueDate: Value(dueDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      note: Value(note),
    );
  }

  factory LoanPlanEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoanPlanEntity(
      loanPlanId: serializer.fromJson<int>(json['loanPlanId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      amount: serializer.fromJson<int>(json['amount']),
      dueDate: serializer.fromJson<int>(json['dueDate']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'loanPlanId': serializer.toJson<int>(loanPlanId),
      'accountId': serializer.toJson<int>(accountId),
      'amount': serializer.toJson<int>(amount),
      'dueDate': serializer.toJson<int>(dueDate),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'note': serializer.toJson<String>(note),
    };
  }

  LoanPlanEntity copyWith({
    int? loanPlanId,
    int? accountId,
    int? amount,
    int? dueDate,
    int? createdAt,
    int? updatedAt,
    String? note,
  }) => LoanPlanEntity(
    loanPlanId: loanPlanId ?? this.loanPlanId,
    accountId: accountId ?? this.accountId,
    amount: amount ?? this.amount,
    dueDate: dueDate ?? this.dueDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    note: note ?? this.note,
  );
  LoanPlanEntity copyWithCompanion(LoanPlanCompanion data) {
    return LoanPlanEntity(
      loanPlanId: data.loanPlanId.present
          ? data.loanPlanId.value
          : this.loanPlanId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      amount: data.amount.present ? data.amount.value : this.amount,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoanPlanEntity(')
          ..write('loanPlanId: $loanPlanId, ')
          ..write('accountId: $accountId, ')
          ..write('amount: $amount, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    loanPlanId,
    accountId,
    amount,
    dueDate,
    createdAt,
    updatedAt,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanPlanEntity &&
          other.loanPlanId == this.loanPlanId &&
          other.accountId == this.accountId &&
          other.amount == this.amount &&
          other.dueDate == this.dueDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.note == this.note);
}

class LoanPlanCompanion extends UpdateCompanion<LoanPlanEntity> {
  final Value<int> loanPlanId;
  final Value<int> accountId;
  final Value<int> amount;
  final Value<int> dueDate;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String> note;
  const LoanPlanCompanion({
    this.loanPlanId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.amount = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.note = const Value.absent(),
  });
  LoanPlanCompanion.insert({
    this.loanPlanId = const Value.absent(),
    required int accountId,
    required int amount,
    required int dueDate,
    required int createdAt,
    required int updatedAt,
    this.note = const Value.absent(),
  }) : accountId = Value(accountId),
       amount = Value(amount),
       dueDate = Value(dueDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<LoanPlanEntity> custom({
    Expression<int>? loanPlanId,
    Expression<int>? accountId,
    Expression<int>? amount,
    Expression<int>? dueDate,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (loanPlanId != null) 'loan_plan_id': loanPlanId,
      if (accountId != null) 'account_id': accountId,
      if (amount != null) 'amount': amount,
      if (dueDate != null) 'due_date': dueDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (note != null) 'note': note,
    });
  }

  LoanPlanCompanion copyWith({
    Value<int>? loanPlanId,
    Value<int>? accountId,
    Value<int>? amount,
    Value<int>? dueDate,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String>? note,
  }) {
    return LoanPlanCompanion(
      loanPlanId: loanPlanId ?? this.loanPlanId,
      accountId: accountId ?? this.accountId,
      amount: amount ?? this.amount,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (loanPlanId.present) {
      map['loan_plan_id'] = Variable<int>(loanPlanId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<int>(dueDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoanPlanCompanion(')
          ..write('loanPlanId: $loanPlanId, ')
          ..write('accountId: $accountId, ')
          ..write('amount: $amount, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $LoanRecordTable extends LoanRecord
    with TableInfo<$LoanRecordTable, LoanRecordEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoanRecordTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _loanRecordIdMeta = const VerificationMeta(
    'loanRecordId',
  );
  @override
  late final GeneratedColumn<int> loanRecordId = GeneratedColumn<int>(
    'loan_record_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    loanRecordId,
    accountId,
    amount,
    timestamp,
    createdAt,
    updatedAt,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loan_record';
  @override
  VerificationContext validateIntegrity(
    Insertable<LoanRecordEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('loan_record_id')) {
      context.handle(
        _loanRecordIdMeta,
        loanRecordId.isAcceptableOrUnknown(
          data['loan_record_id']!,
          _loanRecordIdMeta,
        ),
      );
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {loanRecordId};
  @override
  LoanRecordEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoanRecordEntity(
      loanRecordId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}loan_record_id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $LoanRecordTable createAlias(String alias) {
    return $LoanRecordTable(attachedDatabase, alias);
  }
}

class LoanRecordEntity extends DataClass
    implements Insertable<LoanRecordEntity> {
  final int loanRecordId;
  final int accountId;
  final int amount;
  final int timestamp;
  final int createdAt;
  final int updatedAt;
  final String note;
  const LoanRecordEntity({
    required this.loanRecordId,
    required this.accountId,
    required this.amount,
    required this.timestamp,
    required this.createdAt,
    required this.updatedAt,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['loan_record_id'] = Variable<int>(loanRecordId);
    map['account_id'] = Variable<int>(accountId);
    map['amount'] = Variable<int>(amount);
    map['timestamp'] = Variable<int>(timestamp);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['note'] = Variable<String>(note);
    return map;
  }

  LoanRecordCompanion toCompanion(bool nullToAbsent) {
    return LoanRecordCompanion(
      loanRecordId: Value(loanRecordId),
      accountId: Value(accountId),
      amount: Value(amount),
      timestamp: Value(timestamp),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      note: Value(note),
    );
  }

  factory LoanRecordEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoanRecordEntity(
      loanRecordId: serializer.fromJson<int>(json['loanRecordId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      amount: serializer.fromJson<int>(json['amount']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'loanRecordId': serializer.toJson<int>(loanRecordId),
      'accountId': serializer.toJson<int>(accountId),
      'amount': serializer.toJson<int>(amount),
      'timestamp': serializer.toJson<int>(timestamp),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'note': serializer.toJson<String>(note),
    };
  }

  LoanRecordEntity copyWith({
    int? loanRecordId,
    int? accountId,
    int? amount,
    int? timestamp,
    int? createdAt,
    int? updatedAt,
    String? note,
  }) => LoanRecordEntity(
    loanRecordId: loanRecordId ?? this.loanRecordId,
    accountId: accountId ?? this.accountId,
    amount: amount ?? this.amount,
    timestamp: timestamp ?? this.timestamp,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    note: note ?? this.note,
  );
  LoanRecordEntity copyWithCompanion(LoanRecordCompanion data) {
    return LoanRecordEntity(
      loanRecordId: data.loanRecordId.present
          ? data.loanRecordId.value
          : this.loanRecordId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      amount: data.amount.present ? data.amount.value : this.amount,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoanRecordEntity(')
          ..write('loanRecordId: $loanRecordId, ')
          ..write('accountId: $accountId, ')
          ..write('amount: $amount, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    loanRecordId,
    accountId,
    amount,
    timestamp,
    createdAt,
    updatedAt,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanRecordEntity &&
          other.loanRecordId == this.loanRecordId &&
          other.accountId == this.accountId &&
          other.amount == this.amount &&
          other.timestamp == this.timestamp &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.note == this.note);
}

class LoanRecordCompanion extends UpdateCompanion<LoanRecordEntity> {
  final Value<int> loanRecordId;
  final Value<int> accountId;
  final Value<int> amount;
  final Value<int> timestamp;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String> note;
  const LoanRecordCompanion({
    this.loanRecordId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.amount = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.note = const Value.absent(),
  });
  LoanRecordCompanion.insert({
    this.loanRecordId = const Value.absent(),
    required int accountId,
    required int amount,
    required int timestamp,
    required int createdAt,
    required int updatedAt,
    this.note = const Value.absent(),
  }) : accountId = Value(accountId),
       amount = Value(amount),
       timestamp = Value(timestamp),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<LoanRecordEntity> custom({
    Expression<int>? loanRecordId,
    Expression<int>? accountId,
    Expression<int>? amount,
    Expression<int>? timestamp,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (loanRecordId != null) 'loan_record_id': loanRecordId,
      if (accountId != null) 'account_id': accountId,
      if (amount != null) 'amount': amount,
      if (timestamp != null) 'timestamp': timestamp,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (note != null) 'note': note,
    });
  }

  LoanRecordCompanion copyWith({
    Value<int>? loanRecordId,
    Value<int>? accountId,
    Value<int>? amount,
    Value<int>? timestamp,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String>? note,
  }) {
    return LoanRecordCompanion(
      loanRecordId: loanRecordId ?? this.loanRecordId,
      accountId: accountId ?? this.accountId,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (loanRecordId.present) {
      map['loan_record_id'] = Variable<int>(loanRecordId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoanRecordCompanion(')
          ..write('loanRecordId: $loanRecordId, ')
          ..write('accountId: $accountId, ')
          ..write('amount: $amount, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $LedgerTable extends Ledger with TableInfo<$LedgerTable, LedgerEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LedgerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ledgerIdMeta = const VerificationMeta(
    'ledgerId',
  );
  @override
  late final GeneratedColumn<int> ledgerId = GeneratedColumn<int>(
    'ledger_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES currency (currency_code)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
    'photo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _autoAccountMeta = const VerificationMeta(
    'autoAccount',
  );
  @override
  late final GeneratedColumn<bool> autoAccount = GeneratedColumn<bool>(
    'auto_account',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("auto_account" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _autoCategoryMeta = const VerificationMeta(
    'autoCategory',
  );
  @override
  late final GeneratedColumn<bool> autoCategory = GeneratedColumn<bool>(
    'auto_category',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("auto_category" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    ledgerId,
    name,
    currencyCode,
    description,
    photo,
    autoAccount,
    autoCategory,
    createdAt,
    updatedAt,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ledger';
  @override
  VerificationContext validateIntegrity(
    Insertable<LedgerEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ledger_id')) {
      context.handle(
        _ledgerIdMeta,
        ledgerId.isAcceptableOrUnknown(data['ledger_id']!, _ledgerIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('photo')) {
      context.handle(
        _photoMeta,
        photo.isAcceptableOrUnknown(data['photo']!, _photoMeta),
      );
    }
    if (data.containsKey('auto_account')) {
      context.handle(
        _autoAccountMeta,
        autoAccount.isAcceptableOrUnknown(
          data['auto_account']!,
          _autoAccountMeta,
        ),
      );
    }
    if (data.containsKey('auto_category')) {
      context.handle(
        _autoCategoryMeta,
        autoCategory.isAcceptableOrUnknown(
          data['auto_category']!,
          _autoCategoryMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ledgerId};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {name},
  ];
  @override
  LedgerEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LedgerEntity(
      ledgerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ledger_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      photo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo'],
      ),
      autoAccount: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}auto_account'],
      )!,
      autoCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}auto_category'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $LedgerTable createAlias(String alias) {
    return $LedgerTable(attachedDatabase, alias);
  }
}

class LedgerEntity extends DataClass implements Insertable<LedgerEntity> {
  final int ledgerId;
  final String name;
  final String currencyCode;
  final String description;
  final String? photo;
  final bool autoAccount;
  final bool autoCategory;
  final int createdAt;
  final int updatedAt;
  final String note;
  const LedgerEntity({
    required this.ledgerId,
    required this.name,
    required this.currencyCode,
    required this.description,
    this.photo,
    required this.autoAccount,
    required this.autoCategory,
    required this.createdAt,
    required this.updatedAt,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ledger_id'] = Variable<int>(ledgerId);
    map['name'] = Variable<String>(name);
    map['currency_code'] = Variable<String>(currencyCode);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || photo != null) {
      map['photo'] = Variable<String>(photo);
    }
    map['auto_account'] = Variable<bool>(autoAccount);
    map['auto_category'] = Variable<bool>(autoCategory);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['note'] = Variable<String>(note);
    return map;
  }

  LedgerCompanion toCompanion(bool nullToAbsent) {
    return LedgerCompanion(
      ledgerId: Value(ledgerId),
      name: Value(name),
      currencyCode: Value(currencyCode),
      description: Value(description),
      photo: photo == null && nullToAbsent
          ? const Value.absent()
          : Value(photo),
      autoAccount: Value(autoAccount),
      autoCategory: Value(autoCategory),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      note: Value(note),
    );
  }

  factory LedgerEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LedgerEntity(
      ledgerId: serializer.fromJson<int>(json['ledgerId']),
      name: serializer.fromJson<String>(json['name']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      description: serializer.fromJson<String>(json['description']),
      photo: serializer.fromJson<String?>(json['photo']),
      autoAccount: serializer.fromJson<bool>(json['autoAccount']),
      autoCategory: serializer.fromJson<bool>(json['autoCategory']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ledgerId': serializer.toJson<int>(ledgerId),
      'name': serializer.toJson<String>(name),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'description': serializer.toJson<String>(description),
      'photo': serializer.toJson<String?>(photo),
      'autoAccount': serializer.toJson<bool>(autoAccount),
      'autoCategory': serializer.toJson<bool>(autoCategory),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'note': serializer.toJson<String>(note),
    };
  }

  LedgerEntity copyWith({
    int? ledgerId,
    String? name,
    String? currencyCode,
    String? description,
    Value<String?> photo = const Value.absent(),
    bool? autoAccount,
    bool? autoCategory,
    int? createdAt,
    int? updatedAt,
    String? note,
  }) => LedgerEntity(
    ledgerId: ledgerId ?? this.ledgerId,
    name: name ?? this.name,
    currencyCode: currencyCode ?? this.currencyCode,
    description: description ?? this.description,
    photo: photo.present ? photo.value : this.photo,
    autoAccount: autoAccount ?? this.autoAccount,
    autoCategory: autoCategory ?? this.autoCategory,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    note: note ?? this.note,
  );
  LedgerEntity copyWithCompanion(LedgerCompanion data) {
    return LedgerEntity(
      ledgerId: data.ledgerId.present ? data.ledgerId.value : this.ledgerId,
      name: data.name.present ? data.name.value : this.name,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      description: data.description.present
          ? data.description.value
          : this.description,
      photo: data.photo.present ? data.photo.value : this.photo,
      autoAccount: data.autoAccount.present
          ? data.autoAccount.value
          : this.autoAccount,
      autoCategory: data.autoCategory.present
          ? data.autoCategory.value
          : this.autoCategory,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LedgerEntity(')
          ..write('ledgerId: $ledgerId, ')
          ..write('name: $name, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('description: $description, ')
          ..write('photo: $photo, ')
          ..write('autoAccount: $autoAccount, ')
          ..write('autoCategory: $autoCategory, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    ledgerId,
    name,
    currencyCode,
    description,
    photo,
    autoAccount,
    autoCategory,
    createdAt,
    updatedAt,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LedgerEntity &&
          other.ledgerId == this.ledgerId &&
          other.name == this.name &&
          other.currencyCode == this.currencyCode &&
          other.description == this.description &&
          other.photo == this.photo &&
          other.autoAccount == this.autoAccount &&
          other.autoCategory == this.autoCategory &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.note == this.note);
}

class LedgerCompanion extends UpdateCompanion<LedgerEntity> {
  final Value<int> ledgerId;
  final Value<String> name;
  final Value<String> currencyCode;
  final Value<String> description;
  final Value<String?> photo;
  final Value<bool> autoAccount;
  final Value<bool> autoCategory;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String> note;
  const LedgerCompanion({
    this.ledgerId = const Value.absent(),
    this.name = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.description = const Value.absent(),
    this.photo = const Value.absent(),
    this.autoAccount = const Value.absent(),
    this.autoCategory = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.note = const Value.absent(),
  });
  LedgerCompanion.insert({
    this.ledgerId = const Value.absent(),
    required String name,
    required String currencyCode,
    this.description = const Value.absent(),
    this.photo = const Value.absent(),
    this.autoAccount = const Value.absent(),
    this.autoCategory = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.note = const Value.absent(),
  }) : name = Value(name),
       currencyCode = Value(currencyCode),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<LedgerEntity> custom({
    Expression<int>? ledgerId,
    Expression<String>? name,
    Expression<String>? currencyCode,
    Expression<String>? description,
    Expression<String>? photo,
    Expression<bool>? autoAccount,
    Expression<bool>? autoCategory,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (ledgerId != null) 'ledger_id': ledgerId,
      if (name != null) 'name': name,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (description != null) 'description': description,
      if (photo != null) 'photo': photo,
      if (autoAccount != null) 'auto_account': autoAccount,
      if (autoCategory != null) 'auto_category': autoCategory,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (note != null) 'note': note,
    });
  }

  LedgerCompanion copyWith({
    Value<int>? ledgerId,
    Value<String>? name,
    Value<String>? currencyCode,
    Value<String>? description,
    Value<String?>? photo,
    Value<bool>? autoAccount,
    Value<bool>? autoCategory,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String>? note,
  }) {
    return LedgerCompanion(
      ledgerId: ledgerId ?? this.ledgerId,
      name: name ?? this.name,
      currencyCode: currencyCode ?? this.currencyCode,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      autoAccount: autoAccount ?? this.autoAccount,
      autoCategory: autoCategory ?? this.autoCategory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ledgerId.present) {
      map['ledger_id'] = Variable<int>(ledgerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (autoAccount.present) {
      map['auto_account'] = Variable<bool>(autoAccount.value);
    }
    if (autoCategory.present) {
      map['auto_category'] = Variable<bool>(autoCategory.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LedgerCompanion(')
          ..write('ledgerId: $ledgerId, ')
          ..write('name: $name, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('description: $description, ')
          ..write('photo: $photo, ')
          ..write('autoAccount: $autoAccount, ')
          ..write('autoCategory: $autoCategory, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $RelationAccountLedgerTable extends RelationAccountLedger
    with TableInfo<$RelationAccountLedgerTable, LedgerAccountRelationEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationAccountLedgerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  static const VerificationMeta _ledgerIdMeta = const VerificationMeta(
    'ledgerId',
  );
  @override
  late final GeneratedColumn<int> ledgerId = GeneratedColumn<int>(
    'ledger_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ledger (ledger_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [accountId, ledgerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relation_account_ledger';
  @override
  VerificationContext validateIntegrity(
    Insertable<LedgerAccountRelationEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('ledger_id')) {
      context.handle(
        _ledgerIdMeta,
        ledgerId.isAcceptableOrUnknown(data['ledger_id']!, _ledgerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ledgerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId, ledgerId};
  @override
  LedgerAccountRelationEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LedgerAccountRelationEntity(
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      ledgerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ledger_id'],
      )!,
    );
  }

  @override
  $RelationAccountLedgerTable createAlias(String alias) {
    return $RelationAccountLedgerTable(attachedDatabase, alias);
  }
}

class LedgerAccountRelationEntity extends DataClass
    implements Insertable<LedgerAccountRelationEntity> {
  final int accountId;
  final int ledgerId;
  const LedgerAccountRelationEntity({
    required this.accountId,
    required this.ledgerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    map['ledger_id'] = Variable<int>(ledgerId);
    return map;
  }

  RelationAccountLedgerCompanion toCompanion(bool nullToAbsent) {
    return RelationAccountLedgerCompanion(
      accountId: Value(accountId),
      ledgerId: Value(ledgerId),
    );
  }

  factory LedgerAccountRelationEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LedgerAccountRelationEntity(
      accountId: serializer.fromJson<int>(json['accountId']),
      ledgerId: serializer.fromJson<int>(json['ledgerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'ledgerId': serializer.toJson<int>(ledgerId),
    };
  }

  LedgerAccountRelationEntity copyWith({int? accountId, int? ledgerId}) =>
      LedgerAccountRelationEntity(
        accountId: accountId ?? this.accountId,
        ledgerId: ledgerId ?? this.ledgerId,
      );
  LedgerAccountRelationEntity copyWithCompanion(
    RelationAccountLedgerCompanion data,
  ) {
    return LedgerAccountRelationEntity(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      ledgerId: data.ledgerId.present ? data.ledgerId.value : this.ledgerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LedgerAccountRelationEntity(')
          ..write('accountId: $accountId, ')
          ..write('ledgerId: $ledgerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accountId, ledgerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LedgerAccountRelationEntity &&
          other.accountId == this.accountId &&
          other.ledgerId == this.ledgerId);
}

class RelationAccountLedgerCompanion
    extends UpdateCompanion<LedgerAccountRelationEntity> {
  final Value<int> accountId;
  final Value<int> ledgerId;
  final Value<int> rowid;
  const RelationAccountLedgerCompanion({
    this.accountId = const Value.absent(),
    this.ledgerId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationAccountLedgerCompanion.insert({
    required int accountId,
    required int ledgerId,
    this.rowid = const Value.absent(),
  }) : accountId = Value(accountId),
       ledgerId = Value(ledgerId);
  static Insertable<LedgerAccountRelationEntity> custom({
    Expression<int>? accountId,
    Expression<int>? ledgerId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (ledgerId != null) 'ledger_id': ledgerId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationAccountLedgerCompanion copyWith({
    Value<int>? accountId,
    Value<int>? ledgerId,
    Value<int>? rowid,
  }) {
    return RelationAccountLedgerCompanion(
      accountId: accountId ?? this.accountId,
      ledgerId: ledgerId ?? this.ledgerId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (ledgerId.present) {
      map['ledger_id'] = Variable<int>(ledgerId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationAccountLedgerCompanion(')
          ..write('accountId: $accountId, ')
          ..write('ledgerId: $ledgerId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectTable extends Project
    with TableInfo<$ProjectTable, ProjectEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
    'project_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ledgerIdMeta = const VerificationMeta(
    'ledgerId',
  );
  @override
  late final GeneratedColumn<int> ledgerId = GeneratedColumn<int>(
    'ledger_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ledger (ledger_id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<int> budget = GeneratedColumn<int>(
    'budget',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _archivedMeta = const VerificationMeta(
    'archived',
  );
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
    'archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<int> startDate = GeneratedColumn<int>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<int> endDate = GeneratedColumn<int>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    projectId,
    ledgerId,
    name,
    description,
    budget,
    icon,
    archived,
    createdAt,
    updatedAt,
    startDate,
    endDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    }
    if (data.containsKey('ledger_id')) {
      context.handle(
        _ledgerIdMeta,
        ledgerId.isAcceptableOrUnknown(data['ledger_id']!, _ledgerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ledgerIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('budget')) {
      context.handle(
        _budgetMeta,
        budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('archived')) {
      context.handle(
        _archivedMeta,
        archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {projectId};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {ledgerId, name},
  ];
  @override
  ProjectEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEntity(
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}project_id'],
      )!,
      ledgerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ledger_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      budget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}budget'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      archived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_date'],
      ),
    );
  }

  @override
  $ProjectTable createAlias(String alias) {
    return $ProjectTable(attachedDatabase, alias);
  }
}

class ProjectEntity extends DataClass implements Insertable<ProjectEntity> {
  final int projectId;
  final int ledgerId;
  final String name;
  final String description;
  final int budget;
  final String icon;
  final bool archived;
  final int createdAt;
  final int updatedAt;
  final int? startDate;
  final int? endDate;
  const ProjectEntity({
    required this.projectId,
    required this.ledgerId,
    required this.name,
    required this.description,
    required this.budget,
    required this.icon,
    required this.archived,
    required this.createdAt,
    required this.updatedAt,
    this.startDate,
    this.endDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['project_id'] = Variable<int>(projectId);
    map['ledger_id'] = Variable<int>(ledgerId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['budget'] = Variable<int>(budget);
    map['icon'] = Variable<String>(icon);
    map['archived'] = Variable<bool>(archived);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<int>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<int>(endDate);
    }
    return map;
  }

  ProjectCompanion toCompanion(bool nullToAbsent) {
    return ProjectCompanion(
      projectId: Value(projectId),
      ledgerId: Value(ledgerId),
      name: Value(name),
      description: Value(description),
      budget: Value(budget),
      icon: Value(icon),
      archived: Value(archived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
    );
  }

  factory ProjectEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEntity(
      projectId: serializer.fromJson<int>(json['projectId']),
      ledgerId: serializer.fromJson<int>(json['ledgerId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      budget: serializer.fromJson<int>(json['budget']),
      icon: serializer.fromJson<String>(json['icon']),
      archived: serializer.fromJson<bool>(json['archived']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      startDate: serializer.fromJson<int?>(json['startDate']),
      endDate: serializer.fromJson<int?>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'projectId': serializer.toJson<int>(projectId),
      'ledgerId': serializer.toJson<int>(ledgerId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'budget': serializer.toJson<int>(budget),
      'icon': serializer.toJson<String>(icon),
      'archived': serializer.toJson<bool>(archived),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'startDate': serializer.toJson<int?>(startDate),
      'endDate': serializer.toJson<int?>(endDate),
    };
  }

  ProjectEntity copyWith({
    int? projectId,
    int? ledgerId,
    String? name,
    String? description,
    int? budget,
    String? icon,
    bool? archived,
    int? createdAt,
    int? updatedAt,
    Value<int?> startDate = const Value.absent(),
    Value<int?> endDate = const Value.absent(),
  }) => ProjectEntity(
    projectId: projectId ?? this.projectId,
    ledgerId: ledgerId ?? this.ledgerId,
    name: name ?? this.name,
    description: description ?? this.description,
    budget: budget ?? this.budget,
    icon: icon ?? this.icon,
    archived: archived ?? this.archived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
  );
  ProjectEntity copyWithCompanion(ProjectCompanion data) {
    return ProjectEntity(
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      ledgerId: data.ledgerId.present ? data.ledgerId.value : this.ledgerId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      budget: data.budget.present ? data.budget.value : this.budget,
      icon: data.icon.present ? data.icon.value : this.icon,
      archived: data.archived.present ? data.archived.value : this.archived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEntity(')
          ..write('projectId: $projectId, ')
          ..write('ledgerId: $ledgerId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('budget: $budget, ')
          ..write('icon: $icon, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    projectId,
    ledgerId,
    name,
    description,
    budget,
    icon,
    archived,
    createdAt,
    updatedAt,
    startDate,
    endDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEntity &&
          other.projectId == this.projectId &&
          other.ledgerId == this.ledgerId &&
          other.name == this.name &&
          other.description == this.description &&
          other.budget == this.budget &&
          other.icon == this.icon &&
          other.archived == this.archived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class ProjectCompanion extends UpdateCompanion<ProjectEntity> {
  final Value<int> projectId;
  final Value<int> ledgerId;
  final Value<String> name;
  final Value<String> description;
  final Value<int> budget;
  final Value<String> icon;
  final Value<bool> archived;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> startDate;
  final Value<int?> endDate;
  const ProjectCompanion({
    this.projectId = const Value.absent(),
    this.ledgerId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.budget = const Value.absent(),
    this.icon = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  ProjectCompanion.insert({
    this.projectId = const Value.absent(),
    required int ledgerId,
    required String name,
    this.description = const Value.absent(),
    this.budget = const Value.absent(),
    this.icon = const Value.absent(),
    this.archived = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  }) : ledgerId = Value(ledgerId),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProjectEntity> custom({
    Expression<int>? projectId,
    Expression<int>? ledgerId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? budget,
    Expression<String>? icon,
    Expression<bool>? archived,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? startDate,
    Expression<int>? endDate,
  }) {
    return RawValuesInsertable({
      if (projectId != null) 'project_id': projectId,
      if (ledgerId != null) 'ledger_id': ledgerId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (budget != null) 'budget': budget,
      if (icon != null) 'icon': icon,
      if (archived != null) 'archived': archived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  ProjectCompanion copyWith({
    Value<int>? projectId,
    Value<int>? ledgerId,
    Value<String>? name,
    Value<String>? description,
    Value<int>? budget,
    Value<String>? icon,
    Value<bool>? archived,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? startDate,
    Value<int?>? endDate,
  }) {
    return ProjectCompanion(
      projectId: projectId ?? this.projectId,
      ledgerId: ledgerId ?? this.ledgerId,
      name: name ?? this.name,
      description: description ?? this.description,
      budget: budget ?? this.budget,
      icon: icon ?? this.icon,
      archived: archived ?? this.archived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    if (ledgerId.present) {
      map['ledger_id'] = Variable<int>(ledgerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (budget.present) {
      map['budget'] = Variable<int>(budget.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<int>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<int>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectCompanion(')
          ..write('projectId: $projectId, ')
          ..write('ledgerId: $ledgerId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('budget: $budget, ')
          ..write('icon: $icon, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES category (category_id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CategoryType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CategoryType>($CategoryTable.$convertertype);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    categoryId,
    parentId,
    name,
    type,
    icon,
    order,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryId};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {name, type},
  ];
  @override
  CategoryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryEntity(
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: $CategoryTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      )!,
    );
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CategoryType, String, String> $convertertype =
      const EnumNameConverter<CategoryType>(CategoryType.values);
}

class CategoryEntity extends DataClass implements Insertable<CategoryEntity> {
  final int categoryId;
  final int? parentId;
  final String name;
  final CategoryType type;
  final String icon;
  final int order;
  const CategoryEntity({
    required this.categoryId,
    this.parentId,
    required this.name,
    required this.type,
    required this.icon,
    required this.order,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>($CategoryTable.$convertertype.toSql(type));
    }
    map['icon'] = Variable<String>(icon);
    map['order'] = Variable<int>(order);
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      categoryId: Value(categoryId),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      name: Value(name),
      type: Value(type),
      icon: Value(icon),
      order: Value(order),
    );
  }

  factory CategoryEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryEntity(
      categoryId: serializer.fromJson<int>(json['categoryId']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      name: serializer.fromJson<String>(json['name']),
      type: $CategoryTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      icon: serializer.fromJson<String>(json['icon']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryId': serializer.toJson<int>(categoryId),
      'parentId': serializer.toJson<int?>(parentId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(
        $CategoryTable.$convertertype.toJson(type),
      ),
      'icon': serializer.toJson<String>(icon),
      'order': serializer.toJson<int>(order),
    };
  }

  CategoryEntity copyWith({
    int? categoryId,
    Value<int?> parentId = const Value.absent(),
    String? name,
    CategoryType? type,
    String? icon,
    int? order,
  }) => CategoryEntity(
    categoryId: categoryId ?? this.categoryId,
    parentId: parentId.present ? parentId.value : this.parentId,
    name: name ?? this.name,
    type: type ?? this.type,
    icon: icon ?? this.icon,
    order: order ?? this.order,
  );
  CategoryEntity copyWithCompanion(CategoryCompanion data) {
    return CategoryEntity(
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      icon: data.icon.present ? data.icon.value : this.icon,
      order: data.order.present ? data.order.value : this.order,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryEntity(')
          ..write('categoryId: $categoryId, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('icon: $icon, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(categoryId, parentId, name, type, icon, order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryEntity &&
          other.categoryId == this.categoryId &&
          other.parentId == this.parentId &&
          other.name == this.name &&
          other.type == this.type &&
          other.icon == this.icon &&
          other.order == this.order);
}

class CategoryCompanion extends UpdateCompanion<CategoryEntity> {
  final Value<int> categoryId;
  final Value<int?> parentId;
  final Value<String> name;
  final Value<CategoryType> type;
  final Value<String> icon;
  final Value<int> order;
  const CategoryCompanion({
    this.categoryId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.icon = const Value.absent(),
    this.order = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.categoryId = const Value.absent(),
    this.parentId = const Value.absent(),
    required String name,
    required CategoryType type,
    this.icon = const Value.absent(),
    this.order = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<CategoryEntity> custom({
    Expression<int>? categoryId,
    Expression<int>? parentId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? icon,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (categoryId != null) 'category_id': categoryId,
      if (parentId != null) 'parent_id': parentId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (icon != null) 'icon': icon,
      if (order != null) 'order': order,
    });
  }

  CategoryCompanion copyWith({
    Value<int>? categoryId,
    Value<int?>? parentId,
    Value<String>? name,
    Value<CategoryType>? type,
    Value<String>? icon,
    Value<int>? order,
  }) {
    return CategoryCompanion(
      categoryId: categoryId ?? this.categoryId,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $CategoryTable.$convertertype.toSql(type.value),
      );
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('categoryId: $categoryId, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('icon: $icon, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $RelationCategoryLedgerTable extends RelationCategoryLedger
    with TableInfo<$RelationCategoryLedgerTable, LedgerCategoryRelationEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationCategoryLedgerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES category (category_id)',
    ),
  );
  static const VerificationMeta _ledgerIdMeta = const VerificationMeta(
    'ledgerId',
  );
  @override
  late final GeneratedColumn<int> ledgerId = GeneratedColumn<int>(
    'ledger_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ledger (ledger_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [categoryId, ledgerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relation_category_ledger';
  @override
  VerificationContext validateIntegrity(
    Insertable<LedgerCategoryRelationEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('ledger_id')) {
      context.handle(
        _ledgerIdMeta,
        ledgerId.isAcceptableOrUnknown(data['ledger_id']!, _ledgerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ledgerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryId, ledgerId};
  @override
  LedgerCategoryRelationEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LedgerCategoryRelationEntity(
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      ledgerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ledger_id'],
      )!,
    );
  }

  @override
  $RelationCategoryLedgerTable createAlias(String alias) {
    return $RelationCategoryLedgerTable(attachedDatabase, alias);
  }
}

class LedgerCategoryRelationEntity extends DataClass
    implements Insertable<LedgerCategoryRelationEntity> {
  final int categoryId;
  final int ledgerId;
  const LedgerCategoryRelationEntity({
    required this.categoryId,
    required this.ledgerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_id'] = Variable<int>(categoryId);
    map['ledger_id'] = Variable<int>(ledgerId);
    return map;
  }

  RelationCategoryLedgerCompanion toCompanion(bool nullToAbsent) {
    return RelationCategoryLedgerCompanion(
      categoryId: Value(categoryId),
      ledgerId: Value(ledgerId),
    );
  }

  factory LedgerCategoryRelationEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LedgerCategoryRelationEntity(
      categoryId: serializer.fromJson<int>(json['categoryId']),
      ledgerId: serializer.fromJson<int>(json['ledgerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryId': serializer.toJson<int>(categoryId),
      'ledgerId': serializer.toJson<int>(ledgerId),
    };
  }

  LedgerCategoryRelationEntity copyWith({int? categoryId, int? ledgerId}) =>
      LedgerCategoryRelationEntity(
        categoryId: categoryId ?? this.categoryId,
        ledgerId: ledgerId ?? this.ledgerId,
      );
  LedgerCategoryRelationEntity copyWithCompanion(
    RelationCategoryLedgerCompanion data,
  ) {
    return LedgerCategoryRelationEntity(
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      ledgerId: data.ledgerId.present ? data.ledgerId.value : this.ledgerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LedgerCategoryRelationEntity(')
          ..write('categoryId: $categoryId, ')
          ..write('ledgerId: $ledgerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(categoryId, ledgerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LedgerCategoryRelationEntity &&
          other.categoryId == this.categoryId &&
          other.ledgerId == this.ledgerId);
}

class RelationCategoryLedgerCompanion
    extends UpdateCompanion<LedgerCategoryRelationEntity> {
  final Value<int> categoryId;
  final Value<int> ledgerId;
  final Value<int> rowid;
  const RelationCategoryLedgerCompanion({
    this.categoryId = const Value.absent(),
    this.ledgerId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationCategoryLedgerCompanion.insert({
    required int categoryId,
    required int ledgerId,
    this.rowid = const Value.absent(),
  }) : categoryId = Value(categoryId),
       ledgerId = Value(ledgerId);
  static Insertable<LedgerCategoryRelationEntity> custom({
    Expression<int>? categoryId,
    Expression<int>? ledgerId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (categoryId != null) 'category_id': categoryId,
      if (ledgerId != null) 'ledger_id': ledgerId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationCategoryLedgerCompanion copyWith({
    Value<int>? categoryId,
    Value<int>? ledgerId,
    Value<int>? rowid,
  }) {
    return RelationCategoryLedgerCompanion(
      categoryId: categoryId ?? this.categoryId,
      ledgerId: ledgerId ?? this.ledgerId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (ledgerId.present) {
      map['ledger_id'] = Variable<int>(ledgerId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationCategoryLedgerCompanion(')
          ..write('categoryId: $categoryId, ')
          ..write('ledgerId: $ledgerId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
    'transaction_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ledgerIdMeta = const VerificationMeta(
    'ledgerId',
  );
  @override
  late final GeneratedColumn<int> ledgerId = GeneratedColumn<int>(
    'ledger_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ledger (ledger_id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TransactionType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TransactionType>($TransactionsTable.$convertertype);
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stakeholderIdMeta = const VerificationMeta(
    'stakeholderId',
  );
  @override
  late final GeneratedColumn<int> stakeholderId = GeneratedColumn<int>(
    'stakeholder_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stakeholder (stakeholder_id)',
    ),
  );
  static const VerificationMeta _hiddenMeta = const VerificationMeta('hidden');
  @override
  late final GeneratedColumn<bool> hidden = GeneratedColumn<bool>(
    'hidden',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("hidden" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _excludedMeta = const VerificationMeta(
    'excluded',
  );
  @override
  late final GeneratedColumn<bool> excluded = GeneratedColumn<bool>(
    'excluded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("excluded" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _locationNameMeta = const VerificationMeta(
    'locationName',
  );
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
    'location_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationLatMeta = const VerificationMeta(
    'locationLat',
  );
  @override
  late final GeneratedColumn<double> locationLat = GeneratedColumn<double>(
    'location_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationLngMeta = const VerificationMeta(
    'locationLng',
  );
  @override
  late final GeneratedColumn<double> locationLng = GeneratedColumn<double>(
    'location_lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    transactionId,
    ledgerId,
    type,
    timestamp,
    createdAt,
    updatedAt,
    stakeholderId,
    hidden,
    excluded,
    locationName,
    locationLat,
    locationLng,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    }
    if (data.containsKey('ledger_id')) {
      context.handle(
        _ledgerIdMeta,
        ledgerId.isAcceptableOrUnknown(data['ledger_id']!, _ledgerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ledgerIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('stakeholder_id')) {
      context.handle(
        _stakeholderIdMeta,
        stakeholderId.isAcceptableOrUnknown(
          data['stakeholder_id']!,
          _stakeholderIdMeta,
        ),
      );
    }
    if (data.containsKey('hidden')) {
      context.handle(
        _hiddenMeta,
        hidden.isAcceptableOrUnknown(data['hidden']!, _hiddenMeta),
      );
    }
    if (data.containsKey('excluded')) {
      context.handle(
        _excludedMeta,
        excluded.isAcceptableOrUnknown(data['excluded']!, _excludedMeta),
      );
    }
    if (data.containsKey('location_name')) {
      context.handle(
        _locationNameMeta,
        locationName.isAcceptableOrUnknown(
          data['location_name']!,
          _locationNameMeta,
        ),
      );
    }
    if (data.containsKey('location_lat')) {
      context.handle(
        _locationLatMeta,
        locationLat.isAcceptableOrUnknown(
          data['location_lat']!,
          _locationLatMeta,
        ),
      );
    }
    if (data.containsKey('location_lng')) {
      context.handle(
        _locationLngMeta,
        locationLng.isAcceptableOrUnknown(
          data['location_lng']!,
          _locationLngMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {transactionId};
  @override
  TransactionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionEntity(
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      ledgerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ledger_id'],
      )!,
      type: $TransactionsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      stakeholderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stakeholder_id'],
      ),
      hidden: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}hidden'],
      )!,
      excluded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}excluded'],
      )!,
      locationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_name'],
      ),
      locationLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}location_lat'],
      ),
      locationLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}location_lng'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionType, String, String> $convertertype =
      const EnumNameConverter<TransactionType>(TransactionType.values);
}

class TransactionEntity extends DataClass
    implements Insertable<TransactionEntity> {
  final int transactionId;
  final int ledgerId;
  final TransactionType type;
  final int timestamp;
  final int createdAt;
  final int updatedAt;
  final int? stakeholderId;
  final bool hidden;
  final bool excluded;
  final String? locationName;
  final double? locationLat;
  final double? locationLng;
  final String note;
  const TransactionEntity({
    required this.transactionId,
    required this.ledgerId,
    required this.type,
    required this.timestamp,
    required this.createdAt,
    required this.updatedAt,
    this.stakeholderId,
    required this.hidden,
    required this.excluded,
    this.locationName,
    this.locationLat,
    this.locationLng,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['transaction_id'] = Variable<int>(transactionId);
    map['ledger_id'] = Variable<int>(ledgerId);
    {
      map['type'] = Variable<String>(
        $TransactionsTable.$convertertype.toSql(type),
      );
    }
    map['timestamp'] = Variable<int>(timestamp);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || stakeholderId != null) {
      map['stakeholder_id'] = Variable<int>(stakeholderId);
    }
    map['hidden'] = Variable<bool>(hidden);
    map['excluded'] = Variable<bool>(excluded);
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    if (!nullToAbsent || locationLat != null) {
      map['location_lat'] = Variable<double>(locationLat);
    }
    if (!nullToAbsent || locationLng != null) {
      map['location_lng'] = Variable<double>(locationLng);
    }
    map['note'] = Variable<String>(note);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      transactionId: Value(transactionId),
      ledgerId: Value(ledgerId),
      type: Value(type),
      timestamp: Value(timestamp),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      stakeholderId: stakeholderId == null && nullToAbsent
          ? const Value.absent()
          : Value(stakeholderId),
      hidden: Value(hidden),
      excluded: Value(excluded),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      locationLat: locationLat == null && nullToAbsent
          ? const Value.absent()
          : Value(locationLat),
      locationLng: locationLng == null && nullToAbsent
          ? const Value.absent()
          : Value(locationLng),
      note: Value(note),
    );
  }

  factory TransactionEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionEntity(
      transactionId: serializer.fromJson<int>(json['transactionId']),
      ledgerId: serializer.fromJson<int>(json['ledgerId']),
      type: $TransactionsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      stakeholderId: serializer.fromJson<int?>(json['stakeholderId']),
      hidden: serializer.fromJson<bool>(json['hidden']),
      excluded: serializer.fromJson<bool>(json['excluded']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      locationLat: serializer.fromJson<double?>(json['locationLat']),
      locationLng: serializer.fromJson<double?>(json['locationLng']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'transactionId': serializer.toJson<int>(transactionId),
      'ledgerId': serializer.toJson<int>(ledgerId),
      'type': serializer.toJson<String>(
        $TransactionsTable.$convertertype.toJson(type),
      ),
      'timestamp': serializer.toJson<int>(timestamp),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'stakeholderId': serializer.toJson<int?>(stakeholderId),
      'hidden': serializer.toJson<bool>(hidden),
      'excluded': serializer.toJson<bool>(excluded),
      'locationName': serializer.toJson<String?>(locationName),
      'locationLat': serializer.toJson<double?>(locationLat),
      'locationLng': serializer.toJson<double?>(locationLng),
      'note': serializer.toJson<String>(note),
    };
  }

  TransactionEntity copyWith({
    int? transactionId,
    int? ledgerId,
    TransactionType? type,
    int? timestamp,
    int? createdAt,
    int? updatedAt,
    Value<int?> stakeholderId = const Value.absent(),
    bool? hidden,
    bool? excluded,
    Value<String?> locationName = const Value.absent(),
    Value<double?> locationLat = const Value.absent(),
    Value<double?> locationLng = const Value.absent(),
    String? note,
  }) => TransactionEntity(
    transactionId: transactionId ?? this.transactionId,
    ledgerId: ledgerId ?? this.ledgerId,
    type: type ?? this.type,
    timestamp: timestamp ?? this.timestamp,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    stakeholderId: stakeholderId.present
        ? stakeholderId.value
        : this.stakeholderId,
    hidden: hidden ?? this.hidden,
    excluded: excluded ?? this.excluded,
    locationName: locationName.present ? locationName.value : this.locationName,
    locationLat: locationLat.present ? locationLat.value : this.locationLat,
    locationLng: locationLng.present ? locationLng.value : this.locationLng,
    note: note ?? this.note,
  );
  TransactionEntity copyWithCompanion(TransactionsCompanion data) {
    return TransactionEntity(
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      ledgerId: data.ledgerId.present ? data.ledgerId.value : this.ledgerId,
      type: data.type.present ? data.type.value : this.type,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      stakeholderId: data.stakeholderId.present
          ? data.stakeholderId.value
          : this.stakeholderId,
      hidden: data.hidden.present ? data.hidden.value : this.hidden,
      excluded: data.excluded.present ? data.excluded.value : this.excluded,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
      locationLat: data.locationLat.present
          ? data.locationLat.value
          : this.locationLat,
      locationLng: data.locationLng.present
          ? data.locationLng.value
          : this.locationLng,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionEntity(')
          ..write('transactionId: $transactionId, ')
          ..write('ledgerId: $ledgerId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('hidden: $hidden, ')
          ..write('excluded: $excluded, ')
          ..write('locationName: $locationName, ')
          ..write('locationLat: $locationLat, ')
          ..write('locationLng: $locationLng, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    transactionId,
    ledgerId,
    type,
    timestamp,
    createdAt,
    updatedAt,
    stakeholderId,
    hidden,
    excluded,
    locationName,
    locationLat,
    locationLng,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionEntity &&
          other.transactionId == this.transactionId &&
          other.ledgerId == this.ledgerId &&
          other.type == this.type &&
          other.timestamp == this.timestamp &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.stakeholderId == this.stakeholderId &&
          other.hidden == this.hidden &&
          other.excluded == this.excluded &&
          other.locationName == this.locationName &&
          other.locationLat == this.locationLat &&
          other.locationLng == this.locationLng &&
          other.note == this.note);
}

class TransactionsCompanion extends UpdateCompanion<TransactionEntity> {
  final Value<int> transactionId;
  final Value<int> ledgerId;
  final Value<TransactionType> type;
  final Value<int> timestamp;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> stakeholderId;
  final Value<bool> hidden;
  final Value<bool> excluded;
  final Value<String?> locationName;
  final Value<double?> locationLat;
  final Value<double?> locationLng;
  final Value<String> note;
  const TransactionsCompanion({
    this.transactionId = const Value.absent(),
    this.ledgerId = const Value.absent(),
    this.type = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.stakeholderId = const Value.absent(),
    this.hidden = const Value.absent(),
    this.excluded = const Value.absent(),
    this.locationName = const Value.absent(),
    this.locationLat = const Value.absent(),
    this.locationLng = const Value.absent(),
    this.note = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.transactionId = const Value.absent(),
    required int ledgerId,
    required TransactionType type,
    required int timestamp,
    required int createdAt,
    required int updatedAt,
    this.stakeholderId = const Value.absent(),
    this.hidden = const Value.absent(),
    this.excluded = const Value.absent(),
    this.locationName = const Value.absent(),
    this.locationLat = const Value.absent(),
    this.locationLng = const Value.absent(),
    this.note = const Value.absent(),
  }) : ledgerId = Value(ledgerId),
       type = Value(type),
       timestamp = Value(timestamp),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TransactionEntity> custom({
    Expression<int>? transactionId,
    Expression<int>? ledgerId,
    Expression<String>? type,
    Expression<int>? timestamp,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? stakeholderId,
    Expression<bool>? hidden,
    Expression<bool>? excluded,
    Expression<String>? locationName,
    Expression<double>? locationLat,
    Expression<double>? locationLng,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (transactionId != null) 'transaction_id': transactionId,
      if (ledgerId != null) 'ledger_id': ledgerId,
      if (type != null) 'type': type,
      if (timestamp != null) 'timestamp': timestamp,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (stakeholderId != null) 'stakeholder_id': stakeholderId,
      if (hidden != null) 'hidden': hidden,
      if (excluded != null) 'excluded': excluded,
      if (locationName != null) 'location_name': locationName,
      if (locationLat != null) 'location_lat': locationLat,
      if (locationLng != null) 'location_lng': locationLng,
      if (note != null) 'note': note,
    });
  }

  TransactionsCompanion copyWith({
    Value<int>? transactionId,
    Value<int>? ledgerId,
    Value<TransactionType>? type,
    Value<int>? timestamp,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? stakeholderId,
    Value<bool>? hidden,
    Value<bool>? excluded,
    Value<String?>? locationName,
    Value<double?>? locationLat,
    Value<double?>? locationLng,
    Value<String>? note,
  }) {
    return TransactionsCompanion(
      transactionId: transactionId ?? this.transactionId,
      ledgerId: ledgerId ?? this.ledgerId,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      stakeholderId: stakeholderId ?? this.stakeholderId,
      hidden: hidden ?? this.hidden,
      excluded: excluded ?? this.excluded,
      locationName: locationName ?? this.locationName,
      locationLat: locationLat ?? this.locationLat,
      locationLng: locationLng ?? this.locationLng,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (ledgerId.present) {
      map['ledger_id'] = Variable<int>(ledgerId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $TransactionsTable.$convertertype.toSql(type.value),
      );
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (stakeholderId.present) {
      map['stakeholder_id'] = Variable<int>(stakeholderId.value);
    }
    if (hidden.present) {
      map['hidden'] = Variable<bool>(hidden.value);
    }
    if (excluded.present) {
      map['excluded'] = Variable<bool>(excluded.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (locationLat.present) {
      map['location_lat'] = Variable<double>(locationLat.value);
    }
    if (locationLng.present) {
      map['location_lng'] = Variable<double>(locationLng.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('transactionId: $transactionId, ')
          ..write('ledgerId: $ledgerId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('hidden: $hidden, ')
          ..write('excluded: $excluded, ')
          ..write('locationName: $locationName, ')
          ..write('locationLat: $locationLat, ')
          ..write('locationLng: $locationLng, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $TransactionAmountDetailTable extends TransactionAmountDetail
    with
        TableInfo<
          $TransactionAmountDetailTable,
          TransactionAmountDetailEntity
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionAmountDetailTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _amountDetailIdMeta = const VerificationMeta(
    'amountDetailId',
  );
  @override
  late final GeneratedColumn<int> amountDetailId = GeneratedColumn<int>(
    'amount_detail_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (transaction_id)',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES currency (currency_code)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _realAmountMeta = const VerificationMeta(
    'realAmount',
  );
  @override
  late final GeneratedColumn<int> realAmount = GeneratedColumn<int>(
    'real_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    amountDetailId,
    transactionId,
    accountId,
    currencyCode,
    amount,
    realAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_amount_detail';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionAmountDetailEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('amount_detail_id')) {
      context.handle(
        _amountDetailIdMeta,
        amountDetailId.isAcceptableOrUnknown(
          data['amount_detail_id']!,
          _amountDetailIdMeta,
        ),
      );
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('real_amount')) {
      context.handle(
        _realAmountMeta,
        realAmount.isAcceptableOrUnknown(data['real_amount']!, _realAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_realAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {amountDetailId};
  @override
  TransactionAmountDetailEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionAmountDetailEntity(
      amountDetailId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_detail_id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      realAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}real_amount'],
      )!,
    );
  }

  @override
  $TransactionAmountDetailTable createAlias(String alias) {
    return $TransactionAmountDetailTable(attachedDatabase, alias);
  }
}

class TransactionAmountDetailEntity extends DataClass
    implements Insertable<TransactionAmountDetailEntity> {
  final int amountDetailId;
  final int transactionId;
  final int accountId;
  final String currencyCode;
  final int amount;
  final int realAmount;
  const TransactionAmountDetailEntity({
    required this.amountDetailId,
    required this.transactionId,
    required this.accountId,
    required this.currencyCode,
    required this.amount,
    required this.realAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['amount_detail_id'] = Variable<int>(amountDetailId);
    map['transaction_id'] = Variable<int>(transactionId);
    map['account_id'] = Variable<int>(accountId);
    map['currency_code'] = Variable<String>(currencyCode);
    map['amount'] = Variable<int>(amount);
    map['real_amount'] = Variable<int>(realAmount);
    return map;
  }

  TransactionAmountDetailCompanion toCompanion(bool nullToAbsent) {
    return TransactionAmountDetailCompanion(
      amountDetailId: Value(amountDetailId),
      transactionId: Value(transactionId),
      accountId: Value(accountId),
      currencyCode: Value(currencyCode),
      amount: Value(amount),
      realAmount: Value(realAmount),
    );
  }

  factory TransactionAmountDetailEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionAmountDetailEntity(
      amountDetailId: serializer.fromJson<int>(json['amountDetailId']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      amount: serializer.fromJson<int>(json['amount']),
      realAmount: serializer.fromJson<int>(json['realAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'amountDetailId': serializer.toJson<int>(amountDetailId),
      'transactionId': serializer.toJson<int>(transactionId),
      'accountId': serializer.toJson<int>(accountId),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'amount': serializer.toJson<int>(amount),
      'realAmount': serializer.toJson<int>(realAmount),
    };
  }

  TransactionAmountDetailEntity copyWith({
    int? amountDetailId,
    int? transactionId,
    int? accountId,
    String? currencyCode,
    int? amount,
    int? realAmount,
  }) => TransactionAmountDetailEntity(
    amountDetailId: amountDetailId ?? this.amountDetailId,
    transactionId: transactionId ?? this.transactionId,
    accountId: accountId ?? this.accountId,
    currencyCode: currencyCode ?? this.currencyCode,
    amount: amount ?? this.amount,
    realAmount: realAmount ?? this.realAmount,
  );
  TransactionAmountDetailEntity copyWithCompanion(
    TransactionAmountDetailCompanion data,
  ) {
    return TransactionAmountDetailEntity(
      amountDetailId: data.amountDetailId.present
          ? data.amountDetailId.value
          : this.amountDetailId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      amount: data.amount.present ? data.amount.value : this.amount,
      realAmount: data.realAmount.present
          ? data.realAmount.value
          : this.realAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionAmountDetailEntity(')
          ..write('amountDetailId: $amountDetailId, ')
          ..write('transactionId: $transactionId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    amountDetailId,
    transactionId,
    accountId,
    currencyCode,
    amount,
    realAmount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionAmountDetailEntity &&
          other.amountDetailId == this.amountDetailId &&
          other.transactionId == this.transactionId &&
          other.accountId == this.accountId &&
          other.currencyCode == this.currencyCode &&
          other.amount == this.amount &&
          other.realAmount == this.realAmount);
}

class TransactionAmountDetailCompanion
    extends UpdateCompanion<TransactionAmountDetailEntity> {
  final Value<int> amountDetailId;
  final Value<int> transactionId;
  final Value<int> accountId;
  final Value<String> currencyCode;
  final Value<int> amount;
  final Value<int> realAmount;
  const TransactionAmountDetailCompanion({
    this.amountDetailId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.amount = const Value.absent(),
    this.realAmount = const Value.absent(),
  });
  TransactionAmountDetailCompanion.insert({
    this.amountDetailId = const Value.absent(),
    required int transactionId,
    required int accountId,
    required String currencyCode,
    required int amount,
    required int realAmount,
  }) : transactionId = Value(transactionId),
       accountId = Value(accountId),
       currencyCode = Value(currencyCode),
       amount = Value(amount),
       realAmount = Value(realAmount);
  static Insertable<TransactionAmountDetailEntity> custom({
    Expression<int>? amountDetailId,
    Expression<int>? transactionId,
    Expression<int>? accountId,
    Expression<String>? currencyCode,
    Expression<int>? amount,
    Expression<int>? realAmount,
  }) {
    return RawValuesInsertable({
      if (amountDetailId != null) 'amount_detail_id': amountDetailId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (accountId != null) 'account_id': accountId,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (amount != null) 'amount': amount,
      if (realAmount != null) 'real_amount': realAmount,
    });
  }

  TransactionAmountDetailCompanion copyWith({
    Value<int>? amountDetailId,
    Value<int>? transactionId,
    Value<int>? accountId,
    Value<String>? currencyCode,
    Value<int>? amount,
    Value<int>? realAmount,
  }) {
    return TransactionAmountDetailCompanion(
      amountDetailId: amountDetailId ?? this.amountDetailId,
      transactionId: transactionId ?? this.transactionId,
      accountId: accountId ?? this.accountId,
      currencyCode: currencyCode ?? this.currencyCode,
      amount: amount ?? this.amount,
      realAmount: realAmount ?? this.realAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (amountDetailId.present) {
      map['amount_detail_id'] = Variable<int>(amountDetailId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (realAmount.present) {
      map['real_amount'] = Variable<int>(realAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionAmountDetailCompanion(')
          ..write('amountDetailId: $amountDetailId, ')
          ..write('transactionId: $transactionId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount')
          ..write(')'))
        .toString();
  }
}

class $TransactionCategoryDetailTable extends TransactionCategoryDetail
    with
        TableInfo<
          $TransactionCategoryDetailTable,
          TransactionCategoryDetailEntity
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionCategoryDetailTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryDetailIdMeta = const VerificationMeta(
    'categoryDetailId',
  );
  @override
  late final GeneratedColumn<int> categoryDetailId = GeneratedColumn<int>(
    'category_detail_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (transaction_id)',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES category (category_id)',
    ),
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES currency (currency_code)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _realAmountMeta = const VerificationMeta(
    'realAmount',
  );
  @override
  late final GeneratedColumn<int> realAmount = GeneratedColumn<int>(
    'real_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    categoryDetailId,
    transactionId,
    categoryId,
    currencyCode,
    amount,
    realAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_category_detail';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionCategoryDetailEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_detail_id')) {
      context.handle(
        _categoryDetailIdMeta,
        categoryDetailId.isAcceptableOrUnknown(
          data['category_detail_id']!,
          _categoryDetailIdMeta,
        ),
      );
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('real_amount')) {
      context.handle(
        _realAmountMeta,
        realAmount.isAcceptableOrUnknown(data['real_amount']!, _realAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_realAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryDetailId};
  @override
  TransactionCategoryDetailEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionCategoryDetailEntity(
      categoryDetailId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_detail_id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      realAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}real_amount'],
      )!,
    );
  }

  @override
  $TransactionCategoryDetailTable createAlias(String alias) {
    return $TransactionCategoryDetailTable(attachedDatabase, alias);
  }
}

class TransactionCategoryDetailEntity extends DataClass
    implements Insertable<TransactionCategoryDetailEntity> {
  final int categoryDetailId;
  final int transactionId;
  final int categoryId;
  final String currencyCode;
  final int amount;
  final int realAmount;
  const TransactionCategoryDetailEntity({
    required this.categoryDetailId,
    required this.transactionId,
    required this.categoryId,
    required this.currencyCode,
    required this.amount,
    required this.realAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_detail_id'] = Variable<int>(categoryDetailId);
    map['transaction_id'] = Variable<int>(transactionId);
    map['category_id'] = Variable<int>(categoryId);
    map['currency_code'] = Variable<String>(currencyCode);
    map['amount'] = Variable<int>(amount);
    map['real_amount'] = Variable<int>(realAmount);
    return map;
  }

  TransactionCategoryDetailCompanion toCompanion(bool nullToAbsent) {
    return TransactionCategoryDetailCompanion(
      categoryDetailId: Value(categoryDetailId),
      transactionId: Value(transactionId),
      categoryId: Value(categoryId),
      currencyCode: Value(currencyCode),
      amount: Value(amount),
      realAmount: Value(realAmount),
    );
  }

  factory TransactionCategoryDetailEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionCategoryDetailEntity(
      categoryDetailId: serializer.fromJson<int>(json['categoryDetailId']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      amount: serializer.fromJson<int>(json['amount']),
      realAmount: serializer.fromJson<int>(json['realAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryDetailId': serializer.toJson<int>(categoryDetailId),
      'transactionId': serializer.toJson<int>(transactionId),
      'categoryId': serializer.toJson<int>(categoryId),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'amount': serializer.toJson<int>(amount),
      'realAmount': serializer.toJson<int>(realAmount),
    };
  }

  TransactionCategoryDetailEntity copyWith({
    int? categoryDetailId,
    int? transactionId,
    int? categoryId,
    String? currencyCode,
    int? amount,
    int? realAmount,
  }) => TransactionCategoryDetailEntity(
    categoryDetailId: categoryDetailId ?? this.categoryDetailId,
    transactionId: transactionId ?? this.transactionId,
    categoryId: categoryId ?? this.categoryId,
    currencyCode: currencyCode ?? this.currencyCode,
    amount: amount ?? this.amount,
    realAmount: realAmount ?? this.realAmount,
  );
  TransactionCategoryDetailEntity copyWithCompanion(
    TransactionCategoryDetailCompanion data,
  ) {
    return TransactionCategoryDetailEntity(
      categoryDetailId: data.categoryDetailId.present
          ? data.categoryDetailId.value
          : this.categoryDetailId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      amount: data.amount.present ? data.amount.value : this.amount,
      realAmount: data.realAmount.present
          ? data.realAmount.value
          : this.realAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCategoryDetailEntity(')
          ..write('categoryDetailId: $categoryDetailId, ')
          ..write('transactionId: $transactionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    categoryDetailId,
    transactionId,
    categoryId,
    currencyCode,
    amount,
    realAmount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionCategoryDetailEntity &&
          other.categoryDetailId == this.categoryDetailId &&
          other.transactionId == this.transactionId &&
          other.categoryId == this.categoryId &&
          other.currencyCode == this.currencyCode &&
          other.amount == this.amount &&
          other.realAmount == this.realAmount);
}

class TransactionCategoryDetailCompanion
    extends UpdateCompanion<TransactionCategoryDetailEntity> {
  final Value<int> categoryDetailId;
  final Value<int> transactionId;
  final Value<int> categoryId;
  final Value<String> currencyCode;
  final Value<int> amount;
  final Value<int> realAmount;
  const TransactionCategoryDetailCompanion({
    this.categoryDetailId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.amount = const Value.absent(),
    this.realAmount = const Value.absent(),
  });
  TransactionCategoryDetailCompanion.insert({
    this.categoryDetailId = const Value.absent(),
    required int transactionId,
    required int categoryId,
    required String currencyCode,
    required int amount,
    required int realAmount,
  }) : transactionId = Value(transactionId),
       categoryId = Value(categoryId),
       currencyCode = Value(currencyCode),
       amount = Value(amount),
       realAmount = Value(realAmount);
  static Insertable<TransactionCategoryDetailEntity> custom({
    Expression<int>? categoryDetailId,
    Expression<int>? transactionId,
    Expression<int>? categoryId,
    Expression<String>? currencyCode,
    Expression<int>? amount,
    Expression<int>? realAmount,
  }) {
    return RawValuesInsertable({
      if (categoryDetailId != null) 'category_detail_id': categoryDetailId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (categoryId != null) 'category_id': categoryId,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (amount != null) 'amount': amount,
      if (realAmount != null) 'real_amount': realAmount,
    });
  }

  TransactionCategoryDetailCompanion copyWith({
    Value<int>? categoryDetailId,
    Value<int>? transactionId,
    Value<int>? categoryId,
    Value<String>? currencyCode,
    Value<int>? amount,
    Value<int>? realAmount,
  }) {
    return TransactionCategoryDetailCompanion(
      categoryDetailId: categoryDetailId ?? this.categoryDetailId,
      transactionId: transactionId ?? this.transactionId,
      categoryId: categoryId ?? this.categoryId,
      currencyCode: currencyCode ?? this.currencyCode,
      amount: amount ?? this.amount,
      realAmount: realAmount ?? this.realAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryDetailId.present) {
      map['category_detail_id'] = Variable<int>(categoryDetailId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (realAmount.present) {
      map['real_amount'] = Variable<int>(realAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCategoryDetailCompanion(')
          ..write('categoryDetailId: $categoryDetailId, ')
          ..write('transactionId: $transactionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount')
          ..write(')'))
        .toString();
  }
}

class $TransactionInstallmentDetailTable extends TransactionInstallmentDetail
    with
        TableInfo<
          $TransactionInstallmentDetailTable,
          TransactionInstallmentDetailEntity
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionInstallmentDetailTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _installmentDetailIdMeta =
      const VerificationMeta('installmentDetailId');
  @override
  late final GeneratedColumn<int> installmentDetailId = GeneratedColumn<int>(
    'installment_detail_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (transaction_id)',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES currency (currency_code)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    installmentDetailId,
    transactionId,
    accountId,
    currencyCode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_installment_detail';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionInstallmentDetailEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('installment_detail_id')) {
      context.handle(
        _installmentDetailIdMeta,
        installmentDetailId.isAcceptableOrUnknown(
          data['installment_detail_id']!,
          _installmentDetailIdMeta,
        ),
      );
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {installmentDetailId};
  @override
  TransactionInstallmentDetailEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionInstallmentDetailEntity(
      installmentDetailId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installment_detail_id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
    );
  }

  @override
  $TransactionInstallmentDetailTable createAlias(String alias) {
    return $TransactionInstallmentDetailTable(attachedDatabase, alias);
  }
}

class TransactionInstallmentDetailEntity extends DataClass
    implements Insertable<TransactionInstallmentDetailEntity> {
  final int installmentDetailId;
  final int transactionId;
  final int accountId;
  final String currencyCode;
  const TransactionInstallmentDetailEntity({
    required this.installmentDetailId,
    required this.transactionId,
    required this.accountId,
    required this.currencyCode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['installment_detail_id'] = Variable<int>(installmentDetailId);
    map['transaction_id'] = Variable<int>(transactionId);
    map['account_id'] = Variable<int>(accountId);
    map['currency_code'] = Variable<String>(currencyCode);
    return map;
  }

  TransactionInstallmentDetailCompanion toCompanion(bool nullToAbsent) {
    return TransactionInstallmentDetailCompanion(
      installmentDetailId: Value(installmentDetailId),
      transactionId: Value(transactionId),
      accountId: Value(accountId),
      currencyCode: Value(currencyCode),
    );
  }

  factory TransactionInstallmentDetailEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionInstallmentDetailEntity(
      installmentDetailId: serializer.fromJson<int>(
        json['installmentDetailId'],
      ),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'installmentDetailId': serializer.toJson<int>(installmentDetailId),
      'transactionId': serializer.toJson<int>(transactionId),
      'accountId': serializer.toJson<int>(accountId),
      'currencyCode': serializer.toJson<String>(currencyCode),
    };
  }

  TransactionInstallmentDetailEntity copyWith({
    int? installmentDetailId,
    int? transactionId,
    int? accountId,
    String? currencyCode,
  }) => TransactionInstallmentDetailEntity(
    installmentDetailId: installmentDetailId ?? this.installmentDetailId,
    transactionId: transactionId ?? this.transactionId,
    accountId: accountId ?? this.accountId,
    currencyCode: currencyCode ?? this.currencyCode,
  );
  TransactionInstallmentDetailEntity copyWithCompanion(
    TransactionInstallmentDetailCompanion data,
  ) {
    return TransactionInstallmentDetailEntity(
      installmentDetailId: data.installmentDetailId.present
          ? data.installmentDetailId.value
          : this.installmentDetailId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionInstallmentDetailEntity(')
          ..write('installmentDetailId: $installmentDetailId, ')
          ..write('transactionId: $transactionId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyCode: $currencyCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(installmentDetailId, transactionId, accountId, currencyCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionInstallmentDetailEntity &&
          other.installmentDetailId == this.installmentDetailId &&
          other.transactionId == this.transactionId &&
          other.accountId == this.accountId &&
          other.currencyCode == this.currencyCode);
}

class TransactionInstallmentDetailCompanion
    extends UpdateCompanion<TransactionInstallmentDetailEntity> {
  final Value<int> installmentDetailId;
  final Value<int> transactionId;
  final Value<int> accountId;
  final Value<String> currencyCode;
  const TransactionInstallmentDetailCompanion({
    this.installmentDetailId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.currencyCode = const Value.absent(),
  });
  TransactionInstallmentDetailCompanion.insert({
    this.installmentDetailId = const Value.absent(),
    required int transactionId,
    required int accountId,
    required String currencyCode,
  }) : transactionId = Value(transactionId),
       accountId = Value(accountId),
       currencyCode = Value(currencyCode);
  static Insertable<TransactionInstallmentDetailEntity> custom({
    Expression<int>? installmentDetailId,
    Expression<int>? transactionId,
    Expression<int>? accountId,
    Expression<String>? currencyCode,
  }) {
    return RawValuesInsertable({
      if (installmentDetailId != null)
        'installment_detail_id': installmentDetailId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (accountId != null) 'account_id': accountId,
      if (currencyCode != null) 'currency_code': currencyCode,
    });
  }

  TransactionInstallmentDetailCompanion copyWith({
    Value<int>? installmentDetailId,
    Value<int>? transactionId,
    Value<int>? accountId,
    Value<String>? currencyCode,
  }) {
    return TransactionInstallmentDetailCompanion(
      installmentDetailId: installmentDetailId ?? this.installmentDetailId,
      transactionId: transactionId ?? this.transactionId,
      accountId: accountId ?? this.accountId,
      currencyCode: currencyCode ?? this.currencyCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (installmentDetailId.present) {
      map['installment_detail_id'] = Variable<int>(installmentDetailId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionInstallmentDetailCompanion(')
          ..write('installmentDetailId: $installmentDetailId, ')
          ..write('transactionId: $transactionId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyCode: $currencyCode')
          ..write(')'))
        .toString();
  }
}

class $TransactionInstallmentItemTable extends TransactionInstallmentItem
    with
        TableInfo<
          $TransactionInstallmentItemTable,
          TransactionInstallmentItemEntity
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionInstallmentItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _installmentItemIdMeta = const VerificationMeta(
    'installmentItemId',
  );
  @override
  late final GeneratedColumn<int> installmentItemId = GeneratedColumn<int>(
    'installment_item_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _installmentDetailIdMeta =
      const VerificationMeta('installmentDetailId');
  @override
  late final GeneratedColumn<int> installmentDetailId = GeneratedColumn<int>(
    'installment_detail_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transaction_installment_detail (installment_detail_id)',
    ),
  );
  static const VerificationMeta _installmentNumberMeta = const VerificationMeta(
    'installmentNumber',
  );
  @override
  late final GeneratedColumn<int> installmentNumber = GeneratedColumn<int>(
    'installment_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<int> dueDate = GeneratedColumn<int>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capitalAmountMeta = const VerificationMeta(
    'capitalAmount',
  );
  @override
  late final GeneratedColumn<int> capitalAmount = GeneratedColumn<int>(
    'capital_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _realCapitalAmountMeta = const VerificationMeta(
    'realCapitalAmount',
  );
  @override
  late final GeneratedColumn<int> realCapitalAmount = GeneratedColumn<int>(
    'real_capital_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interestAmountMeta = const VerificationMeta(
    'interestAmount',
  );
  @override
  late final GeneratedColumn<int> interestAmount = GeneratedColumn<int>(
    'interest_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _realInterestAmountMeta =
      const VerificationMeta('realInterestAmount');
  @override
  late final GeneratedColumn<int> realInterestAmount = GeneratedColumn<int>(
    'real_interest_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    installmentItemId,
    installmentDetailId,
    installmentNumber,
    dueDate,
    capitalAmount,
    realCapitalAmount,
    interestAmount,
    realInterestAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_installment_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionInstallmentItemEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('installment_item_id')) {
      context.handle(
        _installmentItemIdMeta,
        installmentItemId.isAcceptableOrUnknown(
          data['installment_item_id']!,
          _installmentItemIdMeta,
        ),
      );
    }
    if (data.containsKey('installment_detail_id')) {
      context.handle(
        _installmentDetailIdMeta,
        installmentDetailId.isAcceptableOrUnknown(
          data['installment_detail_id']!,
          _installmentDetailIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_installmentDetailIdMeta);
    }
    if (data.containsKey('installment_number')) {
      context.handle(
        _installmentNumberMeta,
        installmentNumber.isAcceptableOrUnknown(
          data['installment_number']!,
          _installmentNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_installmentNumberMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('capital_amount')) {
      context.handle(
        _capitalAmountMeta,
        capitalAmount.isAcceptableOrUnknown(
          data['capital_amount']!,
          _capitalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_capitalAmountMeta);
    }
    if (data.containsKey('real_capital_amount')) {
      context.handle(
        _realCapitalAmountMeta,
        realCapitalAmount.isAcceptableOrUnknown(
          data['real_capital_amount']!,
          _realCapitalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_realCapitalAmountMeta);
    }
    if (data.containsKey('interest_amount')) {
      context.handle(
        _interestAmountMeta,
        interestAmount.isAcceptableOrUnknown(
          data['interest_amount']!,
          _interestAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interestAmountMeta);
    }
    if (data.containsKey('real_interest_amount')) {
      context.handle(
        _realInterestAmountMeta,
        realInterestAmount.isAcceptableOrUnknown(
          data['real_interest_amount']!,
          _realInterestAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_realInterestAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {installmentItemId};
  @override
  TransactionInstallmentItemEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionInstallmentItemEntity(
      installmentItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installment_item_id'],
      )!,
      installmentDetailId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installment_detail_id'],
      )!,
      installmentNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installment_number'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_date'],
      )!,
      capitalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}capital_amount'],
      )!,
      realCapitalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}real_capital_amount'],
      )!,
      interestAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interest_amount'],
      )!,
      realInterestAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}real_interest_amount'],
      )!,
    );
  }

  @override
  $TransactionInstallmentItemTable createAlias(String alias) {
    return $TransactionInstallmentItemTable(attachedDatabase, alias);
  }
}

class TransactionInstallmentItemEntity extends DataClass
    implements Insertable<TransactionInstallmentItemEntity> {
  final int installmentItemId;
  final int installmentDetailId;
  final int installmentNumber;
  final int dueDate;
  final int capitalAmount;
  final int realCapitalAmount;
  final int interestAmount;
  final int realInterestAmount;
  const TransactionInstallmentItemEntity({
    required this.installmentItemId,
    required this.installmentDetailId,
    required this.installmentNumber,
    required this.dueDate,
    required this.capitalAmount,
    required this.realCapitalAmount,
    required this.interestAmount,
    required this.realInterestAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['installment_item_id'] = Variable<int>(installmentItemId);
    map['installment_detail_id'] = Variable<int>(installmentDetailId);
    map['installment_number'] = Variable<int>(installmentNumber);
    map['due_date'] = Variable<int>(dueDate);
    map['capital_amount'] = Variable<int>(capitalAmount);
    map['real_capital_amount'] = Variable<int>(realCapitalAmount);
    map['interest_amount'] = Variable<int>(interestAmount);
    map['real_interest_amount'] = Variable<int>(realInterestAmount);
    return map;
  }

  TransactionInstallmentItemCompanion toCompanion(bool nullToAbsent) {
    return TransactionInstallmentItemCompanion(
      installmentItemId: Value(installmentItemId),
      installmentDetailId: Value(installmentDetailId),
      installmentNumber: Value(installmentNumber),
      dueDate: Value(dueDate),
      capitalAmount: Value(capitalAmount),
      realCapitalAmount: Value(realCapitalAmount),
      interestAmount: Value(interestAmount),
      realInterestAmount: Value(realInterestAmount),
    );
  }

  factory TransactionInstallmentItemEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionInstallmentItemEntity(
      installmentItemId: serializer.fromJson<int>(json['installmentItemId']),
      installmentDetailId: serializer.fromJson<int>(
        json['installmentDetailId'],
      ),
      installmentNumber: serializer.fromJson<int>(json['installmentNumber']),
      dueDate: serializer.fromJson<int>(json['dueDate']),
      capitalAmount: serializer.fromJson<int>(json['capitalAmount']),
      realCapitalAmount: serializer.fromJson<int>(json['realCapitalAmount']),
      interestAmount: serializer.fromJson<int>(json['interestAmount']),
      realInterestAmount: serializer.fromJson<int>(json['realInterestAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'installmentItemId': serializer.toJson<int>(installmentItemId),
      'installmentDetailId': serializer.toJson<int>(installmentDetailId),
      'installmentNumber': serializer.toJson<int>(installmentNumber),
      'dueDate': serializer.toJson<int>(dueDate),
      'capitalAmount': serializer.toJson<int>(capitalAmount),
      'realCapitalAmount': serializer.toJson<int>(realCapitalAmount),
      'interestAmount': serializer.toJson<int>(interestAmount),
      'realInterestAmount': serializer.toJson<int>(realInterestAmount),
    };
  }

  TransactionInstallmentItemEntity copyWith({
    int? installmentItemId,
    int? installmentDetailId,
    int? installmentNumber,
    int? dueDate,
    int? capitalAmount,
    int? realCapitalAmount,
    int? interestAmount,
    int? realInterestAmount,
  }) => TransactionInstallmentItemEntity(
    installmentItemId: installmentItemId ?? this.installmentItemId,
    installmentDetailId: installmentDetailId ?? this.installmentDetailId,
    installmentNumber: installmentNumber ?? this.installmentNumber,
    dueDate: dueDate ?? this.dueDate,
    capitalAmount: capitalAmount ?? this.capitalAmount,
    realCapitalAmount: realCapitalAmount ?? this.realCapitalAmount,
    interestAmount: interestAmount ?? this.interestAmount,
    realInterestAmount: realInterestAmount ?? this.realInterestAmount,
  );
  TransactionInstallmentItemEntity copyWithCompanion(
    TransactionInstallmentItemCompanion data,
  ) {
    return TransactionInstallmentItemEntity(
      installmentItemId: data.installmentItemId.present
          ? data.installmentItemId.value
          : this.installmentItemId,
      installmentDetailId: data.installmentDetailId.present
          ? data.installmentDetailId.value
          : this.installmentDetailId,
      installmentNumber: data.installmentNumber.present
          ? data.installmentNumber.value
          : this.installmentNumber,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      capitalAmount: data.capitalAmount.present
          ? data.capitalAmount.value
          : this.capitalAmount,
      realCapitalAmount: data.realCapitalAmount.present
          ? data.realCapitalAmount.value
          : this.realCapitalAmount,
      interestAmount: data.interestAmount.present
          ? data.interestAmount.value
          : this.interestAmount,
      realInterestAmount: data.realInterestAmount.present
          ? data.realInterestAmount.value
          : this.realInterestAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionInstallmentItemEntity(')
          ..write('installmentItemId: $installmentItemId, ')
          ..write('installmentDetailId: $installmentDetailId, ')
          ..write('installmentNumber: $installmentNumber, ')
          ..write('dueDate: $dueDate, ')
          ..write('capitalAmount: $capitalAmount, ')
          ..write('realCapitalAmount: $realCapitalAmount, ')
          ..write('interestAmount: $interestAmount, ')
          ..write('realInterestAmount: $realInterestAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    installmentItemId,
    installmentDetailId,
    installmentNumber,
    dueDate,
    capitalAmount,
    realCapitalAmount,
    interestAmount,
    realInterestAmount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionInstallmentItemEntity &&
          other.installmentItemId == this.installmentItemId &&
          other.installmentDetailId == this.installmentDetailId &&
          other.installmentNumber == this.installmentNumber &&
          other.dueDate == this.dueDate &&
          other.capitalAmount == this.capitalAmount &&
          other.realCapitalAmount == this.realCapitalAmount &&
          other.interestAmount == this.interestAmount &&
          other.realInterestAmount == this.realInterestAmount);
}

class TransactionInstallmentItemCompanion
    extends UpdateCompanion<TransactionInstallmentItemEntity> {
  final Value<int> installmentItemId;
  final Value<int> installmentDetailId;
  final Value<int> installmentNumber;
  final Value<int> dueDate;
  final Value<int> capitalAmount;
  final Value<int> realCapitalAmount;
  final Value<int> interestAmount;
  final Value<int> realInterestAmount;
  const TransactionInstallmentItemCompanion({
    this.installmentItemId = const Value.absent(),
    this.installmentDetailId = const Value.absent(),
    this.installmentNumber = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.capitalAmount = const Value.absent(),
    this.realCapitalAmount = const Value.absent(),
    this.interestAmount = const Value.absent(),
    this.realInterestAmount = const Value.absent(),
  });
  TransactionInstallmentItemCompanion.insert({
    this.installmentItemId = const Value.absent(),
    required int installmentDetailId,
    required int installmentNumber,
    required int dueDate,
    required int capitalAmount,
    required int realCapitalAmount,
    required int interestAmount,
    required int realInterestAmount,
  }) : installmentDetailId = Value(installmentDetailId),
       installmentNumber = Value(installmentNumber),
       dueDate = Value(dueDate),
       capitalAmount = Value(capitalAmount),
       realCapitalAmount = Value(realCapitalAmount),
       interestAmount = Value(interestAmount),
       realInterestAmount = Value(realInterestAmount);
  static Insertable<TransactionInstallmentItemEntity> custom({
    Expression<int>? installmentItemId,
    Expression<int>? installmentDetailId,
    Expression<int>? installmentNumber,
    Expression<int>? dueDate,
    Expression<int>? capitalAmount,
    Expression<int>? realCapitalAmount,
    Expression<int>? interestAmount,
    Expression<int>? realInterestAmount,
  }) {
    return RawValuesInsertable({
      if (installmentItemId != null) 'installment_item_id': installmentItemId,
      if (installmentDetailId != null)
        'installment_detail_id': installmentDetailId,
      if (installmentNumber != null) 'installment_number': installmentNumber,
      if (dueDate != null) 'due_date': dueDate,
      if (capitalAmount != null) 'capital_amount': capitalAmount,
      if (realCapitalAmount != null) 'real_capital_amount': realCapitalAmount,
      if (interestAmount != null) 'interest_amount': interestAmount,
      if (realInterestAmount != null)
        'real_interest_amount': realInterestAmount,
    });
  }

  TransactionInstallmentItemCompanion copyWith({
    Value<int>? installmentItemId,
    Value<int>? installmentDetailId,
    Value<int>? installmentNumber,
    Value<int>? dueDate,
    Value<int>? capitalAmount,
    Value<int>? realCapitalAmount,
    Value<int>? interestAmount,
    Value<int>? realInterestAmount,
  }) {
    return TransactionInstallmentItemCompanion(
      installmentItemId: installmentItemId ?? this.installmentItemId,
      installmentDetailId: installmentDetailId ?? this.installmentDetailId,
      installmentNumber: installmentNumber ?? this.installmentNumber,
      dueDate: dueDate ?? this.dueDate,
      capitalAmount: capitalAmount ?? this.capitalAmount,
      realCapitalAmount: realCapitalAmount ?? this.realCapitalAmount,
      interestAmount: interestAmount ?? this.interestAmount,
      realInterestAmount: realInterestAmount ?? this.realInterestAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (installmentItemId.present) {
      map['installment_item_id'] = Variable<int>(installmentItemId.value);
    }
    if (installmentDetailId.present) {
      map['installment_detail_id'] = Variable<int>(installmentDetailId.value);
    }
    if (installmentNumber.present) {
      map['installment_number'] = Variable<int>(installmentNumber.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<int>(dueDate.value);
    }
    if (capitalAmount.present) {
      map['capital_amount'] = Variable<int>(capitalAmount.value);
    }
    if (realCapitalAmount.present) {
      map['real_capital_amount'] = Variable<int>(realCapitalAmount.value);
    }
    if (interestAmount.present) {
      map['interest_amount'] = Variable<int>(interestAmount.value);
    }
    if (realInterestAmount.present) {
      map['real_interest_amount'] = Variable<int>(realInterestAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionInstallmentItemCompanion(')
          ..write('installmentItemId: $installmentItemId, ')
          ..write('installmentDetailId: $installmentDetailId, ')
          ..write('installmentNumber: $installmentNumber, ')
          ..write('dueDate: $dueDate, ')
          ..write('capitalAmount: $capitalAmount, ')
          ..write('realCapitalAmount: $realCapitalAmount, ')
          ..write('interestAmount: $interestAmount, ')
          ..write('realInterestAmount: $realInterestAmount')
          ..write(')'))
        .toString();
  }
}

class $TransactionReduceTable extends TransactionReduce
    with TableInfo<$TransactionReduceTable, TransactionReduceEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionReduceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _transactionReduceIdMeta =
      const VerificationMeta('transactionReduceId');
  @override
  late final GeneratedColumn<int> transactionReduceId = GeneratedColumn<int>(
    'transaction_reduce_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (transaction_id)',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES category (category_id)',
    ),
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES currency (currency_code)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _realAmountMeta = const VerificationMeta(
    'realAmount',
  );
  @override
  late final GeneratedColumn<int> realAmount = GeneratedColumn<int>(
    'real_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    transactionReduceId,
    transactionId,
    categoryId,
    currencyCode,
    amount,
    realAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_reduce';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionReduceEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('transaction_reduce_id')) {
      context.handle(
        _transactionReduceIdMeta,
        transactionReduceId.isAcceptableOrUnknown(
          data['transaction_reduce_id']!,
          _transactionReduceIdMeta,
        ),
      );
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('real_amount')) {
      context.handle(
        _realAmountMeta,
        realAmount.isAcceptableOrUnknown(data['real_amount']!, _realAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_realAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {transactionReduceId};
  @override
  TransactionReduceEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionReduceEntity(
      transactionReduceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_reduce_id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      realAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}real_amount'],
      )!,
    );
  }

  @override
  $TransactionReduceTable createAlias(String alias) {
    return $TransactionReduceTable(attachedDatabase, alias);
  }
}

class TransactionReduceEntity extends DataClass
    implements Insertable<TransactionReduceEntity> {
  final int transactionReduceId;
  final int transactionId;
  final int categoryId;
  final String currencyCode;
  final int amount;
  final int realAmount;
  const TransactionReduceEntity({
    required this.transactionReduceId,
    required this.transactionId,
    required this.categoryId,
    required this.currencyCode,
    required this.amount,
    required this.realAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['transaction_reduce_id'] = Variable<int>(transactionReduceId);
    map['transaction_id'] = Variable<int>(transactionId);
    map['category_id'] = Variable<int>(categoryId);
    map['currency_code'] = Variable<String>(currencyCode);
    map['amount'] = Variable<int>(amount);
    map['real_amount'] = Variable<int>(realAmount);
    return map;
  }

  TransactionReduceCompanion toCompanion(bool nullToAbsent) {
    return TransactionReduceCompanion(
      transactionReduceId: Value(transactionReduceId),
      transactionId: Value(transactionId),
      categoryId: Value(categoryId),
      currencyCode: Value(currencyCode),
      amount: Value(amount),
      realAmount: Value(realAmount),
    );
  }

  factory TransactionReduceEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionReduceEntity(
      transactionReduceId: serializer.fromJson<int>(
        json['transactionReduceId'],
      ),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      amount: serializer.fromJson<int>(json['amount']),
      realAmount: serializer.fromJson<int>(json['realAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'transactionReduceId': serializer.toJson<int>(transactionReduceId),
      'transactionId': serializer.toJson<int>(transactionId),
      'categoryId': serializer.toJson<int>(categoryId),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'amount': serializer.toJson<int>(amount),
      'realAmount': serializer.toJson<int>(realAmount),
    };
  }

  TransactionReduceEntity copyWith({
    int? transactionReduceId,
    int? transactionId,
    int? categoryId,
    String? currencyCode,
    int? amount,
    int? realAmount,
  }) => TransactionReduceEntity(
    transactionReduceId: transactionReduceId ?? this.transactionReduceId,
    transactionId: transactionId ?? this.transactionId,
    categoryId: categoryId ?? this.categoryId,
    currencyCode: currencyCode ?? this.currencyCode,
    amount: amount ?? this.amount,
    realAmount: realAmount ?? this.realAmount,
  );
  TransactionReduceEntity copyWithCompanion(TransactionReduceCompanion data) {
    return TransactionReduceEntity(
      transactionReduceId: data.transactionReduceId.present
          ? data.transactionReduceId.value
          : this.transactionReduceId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      amount: data.amount.present ? data.amount.value : this.amount,
      realAmount: data.realAmount.present
          ? data.realAmount.value
          : this.realAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionReduceEntity(')
          ..write('transactionReduceId: $transactionReduceId, ')
          ..write('transactionId: $transactionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    transactionReduceId,
    transactionId,
    categoryId,
    currencyCode,
    amount,
    realAmount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionReduceEntity &&
          other.transactionReduceId == this.transactionReduceId &&
          other.transactionId == this.transactionId &&
          other.categoryId == this.categoryId &&
          other.currencyCode == this.currencyCode &&
          other.amount == this.amount &&
          other.realAmount == this.realAmount);
}

class TransactionReduceCompanion
    extends UpdateCompanion<TransactionReduceEntity> {
  final Value<int> transactionReduceId;
  final Value<int> transactionId;
  final Value<int> categoryId;
  final Value<String> currencyCode;
  final Value<int> amount;
  final Value<int> realAmount;
  const TransactionReduceCompanion({
    this.transactionReduceId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.amount = const Value.absent(),
    this.realAmount = const Value.absent(),
  });
  TransactionReduceCompanion.insert({
    this.transactionReduceId = const Value.absent(),
    required int transactionId,
    required int categoryId,
    required String currencyCode,
    required int amount,
    required int realAmount,
  }) : transactionId = Value(transactionId),
       categoryId = Value(categoryId),
       currencyCode = Value(currencyCode),
       amount = Value(amount),
       realAmount = Value(realAmount);
  static Insertable<TransactionReduceEntity> custom({
    Expression<int>? transactionReduceId,
    Expression<int>? transactionId,
    Expression<int>? categoryId,
    Expression<String>? currencyCode,
    Expression<int>? amount,
    Expression<int>? realAmount,
  }) {
    return RawValuesInsertable({
      if (transactionReduceId != null)
        'transaction_reduce_id': transactionReduceId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (categoryId != null) 'category_id': categoryId,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (amount != null) 'amount': amount,
      if (realAmount != null) 'real_amount': realAmount,
    });
  }

  TransactionReduceCompanion copyWith({
    Value<int>? transactionReduceId,
    Value<int>? transactionId,
    Value<int>? categoryId,
    Value<String>? currencyCode,
    Value<int>? amount,
    Value<int>? realAmount,
  }) {
    return TransactionReduceCompanion(
      transactionReduceId: transactionReduceId ?? this.transactionReduceId,
      transactionId: transactionId ?? this.transactionId,
      categoryId: categoryId ?? this.categoryId,
      currencyCode: currencyCode ?? this.currencyCode,
      amount: amount ?? this.amount,
      realAmount: realAmount ?? this.realAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (transactionReduceId.present) {
      map['transaction_reduce_id'] = Variable<int>(transactionReduceId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (realAmount.present) {
      map['real_amount'] = Variable<int>(realAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionReduceCompanion(')
          ..write('transactionReduceId: $transactionReduceId, ')
          ..write('transactionId: $transactionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount')
          ..write(')'))
        .toString();
  }
}

class $TransactionRefundTable extends TransactionRefund
    with TableInfo<$TransactionRefundTable, TransactionRefundEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionRefundTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _transactionRefundIdMeta =
      const VerificationMeta('transactionRefundId');
  @override
  late final GeneratedColumn<int> transactionRefundId = GeneratedColumn<int>(
    'transaction_refund_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (transaction_id)',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES currency (currency_code)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _realAmountMeta = const VerificationMeta(
    'realAmount',
  );
  @override
  late final GeneratedColumn<int> realAmount = GeneratedColumn<int>(
    'real_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    transactionRefundId,
    transactionId,
    accountId,
    currencyCode,
    amount,
    realAmount,
    timestamp,
    createdAt,
    updatedAt,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_refund';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRefundEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('transaction_refund_id')) {
      context.handle(
        _transactionRefundIdMeta,
        transactionRefundId.isAcceptableOrUnknown(
          data['transaction_refund_id']!,
          _transactionRefundIdMeta,
        ),
      );
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('real_amount')) {
      context.handle(
        _realAmountMeta,
        realAmount.isAcceptableOrUnknown(data['real_amount']!, _realAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_realAmountMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {transactionRefundId};
  @override
  TransactionRefundEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRefundEntity(
      transactionRefundId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_refund_id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      realAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}real_amount'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $TransactionRefundTable createAlias(String alias) {
    return $TransactionRefundTable(attachedDatabase, alias);
  }
}

class TransactionRefundEntity extends DataClass
    implements Insertable<TransactionRefundEntity> {
  final int transactionRefundId;
  final int transactionId;
  final int accountId;
  final String currencyCode;
  final int amount;
  final int realAmount;
  final int timestamp;
  final int createdAt;
  final int updatedAt;
  final String note;
  const TransactionRefundEntity({
    required this.transactionRefundId,
    required this.transactionId,
    required this.accountId,
    required this.currencyCode,
    required this.amount,
    required this.realAmount,
    required this.timestamp,
    required this.createdAt,
    required this.updatedAt,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['transaction_refund_id'] = Variable<int>(transactionRefundId);
    map['transaction_id'] = Variable<int>(transactionId);
    map['account_id'] = Variable<int>(accountId);
    map['currency_code'] = Variable<String>(currencyCode);
    map['amount'] = Variable<int>(amount);
    map['real_amount'] = Variable<int>(realAmount);
    map['timestamp'] = Variable<int>(timestamp);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['note'] = Variable<String>(note);
    return map;
  }

  TransactionRefundCompanion toCompanion(bool nullToAbsent) {
    return TransactionRefundCompanion(
      transactionRefundId: Value(transactionRefundId),
      transactionId: Value(transactionId),
      accountId: Value(accountId),
      currencyCode: Value(currencyCode),
      amount: Value(amount),
      realAmount: Value(realAmount),
      timestamp: Value(timestamp),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      note: Value(note),
    );
  }

  factory TransactionRefundEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRefundEntity(
      transactionRefundId: serializer.fromJson<int>(
        json['transactionRefundId'],
      ),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      amount: serializer.fromJson<int>(json['amount']),
      realAmount: serializer.fromJson<int>(json['realAmount']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'transactionRefundId': serializer.toJson<int>(transactionRefundId),
      'transactionId': serializer.toJson<int>(transactionId),
      'accountId': serializer.toJson<int>(accountId),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'amount': serializer.toJson<int>(amount),
      'realAmount': serializer.toJson<int>(realAmount),
      'timestamp': serializer.toJson<int>(timestamp),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'note': serializer.toJson<String>(note),
    };
  }

  TransactionRefundEntity copyWith({
    int? transactionRefundId,
    int? transactionId,
    int? accountId,
    String? currencyCode,
    int? amount,
    int? realAmount,
    int? timestamp,
    int? createdAt,
    int? updatedAt,
    String? note,
  }) => TransactionRefundEntity(
    transactionRefundId: transactionRefundId ?? this.transactionRefundId,
    transactionId: transactionId ?? this.transactionId,
    accountId: accountId ?? this.accountId,
    currencyCode: currencyCode ?? this.currencyCode,
    amount: amount ?? this.amount,
    realAmount: realAmount ?? this.realAmount,
    timestamp: timestamp ?? this.timestamp,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    note: note ?? this.note,
  );
  TransactionRefundEntity copyWithCompanion(TransactionRefundCompanion data) {
    return TransactionRefundEntity(
      transactionRefundId: data.transactionRefundId.present
          ? data.transactionRefundId.value
          : this.transactionRefundId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      amount: data.amount.present ? data.amount.value : this.amount,
      realAmount: data.realAmount.present
          ? data.realAmount.value
          : this.realAmount,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRefundEntity(')
          ..write('transactionRefundId: $transactionRefundId, ')
          ..write('transactionId: $transactionId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    transactionRefundId,
    transactionId,
    accountId,
    currencyCode,
    amount,
    realAmount,
    timestamp,
    createdAt,
    updatedAt,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRefundEntity &&
          other.transactionRefundId == this.transactionRefundId &&
          other.transactionId == this.transactionId &&
          other.accountId == this.accountId &&
          other.currencyCode == this.currencyCode &&
          other.amount == this.amount &&
          other.realAmount == this.realAmount &&
          other.timestamp == this.timestamp &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.note == this.note);
}

class TransactionRefundCompanion
    extends UpdateCompanion<TransactionRefundEntity> {
  final Value<int> transactionRefundId;
  final Value<int> transactionId;
  final Value<int> accountId;
  final Value<String> currencyCode;
  final Value<int> amount;
  final Value<int> realAmount;
  final Value<int> timestamp;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String> note;
  const TransactionRefundCompanion({
    this.transactionRefundId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.amount = const Value.absent(),
    this.realAmount = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.note = const Value.absent(),
  });
  TransactionRefundCompanion.insert({
    this.transactionRefundId = const Value.absent(),
    required int transactionId,
    required int accountId,
    required String currencyCode,
    required int amount,
    required int realAmount,
    required int timestamp,
    required int createdAt,
    required int updatedAt,
    this.note = const Value.absent(),
  }) : transactionId = Value(transactionId),
       accountId = Value(accountId),
       currencyCode = Value(currencyCode),
       amount = Value(amount),
       realAmount = Value(realAmount),
       timestamp = Value(timestamp),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TransactionRefundEntity> custom({
    Expression<int>? transactionRefundId,
    Expression<int>? transactionId,
    Expression<int>? accountId,
    Expression<String>? currencyCode,
    Expression<int>? amount,
    Expression<int>? realAmount,
    Expression<int>? timestamp,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (transactionRefundId != null)
        'transaction_refund_id': transactionRefundId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (accountId != null) 'account_id': accountId,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (amount != null) 'amount': amount,
      if (realAmount != null) 'real_amount': realAmount,
      if (timestamp != null) 'timestamp': timestamp,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (note != null) 'note': note,
    });
  }

  TransactionRefundCompanion copyWith({
    Value<int>? transactionRefundId,
    Value<int>? transactionId,
    Value<int>? accountId,
    Value<String>? currencyCode,
    Value<int>? amount,
    Value<int>? realAmount,
    Value<int>? timestamp,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String>? note,
  }) {
    return TransactionRefundCompanion(
      transactionRefundId: transactionRefundId ?? this.transactionRefundId,
      transactionId: transactionId ?? this.transactionId,
      accountId: accountId ?? this.accountId,
      currencyCode: currencyCode ?? this.currencyCode,
      amount: amount ?? this.amount,
      realAmount: realAmount ?? this.realAmount,
      timestamp: timestamp ?? this.timestamp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (transactionRefundId.present) {
      map['transaction_refund_id'] = Variable<int>(transactionRefundId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (realAmount.present) {
      map['real_amount'] = Variable<int>(realAmount.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRefundCompanion(')
          ..write('transactionRefundId: $transactionRefundId, ')
          ..write('transactionId: $transactionId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $RelationProjectTransactionTable extends RelationProjectTransaction
    with
        TableInfo<
          $RelationProjectTransactionTable,
          TransactionProjectRelationEntity
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationProjectTransactionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (transaction_id)',
    ),
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES project (project_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [transactionId, projectId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relation_project_transaction';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionProjectRelationEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {transactionId, projectId};
  @override
  TransactionProjectRelationEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionProjectRelationEntity(
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}project_id'],
      )!,
    );
  }

  @override
  $RelationProjectTransactionTable createAlias(String alias) {
    return $RelationProjectTransactionTable(attachedDatabase, alias);
  }
}

class TransactionProjectRelationEntity extends DataClass
    implements Insertable<TransactionProjectRelationEntity> {
  final int transactionId;
  final int projectId;
  const TransactionProjectRelationEntity({
    required this.transactionId,
    required this.projectId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['transaction_id'] = Variable<int>(transactionId);
    map['project_id'] = Variable<int>(projectId);
    return map;
  }

  RelationProjectTransactionCompanion toCompanion(bool nullToAbsent) {
    return RelationProjectTransactionCompanion(
      transactionId: Value(transactionId),
      projectId: Value(projectId),
    );
  }

  factory TransactionProjectRelationEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionProjectRelationEntity(
      transactionId: serializer.fromJson<int>(json['transactionId']),
      projectId: serializer.fromJson<int>(json['projectId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'transactionId': serializer.toJson<int>(transactionId),
      'projectId': serializer.toJson<int>(projectId),
    };
  }

  TransactionProjectRelationEntity copyWith({
    int? transactionId,
    int? projectId,
  }) => TransactionProjectRelationEntity(
    transactionId: transactionId ?? this.transactionId,
    projectId: projectId ?? this.projectId,
  );
  TransactionProjectRelationEntity copyWithCompanion(
    RelationProjectTransactionCompanion data,
  ) {
    return TransactionProjectRelationEntity(
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionProjectRelationEntity(')
          ..write('transactionId: $transactionId, ')
          ..write('projectId: $projectId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(transactionId, projectId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionProjectRelationEntity &&
          other.transactionId == this.transactionId &&
          other.projectId == this.projectId);
}

class RelationProjectTransactionCompanion
    extends UpdateCompanion<TransactionProjectRelationEntity> {
  final Value<int> transactionId;
  final Value<int> projectId;
  final Value<int> rowid;
  const RelationProjectTransactionCompanion({
    this.transactionId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationProjectTransactionCompanion.insert({
    required int transactionId,
    required int projectId,
    this.rowid = const Value.absent(),
  }) : transactionId = Value(transactionId),
       projectId = Value(projectId);
  static Insertable<TransactionProjectRelationEntity> custom({
    Expression<int>? transactionId,
    Expression<int>? projectId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (transactionId != null) 'transaction_id': transactionId,
      if (projectId != null) 'project_id': projectId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationProjectTransactionCompanion copyWith({
    Value<int>? transactionId,
    Value<int>? projectId,
    Value<int>? rowid,
  }) {
    return RelationProjectTransactionCompanion(
      transactionId: transactionId ?? this.transactionId,
      projectId: projectId ?? this.projectId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationProjectTransactionCompanion(')
          ..write('transactionId: $transactionId, ')
          ..write('projectId: $projectId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RelationTransactionTable extends RelationTransaction
    with TableInfo<$RelationTransactionTable, TransactionRelationEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationTransactionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _targetTransactionIdMeta =
      const VerificationMeta('targetTransactionId');
  @override
  late final GeneratedColumn<int> targetTransactionId = GeneratedColumn<int>(
    'target_transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (transaction_id)',
    ),
  );
  static const VerificationMeta _sourceTransactionIdMeta =
      const VerificationMeta('sourceTransactionId');
  @override
  late final GeneratedColumn<int> sourceTransactionId = GeneratedColumn<int>(
    'source_transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (transaction_id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TransactionRelationType, String>
  type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TransactionRelationType>(
        $RelationTransactionTable.$convertertype,
      );
  @override
  List<GeneratedColumn> get $columns => [
    targetTransactionId,
    sourceTransactionId,
    type,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relation_transaction';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRelationEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('target_transaction_id')) {
      context.handle(
        _targetTransactionIdMeta,
        targetTransactionId.isAcceptableOrUnknown(
          data['target_transaction_id']!,
          _targetTransactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetTransactionIdMeta);
    }
    if (data.containsKey('source_transaction_id')) {
      context.handle(
        _sourceTransactionIdMeta,
        sourceTransactionId.isAcceptableOrUnknown(
          data['source_transaction_id']!,
          _sourceTransactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sourceTransactionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    targetTransactionId,
    sourceTransactionId,
  };
  @override
  TransactionRelationEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRelationEntity(
      targetTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_transaction_id'],
      )!,
      sourceTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_transaction_id'],
      )!,
      type: $RelationTransactionTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
    );
  }

  @override
  $RelationTransactionTable createAlias(String alias) {
    return $RelationTransactionTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionRelationType, String, String>
  $convertertype = const EnumNameConverter<TransactionRelationType>(
    TransactionRelationType.values,
  );
}

class TransactionRelationEntity extends DataClass
    implements Insertable<TransactionRelationEntity> {
  final int targetTransactionId;
  final int sourceTransactionId;
  final TransactionRelationType type;
  const TransactionRelationEntity({
    required this.targetTransactionId,
    required this.sourceTransactionId,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['target_transaction_id'] = Variable<int>(targetTransactionId);
    map['source_transaction_id'] = Variable<int>(sourceTransactionId);
    {
      map['type'] = Variable<String>(
        $RelationTransactionTable.$convertertype.toSql(type),
      );
    }
    return map;
  }

  RelationTransactionCompanion toCompanion(bool nullToAbsent) {
    return RelationTransactionCompanion(
      targetTransactionId: Value(targetTransactionId),
      sourceTransactionId: Value(sourceTransactionId),
      type: Value(type),
    );
  }

  factory TransactionRelationEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRelationEntity(
      targetTransactionId: serializer.fromJson<int>(
        json['targetTransactionId'],
      ),
      sourceTransactionId: serializer.fromJson<int>(
        json['sourceTransactionId'],
      ),
      type: $RelationTransactionTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'targetTransactionId': serializer.toJson<int>(targetTransactionId),
      'sourceTransactionId': serializer.toJson<int>(sourceTransactionId),
      'type': serializer.toJson<String>(
        $RelationTransactionTable.$convertertype.toJson(type),
      ),
    };
  }

  TransactionRelationEntity copyWith({
    int? targetTransactionId,
    int? sourceTransactionId,
    TransactionRelationType? type,
  }) => TransactionRelationEntity(
    targetTransactionId: targetTransactionId ?? this.targetTransactionId,
    sourceTransactionId: sourceTransactionId ?? this.sourceTransactionId,
    type: type ?? this.type,
  );
  TransactionRelationEntity copyWithCompanion(
    RelationTransactionCompanion data,
  ) {
    return TransactionRelationEntity(
      targetTransactionId: data.targetTransactionId.present
          ? data.targetTransactionId.value
          : this.targetTransactionId,
      sourceTransactionId: data.sourceTransactionId.present
          ? data.sourceTransactionId.value
          : this.sourceTransactionId,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRelationEntity(')
          ..write('targetTransactionId: $targetTransactionId, ')
          ..write('sourceTransactionId: $sourceTransactionId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(targetTransactionId, sourceTransactionId, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRelationEntity &&
          other.targetTransactionId == this.targetTransactionId &&
          other.sourceTransactionId == this.sourceTransactionId &&
          other.type == this.type);
}

class RelationTransactionCompanion
    extends UpdateCompanion<TransactionRelationEntity> {
  final Value<int> targetTransactionId;
  final Value<int> sourceTransactionId;
  final Value<TransactionRelationType> type;
  final Value<int> rowid;
  const RelationTransactionCompanion({
    this.targetTransactionId = const Value.absent(),
    this.sourceTransactionId = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationTransactionCompanion.insert({
    required int targetTransactionId,
    required int sourceTransactionId,
    required TransactionRelationType type,
    this.rowid = const Value.absent(),
  }) : targetTransactionId = Value(targetTransactionId),
       sourceTransactionId = Value(sourceTransactionId),
       type = Value(type);
  static Insertable<TransactionRelationEntity> custom({
    Expression<int>? targetTransactionId,
    Expression<int>? sourceTransactionId,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (targetTransactionId != null)
        'target_transaction_id': targetTransactionId,
      if (sourceTransactionId != null)
        'source_transaction_id': sourceTransactionId,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationTransactionCompanion copyWith({
    Value<int>? targetTransactionId,
    Value<int>? sourceTransactionId,
    Value<TransactionRelationType>? type,
    Value<int>? rowid,
  }) {
    return RelationTransactionCompanion(
      targetTransactionId: targetTransactionId ?? this.targetTransactionId,
      sourceTransactionId: sourceTransactionId ?? this.sourceTransactionId,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (targetTransactionId.present) {
      map['target_transaction_id'] = Variable<int>(targetTransactionId.value);
    }
    if (sourceTransactionId.present) {
      map['source_transaction_id'] = Variable<int>(sourceTransactionId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $RelationTransactionTable.$convertertype.toSql(type.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationTransactionCompanion(')
          ..write('targetTransactionId: $targetTransactionId, ')
          ..write('sourceTransactionId: $sourceTransactionId, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReimbursementTable extends Reimbursement
    with TableInfo<$ReimbursementTable, ReimbursementEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReimbursementTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _reimbursementIdMeta = const VerificationMeta(
    'reimbursementId',
  );
  @override
  late final GeneratedColumn<int> reimbursementId = GeneratedColumn<int>(
    'reimbursement_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (transaction_id)',
    ),
  );
  static const VerificationMeta _archivedMeta = const VerificationMeta(
    'archived',
  );
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
    'archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    reimbursementId,
    transactionId,
    archived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reimbursement';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReimbursementEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('reimbursement_id')) {
      context.handle(
        _reimbursementIdMeta,
        reimbursementId.isAcceptableOrUnknown(
          data['reimbursement_id']!,
          _reimbursementIdMeta,
        ),
      );
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('archived')) {
      context.handle(
        _archivedMeta,
        archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reimbursementId};
  @override
  ReimbursementEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReimbursementEntity(
      reimbursementId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reimbursement_id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      archived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ReimbursementTable createAlias(String alias) {
    return $ReimbursementTable(attachedDatabase, alias);
  }
}

class ReimbursementEntity extends DataClass
    implements Insertable<ReimbursementEntity> {
  final int reimbursementId;
  final int transactionId;
  final bool archived;
  final int createdAt;
  final int updatedAt;
  const ReimbursementEntity({
    required this.reimbursementId,
    required this.transactionId,
    required this.archived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['reimbursement_id'] = Variable<int>(reimbursementId);
    map['transaction_id'] = Variable<int>(transactionId);
    map['archived'] = Variable<bool>(archived);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  ReimbursementCompanion toCompanion(bool nullToAbsent) {
    return ReimbursementCompanion(
      reimbursementId: Value(reimbursementId),
      transactionId: Value(transactionId),
      archived: Value(archived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ReimbursementEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReimbursementEntity(
      reimbursementId: serializer.fromJson<int>(json['reimbursementId']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      archived: serializer.fromJson<bool>(json['archived']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reimbursementId': serializer.toJson<int>(reimbursementId),
      'transactionId': serializer.toJson<int>(transactionId),
      'archived': serializer.toJson<bool>(archived),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  ReimbursementEntity copyWith({
    int? reimbursementId,
    int? transactionId,
    bool? archived,
    int? createdAt,
    int? updatedAt,
  }) => ReimbursementEntity(
    reimbursementId: reimbursementId ?? this.reimbursementId,
    transactionId: transactionId ?? this.transactionId,
    archived: archived ?? this.archived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ReimbursementEntity copyWithCompanion(ReimbursementCompanion data) {
    return ReimbursementEntity(
      reimbursementId: data.reimbursementId.present
          ? data.reimbursementId.value
          : this.reimbursementId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      archived: data.archived.present ? data.archived.value : this.archived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementEntity(')
          ..write('reimbursementId: $reimbursementId, ')
          ..write('transactionId: $transactionId, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    reimbursementId,
    transactionId,
    archived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReimbursementEntity &&
          other.reimbursementId == this.reimbursementId &&
          other.transactionId == this.transactionId &&
          other.archived == this.archived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ReimbursementCompanion extends UpdateCompanion<ReimbursementEntity> {
  final Value<int> reimbursementId;
  final Value<int> transactionId;
  final Value<bool> archived;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const ReimbursementCompanion({
    this.reimbursementId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ReimbursementCompanion.insert({
    this.reimbursementId = const Value.absent(),
    required int transactionId,
    this.archived = const Value.absent(),
    required int createdAt,
    required int updatedAt,
  }) : transactionId = Value(transactionId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ReimbursementEntity> custom({
    Expression<int>? reimbursementId,
    Expression<int>? transactionId,
    Expression<bool>? archived,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (reimbursementId != null) 'reimbursement_id': reimbursementId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (archived != null) 'archived': archived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ReimbursementCompanion copyWith({
    Value<int>? reimbursementId,
    Value<int>? transactionId,
    Value<bool>? archived,
    Value<int>? createdAt,
    Value<int>? updatedAt,
  }) {
    return ReimbursementCompanion(
      reimbursementId: reimbursementId ?? this.reimbursementId,
      transactionId: transactionId ?? this.transactionId,
      archived: archived ?? this.archived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (reimbursementId.present) {
      map['reimbursement_id'] = Variable<int>(reimbursementId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementCompanion(')
          ..write('reimbursementId: $reimbursementId, ')
          ..write('transactionId: $transactionId, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ReimbursementExpectationTable extends ReimbursementExpectation
    with
        TableInfo<
          $ReimbursementExpectationTable,
          ReimbursementExpectationEntity
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReimbursementExpectationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _reimbursementExpectationIdMeta =
      const VerificationMeta('reimbursementExpectationId');
  @override
  late final GeneratedColumn<int> reimbursementExpectationId =
      GeneratedColumn<int>(
        'reimbursement_expectation_id',
        aliasedName,
        false,
        hasAutoIncrement: true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'PRIMARY KEY AUTOINCREMENT',
        ),
      );
  static const VerificationMeta _reimbursementIdMeta = const VerificationMeta(
    'reimbursementId',
  );
  @override
  late final GeneratedColumn<int> reimbursementId = GeneratedColumn<int>(
    'reimbursement_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reimbursement (reimbursement_id)',
    ),
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES currency (currency_code)',
    ),
  );
  static const VerificationMeta _stakeholderIdMeta = const VerificationMeta(
    'stakeholderId',
  );
  @override
  late final GeneratedColumn<int> stakeholderId = GeneratedColumn<int>(
    'stakeholder_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stakeholder (stakeholder_id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _realAmountMeta = const VerificationMeta(
    'realAmount',
  );
  @override
  late final GeneratedColumn<int> realAmount = GeneratedColumn<int>(
    'real_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    reimbursementExpectationId,
    reimbursementId,
    currencyCode,
    stakeholderId,
    amount,
    realAmount,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reimbursement_expectation';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReimbursementExpectationEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('reimbursement_expectation_id')) {
      context.handle(
        _reimbursementExpectationIdMeta,
        reimbursementExpectationId.isAcceptableOrUnknown(
          data['reimbursement_expectation_id']!,
          _reimbursementExpectationIdMeta,
        ),
      );
    }
    if (data.containsKey('reimbursement_id')) {
      context.handle(
        _reimbursementIdMeta,
        reimbursementId.isAcceptableOrUnknown(
          data['reimbursement_id']!,
          _reimbursementIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reimbursementIdMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('stakeholder_id')) {
      context.handle(
        _stakeholderIdMeta,
        stakeholderId.isAcceptableOrUnknown(
          data['stakeholder_id']!,
          _stakeholderIdMeta,
        ),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('real_amount')) {
      context.handle(
        _realAmountMeta,
        realAmount.isAcceptableOrUnknown(data['real_amount']!, _realAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_realAmountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reimbursementExpectationId};
  @override
  ReimbursementExpectationEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReimbursementExpectationEntity(
      reimbursementExpectationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reimbursement_expectation_id'],
      )!,
      reimbursementId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reimbursement_id'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      stakeholderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stakeholder_id'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      realAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}real_amount'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $ReimbursementExpectationTable createAlias(String alias) {
    return $ReimbursementExpectationTable(attachedDatabase, alias);
  }
}

class ReimbursementExpectationEntity extends DataClass
    implements Insertable<ReimbursementExpectationEntity> {
  final int reimbursementExpectationId;
  final int reimbursementId;
  final String currencyCode;
  final int? stakeholderId;
  final int amount;
  final int realAmount;
  final String note;
  const ReimbursementExpectationEntity({
    required this.reimbursementExpectationId,
    required this.reimbursementId,
    required this.currencyCode,
    this.stakeholderId,
    required this.amount,
    required this.realAmount,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['reimbursement_expectation_id'] = Variable<int>(
      reimbursementExpectationId,
    );
    map['reimbursement_id'] = Variable<int>(reimbursementId);
    map['currency_code'] = Variable<String>(currencyCode);
    if (!nullToAbsent || stakeholderId != null) {
      map['stakeholder_id'] = Variable<int>(stakeholderId);
    }
    map['amount'] = Variable<int>(amount);
    map['real_amount'] = Variable<int>(realAmount);
    map['note'] = Variable<String>(note);
    return map;
  }

  ReimbursementExpectationCompanion toCompanion(bool nullToAbsent) {
    return ReimbursementExpectationCompanion(
      reimbursementExpectationId: Value(reimbursementExpectationId),
      reimbursementId: Value(reimbursementId),
      currencyCode: Value(currencyCode),
      stakeholderId: stakeholderId == null && nullToAbsent
          ? const Value.absent()
          : Value(stakeholderId),
      amount: Value(amount),
      realAmount: Value(realAmount),
      note: Value(note),
    );
  }

  factory ReimbursementExpectationEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReimbursementExpectationEntity(
      reimbursementExpectationId: serializer.fromJson<int>(
        json['reimbursementExpectationId'],
      ),
      reimbursementId: serializer.fromJson<int>(json['reimbursementId']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      stakeholderId: serializer.fromJson<int?>(json['stakeholderId']),
      amount: serializer.fromJson<int>(json['amount']),
      realAmount: serializer.fromJson<int>(json['realAmount']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reimbursementExpectationId': serializer.toJson<int>(
        reimbursementExpectationId,
      ),
      'reimbursementId': serializer.toJson<int>(reimbursementId),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'stakeholderId': serializer.toJson<int?>(stakeholderId),
      'amount': serializer.toJson<int>(amount),
      'realAmount': serializer.toJson<int>(realAmount),
      'note': serializer.toJson<String>(note),
    };
  }

  ReimbursementExpectationEntity copyWith({
    int? reimbursementExpectationId,
    int? reimbursementId,
    String? currencyCode,
    Value<int?> stakeholderId = const Value.absent(),
    int? amount,
    int? realAmount,
    String? note,
  }) => ReimbursementExpectationEntity(
    reimbursementExpectationId:
        reimbursementExpectationId ?? this.reimbursementExpectationId,
    reimbursementId: reimbursementId ?? this.reimbursementId,
    currencyCode: currencyCode ?? this.currencyCode,
    stakeholderId: stakeholderId.present
        ? stakeholderId.value
        : this.stakeholderId,
    amount: amount ?? this.amount,
    realAmount: realAmount ?? this.realAmount,
    note: note ?? this.note,
  );
  ReimbursementExpectationEntity copyWithCompanion(
    ReimbursementExpectationCompanion data,
  ) {
    return ReimbursementExpectationEntity(
      reimbursementExpectationId: data.reimbursementExpectationId.present
          ? data.reimbursementExpectationId.value
          : this.reimbursementExpectationId,
      reimbursementId: data.reimbursementId.present
          ? data.reimbursementId.value
          : this.reimbursementId,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      stakeholderId: data.stakeholderId.present
          ? data.stakeholderId.value
          : this.stakeholderId,
      amount: data.amount.present ? data.amount.value : this.amount,
      realAmount: data.realAmount.present
          ? data.realAmount.value
          : this.realAmount,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementExpectationEntity(')
          ..write('reimbursementExpectationId: $reimbursementExpectationId, ')
          ..write('reimbursementId: $reimbursementId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    reimbursementExpectationId,
    reimbursementId,
    currencyCode,
    stakeholderId,
    amount,
    realAmount,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReimbursementExpectationEntity &&
          other.reimbursementExpectationId == this.reimbursementExpectationId &&
          other.reimbursementId == this.reimbursementId &&
          other.currencyCode == this.currencyCode &&
          other.stakeholderId == this.stakeholderId &&
          other.amount == this.amount &&
          other.realAmount == this.realAmount &&
          other.note == this.note);
}

class ReimbursementExpectationCompanion
    extends UpdateCompanion<ReimbursementExpectationEntity> {
  final Value<int> reimbursementExpectationId;
  final Value<int> reimbursementId;
  final Value<String> currencyCode;
  final Value<int?> stakeholderId;
  final Value<int> amount;
  final Value<int> realAmount;
  final Value<String> note;
  const ReimbursementExpectationCompanion({
    this.reimbursementExpectationId = const Value.absent(),
    this.reimbursementId = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.stakeholderId = const Value.absent(),
    this.amount = const Value.absent(),
    this.realAmount = const Value.absent(),
    this.note = const Value.absent(),
  });
  ReimbursementExpectationCompanion.insert({
    this.reimbursementExpectationId = const Value.absent(),
    required int reimbursementId,
    required String currencyCode,
    this.stakeholderId = const Value.absent(),
    required int amount,
    required int realAmount,
    this.note = const Value.absent(),
  }) : reimbursementId = Value(reimbursementId),
       currencyCode = Value(currencyCode),
       amount = Value(amount),
       realAmount = Value(realAmount);
  static Insertable<ReimbursementExpectationEntity> custom({
    Expression<int>? reimbursementExpectationId,
    Expression<int>? reimbursementId,
    Expression<String>? currencyCode,
    Expression<int>? stakeholderId,
    Expression<int>? amount,
    Expression<int>? realAmount,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (reimbursementExpectationId != null)
        'reimbursement_expectation_id': reimbursementExpectationId,
      if (reimbursementId != null) 'reimbursement_id': reimbursementId,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (stakeholderId != null) 'stakeholder_id': stakeholderId,
      if (amount != null) 'amount': amount,
      if (realAmount != null) 'real_amount': realAmount,
      if (note != null) 'note': note,
    });
  }

  ReimbursementExpectationCompanion copyWith({
    Value<int>? reimbursementExpectationId,
    Value<int>? reimbursementId,
    Value<String>? currencyCode,
    Value<int?>? stakeholderId,
    Value<int>? amount,
    Value<int>? realAmount,
    Value<String>? note,
  }) {
    return ReimbursementExpectationCompanion(
      reimbursementExpectationId:
          reimbursementExpectationId ?? this.reimbursementExpectationId,
      reimbursementId: reimbursementId ?? this.reimbursementId,
      currencyCode: currencyCode ?? this.currencyCode,
      stakeholderId: stakeholderId ?? this.stakeholderId,
      amount: amount ?? this.amount,
      realAmount: realAmount ?? this.realAmount,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (reimbursementExpectationId.present) {
      map['reimbursement_expectation_id'] = Variable<int>(
        reimbursementExpectationId.value,
      );
    }
    if (reimbursementId.present) {
      map['reimbursement_id'] = Variable<int>(reimbursementId.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (stakeholderId.present) {
      map['stakeholder_id'] = Variable<int>(stakeholderId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (realAmount.present) {
      map['real_amount'] = Variable<int>(realAmount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementExpectationCompanion(')
          ..write('reimbursementExpectationId: $reimbursementExpectationId, ')
          ..write('reimbursementId: $reimbursementId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $ReimbursementActualTable extends ReimbursementActual
    with TableInfo<$ReimbursementActualTable, ReimbursementActualEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReimbursementActualTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _reimbursementActualIdMeta =
      const VerificationMeta('reimbursementActualId');
  @override
  late final GeneratedColumn<int> reimbursementActualId = GeneratedColumn<int>(
    'reimbursement_actual_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _reimbursementIdMeta = const VerificationMeta(
    'reimbursementId',
  );
  @override
  late final GeneratedColumn<int> reimbursementId = GeneratedColumn<int>(
    'reimbursement_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reimbursement (reimbursement_id)',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (account_id)',
    ),
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES currency (currency_code)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _realAmountMeta = const VerificationMeta(
    'realAmount',
  );
  @override
  late final GeneratedColumn<int> realAmount = GeneratedColumn<int>(
    'real_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    reimbursementActualId,
    reimbursementId,
    accountId,
    currencyCode,
    amount,
    realAmount,
    timestamp,
    createdAt,
    updatedAt,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reimbursement_actual';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReimbursementActualEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('reimbursement_actual_id')) {
      context.handle(
        _reimbursementActualIdMeta,
        reimbursementActualId.isAcceptableOrUnknown(
          data['reimbursement_actual_id']!,
          _reimbursementActualIdMeta,
        ),
      );
    }
    if (data.containsKey('reimbursement_id')) {
      context.handle(
        _reimbursementIdMeta,
        reimbursementId.isAcceptableOrUnknown(
          data['reimbursement_id']!,
          _reimbursementIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reimbursementIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('real_amount')) {
      context.handle(
        _realAmountMeta,
        realAmount.isAcceptableOrUnknown(data['real_amount']!, _realAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_realAmountMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reimbursementActualId};
  @override
  ReimbursementActualEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReimbursementActualEntity(
      reimbursementActualId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reimbursement_actual_id'],
      )!,
      reimbursementId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reimbursement_id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      realAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}real_amount'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $ReimbursementActualTable createAlias(String alias) {
    return $ReimbursementActualTable(attachedDatabase, alias);
  }
}

class ReimbursementActualEntity extends DataClass
    implements Insertable<ReimbursementActualEntity> {
  final int reimbursementActualId;
  final int reimbursementId;
  final int accountId;
  final String currencyCode;
  final int amount;
  final int realAmount;
  final int timestamp;
  final int createdAt;
  final int updatedAt;
  final String note;
  const ReimbursementActualEntity({
    required this.reimbursementActualId,
    required this.reimbursementId,
    required this.accountId,
    required this.currencyCode,
    required this.amount,
    required this.realAmount,
    required this.timestamp,
    required this.createdAt,
    required this.updatedAt,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['reimbursement_actual_id'] = Variable<int>(reimbursementActualId);
    map['reimbursement_id'] = Variable<int>(reimbursementId);
    map['account_id'] = Variable<int>(accountId);
    map['currency_code'] = Variable<String>(currencyCode);
    map['amount'] = Variable<int>(amount);
    map['real_amount'] = Variable<int>(realAmount);
    map['timestamp'] = Variable<int>(timestamp);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['note'] = Variable<String>(note);
    return map;
  }

  ReimbursementActualCompanion toCompanion(bool nullToAbsent) {
    return ReimbursementActualCompanion(
      reimbursementActualId: Value(reimbursementActualId),
      reimbursementId: Value(reimbursementId),
      accountId: Value(accountId),
      currencyCode: Value(currencyCode),
      amount: Value(amount),
      realAmount: Value(realAmount),
      timestamp: Value(timestamp),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      note: Value(note),
    );
  }

  factory ReimbursementActualEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReimbursementActualEntity(
      reimbursementActualId: serializer.fromJson<int>(
        json['reimbursementActualId'],
      ),
      reimbursementId: serializer.fromJson<int>(json['reimbursementId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      amount: serializer.fromJson<int>(json['amount']),
      realAmount: serializer.fromJson<int>(json['realAmount']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reimbursementActualId': serializer.toJson<int>(reimbursementActualId),
      'reimbursementId': serializer.toJson<int>(reimbursementId),
      'accountId': serializer.toJson<int>(accountId),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'amount': serializer.toJson<int>(amount),
      'realAmount': serializer.toJson<int>(realAmount),
      'timestamp': serializer.toJson<int>(timestamp),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'note': serializer.toJson<String>(note),
    };
  }

  ReimbursementActualEntity copyWith({
    int? reimbursementActualId,
    int? reimbursementId,
    int? accountId,
    String? currencyCode,
    int? amount,
    int? realAmount,
    int? timestamp,
    int? createdAt,
    int? updatedAt,
    String? note,
  }) => ReimbursementActualEntity(
    reimbursementActualId: reimbursementActualId ?? this.reimbursementActualId,
    reimbursementId: reimbursementId ?? this.reimbursementId,
    accountId: accountId ?? this.accountId,
    currencyCode: currencyCode ?? this.currencyCode,
    amount: amount ?? this.amount,
    realAmount: realAmount ?? this.realAmount,
    timestamp: timestamp ?? this.timestamp,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    note: note ?? this.note,
  );
  ReimbursementActualEntity copyWithCompanion(
    ReimbursementActualCompanion data,
  ) {
    return ReimbursementActualEntity(
      reimbursementActualId: data.reimbursementActualId.present
          ? data.reimbursementActualId.value
          : this.reimbursementActualId,
      reimbursementId: data.reimbursementId.present
          ? data.reimbursementId.value
          : this.reimbursementId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      amount: data.amount.present ? data.amount.value : this.amount,
      realAmount: data.realAmount.present
          ? data.realAmount.value
          : this.realAmount,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementActualEntity(')
          ..write('reimbursementActualId: $reimbursementActualId, ')
          ..write('reimbursementId: $reimbursementId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    reimbursementActualId,
    reimbursementId,
    accountId,
    currencyCode,
    amount,
    realAmount,
    timestamp,
    createdAt,
    updatedAt,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReimbursementActualEntity &&
          other.reimbursementActualId == this.reimbursementActualId &&
          other.reimbursementId == this.reimbursementId &&
          other.accountId == this.accountId &&
          other.currencyCode == this.currencyCode &&
          other.amount == this.amount &&
          other.realAmount == this.realAmount &&
          other.timestamp == this.timestamp &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.note == this.note);
}

class ReimbursementActualCompanion
    extends UpdateCompanion<ReimbursementActualEntity> {
  final Value<int> reimbursementActualId;
  final Value<int> reimbursementId;
  final Value<int> accountId;
  final Value<String> currencyCode;
  final Value<int> amount;
  final Value<int> realAmount;
  final Value<int> timestamp;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String> note;
  const ReimbursementActualCompanion({
    this.reimbursementActualId = const Value.absent(),
    this.reimbursementId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.amount = const Value.absent(),
    this.realAmount = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.note = const Value.absent(),
  });
  ReimbursementActualCompanion.insert({
    this.reimbursementActualId = const Value.absent(),
    required int reimbursementId,
    required int accountId,
    required String currencyCode,
    required int amount,
    required int realAmount,
    required int timestamp,
    required int createdAt,
    required int updatedAt,
    this.note = const Value.absent(),
  }) : reimbursementId = Value(reimbursementId),
       accountId = Value(accountId),
       currencyCode = Value(currencyCode),
       amount = Value(amount),
       realAmount = Value(realAmount),
       timestamp = Value(timestamp),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ReimbursementActualEntity> custom({
    Expression<int>? reimbursementActualId,
    Expression<int>? reimbursementId,
    Expression<int>? accountId,
    Expression<String>? currencyCode,
    Expression<int>? amount,
    Expression<int>? realAmount,
    Expression<int>? timestamp,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (reimbursementActualId != null)
        'reimbursement_actual_id': reimbursementActualId,
      if (reimbursementId != null) 'reimbursement_id': reimbursementId,
      if (accountId != null) 'account_id': accountId,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (amount != null) 'amount': amount,
      if (realAmount != null) 'real_amount': realAmount,
      if (timestamp != null) 'timestamp': timestamp,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (note != null) 'note': note,
    });
  }

  ReimbursementActualCompanion copyWith({
    Value<int>? reimbursementActualId,
    Value<int>? reimbursementId,
    Value<int>? accountId,
    Value<String>? currencyCode,
    Value<int>? amount,
    Value<int>? realAmount,
    Value<int>? timestamp,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String>? note,
  }) {
    return ReimbursementActualCompanion(
      reimbursementActualId:
          reimbursementActualId ?? this.reimbursementActualId,
      reimbursementId: reimbursementId ?? this.reimbursementId,
      accountId: accountId ?? this.accountId,
      currencyCode: currencyCode ?? this.currencyCode,
      amount: amount ?? this.amount,
      realAmount: realAmount ?? this.realAmount,
      timestamp: timestamp ?? this.timestamp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (reimbursementActualId.present) {
      map['reimbursement_actual_id'] = Variable<int>(
        reimbursementActualId.value,
      );
    }
    if (reimbursementId.present) {
      map['reimbursement_id'] = Variable<int>(reimbursementId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (realAmount.present) {
      map['real_amount'] = Variable<int>(realAmount.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementActualCompanion(')
          ..write('reimbursementActualId: $reimbursementActualId, ')
          ..write('reimbursementId: $reimbursementId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('amount: $amount, ')
          ..write('realAmount: $realAmount, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CurrencyTable currency = $CurrencyTable(this);
  late final $AccountTable account = $AccountTable(this);
  late final $AccountMetaTable accountMeta = $AccountMetaTable(this);
  late final $AccountCreditTable accountCredit = $AccountCreditTable(this);
  late final $AccountBonusTable accountBonus = $AccountBonusTable(this);
  late final $StakeholderTable stakeholder = $StakeholderTable(this);
  late final $AccountLoanTable accountLoan = $AccountLoanTable(this);
  late final $LoanPlanTable loanPlan = $LoanPlanTable(this);
  late final $LoanRecordTable loanRecord = $LoanRecordTable(this);
  late final $LedgerTable ledger = $LedgerTable(this);
  late final $RelationAccountLedgerTable relationAccountLedger =
      $RelationAccountLedgerTable(this);
  late final $ProjectTable project = $ProjectTable(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final $RelationCategoryLedgerTable relationCategoryLedger =
      $RelationCategoryLedgerTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $TransactionAmountDetailTable transactionAmountDetail =
      $TransactionAmountDetailTable(this);
  late final $TransactionCategoryDetailTable transactionCategoryDetail =
      $TransactionCategoryDetailTable(this);
  late final $TransactionInstallmentDetailTable transactionInstallmentDetail =
      $TransactionInstallmentDetailTable(this);
  late final $TransactionInstallmentItemTable transactionInstallmentItem =
      $TransactionInstallmentItemTable(this);
  late final $TransactionReduceTable transactionReduce =
      $TransactionReduceTable(this);
  late final $TransactionRefundTable transactionRefund =
      $TransactionRefundTable(this);
  late final $RelationProjectTransactionTable relationProjectTransaction =
      $RelationProjectTransactionTable(this);
  late final $RelationTransactionTable relationTransaction =
      $RelationTransactionTable(this);
  late final $ReimbursementTable reimbursement = $ReimbursementTable(this);
  late final $ReimbursementExpectationTable reimbursementExpectation =
      $ReimbursementExpectationTable(this);
  late final $ReimbursementActualTable reimbursementActual =
      $ReimbursementActualTable(this);
  late final CurrencyDao currencyDao = CurrencyDao(this as AppDatabase);
  late final AccountDao accountDao = AccountDao(this as AppDatabase);
  late final LedgerDao ledgerDao = LedgerDao(this as AppDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as AppDatabase);
  late final StakeholderDao stakeholderDao = StakeholderDao(
    this as AppDatabase,
  );
  late final TransactionDao transactionDao = TransactionDao(
    this as AppDatabase,
  );
  late final ReimbursementDao reimbursementDao = ReimbursementDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    currency,
    account,
    accountMeta,
    accountCredit,
    accountBonus,
    stakeholder,
    accountLoan,
    loanPlan,
    loanRecord,
    ledger,
    relationAccountLedger,
    project,
    category,
    relationCategoryLedger,
    transactions,
    transactionAmountDetail,
    transactionCategoryDetail,
    transactionInstallmentDetail,
    transactionInstallmentItem,
    transactionReduce,
    transactionRefund,
    relationProjectTransaction,
    relationTransaction,
    reimbursement,
    reimbursementExpectation,
    reimbursementActual,
  ];
}

typedef $$CurrencyTableCreateCompanionBuilder =
    CurrencyCompanion Function({
      required String currencyCode,
      required String name,
      required String symbol,
      Value<CurrencyPosition> position,
      Value<int> decimal,
      Value<String?> icon,
      Value<CurrencySource> source,
      Value<int> rowid,
    });
typedef $$CurrencyTableUpdateCompanionBuilder =
    CurrencyCompanion Function({
      Value<String> currencyCode,
      Value<String> name,
      Value<String> symbol,
      Value<CurrencyPosition> position,
      Value<int> decimal,
      Value<String?> icon,
      Value<CurrencySource> source,
      Value<int> rowid,
    });

final class $$CurrencyTableReferences
    extends BaseReferences<_$AppDatabase, $CurrencyTable, CurrencyEntity> {
  $$CurrencyTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountTable, List<AccountEntity>>
  _accountRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.account,
    aliasName: $_aliasNameGenerator(
      db.currency.currencyCode,
      db.account.currencyCode,
    ),
  );

  $$AccountTableProcessedTableManager get accountRefs {
    final manager = $$AccountTableTableManager($_db, $_db.account).filter(
      (f) => f.currencyCode.currencyCode.sqlEquals(
        $_itemColumn<String>('currency_code')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_accountRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LedgerTable, List<LedgerEntity>> _ledgerRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ledger,
    aliasName: $_aliasNameGenerator(
      db.currency.currencyCode,
      db.ledger.currencyCode,
    ),
  );

  $$LedgerTableProcessedTableManager get ledgerRefs {
    final manager = $$LedgerTableTableManager($_db, $_db.ledger).filter(
      (f) => f.currencyCode.currencyCode.sqlEquals(
        $_itemColumn<String>('currency_code')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_ledgerRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionAmountDetailTable,
    List<TransactionAmountDetailEntity>
  >
  _transactionAmountDetailRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionAmountDetail,
        aliasName: $_aliasNameGenerator(
          db.currency.currencyCode,
          db.transactionAmountDetail.currencyCode,
        ),
      );

  $$TransactionAmountDetailTableProcessedTableManager
  get transactionAmountDetailRefs {
    final manager =
        $$TransactionAmountDetailTableTableManager(
          $_db,
          $_db.transactionAmountDetail,
        ).filter(
          (f) => f.currencyCode.currencyCode.sqlEquals(
            $_itemColumn<String>('currency_code')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionAmountDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionCategoryDetailTable,
    List<TransactionCategoryDetailEntity>
  >
  _transactionCategoryDetailRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionCategoryDetail,
        aliasName: $_aliasNameGenerator(
          db.currency.currencyCode,
          db.transactionCategoryDetail.currencyCode,
        ),
      );

  $$TransactionCategoryDetailTableProcessedTableManager
  get transactionCategoryDetailRefs {
    final manager =
        $$TransactionCategoryDetailTableTableManager(
          $_db,
          $_db.transactionCategoryDetail,
        ).filter(
          (f) => f.currencyCode.currencyCode.sqlEquals(
            $_itemColumn<String>('currency_code')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionCategoryDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionInstallmentDetailTable,
    List<TransactionInstallmentDetailEntity>
  >
  _transactionInstallmentDetailRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionInstallmentDetail,
        aliasName: $_aliasNameGenerator(
          db.currency.currencyCode,
          db.transactionInstallmentDetail.currencyCode,
        ),
      );

  $$TransactionInstallmentDetailTableProcessedTableManager
  get transactionInstallmentDetailRefs {
    final manager =
        $$TransactionInstallmentDetailTableTableManager(
          $_db,
          $_db.transactionInstallmentDetail,
        ).filter(
          (f) => f.currencyCode.currencyCode.sqlEquals(
            $_itemColumn<String>('currency_code')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionInstallmentDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionReduceTable,
    List<TransactionReduceEntity>
  >
  _transactionReduceRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionReduce,
        aliasName: $_aliasNameGenerator(
          db.currency.currencyCode,
          db.transactionReduce.currencyCode,
        ),
      );

  $$TransactionReduceTableProcessedTableManager get transactionReduceRefs {
    final manager =
        $$TransactionReduceTableTableManager(
          $_db,
          $_db.transactionReduce,
        ).filter(
          (f) => f.currencyCode.currencyCode.sqlEquals(
            $_itemColumn<String>('currency_code')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionReduceRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionRefundTable,
    List<TransactionRefundEntity>
  >
  _transactionRefundRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionRefund,
        aliasName: $_aliasNameGenerator(
          db.currency.currencyCode,
          db.transactionRefund.currencyCode,
        ),
      );

  $$TransactionRefundTableProcessedTableManager get transactionRefundRefs {
    final manager =
        $$TransactionRefundTableTableManager(
          $_db,
          $_db.transactionRefund,
        ).filter(
          (f) => f.currencyCode.currencyCode.sqlEquals(
            $_itemColumn<String>('currency_code')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionRefundRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ReimbursementExpectationTable,
    List<ReimbursementExpectationEntity>
  >
  _reimbursementExpectationRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reimbursementExpectation,
        aliasName: $_aliasNameGenerator(
          db.currency.currencyCode,
          db.reimbursementExpectation.currencyCode,
        ),
      );

  $$ReimbursementExpectationTableProcessedTableManager
  get reimbursementExpectationRefs {
    final manager =
        $$ReimbursementExpectationTableTableManager(
          $_db,
          $_db.reimbursementExpectation,
        ).filter(
          (f) => f.currencyCode.currencyCode.sqlEquals(
            $_itemColumn<String>('currency_code')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _reimbursementExpectationRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ReimbursementActualTable,
    List<ReimbursementActualEntity>
  >
  _reimbursementActualRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reimbursementActual,
        aliasName: $_aliasNameGenerator(
          db.currency.currencyCode,
          db.reimbursementActual.currencyCode,
        ),
      );

  $$ReimbursementActualTableProcessedTableManager get reimbursementActualRefs {
    final manager =
        $$ReimbursementActualTableTableManager(
          $_db,
          $_db.reimbursementActual,
        ).filter(
          (f) => f.currencyCode.currencyCode.sqlEquals(
            $_itemColumn<String>('currency_code')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _reimbursementActualRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CurrencyTableFilterComposer
    extends Composer<_$AppDatabase, $CurrencyTable> {
  $$CurrencyTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CurrencyPosition, CurrencyPosition, String>
  get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get decimal => $composableBuilder(
    column: $table.decimal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CurrencySource, CurrencySource, String>
  get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> accountRefs(
    Expression<bool> Function($$AccountTableFilterComposer f) f,
  ) {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ledgerRefs(
    Expression<bool> Function($$LedgerTableFilterComposer f) f,
  ) {
    final $$LedgerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableFilterComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> transactionAmountDetailRefs(
    Expression<bool> Function($$TransactionAmountDetailTableFilterComposer f) f,
  ) {
    final $$TransactionAmountDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.transactionAmountDetail,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionAmountDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionAmountDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionCategoryDetailRefs(
    Expression<bool> Function($$TransactionCategoryDetailTableFilterComposer f)
    f,
  ) {
    final $$TransactionCategoryDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.transactionCategoryDetail,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCategoryDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionCategoryDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionInstallmentDetailRefs(
    Expression<bool> Function(
      $$TransactionInstallmentDetailTableFilterComposer f,
    )
    f,
  ) {
    final $$TransactionInstallmentDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.transactionInstallmentDetail,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionInstallmentDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionReduceRefs(
    Expression<bool> Function($$TransactionReduceTableFilterComposer f) f,
  ) {
    final $$TransactionReduceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.transactionReduce,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionReduceTableFilterComposer(
            $db: $db,
            $table: $db.transactionReduce,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> transactionRefundRefs(
    Expression<bool> Function($$TransactionRefundTableFilterComposer f) f,
  ) {
    final $$TransactionRefundTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.transactionRefund,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionRefundTableFilterComposer(
            $db: $db,
            $table: $db.transactionRefund,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reimbursementExpectationRefs(
    Expression<bool> Function($$ReimbursementExpectationTableFilterComposer f)
    f,
  ) {
    final $$ReimbursementExpectationTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.reimbursementExpectation,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReimbursementExpectationTableFilterComposer(
                $db: $db,
                $table: $db.reimbursementExpectation,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> reimbursementActualRefs(
    Expression<bool> Function($$ReimbursementActualTableFilterComposer f) f,
  ) {
    final $$ReimbursementActualTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.reimbursementActual,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementActualTableFilterComposer(
            $db: $db,
            $table: $db.reimbursementActual,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CurrencyTableOrderingComposer
    extends Composer<_$AppDatabase, $CurrencyTable> {
  $$CurrencyTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get decimal => $composableBuilder(
    column: $table.decimal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CurrencyTableAnnotationComposer
    extends Composer<_$AppDatabase, $CurrencyTable> {
  $$CurrencyTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CurrencyPosition, String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<int> get decimal =>
      $composableBuilder(column: $table.decimal, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CurrencySource, String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  Expression<T> accountRefs<T extends Object>(
    Expression<T> Function($$AccountTableAnnotationComposer a) f,
  ) {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ledgerRefs<T extends Object>(
    Expression<T> Function($$LedgerTableAnnotationComposer a) f,
  ) {
    final $$LedgerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableAnnotationComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> transactionAmountDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionAmountDetailTableAnnotationComposer a)
    f,
  ) {
    final $$TransactionAmountDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.transactionAmountDetail,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionAmountDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionAmountDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionCategoryDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionCategoryDetailTableAnnotationComposer a)
    f,
  ) {
    final $$TransactionCategoryDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.transactionCategoryDetail,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCategoryDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionCategoryDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionInstallmentDetailRefs<T extends Object>(
    Expression<T> Function(
      $$TransactionInstallmentDetailTableAnnotationComposer a,
    )
    f,
  ) {
    final $$TransactionInstallmentDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.transactionInstallmentDetail,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionInstallmentDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionReduceRefs<T extends Object>(
    Expression<T> Function($$TransactionReduceTableAnnotationComposer a) f,
  ) {
    final $$TransactionReduceTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.transactionReduce,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionReduceTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionReduce,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionRefundRefs<T extends Object>(
    Expression<T> Function($$TransactionRefundTableAnnotationComposer a) f,
  ) {
    final $$TransactionRefundTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.transactionRefund,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionRefundTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionRefund,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> reimbursementExpectationRefs<T extends Object>(
    Expression<T> Function($$ReimbursementExpectationTableAnnotationComposer a)
    f,
  ) {
    final $$ReimbursementExpectationTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.reimbursementExpectation,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReimbursementExpectationTableAnnotationComposer(
                $db: $db,
                $table: $db.reimbursementExpectation,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> reimbursementActualRefs<T extends Object>(
    Expression<T> Function($$ReimbursementActualTableAnnotationComposer a) f,
  ) {
    final $$ReimbursementActualTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.currencyCode,
          referencedTable: $db.reimbursementActual,
          getReferencedColumn: (t) => t.currencyCode,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReimbursementActualTableAnnotationComposer(
                $db: $db,
                $table: $db.reimbursementActual,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CurrencyTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CurrencyTable,
          CurrencyEntity,
          $$CurrencyTableFilterComposer,
          $$CurrencyTableOrderingComposer,
          $$CurrencyTableAnnotationComposer,
          $$CurrencyTableCreateCompanionBuilder,
          $$CurrencyTableUpdateCompanionBuilder,
          (CurrencyEntity, $$CurrencyTableReferences),
          CurrencyEntity,
          PrefetchHooks Function({
            bool accountRefs,
            bool ledgerRefs,
            bool transactionAmountDetailRefs,
            bool transactionCategoryDetailRefs,
            bool transactionInstallmentDetailRefs,
            bool transactionReduceRefs,
            bool transactionRefundRefs,
            bool reimbursementExpectationRefs,
            bool reimbursementActualRefs,
          })
        > {
  $$CurrencyTableTableManager(_$AppDatabase db, $CurrencyTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CurrencyTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CurrencyTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CurrencyTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> currencyCode = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> symbol = const Value.absent(),
                Value<CurrencyPosition> position = const Value.absent(),
                Value<int> decimal = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<CurrencySource> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurrencyCompanion(
                currencyCode: currencyCode,
                name: name,
                symbol: symbol,
                position: position,
                decimal: decimal,
                icon: icon,
                source: source,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String currencyCode,
                required String name,
                required String symbol,
                Value<CurrencyPosition> position = const Value.absent(),
                Value<int> decimal = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<CurrencySource> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurrencyCompanion.insert(
                currencyCode: currencyCode,
                name: name,
                symbol: symbol,
                position: position,
                decimal: decimal,
                icon: icon,
                source: source,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CurrencyTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                accountRefs = false,
                ledgerRefs = false,
                transactionAmountDetailRefs = false,
                transactionCategoryDetailRefs = false,
                transactionInstallmentDetailRefs = false,
                transactionReduceRefs = false,
                transactionRefundRefs = false,
                reimbursementExpectationRefs = false,
                reimbursementActualRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (accountRefs) db.account,
                    if (ledgerRefs) db.ledger,
                    if (transactionAmountDetailRefs) db.transactionAmountDetail,
                    if (transactionCategoryDetailRefs)
                      db.transactionCategoryDetail,
                    if (transactionInstallmentDetailRefs)
                      db.transactionInstallmentDetail,
                    if (transactionReduceRefs) db.transactionReduce,
                    if (transactionRefundRefs) db.transactionRefund,
                    if (reimbursementExpectationRefs)
                      db.reimbursementExpectation,
                    if (reimbursementActualRefs) db.reimbursementActual,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (accountRefs)
                        await $_getPrefetchedData<
                          CurrencyEntity,
                          $CurrencyTable,
                          AccountEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CurrencyTableReferences
                              ._accountRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CurrencyTableReferences(
                                db,
                                table,
                                p0,
                              ).accountRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyCode == item.currencyCode,
                              ),
                          typedResults: items,
                        ),
                      if (ledgerRefs)
                        await $_getPrefetchedData<
                          CurrencyEntity,
                          $CurrencyTable,
                          LedgerEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CurrencyTableReferences
                              ._ledgerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CurrencyTableReferences(
                                db,
                                table,
                                p0,
                              ).ledgerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyCode == item.currencyCode,
                              ),
                          typedResults: items,
                        ),
                      if (transactionAmountDetailRefs)
                        await $_getPrefetchedData<
                          CurrencyEntity,
                          $CurrencyTable,
                          TransactionAmountDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CurrencyTableReferences
                              ._transactionAmountDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CurrencyTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionAmountDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyCode == item.currencyCode,
                              ),
                          typedResults: items,
                        ),
                      if (transactionCategoryDetailRefs)
                        await $_getPrefetchedData<
                          CurrencyEntity,
                          $CurrencyTable,
                          TransactionCategoryDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CurrencyTableReferences
                              ._transactionCategoryDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CurrencyTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionCategoryDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyCode == item.currencyCode,
                              ),
                          typedResults: items,
                        ),
                      if (transactionInstallmentDetailRefs)
                        await $_getPrefetchedData<
                          CurrencyEntity,
                          $CurrencyTable,
                          TransactionInstallmentDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CurrencyTableReferences
                              ._transactionInstallmentDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CurrencyTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionInstallmentDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyCode == item.currencyCode,
                              ),
                          typedResults: items,
                        ),
                      if (transactionReduceRefs)
                        await $_getPrefetchedData<
                          CurrencyEntity,
                          $CurrencyTable,
                          TransactionReduceEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CurrencyTableReferences
                              ._transactionReduceRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CurrencyTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionReduceRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyCode == item.currencyCode,
                              ),
                          typedResults: items,
                        ),
                      if (transactionRefundRefs)
                        await $_getPrefetchedData<
                          CurrencyEntity,
                          $CurrencyTable,
                          TransactionRefundEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CurrencyTableReferences
                              ._transactionRefundRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CurrencyTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionRefundRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyCode == item.currencyCode,
                              ),
                          typedResults: items,
                        ),
                      if (reimbursementExpectationRefs)
                        await $_getPrefetchedData<
                          CurrencyEntity,
                          $CurrencyTable,
                          ReimbursementExpectationEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CurrencyTableReferences
                              ._reimbursementExpectationRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CurrencyTableReferences(
                                db,
                                table,
                                p0,
                              ).reimbursementExpectationRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyCode == item.currencyCode,
                              ),
                          typedResults: items,
                        ),
                      if (reimbursementActualRefs)
                        await $_getPrefetchedData<
                          CurrencyEntity,
                          $CurrencyTable,
                          ReimbursementActualEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CurrencyTableReferences
                              ._reimbursementActualRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CurrencyTableReferences(
                                db,
                                table,
                                p0,
                              ).reimbursementActualRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyCode == item.currencyCode,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CurrencyTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CurrencyTable,
      CurrencyEntity,
      $$CurrencyTableFilterComposer,
      $$CurrencyTableOrderingComposer,
      $$CurrencyTableAnnotationComposer,
      $$CurrencyTableCreateCompanionBuilder,
      $$CurrencyTableUpdateCompanionBuilder,
      (CurrencyEntity, $$CurrencyTableReferences),
      CurrencyEntity,
      PrefetchHooks Function({
        bool accountRefs,
        bool ledgerRefs,
        bool transactionAmountDetailRefs,
        bool transactionCategoryDetailRefs,
        bool transactionInstallmentDetailRefs,
        bool transactionReduceRefs,
        bool transactionRefundRefs,
        bool reimbursementExpectationRefs,
        bool reimbursementActualRefs,
      })
    >;
typedef $$AccountTableCreateCompanionBuilder =
    AccountCompanion Function({
      Value<int> accountId,
      required String name,
      Value<String> description,
      Value<String> icon,
      required AccountType type,
      required String currencyCode,
      required int createdAt,
      required int updatedAt,
      Value<String> note,
    });
typedef $$AccountTableUpdateCompanionBuilder =
    AccountCompanion Function({
      Value<int> accountId,
      Value<String> name,
      Value<String> description,
      Value<String> icon,
      Value<AccountType> type,
      Value<String> currencyCode,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String> note,
    });

final class $$AccountTableReferences
    extends BaseReferences<_$AppDatabase, $AccountTable, AccountEntity> {
  $$AccountTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CurrencyTable _currencyCodeTable(_$AppDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(db.account.currencyCode, db.currency.currencyCode),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.currencyCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AccountMetaTable, List<AccountMetaEntity>>
  _accountMetaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.accountMeta,
    aliasName: $_aliasNameGenerator(
      db.account.accountId,
      db.accountMeta.accountId,
    ),
  );

  $$AccountMetaTableProcessedTableManager get accountMetaRefs {
    final manager = $$AccountMetaTableTableManager($_db, $_db.accountMeta)
        .filter(
          (f) =>
              f.accountId.accountId.sqlEquals($_itemColumn<int>('account_id')!),
        );

    final cache = $_typedResult.readTableOrNull(_accountMetaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AccountCreditTable, List<CreditAccountEntity>>
  _accountCreditRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.accountCredit,
    aliasName: $_aliasNameGenerator(
      db.account.accountId,
      db.accountCredit.accountId,
    ),
  );

  $$AccountCreditTableProcessedTableManager get accountCreditRefs {
    final manager = $$AccountCreditTableTableManager($_db, $_db.accountCredit)
        .filter(
          (f) =>
              f.accountId.accountId.sqlEquals($_itemColumn<int>('account_id')!),
        );

    final cache = $_typedResult.readTableOrNull(_accountCreditRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AccountLoanTable, List<LoanAccountEntity>>
  _accountLoanRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.accountLoan,
    aliasName: $_aliasNameGenerator(
      db.account.accountId,
      db.accountLoan.accountId,
    ),
  );

  $$AccountLoanTableProcessedTableManager get accountLoanRefs {
    final manager = $$AccountLoanTableTableManager($_db, $_db.accountLoan)
        .filter(
          (f) =>
              f.accountId.accountId.sqlEquals($_itemColumn<int>('account_id')!),
        );

    final cache = $_typedResult.readTableOrNull(_accountLoanRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LoanPlanTable, List<LoanPlanEntity>>
  _loanPlanRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.loanPlan,
    aliasName: $_aliasNameGenerator(
      db.account.accountId,
      db.loanPlan.accountId,
    ),
  );

  $$LoanPlanTableProcessedTableManager get loanPlanRefs {
    final manager = $$LoanPlanTableTableManager($_db, $_db.loanPlan).filter(
      (f) => f.accountId.accountId.sqlEquals($_itemColumn<int>('account_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_loanPlanRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LoanRecordTable, List<LoanRecordEntity>>
  _loanRecordRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.loanRecord,
    aliasName: $_aliasNameGenerator(
      db.account.accountId,
      db.loanRecord.accountId,
    ),
  );

  $$LoanRecordTableProcessedTableManager get loanRecordRefs {
    final manager = $$LoanRecordTableTableManager($_db, $_db.loanRecord).filter(
      (f) => f.accountId.accountId.sqlEquals($_itemColumn<int>('account_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_loanRecordRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RelationAccountLedgerTable,
    List<LedgerAccountRelationEntity>
  >
  _relationAccountLedgerRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationAccountLedger,
        aliasName: $_aliasNameGenerator(
          db.account.accountId,
          db.relationAccountLedger.accountId,
        ),
      );

  $$RelationAccountLedgerTableProcessedTableManager
  get relationAccountLedgerRefs {
    final manager =
        $$RelationAccountLedgerTableTableManager(
          $_db,
          $_db.relationAccountLedger,
        ).filter(
          (f) =>
              f.accountId.accountId.sqlEquals($_itemColumn<int>('account_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _relationAccountLedgerRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionAmountDetailTable,
    List<TransactionAmountDetailEntity>
  >
  _transactionAmountDetailRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionAmountDetail,
        aliasName: $_aliasNameGenerator(
          db.account.accountId,
          db.transactionAmountDetail.accountId,
        ),
      );

  $$TransactionAmountDetailTableProcessedTableManager
  get transactionAmountDetailRefs {
    final manager =
        $$TransactionAmountDetailTableTableManager(
          $_db,
          $_db.transactionAmountDetail,
        ).filter(
          (f) =>
              f.accountId.accountId.sqlEquals($_itemColumn<int>('account_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionAmountDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionInstallmentDetailTable,
    List<TransactionInstallmentDetailEntity>
  >
  _transactionInstallmentDetailRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionInstallmentDetail,
        aliasName: $_aliasNameGenerator(
          db.account.accountId,
          db.transactionInstallmentDetail.accountId,
        ),
      );

  $$TransactionInstallmentDetailTableProcessedTableManager
  get transactionInstallmentDetailRefs {
    final manager =
        $$TransactionInstallmentDetailTableTableManager(
          $_db,
          $_db.transactionInstallmentDetail,
        ).filter(
          (f) =>
              f.accountId.accountId.sqlEquals($_itemColumn<int>('account_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionInstallmentDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionRefundTable,
    List<TransactionRefundEntity>
  >
  _transactionRefundRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionRefund,
        aliasName: $_aliasNameGenerator(
          db.account.accountId,
          db.transactionRefund.accountId,
        ),
      );

  $$TransactionRefundTableProcessedTableManager get transactionRefundRefs {
    final manager =
        $$TransactionRefundTableTableManager(
          $_db,
          $_db.transactionRefund,
        ).filter(
          (f) =>
              f.accountId.accountId.sqlEquals($_itemColumn<int>('account_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionRefundRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ReimbursementActualTable,
    List<ReimbursementActualEntity>
  >
  _reimbursementActualRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reimbursementActual,
        aliasName: $_aliasNameGenerator(
          db.account.accountId,
          db.reimbursementActual.accountId,
        ),
      );

  $$ReimbursementActualTableProcessedTableManager get reimbursementActualRefs {
    final manager =
        $$ReimbursementActualTableTableManager(
          $_db,
          $_db.reimbursementActual,
        ).filter(
          (f) =>
              f.accountId.accountId.sqlEquals($_itemColumn<int>('account_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _reimbursementActualRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AccountTableFilterComposer
    extends Composer<_$AppDatabase, $AccountTable> {
  $$AccountTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AccountType, AccountType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$CurrencyTableFilterComposer get currencyCode {
    final $$CurrencyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableFilterComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> accountMetaRefs(
    Expression<bool> Function($$AccountMetaTableFilterComposer f) f,
  ) {
    final $$AccountMetaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accountMeta,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountMetaTableFilterComposer(
            $db: $db,
            $table: $db.accountMeta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> accountCreditRefs(
    Expression<bool> Function($$AccountCreditTableFilterComposer f) f,
  ) {
    final $$AccountCreditTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accountCredit,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountCreditTableFilterComposer(
            $db: $db,
            $table: $db.accountCredit,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> accountLoanRefs(
    Expression<bool> Function($$AccountLoanTableFilterComposer f) f,
  ) {
    final $$AccountLoanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accountLoan,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountLoanTableFilterComposer(
            $db: $db,
            $table: $db.accountLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> loanPlanRefs(
    Expression<bool> Function($$LoanPlanTableFilterComposer f) f,
  ) {
    final $$LoanPlanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.loanPlan,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoanPlanTableFilterComposer(
            $db: $db,
            $table: $db.loanPlan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> loanRecordRefs(
    Expression<bool> Function($$LoanRecordTableFilterComposer f) f,
  ) {
    final $$LoanRecordTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.loanRecord,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoanRecordTableFilterComposer(
            $db: $db,
            $table: $db.loanRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> relationAccountLedgerRefs(
    Expression<bool> Function($$RelationAccountLedgerTableFilterComposer f) f,
  ) {
    final $$RelationAccountLedgerTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accountId,
          referencedTable: $db.relationAccountLedger,
          getReferencedColumn: (t) => t.accountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationAccountLedgerTableFilterComposer(
                $db: $db,
                $table: $db.relationAccountLedger,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionAmountDetailRefs(
    Expression<bool> Function($$TransactionAmountDetailTableFilterComposer f) f,
  ) {
    final $$TransactionAmountDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accountId,
          referencedTable: $db.transactionAmountDetail,
          getReferencedColumn: (t) => t.accountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionAmountDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionAmountDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionInstallmentDetailRefs(
    Expression<bool> Function(
      $$TransactionInstallmentDetailTableFilterComposer f,
    )
    f,
  ) {
    final $$TransactionInstallmentDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accountId,
          referencedTable: $db.transactionInstallmentDetail,
          getReferencedColumn: (t) => t.accountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionInstallmentDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionRefundRefs(
    Expression<bool> Function($$TransactionRefundTableFilterComposer f) f,
  ) {
    final $$TransactionRefundTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.transactionRefund,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionRefundTableFilterComposer(
            $db: $db,
            $table: $db.transactionRefund,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reimbursementActualRefs(
    Expression<bool> Function($$ReimbursementActualTableFilterComposer f) f,
  ) {
    final $$ReimbursementActualTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.reimbursementActual,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementActualTableFilterComposer(
            $db: $db,
            $table: $db.reimbursementActual,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AccountTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountTable> {
  $$AccountTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$CurrencyTableOrderingComposer get currencyCode {
    final $$CurrencyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableOrderingComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountTable> {
  $$AccountTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AccountType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$CurrencyTableAnnotationComposer get currencyCode {
    final $$CurrencyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableAnnotationComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> accountMetaRefs<T extends Object>(
    Expression<T> Function($$AccountMetaTableAnnotationComposer a) f,
  ) {
    final $$AccountMetaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accountMeta,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountMetaTableAnnotationComposer(
            $db: $db,
            $table: $db.accountMeta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> accountCreditRefs<T extends Object>(
    Expression<T> Function($$AccountCreditTableAnnotationComposer a) f,
  ) {
    final $$AccountCreditTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accountCredit,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountCreditTableAnnotationComposer(
            $db: $db,
            $table: $db.accountCredit,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> accountLoanRefs<T extends Object>(
    Expression<T> Function($$AccountLoanTableAnnotationComposer a) f,
  ) {
    final $$AccountLoanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accountLoan,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountLoanTableAnnotationComposer(
            $db: $db,
            $table: $db.accountLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> loanPlanRefs<T extends Object>(
    Expression<T> Function($$LoanPlanTableAnnotationComposer a) f,
  ) {
    final $$LoanPlanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.loanPlan,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoanPlanTableAnnotationComposer(
            $db: $db,
            $table: $db.loanPlan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> loanRecordRefs<T extends Object>(
    Expression<T> Function($$LoanRecordTableAnnotationComposer a) f,
  ) {
    final $$LoanRecordTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.loanRecord,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoanRecordTableAnnotationComposer(
            $db: $db,
            $table: $db.loanRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> relationAccountLedgerRefs<T extends Object>(
    Expression<T> Function($$RelationAccountLedgerTableAnnotationComposer a) f,
  ) {
    final $$RelationAccountLedgerTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accountId,
          referencedTable: $db.relationAccountLedger,
          getReferencedColumn: (t) => t.accountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationAccountLedgerTableAnnotationComposer(
                $db: $db,
                $table: $db.relationAccountLedger,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionAmountDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionAmountDetailTableAnnotationComposer a)
    f,
  ) {
    final $$TransactionAmountDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accountId,
          referencedTable: $db.transactionAmountDetail,
          getReferencedColumn: (t) => t.accountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionAmountDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionAmountDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionInstallmentDetailRefs<T extends Object>(
    Expression<T> Function(
      $$TransactionInstallmentDetailTableAnnotationComposer a,
    )
    f,
  ) {
    final $$TransactionInstallmentDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accountId,
          referencedTable: $db.transactionInstallmentDetail,
          getReferencedColumn: (t) => t.accountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionInstallmentDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionRefundRefs<T extends Object>(
    Expression<T> Function($$TransactionRefundTableAnnotationComposer a) f,
  ) {
    final $$TransactionRefundTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accountId,
          referencedTable: $db.transactionRefund,
          getReferencedColumn: (t) => t.accountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionRefundTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionRefund,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> reimbursementActualRefs<T extends Object>(
    Expression<T> Function($$ReimbursementActualTableAnnotationComposer a) f,
  ) {
    final $$ReimbursementActualTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accountId,
          referencedTable: $db.reimbursementActual,
          getReferencedColumn: (t) => t.accountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReimbursementActualTableAnnotationComposer(
                $db: $db,
                $table: $db.reimbursementActual,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AccountTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountTable,
          AccountEntity,
          $$AccountTableFilterComposer,
          $$AccountTableOrderingComposer,
          $$AccountTableAnnotationComposer,
          $$AccountTableCreateCompanionBuilder,
          $$AccountTableUpdateCompanionBuilder,
          (AccountEntity, $$AccountTableReferences),
          AccountEntity,
          PrefetchHooks Function({
            bool currencyCode,
            bool accountMetaRefs,
            bool accountCreditRefs,
            bool accountLoanRefs,
            bool loanPlanRefs,
            bool loanRecordRefs,
            bool relationAccountLedgerRefs,
            bool transactionAmountDetailRefs,
            bool transactionInstallmentDetailRefs,
            bool transactionRefundRefs,
            bool reimbursementActualRefs,
          })
        > {
  $$AccountTableTableManager(_$AppDatabase db, $AccountTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<AccountType> type = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => AccountCompanion(
                accountId: accountId,
                name: name,
                description: description,
                icon: icon,
                type: type,
                currencyCode: currencyCode,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                required String name,
                Value<String> description = const Value.absent(),
                Value<String> icon = const Value.absent(),
                required AccountType type,
                required String currencyCode,
                required int createdAt,
                required int updatedAt,
                Value<String> note = const Value.absent(),
              }) => AccountCompanion.insert(
                accountId: accountId,
                name: name,
                description: description,
                icon: icon,
                type: type,
                currencyCode: currencyCode,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                currencyCode = false,
                accountMetaRefs = false,
                accountCreditRefs = false,
                accountLoanRefs = false,
                loanPlanRefs = false,
                loanRecordRefs = false,
                relationAccountLedgerRefs = false,
                transactionAmountDetailRefs = false,
                transactionInstallmentDetailRefs = false,
                transactionRefundRefs = false,
                reimbursementActualRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (accountMetaRefs) db.accountMeta,
                    if (accountCreditRefs) db.accountCredit,
                    if (accountLoanRefs) db.accountLoan,
                    if (loanPlanRefs) db.loanPlan,
                    if (loanRecordRefs) db.loanRecord,
                    if (relationAccountLedgerRefs) db.relationAccountLedger,
                    if (transactionAmountDetailRefs) db.transactionAmountDetail,
                    if (transactionInstallmentDetailRefs)
                      db.transactionInstallmentDetail,
                    if (transactionRefundRefs) db.transactionRefund,
                    if (reimbursementActualRefs) db.reimbursementActual,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (currencyCode) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currencyCode,
                                    referencedTable: $$AccountTableReferences
                                        ._currencyCodeTable(db),
                                    referencedColumn: $$AccountTableReferences
                                        ._currencyCodeTable(db)
                                        .currencyCode,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (accountMetaRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          AccountMetaEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._accountMetaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).accountMetaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.accountId,
                              ),
                          typedResults: items,
                        ),
                      if (accountCreditRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          CreditAccountEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._accountCreditRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).accountCreditRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.accountId,
                              ),
                          typedResults: items,
                        ),
                      if (accountLoanRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          LoanAccountEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._accountLoanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).accountLoanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.accountId,
                              ),
                          typedResults: items,
                        ),
                      if (loanPlanRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          LoanPlanEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._loanPlanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).loanPlanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.accountId,
                              ),
                          typedResults: items,
                        ),
                      if (loanRecordRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          LoanRecordEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._loanRecordRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).loanRecordRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.accountId,
                              ),
                          typedResults: items,
                        ),
                      if (relationAccountLedgerRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          LedgerAccountRelationEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._relationAccountLedgerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).relationAccountLedgerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.accountId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionAmountDetailRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          TransactionAmountDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._transactionAmountDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionAmountDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.accountId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionInstallmentDetailRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          TransactionInstallmentDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._transactionInstallmentDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionInstallmentDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.accountId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionRefundRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          TransactionRefundEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._transactionRefundRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionRefundRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.accountId,
                              ),
                          typedResults: items,
                        ),
                      if (reimbursementActualRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          ReimbursementActualEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._reimbursementActualRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).reimbursementActualRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.accountId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AccountTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountTable,
      AccountEntity,
      $$AccountTableFilterComposer,
      $$AccountTableOrderingComposer,
      $$AccountTableAnnotationComposer,
      $$AccountTableCreateCompanionBuilder,
      $$AccountTableUpdateCompanionBuilder,
      (AccountEntity, $$AccountTableReferences),
      AccountEntity,
      PrefetchHooks Function({
        bool currencyCode,
        bool accountMetaRefs,
        bool accountCreditRefs,
        bool accountLoanRefs,
        bool loanPlanRefs,
        bool loanRecordRefs,
        bool relationAccountLedgerRefs,
        bool transactionAmountDetailRefs,
        bool transactionInstallmentDetailRefs,
        bool transactionRefundRefs,
        bool reimbursementActualRefs,
      })
    >;
typedef $$AccountMetaTableCreateCompanionBuilder =
    AccountMetaCompanion Function({
      required int accountId,
      required AccountMetaScope scope,
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$AccountMetaTableUpdateCompanionBuilder =
    AccountMetaCompanion Function({
      Value<int> accountId,
      Value<AccountMetaScope> scope,
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

final class $$AccountMetaTableReferences
    extends
        BaseReferences<_$AppDatabase, $AccountMetaTable, AccountMetaEntity> {
  $$AccountMetaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountTable _accountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.accountMeta.accountId, db.account.accountId),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountMetaTableFilterComposer
    extends Composer<_$AppDatabase, $AccountMetaTable> {
  $$AccountMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<AccountMetaScope, AccountMetaScope, String>
  get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountMetaTable> {
  $$AccountMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountMetaTable> {
  $$AccountMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<AccountMetaScope, String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountMetaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountMetaTable,
          AccountMetaEntity,
          $$AccountMetaTableFilterComposer,
          $$AccountMetaTableOrderingComposer,
          $$AccountMetaTableAnnotationComposer,
          $$AccountMetaTableCreateCompanionBuilder,
          $$AccountMetaTableUpdateCompanionBuilder,
          (AccountMetaEntity, $$AccountMetaTableReferences),
          AccountMetaEntity,
          PrefetchHooks Function({bool accountId})
        > {
  $$AccountMetaTableTableManager(_$AppDatabase db, $AccountMetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                Value<AccountMetaScope> scope = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountMetaCompanion(
                accountId: accountId,
                scope: scope,
                key: key,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int accountId,
                required AccountMetaScope scope,
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => AccountMetaCompanion.insert(
                accountId: accountId,
                scope: scope,
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountMetaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (accountId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accountId,
                                referencedTable: $$AccountMetaTableReferences
                                    ._accountIdTable(db),
                                referencedColumn: $$AccountMetaTableReferences
                                    ._accountIdTable(db)
                                    .accountId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AccountMetaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountMetaTable,
      AccountMetaEntity,
      $$AccountMetaTableFilterComposer,
      $$AccountMetaTableOrderingComposer,
      $$AccountMetaTableAnnotationComposer,
      $$AccountMetaTableCreateCompanionBuilder,
      $$AccountMetaTableUpdateCompanionBuilder,
      (AccountMetaEntity, $$AccountMetaTableReferences),
      AccountMetaEntity,
      PrefetchHooks Function({bool accountId})
    >;
typedef $$AccountCreditTableCreateCompanionBuilder =
    AccountCreditCompanion Function({
      Value<int> accountId,
      required int creditLimit,
      required int billingCycleDay,
      required int paymentDueDay,
    });
typedef $$AccountCreditTableUpdateCompanionBuilder =
    AccountCreditCompanion Function({
      Value<int> accountId,
      Value<int> creditLimit,
      Value<int> billingCycleDay,
      Value<int> paymentDueDay,
    });

final class $$AccountCreditTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AccountCreditTable,
          CreditAccountEntity
        > {
  $$AccountCreditTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AccountTable _accountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.accountCredit.accountId, db.account.accountId),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountCreditTableFilterComposer
    extends Composer<_$AppDatabase, $AccountCreditTable> {
  $$AccountCreditTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get billingCycleDay => $composableBuilder(
    column: $table.billingCycleDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paymentDueDay => $composableBuilder(
    column: $table.paymentDueDay,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountCreditTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountCreditTable> {
  $$AccountCreditTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get billingCycleDay => $composableBuilder(
    column: $table.billingCycleDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paymentDueDay => $composableBuilder(
    column: $table.paymentDueDay,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountCreditTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountCreditTable> {
  $$AccountCreditTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get billingCycleDay => $composableBuilder(
    column: $table.billingCycleDay,
    builder: (column) => column,
  );

  GeneratedColumn<int> get paymentDueDay => $composableBuilder(
    column: $table.paymentDueDay,
    builder: (column) => column,
  );

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountCreditTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountCreditTable,
          CreditAccountEntity,
          $$AccountCreditTableFilterComposer,
          $$AccountCreditTableOrderingComposer,
          $$AccountCreditTableAnnotationComposer,
          $$AccountCreditTableCreateCompanionBuilder,
          $$AccountCreditTableUpdateCompanionBuilder,
          (CreditAccountEntity, $$AccountCreditTableReferences),
          CreditAccountEntity,
          PrefetchHooks Function({bool accountId})
        > {
  $$AccountCreditTableTableManager(_$AppDatabase db, $AccountCreditTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountCreditTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountCreditTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountCreditTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                Value<int> creditLimit = const Value.absent(),
                Value<int> billingCycleDay = const Value.absent(),
                Value<int> paymentDueDay = const Value.absent(),
              }) => AccountCreditCompanion(
                accountId: accountId,
                creditLimit: creditLimit,
                billingCycleDay: billingCycleDay,
                paymentDueDay: paymentDueDay,
              ),
          createCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                required int creditLimit,
                required int billingCycleDay,
                required int paymentDueDay,
              }) => AccountCreditCompanion.insert(
                accountId: accountId,
                creditLimit: creditLimit,
                billingCycleDay: billingCycleDay,
                paymentDueDay: paymentDueDay,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountCreditTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (accountId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accountId,
                                referencedTable: $$AccountCreditTableReferences
                                    ._accountIdTable(db),
                                referencedColumn: $$AccountCreditTableReferences
                                    ._accountIdTable(db)
                                    .accountId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AccountCreditTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountCreditTable,
      CreditAccountEntity,
      $$AccountCreditTableFilterComposer,
      $$AccountCreditTableOrderingComposer,
      $$AccountCreditTableAnnotationComposer,
      $$AccountCreditTableCreateCompanionBuilder,
      $$AccountCreditTableUpdateCompanionBuilder,
      (CreditAccountEntity, $$AccountCreditTableReferences),
      CreditAccountEntity,
      PrefetchHooks Function({bool accountId})
    >;
typedef $$AccountBonusTableCreateCompanionBuilder =
    AccountBonusCompanion Function({
      required int bonusAccountId,
      required int prepaidAccountId,
      Value<int> rowid,
    });
typedef $$AccountBonusTableUpdateCompanionBuilder =
    AccountBonusCompanion Function({
      Value<int> bonusAccountId,
      Value<int> prepaidAccountId,
      Value<int> rowid,
    });

final class $$AccountBonusTableReferences
    extends
        BaseReferences<_$AppDatabase, $AccountBonusTable, BonusAccountEntity> {
  $$AccountBonusTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountTable _bonusAccountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(
          db.accountBonus.bonusAccountId,
          db.account.accountId,
        ),
      );

  $$AccountTableProcessedTableManager get bonusAccountId {
    final $_column = $_itemColumn<int>('bonus_account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bonusAccountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountTable _prepaidAccountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(
          db.accountBonus.prepaidAccountId,
          db.account.accountId,
        ),
      );

  $$AccountTableProcessedTableManager get prepaidAccountId {
    final $_column = $_itemColumn<int>('prepaid_account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_prepaidAccountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountBonusTableFilterComposer
    extends Composer<_$AppDatabase, $AccountBonusTable> {
  $$AccountBonusTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AccountTableFilterComposer get bonusAccountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bonusAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableFilterComposer get prepaidAccountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prepaidAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountBonusTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountBonusTable> {
  $$AccountBonusTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AccountTableOrderingComposer get bonusAccountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bonusAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableOrderingComposer get prepaidAccountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prepaidAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountBonusTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountBonusTable> {
  $$AccountBonusTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AccountTableAnnotationComposer get bonusAccountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bonusAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableAnnotationComposer get prepaidAccountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prepaidAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountBonusTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountBonusTable,
          BonusAccountEntity,
          $$AccountBonusTableFilterComposer,
          $$AccountBonusTableOrderingComposer,
          $$AccountBonusTableAnnotationComposer,
          $$AccountBonusTableCreateCompanionBuilder,
          $$AccountBonusTableUpdateCompanionBuilder,
          (BonusAccountEntity, $$AccountBonusTableReferences),
          BonusAccountEntity,
          PrefetchHooks Function({bool bonusAccountId, bool prepaidAccountId})
        > {
  $$AccountBonusTableTableManager(_$AppDatabase db, $AccountBonusTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountBonusTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountBonusTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountBonusTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> bonusAccountId = const Value.absent(),
                Value<int> prepaidAccountId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountBonusCompanion(
                bonusAccountId: bonusAccountId,
                prepaidAccountId: prepaidAccountId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int bonusAccountId,
                required int prepaidAccountId,
                Value<int> rowid = const Value.absent(),
              }) => AccountBonusCompanion.insert(
                bonusAccountId: bonusAccountId,
                prepaidAccountId: prepaidAccountId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountBonusTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({bonusAccountId = false, prepaidAccountId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (bonusAccountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.bonusAccountId,
                                    referencedTable:
                                        $$AccountBonusTableReferences
                                            ._bonusAccountIdTable(db),
                                    referencedColumn:
                                        $$AccountBonusTableReferences
                                            ._bonusAccountIdTable(db)
                                            .accountId,
                                  )
                                  as T;
                        }
                        if (prepaidAccountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.prepaidAccountId,
                                    referencedTable:
                                        $$AccountBonusTableReferences
                                            ._prepaidAccountIdTable(db),
                                    referencedColumn:
                                        $$AccountBonusTableReferences
                                            ._prepaidAccountIdTable(db)
                                            .accountId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AccountBonusTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountBonusTable,
      BonusAccountEntity,
      $$AccountBonusTableFilterComposer,
      $$AccountBonusTableOrderingComposer,
      $$AccountBonusTableAnnotationComposer,
      $$AccountBonusTableCreateCompanionBuilder,
      $$AccountBonusTableUpdateCompanionBuilder,
      (BonusAccountEntity, $$AccountBonusTableReferences),
      BonusAccountEntity,
      PrefetchHooks Function({bool bonusAccountId, bool prepaidAccountId})
    >;
typedef $$StakeholderTableCreateCompanionBuilder =
    StakeholderCompanion Function({
      Value<int> stakeholderId,
      required String name,
      required StakeholderType type,
      Value<String?> avatar,
      Value<String> description,
      Value<String?> contact,
      required int createdAt,
      required int updatedAt,
      Value<String> note,
    });
typedef $$StakeholderTableUpdateCompanionBuilder =
    StakeholderCompanion Function({
      Value<int> stakeholderId,
      Value<String> name,
      Value<StakeholderType> type,
      Value<String?> avatar,
      Value<String> description,
      Value<String?> contact,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String> note,
    });

final class $$StakeholderTableReferences
    extends
        BaseReferences<_$AppDatabase, $StakeholderTable, StakeholderEntity> {
  $$StakeholderTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountLoanTable, List<LoanAccountEntity>>
  _accountLoanRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.accountLoan,
    aliasName: $_aliasNameGenerator(
      db.stakeholder.stakeholderId,
      db.accountLoan.stakeholderId,
    ),
  );

  $$AccountLoanTableProcessedTableManager get accountLoanRefs {
    final manager = $$AccountLoanTableTableManager($_db, $_db.accountLoan)
        .filter(
          (f) => f.stakeholderId.stakeholderId.sqlEquals(
            $_itemColumn<int>('stakeholder_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_accountLoanRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<TransactionEntity>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(
      db.stakeholder.stakeholderId,
      db.transactions.stakeholderId,
    ),
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter(
          (f) => f.stakeholderId.stakeholderId.sqlEquals(
            $_itemColumn<int>('stakeholder_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ReimbursementExpectationTable,
    List<ReimbursementExpectationEntity>
  >
  _reimbursementExpectationRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reimbursementExpectation,
        aliasName: $_aliasNameGenerator(
          db.stakeholder.stakeholderId,
          db.reimbursementExpectation.stakeholderId,
        ),
      );

  $$ReimbursementExpectationTableProcessedTableManager
  get reimbursementExpectationRefs {
    final manager =
        $$ReimbursementExpectationTableTableManager(
          $_db,
          $_db.reimbursementExpectation,
        ).filter(
          (f) => f.stakeholderId.stakeholderId.sqlEquals(
            $_itemColumn<int>('stakeholder_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _reimbursementExpectationRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StakeholderTableFilterComposer
    extends Composer<_$AppDatabase, $StakeholderTable> {
  $$StakeholderTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get stakeholderId => $composableBuilder(
    column: $table.stakeholderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<StakeholderType, StakeholderType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> accountLoanRefs(
    Expression<bool> Function($$AccountLoanTableFilterComposer f) f,
  ) {
    final $$AccountLoanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.accountLoan,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountLoanTableFilterComposer(
            $db: $db,
            $table: $db.accountLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reimbursementExpectationRefs(
    Expression<bool> Function($$ReimbursementExpectationTableFilterComposer f)
    f,
  ) {
    final $$ReimbursementExpectationTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.stakeholderId,
          referencedTable: $db.reimbursementExpectation,
          getReferencedColumn: (t) => t.stakeholderId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReimbursementExpectationTableFilterComposer(
                $db: $db,
                $table: $db.reimbursementExpectation,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$StakeholderTableOrderingComposer
    extends Composer<_$AppDatabase, $StakeholderTable> {
  $$StakeholderTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get stakeholderId => $composableBuilder(
    column: $table.stakeholderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StakeholderTableAnnotationComposer
    extends Composer<_$AppDatabase, $StakeholderTable> {
  $$StakeholderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get stakeholderId => $composableBuilder(
    column: $table.stakeholderId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<StakeholderType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  Expression<T> accountLoanRefs<T extends Object>(
    Expression<T> Function($$AccountLoanTableAnnotationComposer a) f,
  ) {
    final $$AccountLoanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.accountLoan,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountLoanTableAnnotationComposer(
            $db: $db,
            $table: $db.accountLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reimbursementExpectationRefs<T extends Object>(
    Expression<T> Function($$ReimbursementExpectationTableAnnotationComposer a)
    f,
  ) {
    final $$ReimbursementExpectationTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.stakeholderId,
          referencedTable: $db.reimbursementExpectation,
          getReferencedColumn: (t) => t.stakeholderId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReimbursementExpectationTableAnnotationComposer(
                $db: $db,
                $table: $db.reimbursementExpectation,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$StakeholderTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StakeholderTable,
          StakeholderEntity,
          $$StakeholderTableFilterComposer,
          $$StakeholderTableOrderingComposer,
          $$StakeholderTableAnnotationComposer,
          $$StakeholderTableCreateCompanionBuilder,
          $$StakeholderTableUpdateCompanionBuilder,
          (StakeholderEntity, $$StakeholderTableReferences),
          StakeholderEntity,
          PrefetchHooks Function({
            bool accountLoanRefs,
            bool transactionsRefs,
            bool reimbursementExpectationRefs,
          })
        > {
  $$StakeholderTableTableManager(_$AppDatabase db, $StakeholderTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StakeholderTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StakeholderTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StakeholderTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> stakeholderId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<StakeholderType> type = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> contact = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => StakeholderCompanion(
                stakeholderId: stakeholderId,
                name: name,
                type: type,
                avatar: avatar,
                description: description,
                contact: contact,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> stakeholderId = const Value.absent(),
                required String name,
                required StakeholderType type,
                Value<String?> avatar = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> contact = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<String> note = const Value.absent(),
              }) => StakeholderCompanion.insert(
                stakeholderId: stakeholderId,
                name: name,
                type: type,
                avatar: avatar,
                description: description,
                contact: contact,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StakeholderTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                accountLoanRefs = false,
                transactionsRefs = false,
                reimbursementExpectationRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (accountLoanRefs) db.accountLoan,
                    if (transactionsRefs) db.transactions,
                    if (reimbursementExpectationRefs)
                      db.reimbursementExpectation,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (accountLoanRefs)
                        await $_getPrefetchedData<
                          StakeholderEntity,
                          $StakeholderTable,
                          LoanAccountEntity
                        >(
                          currentTable: table,
                          referencedTable: $$StakeholderTableReferences
                              ._accountLoanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StakeholderTableReferences(
                                db,
                                table,
                                p0,
                              ).accountLoanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.stakeholderId == item.stakeholderId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionsRefs)
                        await $_getPrefetchedData<
                          StakeholderEntity,
                          $StakeholderTable,
                          TransactionEntity
                        >(
                          currentTable: table,
                          referencedTable: $$StakeholderTableReferences
                              ._transactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StakeholderTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.stakeholderId == item.stakeholderId,
                              ),
                          typedResults: items,
                        ),
                      if (reimbursementExpectationRefs)
                        await $_getPrefetchedData<
                          StakeholderEntity,
                          $StakeholderTable,
                          ReimbursementExpectationEntity
                        >(
                          currentTable: table,
                          referencedTable: $$StakeholderTableReferences
                              ._reimbursementExpectationRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StakeholderTableReferences(
                                db,
                                table,
                                p0,
                              ).reimbursementExpectationRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.stakeholderId == item.stakeholderId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StakeholderTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StakeholderTable,
      StakeholderEntity,
      $$StakeholderTableFilterComposer,
      $$StakeholderTableOrderingComposer,
      $$StakeholderTableAnnotationComposer,
      $$StakeholderTableCreateCompanionBuilder,
      $$StakeholderTableUpdateCompanionBuilder,
      (StakeholderEntity, $$StakeholderTableReferences),
      StakeholderEntity,
      PrefetchHooks Function({
        bool accountLoanRefs,
        bool transactionsRefs,
        bool reimbursementExpectationRefs,
      })
    >;
typedef $$AccountLoanTableCreateCompanionBuilder =
    AccountLoanCompanion Function({
      Value<int> accountId,
      required int stakeholderId,
      required AccountLoanType type,
      required int amount,
      required int rate,
      required int startDate,
      required int endDate,
      Value<bool> archived,
      Value<String> note,
    });
typedef $$AccountLoanTableUpdateCompanionBuilder =
    AccountLoanCompanion Function({
      Value<int> accountId,
      Value<int> stakeholderId,
      Value<AccountLoanType> type,
      Value<int> amount,
      Value<int> rate,
      Value<int> startDate,
      Value<int> endDate,
      Value<bool> archived,
      Value<String> note,
    });

final class $$AccountLoanTableReferences
    extends
        BaseReferences<_$AppDatabase, $AccountLoanTable, LoanAccountEntity> {
  $$AccountLoanTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountTable _accountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.accountLoan.accountId, db.account.accountId),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StakeholderTable _stakeholderIdTable(_$AppDatabase db) =>
      db.stakeholder.createAlias(
        $_aliasNameGenerator(
          db.accountLoan.stakeholderId,
          db.stakeholder.stakeholderId,
        ),
      );

  $$StakeholderTableProcessedTableManager get stakeholderId {
    final $_column = $_itemColumn<int>('stakeholder_id')!;

    final manager = $$StakeholderTableTableManager(
      $_db,
      $_db.stakeholder,
    ).filter((f) => f.stakeholderId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stakeholderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountLoanTableFilterComposer
    extends Composer<_$AppDatabase, $AccountLoanTable> {
  $$AccountLoanTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<AccountLoanType, AccountLoanType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StakeholderTableFilterComposer get stakeholderId {
    final $$StakeholderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StakeholderTableFilterComposer(
            $db: $db,
            $table: $db.stakeholder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountLoanTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountLoanTable> {
  $$AccountLoanTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StakeholderTableOrderingComposer get stakeholderId {
    final $$StakeholderTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StakeholderTableOrderingComposer(
            $db: $db,
            $table: $db.stakeholder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountLoanTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountLoanTable> {
  $$AccountLoanTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<AccountLoanType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<int> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<int> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StakeholderTableAnnotationComposer get stakeholderId {
    final $$StakeholderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StakeholderTableAnnotationComposer(
            $db: $db,
            $table: $db.stakeholder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountLoanTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountLoanTable,
          LoanAccountEntity,
          $$AccountLoanTableFilterComposer,
          $$AccountLoanTableOrderingComposer,
          $$AccountLoanTableAnnotationComposer,
          $$AccountLoanTableCreateCompanionBuilder,
          $$AccountLoanTableUpdateCompanionBuilder,
          (LoanAccountEntity, $$AccountLoanTableReferences),
          LoanAccountEntity,
          PrefetchHooks Function({bool accountId, bool stakeholderId})
        > {
  $$AccountLoanTableTableManager(_$AppDatabase db, $AccountLoanTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountLoanTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountLoanTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountLoanTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                Value<int> stakeholderId = const Value.absent(),
                Value<AccountLoanType> type = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> rate = const Value.absent(),
                Value<int> startDate = const Value.absent(),
                Value<int> endDate = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => AccountLoanCompanion(
                accountId: accountId,
                stakeholderId: stakeholderId,
                type: type,
                amount: amount,
                rate: rate,
                startDate: startDate,
                endDate: endDate,
                archived: archived,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                required int stakeholderId,
                required AccountLoanType type,
                required int amount,
                required int rate,
                required int startDate,
                required int endDate,
                Value<bool> archived = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => AccountLoanCompanion.insert(
                accountId: accountId,
                stakeholderId: stakeholderId,
                type: type,
                amount: amount,
                rate: rate,
                startDate: startDate,
                endDate: endDate,
                archived: archived,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountLoanTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountId = false, stakeholderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (accountId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accountId,
                                referencedTable: $$AccountLoanTableReferences
                                    ._accountIdTable(db),
                                referencedColumn: $$AccountLoanTableReferences
                                    ._accountIdTable(db)
                                    .accountId,
                              )
                              as T;
                    }
                    if (stakeholderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.stakeholderId,
                                referencedTable: $$AccountLoanTableReferences
                                    ._stakeholderIdTable(db),
                                referencedColumn: $$AccountLoanTableReferences
                                    ._stakeholderIdTable(db)
                                    .stakeholderId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AccountLoanTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountLoanTable,
      LoanAccountEntity,
      $$AccountLoanTableFilterComposer,
      $$AccountLoanTableOrderingComposer,
      $$AccountLoanTableAnnotationComposer,
      $$AccountLoanTableCreateCompanionBuilder,
      $$AccountLoanTableUpdateCompanionBuilder,
      (LoanAccountEntity, $$AccountLoanTableReferences),
      LoanAccountEntity,
      PrefetchHooks Function({bool accountId, bool stakeholderId})
    >;
typedef $$LoanPlanTableCreateCompanionBuilder =
    LoanPlanCompanion Function({
      Value<int> loanPlanId,
      required int accountId,
      required int amount,
      required int dueDate,
      required int createdAt,
      required int updatedAt,
      Value<String> note,
    });
typedef $$LoanPlanTableUpdateCompanionBuilder =
    LoanPlanCompanion Function({
      Value<int> loanPlanId,
      Value<int> accountId,
      Value<int> amount,
      Value<int> dueDate,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String> note,
    });

final class $$LoanPlanTableReferences
    extends BaseReferences<_$AppDatabase, $LoanPlanTable, LoanPlanEntity> {
  $$LoanPlanTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountTable _accountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.loanPlan.accountId, db.account.accountId),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LoanPlanTableFilterComposer
    extends Composer<_$AppDatabase, $LoanPlanTable> {
  $$LoanPlanTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get loanPlanId => $composableBuilder(
    column: $table.loanPlanId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoanPlanTableOrderingComposer
    extends Composer<_$AppDatabase, $LoanPlanTable> {
  $$LoanPlanTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get loanPlanId => $composableBuilder(
    column: $table.loanPlanId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoanPlanTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoanPlanTable> {
  $$LoanPlanTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get loanPlanId => $composableBuilder(
    column: $table.loanPlanId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoanPlanTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LoanPlanTable,
          LoanPlanEntity,
          $$LoanPlanTableFilterComposer,
          $$LoanPlanTableOrderingComposer,
          $$LoanPlanTableAnnotationComposer,
          $$LoanPlanTableCreateCompanionBuilder,
          $$LoanPlanTableUpdateCompanionBuilder,
          (LoanPlanEntity, $$LoanPlanTableReferences),
          LoanPlanEntity,
          PrefetchHooks Function({bool accountId})
        > {
  $$LoanPlanTableTableManager(_$AppDatabase db, $LoanPlanTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoanPlanTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoanPlanTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoanPlanTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> loanPlanId = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> dueDate = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => LoanPlanCompanion(
                loanPlanId: loanPlanId,
                accountId: accountId,
                amount: amount,
                dueDate: dueDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> loanPlanId = const Value.absent(),
                required int accountId,
                required int amount,
                required int dueDate,
                required int createdAt,
                required int updatedAt,
                Value<String> note = const Value.absent(),
              }) => LoanPlanCompanion.insert(
                loanPlanId: loanPlanId,
                accountId: accountId,
                amount: amount,
                dueDate: dueDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LoanPlanTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (accountId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accountId,
                                referencedTable: $$LoanPlanTableReferences
                                    ._accountIdTable(db),
                                referencedColumn: $$LoanPlanTableReferences
                                    ._accountIdTable(db)
                                    .accountId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LoanPlanTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LoanPlanTable,
      LoanPlanEntity,
      $$LoanPlanTableFilterComposer,
      $$LoanPlanTableOrderingComposer,
      $$LoanPlanTableAnnotationComposer,
      $$LoanPlanTableCreateCompanionBuilder,
      $$LoanPlanTableUpdateCompanionBuilder,
      (LoanPlanEntity, $$LoanPlanTableReferences),
      LoanPlanEntity,
      PrefetchHooks Function({bool accountId})
    >;
typedef $$LoanRecordTableCreateCompanionBuilder =
    LoanRecordCompanion Function({
      Value<int> loanRecordId,
      required int accountId,
      required int amount,
      required int timestamp,
      required int createdAt,
      required int updatedAt,
      Value<String> note,
    });
typedef $$LoanRecordTableUpdateCompanionBuilder =
    LoanRecordCompanion Function({
      Value<int> loanRecordId,
      Value<int> accountId,
      Value<int> amount,
      Value<int> timestamp,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String> note,
    });

final class $$LoanRecordTableReferences
    extends BaseReferences<_$AppDatabase, $LoanRecordTable, LoanRecordEntity> {
  $$LoanRecordTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountTable _accountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.loanRecord.accountId, db.account.accountId),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LoanRecordTableFilterComposer
    extends Composer<_$AppDatabase, $LoanRecordTable> {
  $$LoanRecordTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get loanRecordId => $composableBuilder(
    column: $table.loanRecordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoanRecordTableOrderingComposer
    extends Composer<_$AppDatabase, $LoanRecordTable> {
  $$LoanRecordTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get loanRecordId => $composableBuilder(
    column: $table.loanRecordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoanRecordTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoanRecordTable> {
  $$LoanRecordTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get loanRecordId => $composableBuilder(
    column: $table.loanRecordId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoanRecordTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LoanRecordTable,
          LoanRecordEntity,
          $$LoanRecordTableFilterComposer,
          $$LoanRecordTableOrderingComposer,
          $$LoanRecordTableAnnotationComposer,
          $$LoanRecordTableCreateCompanionBuilder,
          $$LoanRecordTableUpdateCompanionBuilder,
          (LoanRecordEntity, $$LoanRecordTableReferences),
          LoanRecordEntity,
          PrefetchHooks Function({bool accountId})
        > {
  $$LoanRecordTableTableManager(_$AppDatabase db, $LoanRecordTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoanRecordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoanRecordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoanRecordTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> loanRecordId = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => LoanRecordCompanion(
                loanRecordId: loanRecordId,
                accountId: accountId,
                amount: amount,
                timestamp: timestamp,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> loanRecordId = const Value.absent(),
                required int accountId,
                required int amount,
                required int timestamp,
                required int createdAt,
                required int updatedAt,
                Value<String> note = const Value.absent(),
              }) => LoanRecordCompanion.insert(
                loanRecordId: loanRecordId,
                accountId: accountId,
                amount: amount,
                timestamp: timestamp,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LoanRecordTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (accountId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accountId,
                                referencedTable: $$LoanRecordTableReferences
                                    ._accountIdTable(db),
                                referencedColumn: $$LoanRecordTableReferences
                                    ._accountIdTable(db)
                                    .accountId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LoanRecordTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LoanRecordTable,
      LoanRecordEntity,
      $$LoanRecordTableFilterComposer,
      $$LoanRecordTableOrderingComposer,
      $$LoanRecordTableAnnotationComposer,
      $$LoanRecordTableCreateCompanionBuilder,
      $$LoanRecordTableUpdateCompanionBuilder,
      (LoanRecordEntity, $$LoanRecordTableReferences),
      LoanRecordEntity,
      PrefetchHooks Function({bool accountId})
    >;
typedef $$LedgerTableCreateCompanionBuilder =
    LedgerCompanion Function({
      Value<int> ledgerId,
      required String name,
      required String currencyCode,
      Value<String> description,
      Value<String?> photo,
      Value<bool> autoAccount,
      Value<bool> autoCategory,
      required int createdAt,
      required int updatedAt,
      Value<String> note,
    });
typedef $$LedgerTableUpdateCompanionBuilder =
    LedgerCompanion Function({
      Value<int> ledgerId,
      Value<String> name,
      Value<String> currencyCode,
      Value<String> description,
      Value<String?> photo,
      Value<bool> autoAccount,
      Value<bool> autoCategory,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String> note,
    });

final class $$LedgerTableReferences
    extends BaseReferences<_$AppDatabase, $LedgerTable, LedgerEntity> {
  $$LedgerTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CurrencyTable _currencyCodeTable(_$AppDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(db.ledger.currencyCode, db.currency.currencyCode),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.currencyCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $RelationAccountLedgerTable,
    List<LedgerAccountRelationEntity>
  >
  _relationAccountLedgerRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationAccountLedger,
        aliasName: $_aliasNameGenerator(
          db.ledger.ledgerId,
          db.relationAccountLedger.ledgerId,
        ),
      );

  $$RelationAccountLedgerTableProcessedTableManager
  get relationAccountLedgerRefs {
    final manager =
        $$RelationAccountLedgerTableTableManager(
          $_db,
          $_db.relationAccountLedger,
        ).filter(
          (f) => f.ledgerId.ledgerId.sqlEquals($_itemColumn<int>('ledger_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _relationAccountLedgerRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectTable, List<ProjectEntity>>
  _projectRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.project,
    aliasName: $_aliasNameGenerator(db.ledger.ledgerId, db.project.ledgerId),
  );

  $$ProjectTableProcessedTableManager get projectRefs {
    final manager = $$ProjectTableTableManager($_db, $_db.project).filter(
      (f) => f.ledgerId.ledgerId.sqlEquals($_itemColumn<int>('ledger_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_projectRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RelationCategoryLedgerTable,
    List<LedgerCategoryRelationEntity>
  >
  _relationCategoryLedgerRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationCategoryLedger,
        aliasName: $_aliasNameGenerator(
          db.ledger.ledgerId,
          db.relationCategoryLedger.ledgerId,
        ),
      );

  $$RelationCategoryLedgerTableProcessedTableManager
  get relationCategoryLedgerRefs {
    final manager =
        $$RelationCategoryLedgerTableTableManager(
          $_db,
          $_db.relationCategoryLedger,
        ).filter(
          (f) => f.ledgerId.ledgerId.sqlEquals($_itemColumn<int>('ledger_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _relationCategoryLedgerRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<TransactionEntity>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(
      db.ledger.ledgerId,
      db.transactions.ledgerId,
    ),
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter(
          (f) => f.ledgerId.ledgerId.sqlEquals($_itemColumn<int>('ledger_id')!),
        );

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LedgerTableFilterComposer
    extends Composer<_$AppDatabase, $LedgerTable> {
  $$LedgerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get ledgerId => $composableBuilder(
    column: $table.ledgerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photo => $composableBuilder(
    column: $table.photo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get autoAccount => $composableBuilder(
    column: $table.autoAccount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get autoCategory => $composableBuilder(
    column: $table.autoCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$CurrencyTableFilterComposer get currencyCode {
    final $$CurrencyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableFilterComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> relationAccountLedgerRefs(
    Expression<bool> Function($$RelationAccountLedgerTableFilterComposer f) f,
  ) {
    final $$RelationAccountLedgerTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.ledgerId,
          referencedTable: $db.relationAccountLedger,
          getReferencedColumn: (t) => t.ledgerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationAccountLedgerTableFilterComposer(
                $db: $db,
                $table: $db.relationAccountLedger,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> projectRefs(
    Expression<bool> Function($$ProjectTableFilterComposer f) f,
  ) {
    final $$ProjectTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTableFilterComposer(
            $db: $db,
            $table: $db.project,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> relationCategoryLedgerRefs(
    Expression<bool> Function($$RelationCategoryLedgerTableFilterComposer f) f,
  ) {
    final $$RelationCategoryLedgerTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.ledgerId,
          referencedTable: $db.relationCategoryLedger,
          getReferencedColumn: (t) => t.ledgerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationCategoryLedgerTableFilterComposer(
                $db: $db,
                $table: $db.relationCategoryLedger,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LedgerTableOrderingComposer
    extends Composer<_$AppDatabase, $LedgerTable> {
  $$LedgerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get ledgerId => $composableBuilder(
    column: $table.ledgerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photo => $composableBuilder(
    column: $table.photo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get autoAccount => $composableBuilder(
    column: $table.autoAccount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get autoCategory => $composableBuilder(
    column: $table.autoCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$CurrencyTableOrderingComposer get currencyCode {
    final $$CurrencyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableOrderingComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LedgerTableAnnotationComposer
    extends Composer<_$AppDatabase, $LedgerTable> {
  $$LedgerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get ledgerId =>
      $composableBuilder(column: $table.ledgerId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photo =>
      $composableBuilder(column: $table.photo, builder: (column) => column);

  GeneratedColumn<bool> get autoAccount => $composableBuilder(
    column: $table.autoAccount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get autoCategory => $composableBuilder(
    column: $table.autoCategory,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$CurrencyTableAnnotationComposer get currencyCode {
    final $$CurrencyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableAnnotationComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> relationAccountLedgerRefs<T extends Object>(
    Expression<T> Function($$RelationAccountLedgerTableAnnotationComposer a) f,
  ) {
    final $$RelationAccountLedgerTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.ledgerId,
          referencedTable: $db.relationAccountLedger,
          getReferencedColumn: (t) => t.ledgerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationAccountLedgerTableAnnotationComposer(
                $db: $db,
                $table: $db.relationAccountLedger,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> projectRefs<T extends Object>(
    Expression<T> Function($$ProjectTableAnnotationComposer a) f,
  ) {
    final $$ProjectTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTableAnnotationComposer(
            $db: $db,
            $table: $db.project,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> relationCategoryLedgerRefs<T extends Object>(
    Expression<T> Function($$RelationCategoryLedgerTableAnnotationComposer a) f,
  ) {
    final $$RelationCategoryLedgerTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.ledgerId,
          referencedTable: $db.relationCategoryLedger,
          getReferencedColumn: (t) => t.ledgerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationCategoryLedgerTableAnnotationComposer(
                $db: $db,
                $table: $db.relationCategoryLedger,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LedgerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LedgerTable,
          LedgerEntity,
          $$LedgerTableFilterComposer,
          $$LedgerTableOrderingComposer,
          $$LedgerTableAnnotationComposer,
          $$LedgerTableCreateCompanionBuilder,
          $$LedgerTableUpdateCompanionBuilder,
          (LedgerEntity, $$LedgerTableReferences),
          LedgerEntity,
          PrefetchHooks Function({
            bool currencyCode,
            bool relationAccountLedgerRefs,
            bool projectRefs,
            bool relationCategoryLedgerRefs,
            bool transactionsRefs,
          })
        > {
  $$LedgerTableTableManager(_$AppDatabase db, $LedgerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LedgerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LedgerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LedgerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> ledgerId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> photo = const Value.absent(),
                Value<bool> autoAccount = const Value.absent(),
                Value<bool> autoCategory = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => LedgerCompanion(
                ledgerId: ledgerId,
                name: name,
                currencyCode: currencyCode,
                description: description,
                photo: photo,
                autoAccount: autoAccount,
                autoCategory: autoCategory,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> ledgerId = const Value.absent(),
                required String name,
                required String currencyCode,
                Value<String> description = const Value.absent(),
                Value<String?> photo = const Value.absent(),
                Value<bool> autoAccount = const Value.absent(),
                Value<bool> autoCategory = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<String> note = const Value.absent(),
              }) => LedgerCompanion.insert(
                ledgerId: ledgerId,
                name: name,
                currencyCode: currencyCode,
                description: description,
                photo: photo,
                autoAccount: autoAccount,
                autoCategory: autoCategory,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LedgerTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                currencyCode = false,
                relationAccountLedgerRefs = false,
                projectRefs = false,
                relationCategoryLedgerRefs = false,
                transactionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (relationAccountLedgerRefs) db.relationAccountLedger,
                    if (projectRefs) db.project,
                    if (relationCategoryLedgerRefs) db.relationCategoryLedger,
                    if (transactionsRefs) db.transactions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (currencyCode) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currencyCode,
                                    referencedTable: $$LedgerTableReferences
                                        ._currencyCodeTable(db),
                                    referencedColumn: $$LedgerTableReferences
                                        ._currencyCodeTable(db)
                                        .currencyCode,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (relationAccountLedgerRefs)
                        await $_getPrefetchedData<
                          LedgerEntity,
                          $LedgerTable,
                          LedgerAccountRelationEntity
                        >(
                          currentTable: table,
                          referencedTable: $$LedgerTableReferences
                              ._relationAccountLedgerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LedgerTableReferences(
                                db,
                                table,
                                p0,
                              ).relationAccountLedgerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ledgerId == item.ledgerId,
                              ),
                          typedResults: items,
                        ),
                      if (projectRefs)
                        await $_getPrefetchedData<
                          LedgerEntity,
                          $LedgerTable,
                          ProjectEntity
                        >(
                          currentTable: table,
                          referencedTable: $$LedgerTableReferences
                              ._projectRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LedgerTableReferences(
                                db,
                                table,
                                p0,
                              ).projectRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ledgerId == item.ledgerId,
                              ),
                          typedResults: items,
                        ),
                      if (relationCategoryLedgerRefs)
                        await $_getPrefetchedData<
                          LedgerEntity,
                          $LedgerTable,
                          LedgerCategoryRelationEntity
                        >(
                          currentTable: table,
                          referencedTable: $$LedgerTableReferences
                              ._relationCategoryLedgerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LedgerTableReferences(
                                db,
                                table,
                                p0,
                              ).relationCategoryLedgerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ledgerId == item.ledgerId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionsRefs)
                        await $_getPrefetchedData<
                          LedgerEntity,
                          $LedgerTable,
                          TransactionEntity
                        >(
                          currentTable: table,
                          referencedTable: $$LedgerTableReferences
                              ._transactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LedgerTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ledgerId == item.ledgerId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LedgerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LedgerTable,
      LedgerEntity,
      $$LedgerTableFilterComposer,
      $$LedgerTableOrderingComposer,
      $$LedgerTableAnnotationComposer,
      $$LedgerTableCreateCompanionBuilder,
      $$LedgerTableUpdateCompanionBuilder,
      (LedgerEntity, $$LedgerTableReferences),
      LedgerEntity,
      PrefetchHooks Function({
        bool currencyCode,
        bool relationAccountLedgerRefs,
        bool projectRefs,
        bool relationCategoryLedgerRefs,
        bool transactionsRefs,
      })
    >;
typedef $$RelationAccountLedgerTableCreateCompanionBuilder =
    RelationAccountLedgerCompanion Function({
      required int accountId,
      required int ledgerId,
      Value<int> rowid,
    });
typedef $$RelationAccountLedgerTableUpdateCompanionBuilder =
    RelationAccountLedgerCompanion Function({
      Value<int> accountId,
      Value<int> ledgerId,
      Value<int> rowid,
    });

final class $$RelationAccountLedgerTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RelationAccountLedgerTable,
          LedgerAccountRelationEntity
        > {
  $$RelationAccountLedgerTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AccountTable _accountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(
          db.relationAccountLedger.accountId,
          db.account.accountId,
        ),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LedgerTable _ledgerIdTable(_$AppDatabase db) => db.ledger.createAlias(
    $_aliasNameGenerator(db.relationAccountLedger.ledgerId, db.ledger.ledgerId),
  );

  $$LedgerTableProcessedTableManager get ledgerId {
    final $_column = $_itemColumn<int>('ledger_id')!;

    final manager = $$LedgerTableTableManager(
      $_db,
      $_db.ledger,
    ).filter((f) => f.ledgerId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ledgerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RelationAccountLedgerTableFilterComposer
    extends Composer<_$AppDatabase, $RelationAccountLedgerTable> {
  $$RelationAccountLedgerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LedgerTableFilterComposer get ledgerId {
    final $$LedgerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableFilterComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationAccountLedgerTableOrderingComposer
    extends Composer<_$AppDatabase, $RelationAccountLedgerTable> {
  $$RelationAccountLedgerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LedgerTableOrderingComposer get ledgerId {
    final $$LedgerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableOrderingComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationAccountLedgerTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelationAccountLedgerTable> {
  $$RelationAccountLedgerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LedgerTableAnnotationComposer get ledgerId {
    final $$LedgerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableAnnotationComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationAccountLedgerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelationAccountLedgerTable,
          LedgerAccountRelationEntity,
          $$RelationAccountLedgerTableFilterComposer,
          $$RelationAccountLedgerTableOrderingComposer,
          $$RelationAccountLedgerTableAnnotationComposer,
          $$RelationAccountLedgerTableCreateCompanionBuilder,
          $$RelationAccountLedgerTableUpdateCompanionBuilder,
          (LedgerAccountRelationEntity, $$RelationAccountLedgerTableReferences),
          LedgerAccountRelationEntity,
          PrefetchHooks Function({bool accountId, bool ledgerId})
        > {
  $$RelationAccountLedgerTableTableManager(
    _$AppDatabase db,
    $RelationAccountLedgerTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelationAccountLedgerTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RelationAccountLedgerTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RelationAccountLedgerTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                Value<int> ledgerId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationAccountLedgerCompanion(
                accountId: accountId,
                ledgerId: ledgerId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int accountId,
                required int ledgerId,
                Value<int> rowid = const Value.absent(),
              }) => RelationAccountLedgerCompanion.insert(
                accountId: accountId,
                ledgerId: ledgerId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RelationAccountLedgerTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountId = false, ledgerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (accountId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accountId,
                                referencedTable:
                                    $$RelationAccountLedgerTableReferences
                                        ._accountIdTable(db),
                                referencedColumn:
                                    $$RelationAccountLedgerTableReferences
                                        ._accountIdTable(db)
                                        .accountId,
                              )
                              as T;
                    }
                    if (ledgerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ledgerId,
                                referencedTable:
                                    $$RelationAccountLedgerTableReferences
                                        ._ledgerIdTable(db),
                                referencedColumn:
                                    $$RelationAccountLedgerTableReferences
                                        ._ledgerIdTable(db)
                                        .ledgerId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RelationAccountLedgerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelationAccountLedgerTable,
      LedgerAccountRelationEntity,
      $$RelationAccountLedgerTableFilterComposer,
      $$RelationAccountLedgerTableOrderingComposer,
      $$RelationAccountLedgerTableAnnotationComposer,
      $$RelationAccountLedgerTableCreateCompanionBuilder,
      $$RelationAccountLedgerTableUpdateCompanionBuilder,
      (LedgerAccountRelationEntity, $$RelationAccountLedgerTableReferences),
      LedgerAccountRelationEntity,
      PrefetchHooks Function({bool accountId, bool ledgerId})
    >;
typedef $$ProjectTableCreateCompanionBuilder =
    ProjectCompanion Function({
      Value<int> projectId,
      required int ledgerId,
      required String name,
      Value<String> description,
      Value<int> budget,
      Value<String> icon,
      Value<bool> archived,
      required int createdAt,
      required int updatedAt,
      Value<int?> startDate,
      Value<int?> endDate,
    });
typedef $$ProjectTableUpdateCompanionBuilder =
    ProjectCompanion Function({
      Value<int> projectId,
      Value<int> ledgerId,
      Value<String> name,
      Value<String> description,
      Value<int> budget,
      Value<String> icon,
      Value<bool> archived,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> startDate,
      Value<int?> endDate,
    });

final class $$ProjectTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectTable, ProjectEntity> {
  $$ProjectTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LedgerTable _ledgerIdTable(_$AppDatabase db) => db.ledger.createAlias(
    $_aliasNameGenerator(db.project.ledgerId, db.ledger.ledgerId),
  );

  $$LedgerTableProcessedTableManager get ledgerId {
    final $_column = $_itemColumn<int>('ledger_id')!;

    final manager = $$LedgerTableTableManager(
      $_db,
      $_db.ledger,
    ).filter((f) => f.ledgerId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ledgerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $RelationProjectTransactionTable,
    List<TransactionProjectRelationEntity>
  >
  _relationProjectTransactionRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationProjectTransaction,
        aliasName: $_aliasNameGenerator(
          db.project.projectId,
          db.relationProjectTransaction.projectId,
        ),
      );

  $$RelationProjectTransactionTableProcessedTableManager
  get relationProjectTransactionRefs {
    final manager =
        $$RelationProjectTransactionTableTableManager(
          $_db,
          $_db.relationProjectTransaction,
        ).filter(
          (f) =>
              f.projectId.projectId.sqlEquals($_itemColumn<int>('project_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _relationProjectTransactionRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProjectTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectTable> {
  $$ProjectTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get budget => $composableBuilder(
    column: $table.budget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  $$LedgerTableFilterComposer get ledgerId {
    final $$LedgerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableFilterComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> relationProjectTransactionRefs(
    Expression<bool> Function($$RelationProjectTransactionTableFilterComposer f)
    f,
  ) {
    final $$RelationProjectTransactionTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.projectId,
          referencedTable: $db.relationProjectTransaction,
          getReferencedColumn: (t) => t.projectId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationProjectTransactionTableFilterComposer(
                $db: $db,
                $table: $db.relationProjectTransaction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProjectTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectTable> {
  $$ProjectTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get budget => $composableBuilder(
    column: $table.budget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$LedgerTableOrderingComposer get ledgerId {
    final $$LedgerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableOrderingComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectTable> {
  $$ProjectTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get budget =>
      $composableBuilder(column: $table.budget, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<int> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  $$LedgerTableAnnotationComposer get ledgerId {
    final $$LedgerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableAnnotationComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> relationProjectTransactionRefs<T extends Object>(
    Expression<T> Function(
      $$RelationProjectTransactionTableAnnotationComposer a,
    )
    f,
  ) {
    final $$RelationProjectTransactionTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.projectId,
          referencedTable: $db.relationProjectTransaction,
          getReferencedColumn: (t) => t.projectId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationProjectTransactionTableAnnotationComposer(
                $db: $db,
                $table: $db.relationProjectTransaction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProjectTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectTable,
          ProjectEntity,
          $$ProjectTableFilterComposer,
          $$ProjectTableOrderingComposer,
          $$ProjectTableAnnotationComposer,
          $$ProjectTableCreateCompanionBuilder,
          $$ProjectTableUpdateCompanionBuilder,
          (ProjectEntity, $$ProjectTableReferences),
          ProjectEntity,
          PrefetchHooks Function({
            bool ledgerId,
            bool relationProjectTransactionRefs,
          })
        > {
  $$ProjectTableTableManager(_$AppDatabase db, $ProjectTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> projectId = const Value.absent(),
                Value<int> ledgerId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> budget = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> startDate = const Value.absent(),
                Value<int?> endDate = const Value.absent(),
              }) => ProjectCompanion(
                projectId: projectId,
                ledgerId: ledgerId,
                name: name,
                description: description,
                budget: budget,
                icon: icon,
                archived: archived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                startDate: startDate,
                endDate: endDate,
              ),
          createCompanionCallback:
              ({
                Value<int> projectId = const Value.absent(),
                required int ledgerId,
                required String name,
                Value<String> description = const Value.absent(),
                Value<int> budget = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> startDate = const Value.absent(),
                Value<int?> endDate = const Value.absent(),
              }) => ProjectCompanion.insert(
                projectId: projectId,
                ledgerId: ledgerId,
                name: name,
                description: description,
                budget: budget,
                icon: icon,
                archived: archived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                startDate: startDate,
                endDate: endDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({ledgerId = false, relationProjectTransactionRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (relationProjectTransactionRefs)
                      db.relationProjectTransaction,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ledgerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ledgerId,
                                    referencedTable: $$ProjectTableReferences
                                        ._ledgerIdTable(db),
                                    referencedColumn: $$ProjectTableReferences
                                        ._ledgerIdTable(db)
                                        .ledgerId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (relationProjectTransactionRefs)
                        await $_getPrefetchedData<
                          ProjectEntity,
                          $ProjectTable,
                          TransactionProjectRelationEntity
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectTableReferences
                              ._relationProjectTransactionRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectTableReferences(
                                db,
                                table,
                                p0,
                              ).relationProjectTransactionRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.projectId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProjectTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectTable,
      ProjectEntity,
      $$ProjectTableFilterComposer,
      $$ProjectTableOrderingComposer,
      $$ProjectTableAnnotationComposer,
      $$ProjectTableCreateCompanionBuilder,
      $$ProjectTableUpdateCompanionBuilder,
      (ProjectEntity, $$ProjectTableReferences),
      ProjectEntity,
      PrefetchHooks Function({
        bool ledgerId,
        bool relationProjectTransactionRefs,
      })
    >;
typedef $$CategoryTableCreateCompanionBuilder =
    CategoryCompanion Function({
      Value<int> categoryId,
      Value<int?> parentId,
      required String name,
      required CategoryType type,
      Value<String> icon,
      Value<int> order,
    });
typedef $$CategoryTableUpdateCompanionBuilder =
    CategoryCompanion Function({
      Value<int> categoryId,
      Value<int?> parentId,
      Value<String> name,
      Value<CategoryType> type,
      Value<String> icon,
      Value<int> order,
    });

final class $$CategoryTableReferences
    extends BaseReferences<_$AppDatabase, $CategoryTable, CategoryEntity> {
  $$CategoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoryTable _parentIdTable(_$AppDatabase db) =>
      db.category.createAlias(
        $_aliasNameGenerator(db.category.parentId, db.category.categoryId),
      );

  $$CategoryTableProcessedTableManager? get parentId {
    final $_column = $_itemColumn<int>('parent_id');
    if ($_column == null) return null;
    final manager = $$CategoryTableTableManager(
      $_db,
      $_db.category,
    ).filter((f) => f.categoryId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $RelationCategoryLedgerTable,
    List<LedgerCategoryRelationEntity>
  >
  _relationCategoryLedgerRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationCategoryLedger,
        aliasName: $_aliasNameGenerator(
          db.category.categoryId,
          db.relationCategoryLedger.categoryId,
        ),
      );

  $$RelationCategoryLedgerTableProcessedTableManager
  get relationCategoryLedgerRefs {
    final manager =
        $$RelationCategoryLedgerTableTableManager(
          $_db,
          $_db.relationCategoryLedger,
        ).filter(
          (f) => f.categoryId.categoryId.sqlEquals(
            $_itemColumn<int>('category_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _relationCategoryLedgerRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionCategoryDetailTable,
    List<TransactionCategoryDetailEntity>
  >
  _transactionCategoryDetailRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionCategoryDetail,
        aliasName: $_aliasNameGenerator(
          db.category.categoryId,
          db.transactionCategoryDetail.categoryId,
        ),
      );

  $$TransactionCategoryDetailTableProcessedTableManager
  get transactionCategoryDetailRefs {
    final manager =
        $$TransactionCategoryDetailTableTableManager(
          $_db,
          $_db.transactionCategoryDetail,
        ).filter(
          (f) => f.categoryId.categoryId.sqlEquals(
            $_itemColumn<int>('category_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionCategoryDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionReduceTable,
    List<TransactionReduceEntity>
  >
  _transactionReduceRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionReduce,
        aliasName: $_aliasNameGenerator(
          db.category.categoryId,
          db.transactionReduce.categoryId,
        ),
      );

  $$TransactionReduceTableProcessedTableManager get transactionReduceRefs {
    final manager =
        $$TransactionReduceTableTableManager(
          $_db,
          $_db.transactionReduce,
        ).filter(
          (f) => f.categoryId.categoryId.sqlEquals(
            $_itemColumn<int>('category_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionReduceRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoryTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CategoryType, CategoryType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoryTableFilterComposer get parentId {
    final $$CategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableFilterComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> relationCategoryLedgerRefs(
    Expression<bool> Function($$RelationCategoryLedgerTableFilterComposer f) f,
  ) {
    final $$RelationCategoryLedgerTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.relationCategoryLedger,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationCategoryLedgerTableFilterComposer(
                $db: $db,
                $table: $db.relationCategoryLedger,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionCategoryDetailRefs(
    Expression<bool> Function($$TransactionCategoryDetailTableFilterComposer f)
    f,
  ) {
    final $$TransactionCategoryDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.transactionCategoryDetail,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCategoryDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionCategoryDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionReduceRefs(
    Expression<bool> Function($$TransactionReduceTableFilterComposer f) f,
  ) {
    final $$TransactionReduceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.transactionReduce,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionReduceTableFilterComposer(
            $db: $db,
            $table: $db.transactionReduce,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoryTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoryTableOrderingComposer get parentId {
    final $$CategoryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableOrderingComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CategoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CategoryType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  $$CategoryTableAnnotationComposer get parentId {
    final $$CategoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableAnnotationComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> relationCategoryLedgerRefs<T extends Object>(
    Expression<T> Function($$RelationCategoryLedgerTableAnnotationComposer a) f,
  ) {
    final $$RelationCategoryLedgerTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.relationCategoryLedger,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationCategoryLedgerTableAnnotationComposer(
                $db: $db,
                $table: $db.relationCategoryLedger,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionCategoryDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionCategoryDetailTableAnnotationComposer a)
    f,
  ) {
    final $$TransactionCategoryDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.transactionCategoryDetail,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCategoryDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionCategoryDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionReduceRefs<T extends Object>(
    Expression<T> Function($$TransactionReduceTableAnnotationComposer a) f,
  ) {
    final $$TransactionReduceTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.transactionReduce,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionReduceTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionReduce,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CategoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryTable,
          CategoryEntity,
          $$CategoryTableFilterComposer,
          $$CategoryTableOrderingComposer,
          $$CategoryTableAnnotationComposer,
          $$CategoryTableCreateCompanionBuilder,
          $$CategoryTableUpdateCompanionBuilder,
          (CategoryEntity, $$CategoryTableReferences),
          CategoryEntity,
          PrefetchHooks Function({
            bool parentId,
            bool relationCategoryLedgerRefs,
            bool transactionCategoryDetailRefs,
            bool transactionReduceRefs,
          })
        > {
  $$CategoryTableTableManager(_$AppDatabase db, $CategoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> categoryId = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<CategoryType> type = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<int> order = const Value.absent(),
              }) => CategoryCompanion(
                categoryId: categoryId,
                parentId: parentId,
                name: name,
                type: type,
                icon: icon,
                order: order,
              ),
          createCompanionCallback:
              ({
                Value<int> categoryId = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                required String name,
                required CategoryType type,
                Value<String> icon = const Value.absent(),
                Value<int> order = const Value.absent(),
              }) => CategoryCompanion.insert(
                categoryId: categoryId,
                parentId: parentId,
                name: name,
                type: type,
                icon: icon,
                order: order,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                parentId = false,
                relationCategoryLedgerRefs = false,
                transactionCategoryDetailRefs = false,
                transactionReduceRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (relationCategoryLedgerRefs) db.relationCategoryLedger,
                    if (transactionCategoryDetailRefs)
                      db.transactionCategoryDetail,
                    if (transactionReduceRefs) db.transactionReduce,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (parentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.parentId,
                                    referencedTable: $$CategoryTableReferences
                                        ._parentIdTable(db),
                                    referencedColumn: $$CategoryTableReferences
                                        ._parentIdTable(db)
                                        .categoryId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (relationCategoryLedgerRefs)
                        await $_getPrefetchedData<
                          CategoryEntity,
                          $CategoryTable,
                          LedgerCategoryRelationEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CategoryTableReferences
                              ._relationCategoryLedgerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoryTableReferences(
                                db,
                                table,
                                p0,
                              ).relationCategoryLedgerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.categoryId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionCategoryDetailRefs)
                        await $_getPrefetchedData<
                          CategoryEntity,
                          $CategoryTable,
                          TransactionCategoryDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CategoryTableReferences
                              ._transactionCategoryDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoryTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionCategoryDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.categoryId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionReduceRefs)
                        await $_getPrefetchedData<
                          CategoryEntity,
                          $CategoryTable,
                          TransactionReduceEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CategoryTableReferences
                              ._transactionReduceRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoryTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionReduceRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.categoryId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CategoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryTable,
      CategoryEntity,
      $$CategoryTableFilterComposer,
      $$CategoryTableOrderingComposer,
      $$CategoryTableAnnotationComposer,
      $$CategoryTableCreateCompanionBuilder,
      $$CategoryTableUpdateCompanionBuilder,
      (CategoryEntity, $$CategoryTableReferences),
      CategoryEntity,
      PrefetchHooks Function({
        bool parentId,
        bool relationCategoryLedgerRefs,
        bool transactionCategoryDetailRefs,
        bool transactionReduceRefs,
      })
    >;
typedef $$RelationCategoryLedgerTableCreateCompanionBuilder =
    RelationCategoryLedgerCompanion Function({
      required int categoryId,
      required int ledgerId,
      Value<int> rowid,
    });
typedef $$RelationCategoryLedgerTableUpdateCompanionBuilder =
    RelationCategoryLedgerCompanion Function({
      Value<int> categoryId,
      Value<int> ledgerId,
      Value<int> rowid,
    });

final class $$RelationCategoryLedgerTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RelationCategoryLedgerTable,
          LedgerCategoryRelationEntity
        > {
  $$RelationCategoryLedgerTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CategoryTable _categoryIdTable(_$AppDatabase db) =>
      db.category.createAlias(
        $_aliasNameGenerator(
          db.relationCategoryLedger.categoryId,
          db.category.categoryId,
        ),
      );

  $$CategoryTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoryTableTableManager(
      $_db,
      $_db.category,
    ).filter((f) => f.categoryId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LedgerTable _ledgerIdTable(_$AppDatabase db) => db.ledger.createAlias(
    $_aliasNameGenerator(
      db.relationCategoryLedger.ledgerId,
      db.ledger.ledgerId,
    ),
  );

  $$LedgerTableProcessedTableManager get ledgerId {
    final $_column = $_itemColumn<int>('ledger_id')!;

    final manager = $$LedgerTableTableManager(
      $_db,
      $_db.ledger,
    ).filter((f) => f.ledgerId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ledgerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RelationCategoryLedgerTableFilterComposer
    extends Composer<_$AppDatabase, $RelationCategoryLedgerTable> {
  $$RelationCategoryLedgerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CategoryTableFilterComposer get categoryId {
    final $$CategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableFilterComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LedgerTableFilterComposer get ledgerId {
    final $$LedgerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableFilterComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationCategoryLedgerTableOrderingComposer
    extends Composer<_$AppDatabase, $RelationCategoryLedgerTable> {
  $$RelationCategoryLedgerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CategoryTableOrderingComposer get categoryId {
    final $$CategoryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableOrderingComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LedgerTableOrderingComposer get ledgerId {
    final $$LedgerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableOrderingComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationCategoryLedgerTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelationCategoryLedgerTable> {
  $$RelationCategoryLedgerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CategoryTableAnnotationComposer get categoryId {
    final $$CategoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableAnnotationComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LedgerTableAnnotationComposer get ledgerId {
    final $$LedgerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableAnnotationComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationCategoryLedgerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelationCategoryLedgerTable,
          LedgerCategoryRelationEntity,
          $$RelationCategoryLedgerTableFilterComposer,
          $$RelationCategoryLedgerTableOrderingComposer,
          $$RelationCategoryLedgerTableAnnotationComposer,
          $$RelationCategoryLedgerTableCreateCompanionBuilder,
          $$RelationCategoryLedgerTableUpdateCompanionBuilder,
          (
            LedgerCategoryRelationEntity,
            $$RelationCategoryLedgerTableReferences,
          ),
          LedgerCategoryRelationEntity,
          PrefetchHooks Function({bool categoryId, bool ledgerId})
        > {
  $$RelationCategoryLedgerTableTableManager(
    _$AppDatabase db,
    $RelationCategoryLedgerTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelationCategoryLedgerTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RelationCategoryLedgerTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RelationCategoryLedgerTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> categoryId = const Value.absent(),
                Value<int> ledgerId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationCategoryLedgerCompanion(
                categoryId: categoryId,
                ledgerId: ledgerId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int categoryId,
                required int ledgerId,
                Value<int> rowid = const Value.absent(),
              }) => RelationCategoryLedgerCompanion.insert(
                categoryId: categoryId,
                ledgerId: ledgerId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RelationCategoryLedgerTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({categoryId = false, ledgerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable:
                                    $$RelationCategoryLedgerTableReferences
                                        ._categoryIdTable(db),
                                referencedColumn:
                                    $$RelationCategoryLedgerTableReferences
                                        ._categoryIdTable(db)
                                        .categoryId,
                              )
                              as T;
                    }
                    if (ledgerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ledgerId,
                                referencedTable:
                                    $$RelationCategoryLedgerTableReferences
                                        ._ledgerIdTable(db),
                                referencedColumn:
                                    $$RelationCategoryLedgerTableReferences
                                        ._ledgerIdTable(db)
                                        .ledgerId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RelationCategoryLedgerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelationCategoryLedgerTable,
      LedgerCategoryRelationEntity,
      $$RelationCategoryLedgerTableFilterComposer,
      $$RelationCategoryLedgerTableOrderingComposer,
      $$RelationCategoryLedgerTableAnnotationComposer,
      $$RelationCategoryLedgerTableCreateCompanionBuilder,
      $$RelationCategoryLedgerTableUpdateCompanionBuilder,
      (LedgerCategoryRelationEntity, $$RelationCategoryLedgerTableReferences),
      LedgerCategoryRelationEntity,
      PrefetchHooks Function({bool categoryId, bool ledgerId})
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      Value<int> transactionId,
      required int ledgerId,
      required TransactionType type,
      required int timestamp,
      required int createdAt,
      required int updatedAt,
      Value<int?> stakeholderId,
      Value<bool> hidden,
      Value<bool> excluded,
      Value<String?> locationName,
      Value<double?> locationLat,
      Value<double?> locationLng,
      Value<String> note,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<int> transactionId,
      Value<int> ledgerId,
      Value<TransactionType> type,
      Value<int> timestamp,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> stakeholderId,
      Value<bool> hidden,
      Value<bool> excluded,
      Value<String?> locationName,
      Value<double?> locationLat,
      Value<double?> locationLng,
      Value<String> note,
    });

final class $$TransactionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $TransactionsTable, TransactionEntity> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LedgerTable _ledgerIdTable(_$AppDatabase db) => db.ledger.createAlias(
    $_aliasNameGenerator(db.transactions.ledgerId, db.ledger.ledgerId),
  );

  $$LedgerTableProcessedTableManager get ledgerId {
    final $_column = $_itemColumn<int>('ledger_id')!;

    final manager = $$LedgerTableTableManager(
      $_db,
      $_db.ledger,
    ).filter((f) => f.ledgerId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ledgerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StakeholderTable _stakeholderIdTable(_$AppDatabase db) =>
      db.stakeholder.createAlias(
        $_aliasNameGenerator(
          db.transactions.stakeholderId,
          db.stakeholder.stakeholderId,
        ),
      );

  $$StakeholderTableProcessedTableManager? get stakeholderId {
    final $_column = $_itemColumn<int>('stakeholder_id');
    if ($_column == null) return null;
    final manager = $$StakeholderTableTableManager(
      $_db,
      $_db.stakeholder,
    ).filter((f) => f.stakeholderId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stakeholderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $TransactionAmountDetailTable,
    List<TransactionAmountDetailEntity>
  >
  _transactionAmountDetailRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionAmountDetail,
        aliasName: $_aliasNameGenerator(
          db.transactions.transactionId,
          db.transactionAmountDetail.transactionId,
        ),
      );

  $$TransactionAmountDetailTableProcessedTableManager
  get transactionAmountDetailRefs {
    final manager =
        $$TransactionAmountDetailTableTableManager(
          $_db,
          $_db.transactionAmountDetail,
        ).filter(
          (f) => f.transactionId.transactionId.sqlEquals(
            $_itemColumn<int>('transaction_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionAmountDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionCategoryDetailTable,
    List<TransactionCategoryDetailEntity>
  >
  _transactionCategoryDetailRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionCategoryDetail,
        aliasName: $_aliasNameGenerator(
          db.transactions.transactionId,
          db.transactionCategoryDetail.transactionId,
        ),
      );

  $$TransactionCategoryDetailTableProcessedTableManager
  get transactionCategoryDetailRefs {
    final manager =
        $$TransactionCategoryDetailTableTableManager(
          $_db,
          $_db.transactionCategoryDetail,
        ).filter(
          (f) => f.transactionId.transactionId.sqlEquals(
            $_itemColumn<int>('transaction_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionCategoryDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionInstallmentDetailTable,
    List<TransactionInstallmentDetailEntity>
  >
  _transactionInstallmentDetailRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionInstallmentDetail,
        aliasName: $_aliasNameGenerator(
          db.transactions.transactionId,
          db.transactionInstallmentDetail.transactionId,
        ),
      );

  $$TransactionInstallmentDetailTableProcessedTableManager
  get transactionInstallmentDetailRefs {
    final manager =
        $$TransactionInstallmentDetailTableTableManager(
          $_db,
          $_db.transactionInstallmentDetail,
        ).filter(
          (f) => f.transactionId.transactionId.sqlEquals(
            $_itemColumn<int>('transaction_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionInstallmentDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionReduceTable,
    List<TransactionReduceEntity>
  >
  _transactionReduceRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionReduce,
        aliasName: $_aliasNameGenerator(
          db.transactions.transactionId,
          db.transactionReduce.transactionId,
        ),
      );

  $$TransactionReduceTableProcessedTableManager get transactionReduceRefs {
    final manager =
        $$TransactionReduceTableTableManager(
          $_db,
          $_db.transactionReduce,
        ).filter(
          (f) => f.transactionId.transactionId.sqlEquals(
            $_itemColumn<int>('transaction_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionReduceRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionRefundTable,
    List<TransactionRefundEntity>
  >
  _transactionRefundRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionRefund,
        aliasName: $_aliasNameGenerator(
          db.transactions.transactionId,
          db.transactionRefund.transactionId,
        ),
      );

  $$TransactionRefundTableProcessedTableManager get transactionRefundRefs {
    final manager =
        $$TransactionRefundTableTableManager(
          $_db,
          $_db.transactionRefund,
        ).filter(
          (f) => f.transactionId.transactionId.sqlEquals(
            $_itemColumn<int>('transaction_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionRefundRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RelationProjectTransactionTable,
    List<TransactionProjectRelationEntity>
  >
  _relationProjectTransactionRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationProjectTransaction,
        aliasName: $_aliasNameGenerator(
          db.transactions.transactionId,
          db.relationProjectTransaction.transactionId,
        ),
      );

  $$RelationProjectTransactionTableProcessedTableManager
  get relationProjectTransactionRefs {
    final manager =
        $$RelationProjectTransactionTableTableManager(
          $_db,
          $_db.relationProjectTransaction,
        ).filter(
          (f) => f.transactionId.transactionId.sqlEquals(
            $_itemColumn<int>('transaction_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _relationProjectTransactionRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReimbursementTable, List<ReimbursementEntity>>
  _reimbursementRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reimbursement,
    aliasName: $_aliasNameGenerator(
      db.transactions.transactionId,
      db.reimbursement.transactionId,
    ),
  );

  $$ReimbursementTableProcessedTableManager get reimbursementRefs {
    final manager = $$ReimbursementTableTableManager($_db, $_db.reimbursement)
        .filter(
          (f) => f.transactionId.transactionId.sqlEquals(
            $_itemColumn<int>('transaction_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_reimbursementRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TransactionType, TransactionType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hidden => $composableBuilder(
    column: $table.hidden,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excluded => $composableBuilder(
    column: $table.excluded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get locationLat => $composableBuilder(
    column: $table.locationLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get locationLng => $composableBuilder(
    column: $table.locationLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$LedgerTableFilterComposer get ledgerId {
    final $$LedgerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableFilterComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StakeholderTableFilterComposer get stakeholderId {
    final $$StakeholderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StakeholderTableFilterComposer(
            $db: $db,
            $table: $db.stakeholder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transactionAmountDetailRefs(
    Expression<bool> Function($$TransactionAmountDetailTableFilterComposer f) f,
  ) {
    final $$TransactionAmountDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionId,
          referencedTable: $db.transactionAmountDetail,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionAmountDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionAmountDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionCategoryDetailRefs(
    Expression<bool> Function($$TransactionCategoryDetailTableFilterComposer f)
    f,
  ) {
    final $$TransactionCategoryDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionId,
          referencedTable: $db.transactionCategoryDetail,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCategoryDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionCategoryDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionInstallmentDetailRefs(
    Expression<bool> Function(
      $$TransactionInstallmentDetailTableFilterComposer f,
    )
    f,
  ) {
    final $$TransactionInstallmentDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionId,
          referencedTable: $db.transactionInstallmentDetail,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionInstallmentDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> transactionReduceRefs(
    Expression<bool> Function($$TransactionReduceTableFilterComposer f) f,
  ) {
    final $$TransactionReduceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactionReduce,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionReduceTableFilterComposer(
            $db: $db,
            $table: $db.transactionReduce,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> transactionRefundRefs(
    Expression<bool> Function($$TransactionRefundTableFilterComposer f) f,
  ) {
    final $$TransactionRefundTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactionRefund,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionRefundTableFilterComposer(
            $db: $db,
            $table: $db.transactionRefund,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> relationProjectTransactionRefs(
    Expression<bool> Function($$RelationProjectTransactionTableFilterComposer f)
    f,
  ) {
    final $$RelationProjectTransactionTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionId,
          referencedTable: $db.relationProjectTransaction,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationProjectTransactionTableFilterComposer(
                $db: $db,
                $table: $db.relationProjectTransaction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> reimbursementRefs(
    Expression<bool> Function($$ReimbursementTableFilterComposer f) f,
  ) {
    final $$ReimbursementTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementTableFilterComposer(
            $db: $db,
            $table: $db.reimbursement,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hidden => $composableBuilder(
    column: $table.hidden,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excluded => $composableBuilder(
    column: $table.excluded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get locationLat => $composableBuilder(
    column: $table.locationLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get locationLng => $composableBuilder(
    column: $table.locationLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$LedgerTableOrderingComposer get ledgerId {
    final $$LedgerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableOrderingComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StakeholderTableOrderingComposer get stakeholderId {
    final $$StakeholderTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StakeholderTableOrderingComposer(
            $db: $db,
            $table: $db.stakeholder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<TransactionType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get hidden =>
      $composableBuilder(column: $table.hidden, builder: (column) => column);

  GeneratedColumn<bool> get excluded =>
      $composableBuilder(column: $table.excluded, builder: (column) => column);

  GeneratedColumn<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get locationLat => $composableBuilder(
    column: $table.locationLat,
    builder: (column) => column,
  );

  GeneratedColumn<double> get locationLng => $composableBuilder(
    column: $table.locationLng,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$LedgerTableAnnotationComposer get ledgerId {
    final $$LedgerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ledgerId,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.ledgerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableAnnotationComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StakeholderTableAnnotationComposer get stakeholderId {
    final $$StakeholderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StakeholderTableAnnotationComposer(
            $db: $db,
            $table: $db.stakeholder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transactionAmountDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionAmountDetailTableAnnotationComposer a)
    f,
  ) {
    final $$TransactionAmountDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionId,
          referencedTable: $db.transactionAmountDetail,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionAmountDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionAmountDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionCategoryDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionCategoryDetailTableAnnotationComposer a)
    f,
  ) {
    final $$TransactionCategoryDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionId,
          referencedTable: $db.transactionCategoryDetail,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCategoryDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionCategoryDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionInstallmentDetailRefs<T extends Object>(
    Expression<T> Function(
      $$TransactionInstallmentDetailTableAnnotationComposer a,
    )
    f,
  ) {
    final $$TransactionInstallmentDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionId,
          referencedTable: $db.transactionInstallmentDetail,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionInstallmentDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionReduceRefs<T extends Object>(
    Expression<T> Function($$TransactionReduceTableAnnotationComposer a) f,
  ) {
    final $$TransactionReduceTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionId,
          referencedTable: $db.transactionReduce,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionReduceTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionReduce,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> transactionRefundRefs<T extends Object>(
    Expression<T> Function($$TransactionRefundTableAnnotationComposer a) f,
  ) {
    final $$TransactionRefundTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionId,
          referencedTable: $db.transactionRefund,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionRefundTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionRefund,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> relationProjectTransactionRefs<T extends Object>(
    Expression<T> Function(
      $$RelationProjectTransactionTableAnnotationComposer a,
    )
    f,
  ) {
    final $$RelationProjectTransactionTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionId,
          referencedTable: $db.relationProjectTransaction,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationProjectTransactionTableAnnotationComposer(
                $db: $db,
                $table: $db.relationProjectTransaction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> reimbursementRefs<T extends Object>(
    Expression<T> Function($$ReimbursementTableAnnotationComposer a) f,
  ) {
    final $$ReimbursementTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementTableAnnotationComposer(
            $db: $db,
            $table: $db.reimbursement,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          TransactionEntity,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (TransactionEntity, $$TransactionsTableReferences),
          TransactionEntity,
          PrefetchHooks Function({
            bool ledgerId,
            bool stakeholderId,
            bool transactionAmountDetailRefs,
            bool transactionCategoryDetailRefs,
            bool transactionInstallmentDetailRefs,
            bool transactionReduceRefs,
            bool transactionRefundRefs,
            bool relationProjectTransactionRefs,
            bool reimbursementRefs,
          })
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> transactionId = const Value.absent(),
                Value<int> ledgerId = const Value.absent(),
                Value<TransactionType> type = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> stakeholderId = const Value.absent(),
                Value<bool> hidden = const Value.absent(),
                Value<bool> excluded = const Value.absent(),
                Value<String?> locationName = const Value.absent(),
                Value<double?> locationLat = const Value.absent(),
                Value<double?> locationLng = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => TransactionsCompanion(
                transactionId: transactionId,
                ledgerId: ledgerId,
                type: type,
                timestamp: timestamp,
                createdAt: createdAt,
                updatedAt: updatedAt,
                stakeholderId: stakeholderId,
                hidden: hidden,
                excluded: excluded,
                locationName: locationName,
                locationLat: locationLat,
                locationLng: locationLng,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> transactionId = const Value.absent(),
                required int ledgerId,
                required TransactionType type,
                required int timestamp,
                required int createdAt,
                required int updatedAt,
                Value<int?> stakeholderId = const Value.absent(),
                Value<bool> hidden = const Value.absent(),
                Value<bool> excluded = const Value.absent(),
                Value<String?> locationName = const Value.absent(),
                Value<double?> locationLat = const Value.absent(),
                Value<double?> locationLng = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => TransactionsCompanion.insert(
                transactionId: transactionId,
                ledgerId: ledgerId,
                type: type,
                timestamp: timestamp,
                createdAt: createdAt,
                updatedAt: updatedAt,
                stakeholderId: stakeholderId,
                hidden: hidden,
                excluded: excluded,
                locationName: locationName,
                locationLat: locationLat,
                locationLng: locationLng,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                ledgerId = false,
                stakeholderId = false,
                transactionAmountDetailRefs = false,
                transactionCategoryDetailRefs = false,
                transactionInstallmentDetailRefs = false,
                transactionReduceRefs = false,
                transactionRefundRefs = false,
                relationProjectTransactionRefs = false,
                reimbursementRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionAmountDetailRefs) db.transactionAmountDetail,
                    if (transactionCategoryDetailRefs)
                      db.transactionCategoryDetail,
                    if (transactionInstallmentDetailRefs)
                      db.transactionInstallmentDetail,
                    if (transactionReduceRefs) db.transactionReduce,
                    if (transactionRefundRefs) db.transactionRefund,
                    if (relationProjectTransactionRefs)
                      db.relationProjectTransaction,
                    if (reimbursementRefs) db.reimbursement,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ledgerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ledgerId,
                                    referencedTable:
                                        $$TransactionsTableReferences
                                            ._ledgerIdTable(db),
                                    referencedColumn:
                                        $$TransactionsTableReferences
                                            ._ledgerIdTable(db)
                                            .ledgerId,
                                  )
                                  as T;
                        }
                        if (stakeholderId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.stakeholderId,
                                    referencedTable:
                                        $$TransactionsTableReferences
                                            ._stakeholderIdTable(db),
                                    referencedColumn:
                                        $$TransactionsTableReferences
                                            ._stakeholderIdTable(db)
                                            .stakeholderId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionAmountDetailRefs)
                        await $_getPrefetchedData<
                          TransactionEntity,
                          $TransactionsTable,
                          TransactionAmountDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._transactionAmountDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionAmountDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.transactionId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionCategoryDetailRefs)
                        await $_getPrefetchedData<
                          TransactionEntity,
                          $TransactionsTable,
                          TransactionCategoryDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._transactionCategoryDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionCategoryDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.transactionId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionInstallmentDetailRefs)
                        await $_getPrefetchedData<
                          TransactionEntity,
                          $TransactionsTable,
                          TransactionInstallmentDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._transactionInstallmentDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionInstallmentDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.transactionId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionReduceRefs)
                        await $_getPrefetchedData<
                          TransactionEntity,
                          $TransactionsTable,
                          TransactionReduceEntity
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._transactionReduceRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionReduceRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.transactionId,
                              ),
                          typedResults: items,
                        ),
                      if (transactionRefundRefs)
                        await $_getPrefetchedData<
                          TransactionEntity,
                          $TransactionsTable,
                          TransactionRefundEntity
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._transactionRefundRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionRefundRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.transactionId,
                              ),
                          typedResults: items,
                        ),
                      if (relationProjectTransactionRefs)
                        await $_getPrefetchedData<
                          TransactionEntity,
                          $TransactionsTable,
                          TransactionProjectRelationEntity
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._relationProjectTransactionRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).relationProjectTransactionRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.transactionId,
                              ),
                          typedResults: items,
                        ),
                      if (reimbursementRefs)
                        await $_getPrefetchedData<
                          TransactionEntity,
                          $TransactionsTable,
                          ReimbursementEntity
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._reimbursementRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).reimbursementRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.transactionId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      TransactionEntity,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (TransactionEntity, $$TransactionsTableReferences),
      TransactionEntity,
      PrefetchHooks Function({
        bool ledgerId,
        bool stakeholderId,
        bool transactionAmountDetailRefs,
        bool transactionCategoryDetailRefs,
        bool transactionInstallmentDetailRefs,
        bool transactionReduceRefs,
        bool transactionRefundRefs,
        bool relationProjectTransactionRefs,
        bool reimbursementRefs,
      })
    >;
typedef $$TransactionAmountDetailTableCreateCompanionBuilder =
    TransactionAmountDetailCompanion Function({
      Value<int> amountDetailId,
      required int transactionId,
      required int accountId,
      required String currencyCode,
      required int amount,
      required int realAmount,
    });
typedef $$TransactionAmountDetailTableUpdateCompanionBuilder =
    TransactionAmountDetailCompanion Function({
      Value<int> amountDetailId,
      Value<int> transactionId,
      Value<int> accountId,
      Value<String> currencyCode,
      Value<int> amount,
      Value<int> realAmount,
    });

final class $$TransactionAmountDetailTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionAmountDetailTable,
          TransactionAmountDetailEntity
        > {
  $$TransactionAmountDetailTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionAmountDetail.transactionId,
          db.transactions.transactionId,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.transactionId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountTable _accountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(
          db.transactionAmountDetail.accountId,
          db.account.accountId,
        ),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CurrencyTable _currencyCodeTable(_$AppDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(
          db.transactionAmountDetail.currencyCode,
          db.currency.currencyCode,
        ),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.currencyCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionAmountDetailTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionAmountDetailTable> {
  $$TransactionAmountDetailTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get amountDetailId => $composableBuilder(
    column: $table.amountDetailId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableFilterComposer get currencyCode {
    final $$CurrencyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableFilterComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionAmountDetailTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionAmountDetailTable> {
  $$TransactionAmountDetailTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get amountDetailId => $composableBuilder(
    column: $table.amountDetailId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableOrderingComposer get currencyCode {
    final $$CurrencyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableOrderingComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionAmountDetailTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionAmountDetailTable> {
  $$TransactionAmountDetailTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get amountDetailId => $composableBuilder(
    column: $table.amountDetailId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => column,
  );

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableAnnotationComposer get currencyCode {
    final $$CurrencyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableAnnotationComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionAmountDetailTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionAmountDetailTable,
          TransactionAmountDetailEntity,
          $$TransactionAmountDetailTableFilterComposer,
          $$TransactionAmountDetailTableOrderingComposer,
          $$TransactionAmountDetailTableAnnotationComposer,
          $$TransactionAmountDetailTableCreateCompanionBuilder,
          $$TransactionAmountDetailTableUpdateCompanionBuilder,
          (
            TransactionAmountDetailEntity,
            $$TransactionAmountDetailTableReferences,
          ),
          TransactionAmountDetailEntity,
          PrefetchHooks Function({
            bool transactionId,
            bool accountId,
            bool currencyCode,
          })
        > {
  $$TransactionAmountDetailTableTableManager(
    _$AppDatabase db,
    $TransactionAmountDetailTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionAmountDetailTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$TransactionAmountDetailTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TransactionAmountDetailTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> amountDetailId = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> realAmount = const Value.absent(),
              }) => TransactionAmountDetailCompanion(
                amountDetailId: amountDetailId,
                transactionId: transactionId,
                accountId: accountId,
                currencyCode: currencyCode,
                amount: amount,
                realAmount: realAmount,
              ),
          createCompanionCallback:
              ({
                Value<int> amountDetailId = const Value.absent(),
                required int transactionId,
                required int accountId,
                required String currencyCode,
                required int amount,
                required int realAmount,
              }) => TransactionAmountDetailCompanion.insert(
                amountDetailId: amountDetailId,
                transactionId: transactionId,
                accountId: accountId,
                currencyCode: currencyCode,
                amount: amount,
                realAmount: realAmount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionAmountDetailTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                transactionId = false,
                accountId = false,
                currencyCode = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (transactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.transactionId,
                                    referencedTable:
                                        $$TransactionAmountDetailTableReferences
                                            ._transactionIdTable(db),
                                    referencedColumn:
                                        $$TransactionAmountDetailTableReferences
                                            ._transactionIdTable(db)
                                            .transactionId,
                                  )
                                  as T;
                        }
                        if (accountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.accountId,
                                    referencedTable:
                                        $$TransactionAmountDetailTableReferences
                                            ._accountIdTable(db),
                                    referencedColumn:
                                        $$TransactionAmountDetailTableReferences
                                            ._accountIdTable(db)
                                            .accountId,
                                  )
                                  as T;
                        }
                        if (currencyCode) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currencyCode,
                                    referencedTable:
                                        $$TransactionAmountDetailTableReferences
                                            ._currencyCodeTable(db),
                                    referencedColumn:
                                        $$TransactionAmountDetailTableReferences
                                            ._currencyCodeTable(db)
                                            .currencyCode,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TransactionAmountDetailTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionAmountDetailTable,
      TransactionAmountDetailEntity,
      $$TransactionAmountDetailTableFilterComposer,
      $$TransactionAmountDetailTableOrderingComposer,
      $$TransactionAmountDetailTableAnnotationComposer,
      $$TransactionAmountDetailTableCreateCompanionBuilder,
      $$TransactionAmountDetailTableUpdateCompanionBuilder,
      (TransactionAmountDetailEntity, $$TransactionAmountDetailTableReferences),
      TransactionAmountDetailEntity,
      PrefetchHooks Function({
        bool transactionId,
        bool accountId,
        bool currencyCode,
      })
    >;
typedef $$TransactionCategoryDetailTableCreateCompanionBuilder =
    TransactionCategoryDetailCompanion Function({
      Value<int> categoryDetailId,
      required int transactionId,
      required int categoryId,
      required String currencyCode,
      required int amount,
      required int realAmount,
    });
typedef $$TransactionCategoryDetailTableUpdateCompanionBuilder =
    TransactionCategoryDetailCompanion Function({
      Value<int> categoryDetailId,
      Value<int> transactionId,
      Value<int> categoryId,
      Value<String> currencyCode,
      Value<int> amount,
      Value<int> realAmount,
    });

final class $$TransactionCategoryDetailTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionCategoryDetailTable,
          TransactionCategoryDetailEntity
        > {
  $$TransactionCategoryDetailTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionCategoryDetail.transactionId,
          db.transactions.transactionId,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.transactionId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoryTable _categoryIdTable(_$AppDatabase db) =>
      db.category.createAlias(
        $_aliasNameGenerator(
          db.transactionCategoryDetail.categoryId,
          db.category.categoryId,
        ),
      );

  $$CategoryTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoryTableTableManager(
      $_db,
      $_db.category,
    ).filter((f) => f.categoryId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CurrencyTable _currencyCodeTable(_$AppDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(
          db.transactionCategoryDetail.currencyCode,
          db.currency.currencyCode,
        ),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.currencyCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionCategoryDetailTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionCategoryDetailTable> {
  $$TransactionCategoryDetailTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get categoryDetailId => $composableBuilder(
    column: $table.categoryDetailId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoryTableFilterComposer get categoryId {
    final $$CategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableFilterComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableFilterComposer get currencyCode {
    final $$CurrencyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableFilterComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionCategoryDetailTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionCategoryDetailTable> {
  $$TransactionCategoryDetailTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get categoryDetailId => $composableBuilder(
    column: $table.categoryDetailId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoryTableOrderingComposer get categoryId {
    final $$CategoryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableOrderingComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableOrderingComposer get currencyCode {
    final $$CurrencyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableOrderingComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionCategoryDetailTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionCategoryDetailTable> {
  $$TransactionCategoryDetailTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get categoryDetailId => $composableBuilder(
    column: $table.categoryDetailId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => column,
  );

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoryTableAnnotationComposer get categoryId {
    final $$CategoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableAnnotationComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableAnnotationComposer get currencyCode {
    final $$CurrencyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableAnnotationComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionCategoryDetailTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionCategoryDetailTable,
          TransactionCategoryDetailEntity,
          $$TransactionCategoryDetailTableFilterComposer,
          $$TransactionCategoryDetailTableOrderingComposer,
          $$TransactionCategoryDetailTableAnnotationComposer,
          $$TransactionCategoryDetailTableCreateCompanionBuilder,
          $$TransactionCategoryDetailTableUpdateCompanionBuilder,
          (
            TransactionCategoryDetailEntity,
            $$TransactionCategoryDetailTableReferences,
          ),
          TransactionCategoryDetailEntity,
          PrefetchHooks Function({
            bool transactionId,
            bool categoryId,
            bool currencyCode,
          })
        > {
  $$TransactionCategoryDetailTableTableManager(
    _$AppDatabase db,
    $TransactionCategoryDetailTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionCategoryDetailTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$TransactionCategoryDetailTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TransactionCategoryDetailTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> categoryDetailId = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> realAmount = const Value.absent(),
              }) => TransactionCategoryDetailCompanion(
                categoryDetailId: categoryDetailId,
                transactionId: transactionId,
                categoryId: categoryId,
                currencyCode: currencyCode,
                amount: amount,
                realAmount: realAmount,
              ),
          createCompanionCallback:
              ({
                Value<int> categoryDetailId = const Value.absent(),
                required int transactionId,
                required int categoryId,
                required String currencyCode,
                required int amount,
                required int realAmount,
              }) => TransactionCategoryDetailCompanion.insert(
                categoryDetailId: categoryDetailId,
                transactionId: transactionId,
                categoryId: categoryId,
                currencyCode: currencyCode,
                amount: amount,
                realAmount: realAmount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionCategoryDetailTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                transactionId = false,
                categoryId = false,
                currencyCode = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (transactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.transactionId,
                                    referencedTable:
                                        $$TransactionCategoryDetailTableReferences
                                            ._transactionIdTable(db),
                                    referencedColumn:
                                        $$TransactionCategoryDetailTableReferences
                                            ._transactionIdTable(db)
                                            .transactionId,
                                  )
                                  as T;
                        }
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable:
                                        $$TransactionCategoryDetailTableReferences
                                            ._categoryIdTable(db),
                                    referencedColumn:
                                        $$TransactionCategoryDetailTableReferences
                                            ._categoryIdTable(db)
                                            .categoryId,
                                  )
                                  as T;
                        }
                        if (currencyCode) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currencyCode,
                                    referencedTable:
                                        $$TransactionCategoryDetailTableReferences
                                            ._currencyCodeTable(db),
                                    referencedColumn:
                                        $$TransactionCategoryDetailTableReferences
                                            ._currencyCodeTable(db)
                                            .currencyCode,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TransactionCategoryDetailTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionCategoryDetailTable,
      TransactionCategoryDetailEntity,
      $$TransactionCategoryDetailTableFilterComposer,
      $$TransactionCategoryDetailTableOrderingComposer,
      $$TransactionCategoryDetailTableAnnotationComposer,
      $$TransactionCategoryDetailTableCreateCompanionBuilder,
      $$TransactionCategoryDetailTableUpdateCompanionBuilder,
      (
        TransactionCategoryDetailEntity,
        $$TransactionCategoryDetailTableReferences,
      ),
      TransactionCategoryDetailEntity,
      PrefetchHooks Function({
        bool transactionId,
        bool categoryId,
        bool currencyCode,
      })
    >;
typedef $$TransactionInstallmentDetailTableCreateCompanionBuilder =
    TransactionInstallmentDetailCompanion Function({
      Value<int> installmentDetailId,
      required int transactionId,
      required int accountId,
      required String currencyCode,
    });
typedef $$TransactionInstallmentDetailTableUpdateCompanionBuilder =
    TransactionInstallmentDetailCompanion Function({
      Value<int> installmentDetailId,
      Value<int> transactionId,
      Value<int> accountId,
      Value<String> currencyCode,
    });

final class $$TransactionInstallmentDetailTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionInstallmentDetailTable,
          TransactionInstallmentDetailEntity
        > {
  $$TransactionInstallmentDetailTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionInstallmentDetail.transactionId,
          db.transactions.transactionId,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.transactionId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountTable _accountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(
          db.transactionInstallmentDetail.accountId,
          db.account.accountId,
        ),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CurrencyTable _currencyCodeTable(_$AppDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(
          db.transactionInstallmentDetail.currencyCode,
          db.currency.currencyCode,
        ),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.currencyCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $TransactionInstallmentItemTable,
    List<TransactionInstallmentItemEntity>
  >
  _transactionInstallmentItemRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionInstallmentItem,
        aliasName: $_aliasNameGenerator(
          db.transactionInstallmentDetail.installmentDetailId,
          db.transactionInstallmentItem.installmentDetailId,
        ),
      );

  $$TransactionInstallmentItemTableProcessedTableManager
  get transactionInstallmentItemRefs {
    final manager =
        $$TransactionInstallmentItemTableTableManager(
          $_db,
          $_db.transactionInstallmentItem,
        ).filter(
          (f) => f.installmentDetailId.installmentDetailId.sqlEquals(
            $_itemColumn<int>('installment_detail_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionInstallmentItemRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransactionInstallmentDetailTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionInstallmentDetailTable> {
  $$TransactionInstallmentDetailTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get installmentDetailId => $composableBuilder(
    column: $table.installmentDetailId,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableFilterComposer get currencyCode {
    final $$CurrencyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableFilterComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transactionInstallmentItemRefs(
    Expression<bool> Function($$TransactionInstallmentItemTableFilterComposer f)
    f,
  ) {
    final $$TransactionInstallmentItemTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.installmentDetailId,
          referencedTable: $db.transactionInstallmentItem,
          getReferencedColumn: (t) => t.installmentDetailId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentItemTableFilterComposer(
                $db: $db,
                $table: $db.transactionInstallmentItem,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TransactionInstallmentDetailTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionInstallmentDetailTable> {
  $$TransactionInstallmentDetailTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get installmentDetailId => $composableBuilder(
    column: $table.installmentDetailId,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableOrderingComposer get currencyCode {
    final $$CurrencyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableOrderingComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionInstallmentDetailTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionInstallmentDetailTable> {
  $$TransactionInstallmentDetailTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get installmentDetailId => $composableBuilder(
    column: $table.installmentDetailId,
    builder: (column) => column,
  );

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableAnnotationComposer get currencyCode {
    final $$CurrencyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableAnnotationComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transactionInstallmentItemRefs<T extends Object>(
    Expression<T> Function(
      $$TransactionInstallmentItemTableAnnotationComposer a,
    )
    f,
  ) {
    final $$TransactionInstallmentItemTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.installmentDetailId,
          referencedTable: $db.transactionInstallmentItem,
          getReferencedColumn: (t) => t.installmentDetailId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentItemTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionInstallmentItem,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TransactionInstallmentDetailTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionInstallmentDetailTable,
          TransactionInstallmentDetailEntity,
          $$TransactionInstallmentDetailTableFilterComposer,
          $$TransactionInstallmentDetailTableOrderingComposer,
          $$TransactionInstallmentDetailTableAnnotationComposer,
          $$TransactionInstallmentDetailTableCreateCompanionBuilder,
          $$TransactionInstallmentDetailTableUpdateCompanionBuilder,
          (
            TransactionInstallmentDetailEntity,
            $$TransactionInstallmentDetailTableReferences,
          ),
          TransactionInstallmentDetailEntity,
          PrefetchHooks Function({
            bool transactionId,
            bool accountId,
            bool currencyCode,
            bool transactionInstallmentItemRefs,
          })
        > {
  $$TransactionInstallmentDetailTableTableManager(
    _$AppDatabase db,
    $TransactionInstallmentDetailTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionInstallmentDetailTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$TransactionInstallmentDetailTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TransactionInstallmentDetailTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> installmentDetailId = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
              }) => TransactionInstallmentDetailCompanion(
                installmentDetailId: installmentDetailId,
                transactionId: transactionId,
                accountId: accountId,
                currencyCode: currencyCode,
              ),
          createCompanionCallback:
              ({
                Value<int> installmentDetailId = const Value.absent(),
                required int transactionId,
                required int accountId,
                required String currencyCode,
              }) => TransactionInstallmentDetailCompanion.insert(
                installmentDetailId: installmentDetailId,
                transactionId: transactionId,
                accountId: accountId,
                currencyCode: currencyCode,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionInstallmentDetailTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                transactionId = false,
                accountId = false,
                currencyCode = false,
                transactionInstallmentItemRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionInstallmentItemRefs)
                      db.transactionInstallmentItem,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (transactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.transactionId,
                                    referencedTable:
                                        $$TransactionInstallmentDetailTableReferences
                                            ._transactionIdTable(db),
                                    referencedColumn:
                                        $$TransactionInstallmentDetailTableReferences
                                            ._transactionIdTable(db)
                                            .transactionId,
                                  )
                                  as T;
                        }
                        if (accountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.accountId,
                                    referencedTable:
                                        $$TransactionInstallmentDetailTableReferences
                                            ._accountIdTable(db),
                                    referencedColumn:
                                        $$TransactionInstallmentDetailTableReferences
                                            ._accountIdTable(db)
                                            .accountId,
                                  )
                                  as T;
                        }
                        if (currencyCode) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currencyCode,
                                    referencedTable:
                                        $$TransactionInstallmentDetailTableReferences
                                            ._currencyCodeTable(db),
                                    referencedColumn:
                                        $$TransactionInstallmentDetailTableReferences
                                            ._currencyCodeTable(db)
                                            .currencyCode,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionInstallmentItemRefs)
                        await $_getPrefetchedData<
                          TransactionInstallmentDetailEntity,
                          $TransactionInstallmentDetailTable,
                          TransactionInstallmentItemEntity
                        >(
                          currentTable: table,
                          referencedTable:
                              $$TransactionInstallmentDetailTableReferences
                                  ._transactionInstallmentItemRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionInstallmentDetailTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionInstallmentItemRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) =>
                                    e.installmentDetailId ==
                                    item.installmentDetailId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TransactionInstallmentDetailTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionInstallmentDetailTable,
      TransactionInstallmentDetailEntity,
      $$TransactionInstallmentDetailTableFilterComposer,
      $$TransactionInstallmentDetailTableOrderingComposer,
      $$TransactionInstallmentDetailTableAnnotationComposer,
      $$TransactionInstallmentDetailTableCreateCompanionBuilder,
      $$TransactionInstallmentDetailTableUpdateCompanionBuilder,
      (
        TransactionInstallmentDetailEntity,
        $$TransactionInstallmentDetailTableReferences,
      ),
      TransactionInstallmentDetailEntity,
      PrefetchHooks Function({
        bool transactionId,
        bool accountId,
        bool currencyCode,
        bool transactionInstallmentItemRefs,
      })
    >;
typedef $$TransactionInstallmentItemTableCreateCompanionBuilder =
    TransactionInstallmentItemCompanion Function({
      Value<int> installmentItemId,
      required int installmentDetailId,
      required int installmentNumber,
      required int dueDate,
      required int capitalAmount,
      required int realCapitalAmount,
      required int interestAmount,
      required int realInterestAmount,
    });
typedef $$TransactionInstallmentItemTableUpdateCompanionBuilder =
    TransactionInstallmentItemCompanion Function({
      Value<int> installmentItemId,
      Value<int> installmentDetailId,
      Value<int> installmentNumber,
      Value<int> dueDate,
      Value<int> capitalAmount,
      Value<int> realCapitalAmount,
      Value<int> interestAmount,
      Value<int> realInterestAmount,
    });

final class $$TransactionInstallmentItemTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionInstallmentItemTable,
          TransactionInstallmentItemEntity
        > {
  $$TransactionInstallmentItemTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionInstallmentDetailTable _installmentDetailIdTable(
    _$AppDatabase db,
  ) => db.transactionInstallmentDetail.createAlias(
    $_aliasNameGenerator(
      db.transactionInstallmentItem.installmentDetailId,
      db.transactionInstallmentDetail.installmentDetailId,
    ),
  );

  $$TransactionInstallmentDetailTableProcessedTableManager
  get installmentDetailId {
    final $_column = $_itemColumn<int>('installment_detail_id')!;

    final manager = $$TransactionInstallmentDetailTableTableManager(
      $_db,
      $_db.transactionInstallmentDetail,
    ).filter((f) => f.installmentDetailId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_installmentDetailIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionInstallmentItemTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionInstallmentItemTable> {
  $$TransactionInstallmentItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get installmentItemId => $composableBuilder(
    column: $table.installmentItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get installmentNumber => $composableBuilder(
    column: $table.installmentNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get capitalAmount => $composableBuilder(
    column: $table.capitalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get realCapitalAmount => $composableBuilder(
    column: $table.realCapitalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get interestAmount => $composableBuilder(
    column: $table.interestAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get realInterestAmount => $composableBuilder(
    column: $table.realInterestAmount,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionInstallmentDetailTableFilterComposer get installmentDetailId {
    final $$TransactionInstallmentDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.installmentDetailId,
          referencedTable: $db.transactionInstallmentDetail,
          getReferencedColumn: (t) => t.installmentDetailId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionInstallmentDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TransactionInstallmentItemTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionInstallmentItemTable> {
  $$TransactionInstallmentItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get installmentItemId => $composableBuilder(
    column: $table.installmentItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installmentNumber => $composableBuilder(
    column: $table.installmentNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get capitalAmount => $composableBuilder(
    column: $table.capitalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get realCapitalAmount => $composableBuilder(
    column: $table.realCapitalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get interestAmount => $composableBuilder(
    column: $table.interestAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get realInterestAmount => $composableBuilder(
    column: $table.realInterestAmount,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionInstallmentDetailTableOrderingComposer get installmentDetailId {
    final $$TransactionInstallmentDetailTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.installmentDetailId,
          referencedTable: $db.transactionInstallmentDetail,
          getReferencedColumn: (t) => t.installmentDetailId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentDetailTableOrderingComposer(
                $db: $db,
                $table: $db.transactionInstallmentDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TransactionInstallmentItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionInstallmentItemTable> {
  $$TransactionInstallmentItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get installmentItemId => $composableBuilder(
    column: $table.installmentItemId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installmentNumber => $composableBuilder(
    column: $table.installmentNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<int> get capitalAmount => $composableBuilder(
    column: $table.capitalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get realCapitalAmount => $composableBuilder(
    column: $table.realCapitalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get interestAmount => $composableBuilder(
    column: $table.interestAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get realInterestAmount => $composableBuilder(
    column: $table.realInterestAmount,
    builder: (column) => column,
  );

  $$TransactionInstallmentDetailTableAnnotationComposer
  get installmentDetailId {
    final $$TransactionInstallmentDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.installmentDetailId,
          referencedTable: $db.transactionInstallmentDetail,
          getReferencedColumn: (t) => t.installmentDetailId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionInstallmentDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionInstallmentDetail,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TransactionInstallmentItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionInstallmentItemTable,
          TransactionInstallmentItemEntity,
          $$TransactionInstallmentItemTableFilterComposer,
          $$TransactionInstallmentItemTableOrderingComposer,
          $$TransactionInstallmentItemTableAnnotationComposer,
          $$TransactionInstallmentItemTableCreateCompanionBuilder,
          $$TransactionInstallmentItemTableUpdateCompanionBuilder,
          (
            TransactionInstallmentItemEntity,
            $$TransactionInstallmentItemTableReferences,
          ),
          TransactionInstallmentItemEntity,
          PrefetchHooks Function({bool installmentDetailId})
        > {
  $$TransactionInstallmentItemTableTableManager(
    _$AppDatabase db,
    $TransactionInstallmentItemTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionInstallmentItemTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$TransactionInstallmentItemTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TransactionInstallmentItemTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> installmentItemId = const Value.absent(),
                Value<int> installmentDetailId = const Value.absent(),
                Value<int> installmentNumber = const Value.absent(),
                Value<int> dueDate = const Value.absent(),
                Value<int> capitalAmount = const Value.absent(),
                Value<int> realCapitalAmount = const Value.absent(),
                Value<int> interestAmount = const Value.absent(),
                Value<int> realInterestAmount = const Value.absent(),
              }) => TransactionInstallmentItemCompanion(
                installmentItemId: installmentItemId,
                installmentDetailId: installmentDetailId,
                installmentNumber: installmentNumber,
                dueDate: dueDate,
                capitalAmount: capitalAmount,
                realCapitalAmount: realCapitalAmount,
                interestAmount: interestAmount,
                realInterestAmount: realInterestAmount,
              ),
          createCompanionCallback:
              ({
                Value<int> installmentItemId = const Value.absent(),
                required int installmentDetailId,
                required int installmentNumber,
                required int dueDate,
                required int capitalAmount,
                required int realCapitalAmount,
                required int interestAmount,
                required int realInterestAmount,
              }) => TransactionInstallmentItemCompanion.insert(
                installmentItemId: installmentItemId,
                installmentDetailId: installmentDetailId,
                installmentNumber: installmentNumber,
                dueDate: dueDate,
                capitalAmount: capitalAmount,
                realCapitalAmount: realCapitalAmount,
                interestAmount: interestAmount,
                realInterestAmount: realInterestAmount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionInstallmentItemTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({installmentDetailId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (installmentDetailId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.installmentDetailId,
                                referencedTable:
                                    $$TransactionInstallmentItemTableReferences
                                        ._installmentDetailIdTable(db),
                                referencedColumn:
                                    $$TransactionInstallmentItemTableReferences
                                        ._installmentDetailIdTable(db)
                                        .installmentDetailId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TransactionInstallmentItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionInstallmentItemTable,
      TransactionInstallmentItemEntity,
      $$TransactionInstallmentItemTableFilterComposer,
      $$TransactionInstallmentItemTableOrderingComposer,
      $$TransactionInstallmentItemTableAnnotationComposer,
      $$TransactionInstallmentItemTableCreateCompanionBuilder,
      $$TransactionInstallmentItemTableUpdateCompanionBuilder,
      (
        TransactionInstallmentItemEntity,
        $$TransactionInstallmentItemTableReferences,
      ),
      TransactionInstallmentItemEntity,
      PrefetchHooks Function({bool installmentDetailId})
    >;
typedef $$TransactionReduceTableCreateCompanionBuilder =
    TransactionReduceCompanion Function({
      Value<int> transactionReduceId,
      required int transactionId,
      required int categoryId,
      required String currencyCode,
      required int amount,
      required int realAmount,
    });
typedef $$TransactionReduceTableUpdateCompanionBuilder =
    TransactionReduceCompanion Function({
      Value<int> transactionReduceId,
      Value<int> transactionId,
      Value<int> categoryId,
      Value<String> currencyCode,
      Value<int> amount,
      Value<int> realAmount,
    });

final class $$TransactionReduceTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionReduceTable,
          TransactionReduceEntity
        > {
  $$TransactionReduceTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionReduce.transactionId,
          db.transactions.transactionId,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.transactionId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoryTable _categoryIdTable(_$AppDatabase db) =>
      db.category.createAlias(
        $_aliasNameGenerator(
          db.transactionReduce.categoryId,
          db.category.categoryId,
        ),
      );

  $$CategoryTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoryTableTableManager(
      $_db,
      $_db.category,
    ).filter((f) => f.categoryId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CurrencyTable _currencyCodeTable(_$AppDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(
          db.transactionReduce.currencyCode,
          db.currency.currencyCode,
        ),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.currencyCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionReduceTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionReduceTable> {
  $$TransactionReduceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get transactionReduceId => $composableBuilder(
    column: $table.transactionReduceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoryTableFilterComposer get categoryId {
    final $$CategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableFilterComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableFilterComposer get currencyCode {
    final $$CurrencyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableFilterComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionReduceTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionReduceTable> {
  $$TransactionReduceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get transactionReduceId => $composableBuilder(
    column: $table.transactionReduceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoryTableOrderingComposer get categoryId {
    final $$CategoryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableOrderingComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableOrderingComposer get currencyCode {
    final $$CurrencyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableOrderingComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionReduceTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionReduceTable> {
  $$TransactionReduceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get transactionReduceId => $composableBuilder(
    column: $table.transactionReduceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => column,
  );

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoryTableAnnotationComposer get categoryId {
    final $$CategoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableAnnotationComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableAnnotationComposer get currencyCode {
    final $$CurrencyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableAnnotationComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionReduceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionReduceTable,
          TransactionReduceEntity,
          $$TransactionReduceTableFilterComposer,
          $$TransactionReduceTableOrderingComposer,
          $$TransactionReduceTableAnnotationComposer,
          $$TransactionReduceTableCreateCompanionBuilder,
          $$TransactionReduceTableUpdateCompanionBuilder,
          (TransactionReduceEntity, $$TransactionReduceTableReferences),
          TransactionReduceEntity,
          PrefetchHooks Function({
            bool transactionId,
            bool categoryId,
            bool currencyCode,
          })
        > {
  $$TransactionReduceTableTableManager(
    _$AppDatabase db,
    $TransactionReduceTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionReduceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionReduceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionReduceTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> transactionReduceId = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> realAmount = const Value.absent(),
              }) => TransactionReduceCompanion(
                transactionReduceId: transactionReduceId,
                transactionId: transactionId,
                categoryId: categoryId,
                currencyCode: currencyCode,
                amount: amount,
                realAmount: realAmount,
              ),
          createCompanionCallback:
              ({
                Value<int> transactionReduceId = const Value.absent(),
                required int transactionId,
                required int categoryId,
                required String currencyCode,
                required int amount,
                required int realAmount,
              }) => TransactionReduceCompanion.insert(
                transactionReduceId: transactionReduceId,
                transactionId: transactionId,
                categoryId: categoryId,
                currencyCode: currencyCode,
                amount: amount,
                realAmount: realAmount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionReduceTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                transactionId = false,
                categoryId = false,
                currencyCode = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (transactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.transactionId,
                                    referencedTable:
                                        $$TransactionReduceTableReferences
                                            ._transactionIdTable(db),
                                    referencedColumn:
                                        $$TransactionReduceTableReferences
                                            ._transactionIdTable(db)
                                            .transactionId,
                                  )
                                  as T;
                        }
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable:
                                        $$TransactionReduceTableReferences
                                            ._categoryIdTable(db),
                                    referencedColumn:
                                        $$TransactionReduceTableReferences
                                            ._categoryIdTable(db)
                                            .categoryId,
                                  )
                                  as T;
                        }
                        if (currencyCode) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currencyCode,
                                    referencedTable:
                                        $$TransactionReduceTableReferences
                                            ._currencyCodeTable(db),
                                    referencedColumn:
                                        $$TransactionReduceTableReferences
                                            ._currencyCodeTable(db)
                                            .currencyCode,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TransactionReduceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionReduceTable,
      TransactionReduceEntity,
      $$TransactionReduceTableFilterComposer,
      $$TransactionReduceTableOrderingComposer,
      $$TransactionReduceTableAnnotationComposer,
      $$TransactionReduceTableCreateCompanionBuilder,
      $$TransactionReduceTableUpdateCompanionBuilder,
      (TransactionReduceEntity, $$TransactionReduceTableReferences),
      TransactionReduceEntity,
      PrefetchHooks Function({
        bool transactionId,
        bool categoryId,
        bool currencyCode,
      })
    >;
typedef $$TransactionRefundTableCreateCompanionBuilder =
    TransactionRefundCompanion Function({
      Value<int> transactionRefundId,
      required int transactionId,
      required int accountId,
      required String currencyCode,
      required int amount,
      required int realAmount,
      required int timestamp,
      required int createdAt,
      required int updatedAt,
      Value<String> note,
    });
typedef $$TransactionRefundTableUpdateCompanionBuilder =
    TransactionRefundCompanion Function({
      Value<int> transactionRefundId,
      Value<int> transactionId,
      Value<int> accountId,
      Value<String> currencyCode,
      Value<int> amount,
      Value<int> realAmount,
      Value<int> timestamp,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String> note,
    });

final class $$TransactionRefundTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionRefundTable,
          TransactionRefundEntity
        > {
  $$TransactionRefundTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionRefund.transactionId,
          db.transactions.transactionId,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.transactionId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountTable _accountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(
          db.transactionRefund.accountId,
          db.account.accountId,
        ),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CurrencyTable _currencyCodeTable(_$AppDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(
          db.transactionRefund.currencyCode,
          db.currency.currencyCode,
        ),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.currencyCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionRefundTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionRefundTable> {
  $$TransactionRefundTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get transactionRefundId => $composableBuilder(
    column: $table.transactionRefundId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableFilterComposer get currencyCode {
    final $$CurrencyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableFilterComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionRefundTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionRefundTable> {
  $$TransactionRefundTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get transactionRefundId => $composableBuilder(
    column: $table.transactionRefundId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableOrderingComposer get currencyCode {
    final $$CurrencyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableOrderingComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionRefundTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionRefundTable> {
  $$TransactionRefundTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get transactionRefundId => $composableBuilder(
    column: $table.transactionRefundId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableAnnotationComposer get currencyCode {
    final $$CurrencyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableAnnotationComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionRefundTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionRefundTable,
          TransactionRefundEntity,
          $$TransactionRefundTableFilterComposer,
          $$TransactionRefundTableOrderingComposer,
          $$TransactionRefundTableAnnotationComposer,
          $$TransactionRefundTableCreateCompanionBuilder,
          $$TransactionRefundTableUpdateCompanionBuilder,
          (TransactionRefundEntity, $$TransactionRefundTableReferences),
          TransactionRefundEntity,
          PrefetchHooks Function({
            bool transactionId,
            bool accountId,
            bool currencyCode,
          })
        > {
  $$TransactionRefundTableTableManager(
    _$AppDatabase db,
    $TransactionRefundTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionRefundTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionRefundTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionRefundTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> transactionRefundId = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> realAmount = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => TransactionRefundCompanion(
                transactionRefundId: transactionRefundId,
                transactionId: transactionId,
                accountId: accountId,
                currencyCode: currencyCode,
                amount: amount,
                realAmount: realAmount,
                timestamp: timestamp,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> transactionRefundId = const Value.absent(),
                required int transactionId,
                required int accountId,
                required String currencyCode,
                required int amount,
                required int realAmount,
                required int timestamp,
                required int createdAt,
                required int updatedAt,
                Value<String> note = const Value.absent(),
              }) => TransactionRefundCompanion.insert(
                transactionRefundId: transactionRefundId,
                transactionId: transactionId,
                accountId: accountId,
                currencyCode: currencyCode,
                amount: amount,
                realAmount: realAmount,
                timestamp: timestamp,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionRefundTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                transactionId = false,
                accountId = false,
                currencyCode = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (transactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.transactionId,
                                    referencedTable:
                                        $$TransactionRefundTableReferences
                                            ._transactionIdTable(db),
                                    referencedColumn:
                                        $$TransactionRefundTableReferences
                                            ._transactionIdTable(db)
                                            .transactionId,
                                  )
                                  as T;
                        }
                        if (accountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.accountId,
                                    referencedTable:
                                        $$TransactionRefundTableReferences
                                            ._accountIdTable(db),
                                    referencedColumn:
                                        $$TransactionRefundTableReferences
                                            ._accountIdTable(db)
                                            .accountId,
                                  )
                                  as T;
                        }
                        if (currencyCode) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currencyCode,
                                    referencedTable:
                                        $$TransactionRefundTableReferences
                                            ._currencyCodeTable(db),
                                    referencedColumn:
                                        $$TransactionRefundTableReferences
                                            ._currencyCodeTable(db)
                                            .currencyCode,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TransactionRefundTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionRefundTable,
      TransactionRefundEntity,
      $$TransactionRefundTableFilterComposer,
      $$TransactionRefundTableOrderingComposer,
      $$TransactionRefundTableAnnotationComposer,
      $$TransactionRefundTableCreateCompanionBuilder,
      $$TransactionRefundTableUpdateCompanionBuilder,
      (TransactionRefundEntity, $$TransactionRefundTableReferences),
      TransactionRefundEntity,
      PrefetchHooks Function({
        bool transactionId,
        bool accountId,
        bool currencyCode,
      })
    >;
typedef $$RelationProjectTransactionTableCreateCompanionBuilder =
    RelationProjectTransactionCompanion Function({
      required int transactionId,
      required int projectId,
      Value<int> rowid,
    });
typedef $$RelationProjectTransactionTableUpdateCompanionBuilder =
    RelationProjectTransactionCompanion Function({
      Value<int> transactionId,
      Value<int> projectId,
      Value<int> rowid,
    });

final class $$RelationProjectTransactionTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RelationProjectTransactionTable,
          TransactionProjectRelationEntity
        > {
  $$RelationProjectTransactionTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.relationProjectTransaction.transactionId,
          db.transactions.transactionId,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.transactionId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProjectTable _projectIdTable(_$AppDatabase db) =>
      db.project.createAlias(
        $_aliasNameGenerator(
          db.relationProjectTransaction.projectId,
          db.project.projectId,
        ),
      );

  $$ProjectTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<int>('project_id')!;

    final manager = $$ProjectTableTableManager(
      $_db,
      $_db.project,
    ).filter((f) => f.projectId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RelationProjectTransactionTableFilterComposer
    extends Composer<_$AppDatabase, $RelationProjectTransactionTable> {
  $$RelationProjectTransactionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProjectTableFilterComposer get projectId {
    final $$ProjectTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTableFilterComposer(
            $db: $db,
            $table: $db.project,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationProjectTransactionTableOrderingComposer
    extends Composer<_$AppDatabase, $RelationProjectTransactionTable> {
  $$RelationProjectTransactionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProjectTableOrderingComposer get projectId {
    final $$ProjectTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTableOrderingComposer(
            $db: $db,
            $table: $db.project,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationProjectTransactionTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelationProjectTransactionTable> {
  $$RelationProjectTransactionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProjectTableAnnotationComposer get projectId {
    final $$ProjectTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTableAnnotationComposer(
            $db: $db,
            $table: $db.project,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationProjectTransactionTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelationProjectTransactionTable,
          TransactionProjectRelationEntity,
          $$RelationProjectTransactionTableFilterComposer,
          $$RelationProjectTransactionTableOrderingComposer,
          $$RelationProjectTransactionTableAnnotationComposer,
          $$RelationProjectTransactionTableCreateCompanionBuilder,
          $$RelationProjectTransactionTableUpdateCompanionBuilder,
          (
            TransactionProjectRelationEntity,
            $$RelationProjectTransactionTableReferences,
          ),
          TransactionProjectRelationEntity,
          PrefetchHooks Function({bool transactionId, bool projectId})
        > {
  $$RelationProjectTransactionTableTableManager(
    _$AppDatabase db,
    $RelationProjectTransactionTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelationProjectTransactionTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RelationProjectTransactionTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RelationProjectTransactionTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> transactionId = const Value.absent(),
                Value<int> projectId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationProjectTransactionCompanion(
                transactionId: transactionId,
                projectId: projectId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int transactionId,
                required int projectId,
                Value<int> rowid = const Value.absent(),
              }) => RelationProjectTransactionCompanion.insert(
                transactionId: transactionId,
                projectId: projectId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RelationProjectTransactionTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transactionId = false, projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (transactionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.transactionId,
                                referencedTable:
                                    $$RelationProjectTransactionTableReferences
                                        ._transactionIdTable(db),
                                referencedColumn:
                                    $$RelationProjectTransactionTableReferences
                                        ._transactionIdTable(db)
                                        .transactionId,
                              )
                              as T;
                    }
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable:
                                    $$RelationProjectTransactionTableReferences
                                        ._projectIdTable(db),
                                referencedColumn:
                                    $$RelationProjectTransactionTableReferences
                                        ._projectIdTable(db)
                                        .projectId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RelationProjectTransactionTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelationProjectTransactionTable,
      TransactionProjectRelationEntity,
      $$RelationProjectTransactionTableFilterComposer,
      $$RelationProjectTransactionTableOrderingComposer,
      $$RelationProjectTransactionTableAnnotationComposer,
      $$RelationProjectTransactionTableCreateCompanionBuilder,
      $$RelationProjectTransactionTableUpdateCompanionBuilder,
      (
        TransactionProjectRelationEntity,
        $$RelationProjectTransactionTableReferences,
      ),
      TransactionProjectRelationEntity,
      PrefetchHooks Function({bool transactionId, bool projectId})
    >;
typedef $$RelationTransactionTableCreateCompanionBuilder =
    RelationTransactionCompanion Function({
      required int targetTransactionId,
      required int sourceTransactionId,
      required TransactionRelationType type,
      Value<int> rowid,
    });
typedef $$RelationTransactionTableUpdateCompanionBuilder =
    RelationTransactionCompanion Function({
      Value<int> targetTransactionId,
      Value<int> sourceTransactionId,
      Value<TransactionRelationType> type,
      Value<int> rowid,
    });

final class $$RelationTransactionTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RelationTransactionTable,
          TransactionRelationEntity
        > {
  $$RelationTransactionTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _targetTransactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.relationTransaction.targetTransactionId,
          db.transactions.transactionId,
        ),
      );

  $$TransactionsTableProcessedTableManager get targetTransactionId {
    final $_column = $_itemColumn<int>('target_transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.transactionId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_targetTransactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionsTable _sourceTransactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.relationTransaction.sourceTransactionId,
          db.transactions.transactionId,
        ),
      );

  $$TransactionsTableProcessedTableManager get sourceTransactionId {
    final $_column = $_itemColumn<int>('source_transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.transactionId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceTransactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RelationTransactionTableFilterComposer
    extends Composer<_$AppDatabase, $RelationTransactionTable> {
  $$RelationTransactionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<
    TransactionRelationType,
    TransactionRelationType,
    String
  >
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$TransactionsTableFilterComposer get targetTransactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableFilterComposer get sourceTransactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationTransactionTableOrderingComposer
    extends Composer<_$AppDatabase, $RelationTransactionTable> {
  $$RelationTransactionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get targetTransactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableOrderingComposer get sourceTransactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationTransactionTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelationTransactionTable> {
  $$RelationTransactionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<TransactionRelationType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get targetTransactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableAnnotationComposer get sourceTransactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationTransactionTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelationTransactionTable,
          TransactionRelationEntity,
          $$RelationTransactionTableFilterComposer,
          $$RelationTransactionTableOrderingComposer,
          $$RelationTransactionTableAnnotationComposer,
          $$RelationTransactionTableCreateCompanionBuilder,
          $$RelationTransactionTableUpdateCompanionBuilder,
          (TransactionRelationEntity, $$RelationTransactionTableReferences),
          TransactionRelationEntity,
          PrefetchHooks Function({
            bool targetTransactionId,
            bool sourceTransactionId,
          })
        > {
  $$RelationTransactionTableTableManager(
    _$AppDatabase db,
    $RelationTransactionTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelationTransactionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelationTransactionTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RelationTransactionTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> targetTransactionId = const Value.absent(),
                Value<int> sourceTransactionId = const Value.absent(),
                Value<TransactionRelationType> type = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationTransactionCompanion(
                targetTransactionId: targetTransactionId,
                sourceTransactionId: sourceTransactionId,
                type: type,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int targetTransactionId,
                required int sourceTransactionId,
                required TransactionRelationType type,
                Value<int> rowid = const Value.absent(),
              }) => RelationTransactionCompanion.insert(
                targetTransactionId: targetTransactionId,
                sourceTransactionId: sourceTransactionId,
                type: type,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RelationTransactionTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({targetTransactionId = false, sourceTransactionId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (targetTransactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.targetTransactionId,
                                    referencedTable:
                                        $$RelationTransactionTableReferences
                                            ._targetTransactionIdTable(db),
                                    referencedColumn:
                                        $$RelationTransactionTableReferences
                                            ._targetTransactionIdTable(db)
                                            .transactionId,
                                  )
                                  as T;
                        }
                        if (sourceTransactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceTransactionId,
                                    referencedTable:
                                        $$RelationTransactionTableReferences
                                            ._sourceTransactionIdTable(db),
                                    referencedColumn:
                                        $$RelationTransactionTableReferences
                                            ._sourceTransactionIdTable(db)
                                            .transactionId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$RelationTransactionTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelationTransactionTable,
      TransactionRelationEntity,
      $$RelationTransactionTableFilterComposer,
      $$RelationTransactionTableOrderingComposer,
      $$RelationTransactionTableAnnotationComposer,
      $$RelationTransactionTableCreateCompanionBuilder,
      $$RelationTransactionTableUpdateCompanionBuilder,
      (TransactionRelationEntity, $$RelationTransactionTableReferences),
      TransactionRelationEntity,
      PrefetchHooks Function({
        bool targetTransactionId,
        bool sourceTransactionId,
      })
    >;
typedef $$ReimbursementTableCreateCompanionBuilder =
    ReimbursementCompanion Function({
      Value<int> reimbursementId,
      required int transactionId,
      Value<bool> archived,
      required int createdAt,
      required int updatedAt,
    });
typedef $$ReimbursementTableUpdateCompanionBuilder =
    ReimbursementCompanion Function({
      Value<int> reimbursementId,
      Value<int> transactionId,
      Value<bool> archived,
      Value<int> createdAt,
      Value<int> updatedAt,
    });

final class $$ReimbursementTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ReimbursementTable,
          ReimbursementEntity
        > {
  $$ReimbursementTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.reimbursement.transactionId,
          db.transactions.transactionId,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.transactionId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ReimbursementExpectationTable,
    List<ReimbursementExpectationEntity>
  >
  _reimbursementExpectationRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reimbursementExpectation,
        aliasName: $_aliasNameGenerator(
          db.reimbursement.reimbursementId,
          db.reimbursementExpectation.reimbursementId,
        ),
      );

  $$ReimbursementExpectationTableProcessedTableManager
  get reimbursementExpectationRefs {
    final manager =
        $$ReimbursementExpectationTableTableManager(
          $_db,
          $_db.reimbursementExpectation,
        ).filter(
          (f) => f.reimbursementId.reimbursementId.sqlEquals(
            $_itemColumn<int>('reimbursement_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _reimbursementExpectationRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ReimbursementActualTable,
    List<ReimbursementActualEntity>
  >
  _reimbursementActualRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reimbursementActual,
        aliasName: $_aliasNameGenerator(
          db.reimbursement.reimbursementId,
          db.reimbursementActual.reimbursementId,
        ),
      );

  $$ReimbursementActualTableProcessedTableManager get reimbursementActualRefs {
    final manager =
        $$ReimbursementActualTableTableManager(
          $_db,
          $_db.reimbursementActual,
        ).filter(
          (f) => f.reimbursementId.reimbursementId.sqlEquals(
            $_itemColumn<int>('reimbursement_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _reimbursementActualRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ReimbursementTableFilterComposer
    extends Composer<_$AppDatabase, $ReimbursementTable> {
  $$ReimbursementTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get reimbursementId => $composableBuilder(
    column: $table.reimbursementId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> reimbursementExpectationRefs(
    Expression<bool> Function($$ReimbursementExpectationTableFilterComposer f)
    f,
  ) {
    final $$ReimbursementExpectationTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.reimbursementId,
          referencedTable: $db.reimbursementExpectation,
          getReferencedColumn: (t) => t.reimbursementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReimbursementExpectationTableFilterComposer(
                $db: $db,
                $table: $db.reimbursementExpectation,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> reimbursementActualRefs(
    Expression<bool> Function($$ReimbursementActualTableFilterComposer f) f,
  ) {
    final $$ReimbursementActualTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursementActual,
      getReferencedColumn: (t) => t.reimbursementId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementActualTableFilterComposer(
            $db: $db,
            $table: $db.reimbursementActual,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReimbursementTableOrderingComposer
    extends Composer<_$AppDatabase, $ReimbursementTable> {
  $$ReimbursementTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get reimbursementId => $composableBuilder(
    column: $table.reimbursementId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReimbursementTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReimbursementTable> {
  $$ReimbursementTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get reimbursementId => $composableBuilder(
    column: $table.reimbursementId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> reimbursementExpectationRefs<T extends Object>(
    Expression<T> Function($$ReimbursementExpectationTableAnnotationComposer a)
    f,
  ) {
    final $$ReimbursementExpectationTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.reimbursementId,
          referencedTable: $db.reimbursementExpectation,
          getReferencedColumn: (t) => t.reimbursementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReimbursementExpectationTableAnnotationComposer(
                $db: $db,
                $table: $db.reimbursementExpectation,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> reimbursementActualRefs<T extends Object>(
    Expression<T> Function($$ReimbursementActualTableAnnotationComposer a) f,
  ) {
    final $$ReimbursementActualTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.reimbursementId,
          referencedTable: $db.reimbursementActual,
          getReferencedColumn: (t) => t.reimbursementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReimbursementActualTableAnnotationComposer(
                $db: $db,
                $table: $db.reimbursementActual,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ReimbursementTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReimbursementTable,
          ReimbursementEntity,
          $$ReimbursementTableFilterComposer,
          $$ReimbursementTableOrderingComposer,
          $$ReimbursementTableAnnotationComposer,
          $$ReimbursementTableCreateCompanionBuilder,
          $$ReimbursementTableUpdateCompanionBuilder,
          (ReimbursementEntity, $$ReimbursementTableReferences),
          ReimbursementEntity,
          PrefetchHooks Function({
            bool transactionId,
            bool reimbursementExpectationRefs,
            bool reimbursementActualRefs,
          })
        > {
  $$ReimbursementTableTableManager(_$AppDatabase db, $ReimbursementTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReimbursementTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReimbursementTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReimbursementTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> reimbursementId = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => ReimbursementCompanion(
                reimbursementId: reimbursementId,
                transactionId: transactionId,
                archived: archived,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> reimbursementId = const Value.absent(),
                required int transactionId,
                Value<bool> archived = const Value.absent(),
                required int createdAt,
                required int updatedAt,
              }) => ReimbursementCompanion.insert(
                reimbursementId: reimbursementId,
                transactionId: transactionId,
                archived: archived,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReimbursementTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                transactionId = false,
                reimbursementExpectationRefs = false,
                reimbursementActualRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (reimbursementExpectationRefs)
                      db.reimbursementExpectation,
                    if (reimbursementActualRefs) db.reimbursementActual,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (transactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.transactionId,
                                    referencedTable:
                                        $$ReimbursementTableReferences
                                            ._transactionIdTable(db),
                                    referencedColumn:
                                        $$ReimbursementTableReferences
                                            ._transactionIdTable(db)
                                            .transactionId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (reimbursementExpectationRefs)
                        await $_getPrefetchedData<
                          ReimbursementEntity,
                          $ReimbursementTable,
                          ReimbursementExpectationEntity
                        >(
                          currentTable: table,
                          referencedTable: $$ReimbursementTableReferences
                              ._reimbursementExpectationRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ReimbursementTableReferences(
                                db,
                                table,
                                p0,
                              ).reimbursementExpectationRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) =>
                                    e.reimbursementId == item.reimbursementId,
                              ),
                          typedResults: items,
                        ),
                      if (reimbursementActualRefs)
                        await $_getPrefetchedData<
                          ReimbursementEntity,
                          $ReimbursementTable,
                          ReimbursementActualEntity
                        >(
                          currentTable: table,
                          referencedTable: $$ReimbursementTableReferences
                              ._reimbursementActualRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ReimbursementTableReferences(
                                db,
                                table,
                                p0,
                              ).reimbursementActualRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) =>
                                    e.reimbursementId == item.reimbursementId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ReimbursementTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReimbursementTable,
      ReimbursementEntity,
      $$ReimbursementTableFilterComposer,
      $$ReimbursementTableOrderingComposer,
      $$ReimbursementTableAnnotationComposer,
      $$ReimbursementTableCreateCompanionBuilder,
      $$ReimbursementTableUpdateCompanionBuilder,
      (ReimbursementEntity, $$ReimbursementTableReferences),
      ReimbursementEntity,
      PrefetchHooks Function({
        bool transactionId,
        bool reimbursementExpectationRefs,
        bool reimbursementActualRefs,
      })
    >;
typedef $$ReimbursementExpectationTableCreateCompanionBuilder =
    ReimbursementExpectationCompanion Function({
      Value<int> reimbursementExpectationId,
      required int reimbursementId,
      required String currencyCode,
      Value<int?> stakeholderId,
      required int amount,
      required int realAmount,
      Value<String> note,
    });
typedef $$ReimbursementExpectationTableUpdateCompanionBuilder =
    ReimbursementExpectationCompanion Function({
      Value<int> reimbursementExpectationId,
      Value<int> reimbursementId,
      Value<String> currencyCode,
      Value<int?> stakeholderId,
      Value<int> amount,
      Value<int> realAmount,
      Value<String> note,
    });

final class $$ReimbursementExpectationTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ReimbursementExpectationTable,
          ReimbursementExpectationEntity
        > {
  $$ReimbursementExpectationTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ReimbursementTable _reimbursementIdTable(_$AppDatabase db) =>
      db.reimbursement.createAlias(
        $_aliasNameGenerator(
          db.reimbursementExpectation.reimbursementId,
          db.reimbursement.reimbursementId,
        ),
      );

  $$ReimbursementTableProcessedTableManager get reimbursementId {
    final $_column = $_itemColumn<int>('reimbursement_id')!;

    final manager = $$ReimbursementTableTableManager(
      $_db,
      $_db.reimbursement,
    ).filter((f) => f.reimbursementId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reimbursementIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CurrencyTable _currencyCodeTable(_$AppDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(
          db.reimbursementExpectation.currencyCode,
          db.currency.currencyCode,
        ),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.currencyCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StakeholderTable _stakeholderIdTable(_$AppDatabase db) =>
      db.stakeholder.createAlias(
        $_aliasNameGenerator(
          db.reimbursementExpectation.stakeholderId,
          db.stakeholder.stakeholderId,
        ),
      );

  $$StakeholderTableProcessedTableManager? get stakeholderId {
    final $_column = $_itemColumn<int>('stakeholder_id');
    if ($_column == null) return null;
    final manager = $$StakeholderTableTableManager(
      $_db,
      $_db.stakeholder,
    ).filter((f) => f.stakeholderId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stakeholderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReimbursementExpectationTableFilterComposer
    extends Composer<_$AppDatabase, $ReimbursementExpectationTable> {
  $$ReimbursementExpectationTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get reimbursementExpectationId => $composableBuilder(
    column: $table.reimbursementExpectationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$ReimbursementTableFilterComposer get reimbursementId {
    final $$ReimbursementTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.reimbursementId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementTableFilterComposer(
            $db: $db,
            $table: $db.reimbursement,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableFilterComposer get currencyCode {
    final $$CurrencyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableFilterComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StakeholderTableFilterComposer get stakeholderId {
    final $$StakeholderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StakeholderTableFilterComposer(
            $db: $db,
            $table: $db.stakeholder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReimbursementExpectationTableOrderingComposer
    extends Composer<_$AppDatabase, $ReimbursementExpectationTable> {
  $$ReimbursementExpectationTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get reimbursementExpectationId => $composableBuilder(
    column: $table.reimbursementExpectationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$ReimbursementTableOrderingComposer get reimbursementId {
    final $$ReimbursementTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.reimbursementId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementTableOrderingComposer(
            $db: $db,
            $table: $db.reimbursement,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableOrderingComposer get currencyCode {
    final $$CurrencyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableOrderingComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StakeholderTableOrderingComposer get stakeholderId {
    final $$StakeholderTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StakeholderTableOrderingComposer(
            $db: $db,
            $table: $db.stakeholder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReimbursementExpectationTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReimbursementExpectationTable> {
  $$ReimbursementExpectationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get reimbursementExpectationId => $composableBuilder(
    column: $table.reimbursementExpectationId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$ReimbursementTableAnnotationComposer get reimbursementId {
    final $$ReimbursementTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.reimbursementId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementTableAnnotationComposer(
            $db: $db,
            $table: $db.reimbursement,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableAnnotationComposer get currencyCode {
    final $$CurrencyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableAnnotationComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StakeholderTableAnnotationComposer get stakeholderId {
    final $$StakeholderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StakeholderTableAnnotationComposer(
            $db: $db,
            $table: $db.stakeholder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReimbursementExpectationTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReimbursementExpectationTable,
          ReimbursementExpectationEntity,
          $$ReimbursementExpectationTableFilterComposer,
          $$ReimbursementExpectationTableOrderingComposer,
          $$ReimbursementExpectationTableAnnotationComposer,
          $$ReimbursementExpectationTableCreateCompanionBuilder,
          $$ReimbursementExpectationTableUpdateCompanionBuilder,
          (
            ReimbursementExpectationEntity,
            $$ReimbursementExpectationTableReferences,
          ),
          ReimbursementExpectationEntity,
          PrefetchHooks Function({
            bool reimbursementId,
            bool currencyCode,
            bool stakeholderId,
          })
        > {
  $$ReimbursementExpectationTableTableManager(
    _$AppDatabase db,
    $ReimbursementExpectationTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReimbursementExpectationTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ReimbursementExpectationTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ReimbursementExpectationTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> reimbursementExpectationId = const Value.absent(),
                Value<int> reimbursementId = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int?> stakeholderId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> realAmount = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => ReimbursementExpectationCompanion(
                reimbursementExpectationId: reimbursementExpectationId,
                reimbursementId: reimbursementId,
                currencyCode: currencyCode,
                stakeholderId: stakeholderId,
                amount: amount,
                realAmount: realAmount,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> reimbursementExpectationId = const Value.absent(),
                required int reimbursementId,
                required String currencyCode,
                Value<int?> stakeholderId = const Value.absent(),
                required int amount,
                required int realAmount,
                Value<String> note = const Value.absent(),
              }) => ReimbursementExpectationCompanion.insert(
                reimbursementExpectationId: reimbursementExpectationId,
                reimbursementId: reimbursementId,
                currencyCode: currencyCode,
                stakeholderId: stakeholderId,
                amount: amount,
                realAmount: realAmount,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReimbursementExpectationTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                reimbursementId = false,
                currencyCode = false,
                stakeholderId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (reimbursementId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.reimbursementId,
                                    referencedTable:
                                        $$ReimbursementExpectationTableReferences
                                            ._reimbursementIdTable(db),
                                    referencedColumn:
                                        $$ReimbursementExpectationTableReferences
                                            ._reimbursementIdTable(db)
                                            .reimbursementId,
                                  )
                                  as T;
                        }
                        if (currencyCode) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currencyCode,
                                    referencedTable:
                                        $$ReimbursementExpectationTableReferences
                                            ._currencyCodeTable(db),
                                    referencedColumn:
                                        $$ReimbursementExpectationTableReferences
                                            ._currencyCodeTable(db)
                                            .currencyCode,
                                  )
                                  as T;
                        }
                        if (stakeholderId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.stakeholderId,
                                    referencedTable:
                                        $$ReimbursementExpectationTableReferences
                                            ._stakeholderIdTable(db),
                                    referencedColumn:
                                        $$ReimbursementExpectationTableReferences
                                            ._stakeholderIdTable(db)
                                            .stakeholderId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ReimbursementExpectationTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReimbursementExpectationTable,
      ReimbursementExpectationEntity,
      $$ReimbursementExpectationTableFilterComposer,
      $$ReimbursementExpectationTableOrderingComposer,
      $$ReimbursementExpectationTableAnnotationComposer,
      $$ReimbursementExpectationTableCreateCompanionBuilder,
      $$ReimbursementExpectationTableUpdateCompanionBuilder,
      (
        ReimbursementExpectationEntity,
        $$ReimbursementExpectationTableReferences,
      ),
      ReimbursementExpectationEntity,
      PrefetchHooks Function({
        bool reimbursementId,
        bool currencyCode,
        bool stakeholderId,
      })
    >;
typedef $$ReimbursementActualTableCreateCompanionBuilder =
    ReimbursementActualCompanion Function({
      Value<int> reimbursementActualId,
      required int reimbursementId,
      required int accountId,
      required String currencyCode,
      required int amount,
      required int realAmount,
      required int timestamp,
      required int createdAt,
      required int updatedAt,
      Value<String> note,
    });
typedef $$ReimbursementActualTableUpdateCompanionBuilder =
    ReimbursementActualCompanion Function({
      Value<int> reimbursementActualId,
      Value<int> reimbursementId,
      Value<int> accountId,
      Value<String> currencyCode,
      Value<int> amount,
      Value<int> realAmount,
      Value<int> timestamp,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String> note,
    });

final class $$ReimbursementActualTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ReimbursementActualTable,
          ReimbursementActualEntity
        > {
  $$ReimbursementActualTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ReimbursementTable _reimbursementIdTable(_$AppDatabase db) =>
      db.reimbursement.createAlias(
        $_aliasNameGenerator(
          db.reimbursementActual.reimbursementId,
          db.reimbursement.reimbursementId,
        ),
      );

  $$ReimbursementTableProcessedTableManager get reimbursementId {
    final $_column = $_itemColumn<int>('reimbursement_id')!;

    final manager = $$ReimbursementTableTableManager(
      $_db,
      $_db.reimbursement,
    ).filter((f) => f.reimbursementId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reimbursementIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountTable _accountIdTable(_$AppDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(
          db.reimbursementActual.accountId,
          db.account.accountId,
        ),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.accountId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CurrencyTable _currencyCodeTable(_$AppDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(
          db.reimbursementActual.currencyCode,
          db.currency.currencyCode,
        ),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.currencyCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReimbursementActualTableFilterComposer
    extends Composer<_$AppDatabase, $ReimbursementActualTable> {
  $$ReimbursementActualTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get reimbursementActualId => $composableBuilder(
    column: $table.reimbursementActualId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$ReimbursementTableFilterComposer get reimbursementId {
    final $$ReimbursementTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.reimbursementId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementTableFilterComposer(
            $db: $db,
            $table: $db.reimbursement,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableFilterComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableFilterComposer get currencyCode {
    final $$CurrencyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableFilterComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReimbursementActualTableOrderingComposer
    extends Composer<_$AppDatabase, $ReimbursementActualTable> {
  $$ReimbursementActualTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get reimbursementActualId => $composableBuilder(
    column: $table.reimbursementActualId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$ReimbursementTableOrderingComposer get reimbursementId {
    final $$ReimbursementTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.reimbursementId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementTableOrderingComposer(
            $db: $db,
            $table: $db.reimbursement,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableOrderingComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableOrderingComposer get currencyCode {
    final $$CurrencyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableOrderingComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReimbursementActualTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReimbursementActualTable> {
  $$ReimbursementActualTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get reimbursementActualId => $composableBuilder(
    column: $table.reimbursementActualId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$ReimbursementTableAnnotationComposer get reimbursementId {
    final $$ReimbursementTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.reimbursementId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReimbursementTableAnnotationComposer(
            $db: $db,
            $table: $db.reimbursement,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountTableAnnotationComposer(
            $db: $db,
            $table: $db.account,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyTableAnnotationComposer get currencyCode {
    final $$CurrencyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.currencyCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyTableAnnotationComposer(
            $db: $db,
            $table: $db.currency,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReimbursementActualTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReimbursementActualTable,
          ReimbursementActualEntity,
          $$ReimbursementActualTableFilterComposer,
          $$ReimbursementActualTableOrderingComposer,
          $$ReimbursementActualTableAnnotationComposer,
          $$ReimbursementActualTableCreateCompanionBuilder,
          $$ReimbursementActualTableUpdateCompanionBuilder,
          (ReimbursementActualEntity, $$ReimbursementActualTableReferences),
          ReimbursementActualEntity,
          PrefetchHooks Function({
            bool reimbursementId,
            bool accountId,
            bool currencyCode,
          })
        > {
  $$ReimbursementActualTableTableManager(
    _$AppDatabase db,
    $ReimbursementActualTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReimbursementActualTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReimbursementActualTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ReimbursementActualTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> reimbursementActualId = const Value.absent(),
                Value<int> reimbursementId = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> realAmount = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String> note = const Value.absent(),
              }) => ReimbursementActualCompanion(
                reimbursementActualId: reimbursementActualId,
                reimbursementId: reimbursementId,
                accountId: accountId,
                currencyCode: currencyCode,
                amount: amount,
                realAmount: realAmount,
                timestamp: timestamp,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> reimbursementActualId = const Value.absent(),
                required int reimbursementId,
                required int accountId,
                required String currencyCode,
                required int amount,
                required int realAmount,
                required int timestamp,
                required int createdAt,
                required int updatedAt,
                Value<String> note = const Value.absent(),
              }) => ReimbursementActualCompanion.insert(
                reimbursementActualId: reimbursementActualId,
                reimbursementId: reimbursementId,
                accountId: accountId,
                currencyCode: currencyCode,
                amount: amount,
                realAmount: realAmount,
                timestamp: timestamp,
                createdAt: createdAt,
                updatedAt: updatedAt,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReimbursementActualTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                reimbursementId = false,
                accountId = false,
                currencyCode = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (reimbursementId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.reimbursementId,
                                    referencedTable:
                                        $$ReimbursementActualTableReferences
                                            ._reimbursementIdTable(db),
                                    referencedColumn:
                                        $$ReimbursementActualTableReferences
                                            ._reimbursementIdTable(db)
                                            .reimbursementId,
                                  )
                                  as T;
                        }
                        if (accountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.accountId,
                                    referencedTable:
                                        $$ReimbursementActualTableReferences
                                            ._accountIdTable(db),
                                    referencedColumn:
                                        $$ReimbursementActualTableReferences
                                            ._accountIdTable(db)
                                            .accountId,
                                  )
                                  as T;
                        }
                        if (currencyCode) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currencyCode,
                                    referencedTable:
                                        $$ReimbursementActualTableReferences
                                            ._currencyCodeTable(db),
                                    referencedColumn:
                                        $$ReimbursementActualTableReferences
                                            ._currencyCodeTable(db)
                                            .currencyCode,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ReimbursementActualTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReimbursementActualTable,
      ReimbursementActualEntity,
      $$ReimbursementActualTableFilterComposer,
      $$ReimbursementActualTableOrderingComposer,
      $$ReimbursementActualTableAnnotationComposer,
      $$ReimbursementActualTableCreateCompanionBuilder,
      $$ReimbursementActualTableUpdateCompanionBuilder,
      (ReimbursementActualEntity, $$ReimbursementActualTableReferences),
      ReimbursementActualEntity,
      PrefetchHooks Function({
        bool reimbursementId,
        bool accountId,
        bool currencyCode,
      })
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CurrencyTableTableManager get currency =>
      $$CurrencyTableTableManager(_db, _db.currency);
  $$AccountTableTableManager get account =>
      $$AccountTableTableManager(_db, _db.account);
  $$AccountMetaTableTableManager get accountMeta =>
      $$AccountMetaTableTableManager(_db, _db.accountMeta);
  $$AccountCreditTableTableManager get accountCredit =>
      $$AccountCreditTableTableManager(_db, _db.accountCredit);
  $$AccountBonusTableTableManager get accountBonus =>
      $$AccountBonusTableTableManager(_db, _db.accountBonus);
  $$StakeholderTableTableManager get stakeholder =>
      $$StakeholderTableTableManager(_db, _db.stakeholder);
  $$AccountLoanTableTableManager get accountLoan =>
      $$AccountLoanTableTableManager(_db, _db.accountLoan);
  $$LoanPlanTableTableManager get loanPlan =>
      $$LoanPlanTableTableManager(_db, _db.loanPlan);
  $$LoanRecordTableTableManager get loanRecord =>
      $$LoanRecordTableTableManager(_db, _db.loanRecord);
  $$LedgerTableTableManager get ledger =>
      $$LedgerTableTableManager(_db, _db.ledger);
  $$RelationAccountLedgerTableTableManager get relationAccountLedger =>
      $$RelationAccountLedgerTableTableManager(_db, _db.relationAccountLedger);
  $$ProjectTableTableManager get project =>
      $$ProjectTableTableManager(_db, _db.project);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
  $$RelationCategoryLedgerTableTableManager get relationCategoryLedger =>
      $$RelationCategoryLedgerTableTableManager(
        _db,
        _db.relationCategoryLedger,
      );
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$TransactionAmountDetailTableTableManager get transactionAmountDetail =>
      $$TransactionAmountDetailTableTableManager(
        _db,
        _db.transactionAmountDetail,
      );
  $$TransactionCategoryDetailTableTableManager get transactionCategoryDetail =>
      $$TransactionCategoryDetailTableTableManager(
        _db,
        _db.transactionCategoryDetail,
      );
  $$TransactionInstallmentDetailTableTableManager
  get transactionInstallmentDetail =>
      $$TransactionInstallmentDetailTableTableManager(
        _db,
        _db.transactionInstallmentDetail,
      );
  $$TransactionInstallmentItemTableTableManager
  get transactionInstallmentItem =>
      $$TransactionInstallmentItemTableTableManager(
        _db,
        _db.transactionInstallmentItem,
      );
  $$TransactionReduceTableTableManager get transactionReduce =>
      $$TransactionReduceTableTableManager(_db, _db.transactionReduce);
  $$TransactionRefundTableTableManager get transactionRefund =>
      $$TransactionRefundTableTableManager(_db, _db.transactionRefund);
  $$RelationProjectTransactionTableTableManager
  get relationProjectTransaction =>
      $$RelationProjectTransactionTableTableManager(
        _db,
        _db.relationProjectTransaction,
      );
  $$RelationTransactionTableTableManager get relationTransaction =>
      $$RelationTransactionTableTableManager(_db, _db.relationTransaction);
  $$ReimbursementTableTableManager get reimbursement =>
      $$ReimbursementTableTableManager(_db, _db.reimbursement);
  $$ReimbursementExpectationTableTableManager get reimbursementExpectation =>
      $$ReimbursementExpectationTableTableManager(
        _db,
        _db.reimbursementExpectation,
      );
  $$ReimbursementActualTableTableManager get reimbursementActual =>
      $$ReimbursementActualTableTableManager(_db, _db.reimbursementActual);
}
