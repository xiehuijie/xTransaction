// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CurrencyTable extends Currency
    with TableInfo<$CurrencyTable, CurrencyEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
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
  static const VerificationMeta _mainMeta = const VerificationMeta('main');
  @override
  late final GeneratedColumn<bool> main = GeneratedColumn<bool>(
    'main',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("main" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
    code,
    name,
    symbol,
    main,
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
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
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
    if (data.containsKey('main')) {
      context.handle(
        _mainMeta,
        main.isAcceptableOrUnknown(data['main']!, _mainMeta),
      );
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
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  CurrencyEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyEntity(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      )!,
      main: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}main'],
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
      )!,
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
  /// 货币代码 🔑
  final String code;

  /// 货币名称
  final String name;

  /// 货币符号
  final String symbol;

  /// 是否为本币
  final bool main;

  /// 货币符号位置 ℹ️
  final CurrencyPosition position;

  /// 小数位数
  final int decimal;

  /// 货币图标
  final String icon;

  /// 货币来源 ℹ️
  final CurrencySource source;
  const CurrencyEntity({
    required this.code,
    required this.name,
    required this.symbol,
    required this.main,
    required this.position,
    required this.decimal,
    required this.icon,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['symbol'] = Variable<String>(symbol);
    map['main'] = Variable<bool>(main);
    {
      map['position'] = Variable<String>(
        $CurrencyTable.$converterposition.toSql(position),
      );
    }
    map['decimal'] = Variable<int>(decimal);
    map['icon'] = Variable<String>(icon);
    {
      map['source'] = Variable<String>(
        $CurrencyTable.$convertersource.toSql(source),
      );
    }
    return map;
  }

  CurrencyCompanion toCompanion(bool nullToAbsent) {
    return CurrencyCompanion(
      code: Value(code),
      name: Value(name),
      symbol: Value(symbol),
      main: Value(main),
      position: Value(position),
      decimal: Value(decimal),
      icon: Value(icon),
      source: Value(source),
    );
  }

  factory CurrencyEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyEntity(
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      symbol: serializer.fromJson<String>(json['symbol']),
      main: serializer.fromJson<bool>(json['main']),
      position: $CurrencyTable.$converterposition.fromJson(
        serializer.fromJson<String>(json['position']),
      ),
      decimal: serializer.fromJson<int>(json['decimal']),
      icon: serializer.fromJson<String>(json['icon']),
      source: $CurrencyTable.$convertersource.fromJson(
        serializer.fromJson<String>(json['source']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'symbol': serializer.toJson<String>(symbol),
      'main': serializer.toJson<bool>(main),
      'position': serializer.toJson<String>(
        $CurrencyTable.$converterposition.toJson(position),
      ),
      'decimal': serializer.toJson<int>(decimal),
      'icon': serializer.toJson<String>(icon),
      'source': serializer.toJson<String>(
        $CurrencyTable.$convertersource.toJson(source),
      ),
    };
  }

  CurrencyEntity copyWith({
    String? code,
    String? name,
    String? symbol,
    bool? main,
    CurrencyPosition? position,
    int? decimal,
    String? icon,
    CurrencySource? source,
  }) => CurrencyEntity(
    code: code ?? this.code,
    name: name ?? this.name,
    symbol: symbol ?? this.symbol,
    main: main ?? this.main,
    position: position ?? this.position,
    decimal: decimal ?? this.decimal,
    icon: icon ?? this.icon,
    source: source ?? this.source,
  );
  CurrencyEntity copyWithCompanion(CurrencyCompanion data) {
    return CurrencyEntity(
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      main: data.main.present ? data.main.value : this.main,
      position: data.position.present ? data.position.value : this.position,
      decimal: data.decimal.present ? data.decimal.value : this.decimal,
      icon: data.icon.present ? data.icon.value : this.icon,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyEntity(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol, ')
          ..write('main: $main, ')
          ..write('position: $position, ')
          ..write('decimal: $decimal, ')
          ..write('icon: $icon, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(code, name, symbol, main, position, decimal, icon, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyEntity &&
          other.code == this.code &&
          other.name == this.name &&
          other.symbol == this.symbol &&
          other.main == this.main &&
          other.position == this.position &&
          other.decimal == this.decimal &&
          other.icon == this.icon &&
          other.source == this.source);
}

class CurrencyCompanion extends UpdateCompanion<CurrencyEntity> {
  final Value<String> code;
  final Value<String> name;
  final Value<String> symbol;
  final Value<bool> main;
  final Value<CurrencyPosition> position;
  final Value<int> decimal;
  final Value<String> icon;
  final Value<CurrencySource> source;
  final Value<int> rowid;
  const CurrencyCompanion({
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.symbol = const Value.absent(),
    this.main = const Value.absent(),
    this.position = const Value.absent(),
    this.decimal = const Value.absent(),
    this.icon = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrencyCompanion.insert({
    required String code,
    required String name,
    required String symbol,
    this.main = const Value.absent(),
    this.position = const Value.absent(),
    this.decimal = const Value.absent(),
    this.icon = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : code = Value(code),
       name = Value(name),
       symbol = Value(symbol);
  static Insertable<CurrencyEntity> custom({
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? symbol,
    Expression<bool>? main,
    Expression<String>? position,
    Expression<int>? decimal,
    Expression<String>? icon,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (symbol != null) 'symbol': symbol,
      if (main != null) 'main': main,
      if (position != null) 'position': position,
      if (decimal != null) 'decimal': decimal,
      if (icon != null) 'icon': icon,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrencyCompanion copyWith({
    Value<String>? code,
    Value<String>? name,
    Value<String>? symbol,
    Value<bool>? main,
    Value<CurrencyPosition>? position,
    Value<int>? decimal,
    Value<String>? icon,
    Value<CurrencySource>? source,
    Value<int>? rowid,
  }) {
    return CurrencyCompanion(
      code: code ?? this.code,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      main: main ?? this.main,
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
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (main.present) {
      map['main'] = Variable<bool>(main.value);
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
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol, ')
          ..write('main: $main, ')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
      'REFERENCES currency (code)',
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {name},
  ];
  @override
  AccountEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
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
      ),
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
  /// 账户唯一标识 🔑#️⃣
  final int id;

  /// 账户名称 ❄️
  final String name;

  /// 账户描述
  final String description;

  /// 账户图标
  final String icon;

  /// 账户类型 ℹ️
  final AccountType type;

  /// 账户货币代码 🔗
  final String currencyCode;

  /// 创建时间 🕗
  final int createdAt;

  /// 更新时间 🕗
  final int updatedAt;

  /// 备注
  final String? note;
  const AccountEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.type,
    required this.currencyCode,
    required this.createdAt,
    required this.updatedAt,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['icon'] = Variable<String>(icon);
    {
      map['type'] = Variable<String>($AccountTable.$convertertype.toSql(type));
    }
    map['currency_code'] = Variable<String>(currencyCode);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  AccountCompanion toCompanion(bool nullToAbsent) {
    return AccountCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      icon: Value(icon),
      type: Value(type),
      currencyCode: Value(currencyCode),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory AccountEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      icon: serializer.fromJson<String>(json['icon']),
      type: $AccountTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'icon': serializer.toJson<String>(icon),
      'type': serializer.toJson<String>(
        $AccountTable.$convertertype.toJson(type),
      ),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'note': serializer.toJson<String?>(note),
    };
  }

  AccountEntity copyWith({
    int? id,
    String? name,
    String? description,
    String? icon,
    AccountType? type,
    String? currencyCode,
    int? createdAt,
    int? updatedAt,
    Value<String?> note = const Value.absent(),
  }) => AccountEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    icon: icon ?? this.icon,
    type: type ?? this.type,
    currencyCode: currencyCode ?? this.currencyCode,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    note: note.present ? note.value : this.note,
  );
  AccountEntity copyWithCompanion(AccountCompanion data) {
    return AccountEntity(
      id: data.id.present ? data.id.value : this.id,
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
          ..write('id: $id, ')
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
    id,
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
          other.id == this.id &&
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
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> icon;
  final Value<AccountType> type;
  final Value<String> currencyCode;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String?> note;
  const AccountCompanion({
    this.id = const Value.absent(),
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
    this.id = const Value.absent(),
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
    Expression<int>? id,
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
      if (id != null) 'id': id,
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
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? icon,
    Value<AccountType>? type,
    Value<String>? currencyCode,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String?>? note,
  }) {
    return AccountCompanion(
      id: id ?? this.id,
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
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
          ..write('id: $id, ')
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
      'REFERENCES account (id)',
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
  /// 关联的账户唯一标识 🔑🔗
  final int accountId;

  /// 元数据作用域 🔑ℹ️
  final AccountMetaScope scope;

  /// 元数据键 🔑
  final String key;

  /// 元数据值
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
      'REFERENCES account (id)',
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
  /// 关联的账户唯一标识 🔑🔗
  final int accountId;

  /// 信用额度 💰
  final int creditLimit;

  /// 账单日 📅
  final int billingCycleDay;

  /// 还款日 📅
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

class $AccountPrepaidTable extends AccountPrepaid
    with TableInfo<$AccountPrepaidTable, PrepaidAccountEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountPrepaidTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _prepaidAccountIdMeta = const VerificationMeta(
    'prepaidAccountId',
  );
  @override
  late final GeneratedColumn<int> prepaidAccountId = GeneratedColumn<int>(
    'prepaid_account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES account (id)',
    ),
  );
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
      'REFERENCES account (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountBonusMode, String>
  bonusMode = GeneratedColumn<String>(
    'bonus_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<AccountBonusMode>($AccountPrepaidTable.$converterbonusMode);
  @override
  List<GeneratedColumn> get $columns => [
    prepaidAccountId,
    bonusAccountId,
    bonusMode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_prepaid';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrepaidAccountEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('prepaid_account_id')) {
      context.handle(
        _prepaidAccountIdMeta,
        prepaidAccountId.isAcceptableOrUnknown(
          data['prepaid_account_id']!,
          _prepaidAccountIdMeta,
        ),
      );
    }
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {prepaidAccountId};
  @override
  PrepaidAccountEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrepaidAccountEntity(
      prepaidAccountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}prepaid_account_id'],
      )!,
      bonusAccountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bonus_account_id'],
      )!,
      bonusMode: $AccountPrepaidTable.$converterbonusMode.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}bonus_mode'],
        )!,
      ),
    );
  }

  @override
  $AccountPrepaidTable createAlias(String alias) {
    return $AccountPrepaidTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountBonusMode, String, String>
  $converterbonusMode = const EnumNameConverter<AccountBonusMode>(
    AccountBonusMode.values,
  );
}

class PrepaidAccountEntity extends DataClass
    implements Insertable<PrepaidAccountEntity> {
  /// 对应的预付款账户唯一标识 🔑🔗
  final int prepaidAccountId;

  /// 对应的赠送金账户唯一标识 ❄️🔗
  final int bonusAccountId;

  /// 赠送金扣减方式 ℹ️
  final AccountBonusMode bonusMode;
  const PrepaidAccountEntity({
    required this.prepaidAccountId,
    required this.bonusAccountId,
    required this.bonusMode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['prepaid_account_id'] = Variable<int>(prepaidAccountId);
    map['bonus_account_id'] = Variable<int>(bonusAccountId);
    {
      map['bonus_mode'] = Variable<String>(
        $AccountPrepaidTable.$converterbonusMode.toSql(bonusMode),
      );
    }
    return map;
  }

  AccountPrepaidCompanion toCompanion(bool nullToAbsent) {
    return AccountPrepaidCompanion(
      prepaidAccountId: Value(prepaidAccountId),
      bonusAccountId: Value(bonusAccountId),
      bonusMode: Value(bonusMode),
    );
  }

  factory PrepaidAccountEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrepaidAccountEntity(
      prepaidAccountId: serializer.fromJson<int>(json['prepaidAccountId']),
      bonusAccountId: serializer.fromJson<int>(json['bonusAccountId']),
      bonusMode: $AccountPrepaidTable.$converterbonusMode.fromJson(
        serializer.fromJson<String>(json['bonusMode']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'prepaidAccountId': serializer.toJson<int>(prepaidAccountId),
      'bonusAccountId': serializer.toJson<int>(bonusAccountId),
      'bonusMode': serializer.toJson<String>(
        $AccountPrepaidTable.$converterbonusMode.toJson(bonusMode),
      ),
    };
  }

  PrepaidAccountEntity copyWith({
    int? prepaidAccountId,
    int? bonusAccountId,
    AccountBonusMode? bonusMode,
  }) => PrepaidAccountEntity(
    prepaidAccountId: prepaidAccountId ?? this.prepaidAccountId,
    bonusAccountId: bonusAccountId ?? this.bonusAccountId,
    bonusMode: bonusMode ?? this.bonusMode,
  );
  PrepaidAccountEntity copyWithCompanion(AccountPrepaidCompanion data) {
    return PrepaidAccountEntity(
      prepaidAccountId: data.prepaidAccountId.present
          ? data.prepaidAccountId.value
          : this.prepaidAccountId,
      bonusAccountId: data.bonusAccountId.present
          ? data.bonusAccountId.value
          : this.bonusAccountId,
      bonusMode: data.bonusMode.present ? data.bonusMode.value : this.bonusMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrepaidAccountEntity(')
          ..write('prepaidAccountId: $prepaidAccountId, ')
          ..write('bonusAccountId: $bonusAccountId, ')
          ..write('bonusMode: $bonusMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(prepaidAccountId, bonusAccountId, bonusMode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrepaidAccountEntity &&
          other.prepaidAccountId == this.prepaidAccountId &&
          other.bonusAccountId == this.bonusAccountId &&
          other.bonusMode == this.bonusMode);
}

class AccountPrepaidCompanion extends UpdateCompanion<PrepaidAccountEntity> {
  final Value<int> prepaidAccountId;
  final Value<int> bonusAccountId;
  final Value<AccountBonusMode> bonusMode;
  const AccountPrepaidCompanion({
    this.prepaidAccountId = const Value.absent(),
    this.bonusAccountId = const Value.absent(),
    this.bonusMode = const Value.absent(),
  });
  AccountPrepaidCompanion.insert({
    this.prepaidAccountId = const Value.absent(),
    required int bonusAccountId,
    required AccountBonusMode bonusMode,
  }) : bonusAccountId = Value(bonusAccountId),
       bonusMode = Value(bonusMode);
  static Insertable<PrepaidAccountEntity> custom({
    Expression<int>? prepaidAccountId,
    Expression<int>? bonusAccountId,
    Expression<String>? bonusMode,
  }) {
    return RawValuesInsertable({
      if (prepaidAccountId != null) 'prepaid_account_id': prepaidAccountId,
      if (bonusAccountId != null) 'bonus_account_id': bonusAccountId,
      if (bonusMode != null) 'bonus_mode': bonusMode,
    });
  }

  AccountPrepaidCompanion copyWith({
    Value<int>? prepaidAccountId,
    Value<int>? bonusAccountId,
    Value<AccountBonusMode>? bonusMode,
  }) {
    return AccountPrepaidCompanion(
      prepaidAccountId: prepaidAccountId ?? this.prepaidAccountId,
      bonusAccountId: bonusAccountId ?? this.bonusAccountId,
      bonusMode: bonusMode ?? this.bonusMode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (prepaidAccountId.present) {
      map['prepaid_account_id'] = Variable<int>(prepaidAccountId.value);
    }
    if (bonusAccountId.present) {
      map['bonus_account_id'] = Variable<int>(bonusAccountId.value);
    }
    if (bonusMode.present) {
      map['bonus_mode'] = Variable<String>(
        $AccountPrepaidTable.$converterbonusMode.toSql(bonusMode.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountPrepaidCompanion(')
          ..write('prepaidAccountId: $prepaidAccountId, ')
          ..write('bonusAccountId: $bonusAccountId, ')
          ..write('bonusMode: $bonusMode')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    id,
    name,
    type,
    description,
    icon,
    archived,
    createdAt,
    updatedAt,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {name},
  ];
  @override
  StakeholderEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StakeholderEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
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
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
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
  $StakeholderTable createAlias(String alias) {
    return $StakeholderTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<StakeholderType, String, String> $convertertype =
      const EnumNameConverter<StakeholderType>(StakeholderType.values);
}

class StakeholderEntity extends DataClass
    implements Insertable<StakeholderEntity> {
  /// 相关方唯一标识 🔑#️⃣
  final int id;

  /// 相关方名称 ❄️
  final String name;

  /// 相关方类型 ℹ️🔍
  final StakeholderType type;

  /// 相关方描述
  final String? description;

  /// 相关方图标
  final String? icon;

  /// 是否归档 🔍
  final bool archived;

  /// 创建时间 🕗
  final int createdAt;

  /// 更新时间 🕗
  final int updatedAt;
  const StakeholderEntity({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    this.icon,
    required this.archived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>(
        $StakeholderTable.$convertertype.toSql(type),
      );
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    map['archived'] = Variable<bool>(archived);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  StakeholderCompanion toCompanion(bool nullToAbsent) {
    return StakeholderCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      archived: Value(archived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory StakeholderEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StakeholderEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: $StakeholderTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      description: serializer.fromJson<String?>(json['description']),
      icon: serializer.fromJson<String?>(json['icon']),
      archived: serializer.fromJson<bool>(json['archived']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(
        $StakeholderTable.$convertertype.toJson(type),
      ),
      'description': serializer.toJson<String?>(description),
      'icon': serializer.toJson<String?>(icon),
      'archived': serializer.toJson<bool>(archived),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  StakeholderEntity copyWith({
    int? id,
    String? name,
    StakeholderType? type,
    Value<String?> description = const Value.absent(),
    Value<String?> icon = const Value.absent(),
    bool? archived,
    int? createdAt,
    int? updatedAt,
  }) => StakeholderEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    description: description.present ? description.value : this.description,
    icon: icon.present ? icon.value : this.icon,
    archived: archived ?? this.archived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  StakeholderEntity copyWithCompanion(StakeholderCompanion data) {
    return StakeholderEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      icon: data.icon.present ? data.icon.value : this.icon,
      archived: data.archived.present ? data.archived.value : this.archived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StakeholderEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    description,
    icon,
    archived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StakeholderEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.description == this.description &&
          other.icon == this.icon &&
          other.archived == this.archived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StakeholderCompanion extends UpdateCompanion<StakeholderEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<StakeholderType> type;
  final Value<String?> description;
  final Value<String?> icon;
  final Value<bool> archived;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const StakeholderCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StakeholderCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required StakeholderType type,
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.archived = const Value.absent(),
    required int createdAt,
    required int updatedAt,
  }) : name = Value(name),
       type = Value(type),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<StakeholderEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? description,
    Expression<String>? icon,
    Expression<bool>? archived,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (archived != null) 'archived': archived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StakeholderCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<StakeholderType>? type,
    Value<String?>? description,
    Value<String?>? icon,
    Value<bool>? archived,
    Value<int>? createdAt,
    Value<int>? updatedAt,
  }) {
    return StakeholderCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      archived: archived ?? this.archived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $StakeholderTable.$convertertype.toSql(type.value),
      );
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StakeholderCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AccountPlanLoanTable extends AccountPlanLoan
    with TableInfo<$AccountPlanLoanTable, PlanLoanAccountEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountPlanLoanTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES account (id)',
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
      'REFERENCES stakeholder (id)',
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
      ).withConverter<AccountLoanType>($AccountPlanLoanTable.$convertertype);
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
  @override
  List<GeneratedColumn> get $columns => [
    accountId,
    stakeholderId,
    type,
    archived,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_plan_loan';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanLoanAccountEntity> instance, {
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
    if (data.containsKey('archived')) {
      context.handle(
        _archivedMeta,
        archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId};
  @override
  PlanLoanAccountEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanLoanAccountEntity(
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      stakeholderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stakeholder_id'],
      )!,
      type: $AccountPlanLoanTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      archived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}archived'],
      )!,
    );
  }

  @override
  $AccountPlanLoanTable createAlias(String alias) {
    return $AccountPlanLoanTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountLoanType, String, String> $convertertype =
      const EnumNameConverter<AccountLoanType>(AccountLoanType.values);
}

class PlanLoanAccountEntity extends DataClass
    implements Insertable<PlanLoanAccountEntity> {
  /// 关联的账户唯一标识 🔑🔗
  final int accountId;

  /// 关联的相关方唯一标识 🔗🔍
  final int stakeholderId;

  /// 借贷类型 ℹ️
  final AccountLoanType type;

  /// 是否归档 🔍
  final bool archived;
  const PlanLoanAccountEntity({
    required this.accountId,
    required this.stakeholderId,
    required this.type,
    required this.archived,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    map['stakeholder_id'] = Variable<int>(stakeholderId);
    {
      map['type'] = Variable<String>(
        $AccountPlanLoanTable.$convertertype.toSql(type),
      );
    }
    map['archived'] = Variable<bool>(archived);
    return map;
  }

  AccountPlanLoanCompanion toCompanion(bool nullToAbsent) {
    return AccountPlanLoanCompanion(
      accountId: Value(accountId),
      stakeholderId: Value(stakeholderId),
      type: Value(type),
      archived: Value(archived),
    );
  }

  factory PlanLoanAccountEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanLoanAccountEntity(
      accountId: serializer.fromJson<int>(json['accountId']),
      stakeholderId: serializer.fromJson<int>(json['stakeholderId']),
      type: $AccountPlanLoanTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      archived: serializer.fromJson<bool>(json['archived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'stakeholderId': serializer.toJson<int>(stakeholderId),
      'type': serializer.toJson<String>(
        $AccountPlanLoanTable.$convertertype.toJson(type),
      ),
      'archived': serializer.toJson<bool>(archived),
    };
  }

  PlanLoanAccountEntity copyWith({
    int? accountId,
    int? stakeholderId,
    AccountLoanType? type,
    bool? archived,
  }) => PlanLoanAccountEntity(
    accountId: accountId ?? this.accountId,
    stakeholderId: stakeholderId ?? this.stakeholderId,
    type: type ?? this.type,
    archived: archived ?? this.archived,
  );
  PlanLoanAccountEntity copyWithCompanion(AccountPlanLoanCompanion data) {
    return PlanLoanAccountEntity(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      stakeholderId: data.stakeholderId.present
          ? data.stakeholderId.value
          : this.stakeholderId,
      type: data.type.present ? data.type.value : this.type,
      archived: data.archived.present ? data.archived.value : this.archived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanLoanAccountEntity(')
          ..write('accountId: $accountId, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('type: $type, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accountId, stakeholderId, type, archived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanLoanAccountEntity &&
          other.accountId == this.accountId &&
          other.stakeholderId == this.stakeholderId &&
          other.type == this.type &&
          other.archived == this.archived);
}

class AccountPlanLoanCompanion extends UpdateCompanion<PlanLoanAccountEntity> {
  final Value<int> accountId;
  final Value<int> stakeholderId;
  final Value<AccountLoanType> type;
  final Value<bool> archived;
  const AccountPlanLoanCompanion({
    this.accountId = const Value.absent(),
    this.stakeholderId = const Value.absent(),
    this.type = const Value.absent(),
    this.archived = const Value.absent(),
  });
  AccountPlanLoanCompanion.insert({
    this.accountId = const Value.absent(),
    required int stakeholderId,
    required AccountLoanType type,
    this.archived = const Value.absent(),
  }) : stakeholderId = Value(stakeholderId),
       type = Value(type);
  static Insertable<PlanLoanAccountEntity> custom({
    Expression<int>? accountId,
    Expression<int>? stakeholderId,
    Expression<String>? type,
    Expression<bool>? archived,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (stakeholderId != null) 'stakeholder_id': stakeholderId,
      if (type != null) 'type': type,
      if (archived != null) 'archived': archived,
    });
  }

  AccountPlanLoanCompanion copyWith({
    Value<int>? accountId,
    Value<int>? stakeholderId,
    Value<AccountLoanType>? type,
    Value<bool>? archived,
  }) {
    return AccountPlanLoanCompanion(
      accountId: accountId ?? this.accountId,
      stakeholderId: stakeholderId ?? this.stakeholderId,
      type: type ?? this.type,
      archived: archived ?? this.archived,
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
        $AccountPlanLoanTable.$convertertype.toSql(type.value),
      );
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountPlanLoanCompanion(')
          ..write('accountId: $accountId, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('type: $type, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }
}

class $AccountFlexLoanTable extends AccountFlexLoan
    with TableInfo<$AccountFlexLoanTable, FlexLoanAccountEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountFlexLoanTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES account (id)',
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
      'REFERENCES stakeholder (id)',
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
      ).withConverter<AccountLoanType>($AccountFlexLoanTable.$convertertype);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
    'rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<LoanInterestCycle, String> cycle =
      GeneratedColumn<String>(
        'cycle',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LoanInterestCycle>($AccountFlexLoanTable.$convertercycle);
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
  @override
  List<GeneratedColumn> get $columns => [
    accountId,
    stakeholderId,
    type,
    rate,
    cycle,
    startDate,
    endDate,
    archived,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_flex_loan';
  @override
  VerificationContext validateIntegrity(
    Insertable<FlexLoanAccountEntity> instance, {
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId};
  @override
  FlexLoanAccountEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlexLoanAccountEntity(
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      stakeholderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stakeholder_id'],
      )!,
      type: $AccountFlexLoanTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      rate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rate'],
      )!,
      cycle: $AccountFlexLoanTable.$convertercycle.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}cycle'],
        )!,
      ),
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
    );
  }

  @override
  $AccountFlexLoanTable createAlias(String alias) {
    return $AccountFlexLoanTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountLoanType, String, String> $convertertype =
      const EnumNameConverter<AccountLoanType>(AccountLoanType.values);
  static JsonTypeConverter2<LoanInterestCycle, String, String> $convertercycle =
      const EnumNameConverter<LoanInterestCycle>(LoanInterestCycle.values);
}

class FlexLoanAccountEntity extends DataClass
    implements Insertable<FlexLoanAccountEntity> {
  /// 关联的账户唯一标识 🔑🔗
  final int accountId;

  /// 关联的相关方唯一标识 🔗🔍
  final int stakeholderId;

  /// 借贷类型 ℹ️
  final AccountLoanType type;

  /// 年化利率
  final double rate;

  /// 计息周期 ℹ️
  final LoanInterestCycle cycle;

  /// 借贷开始日期 📅
  final int startDate;

  /// 借贷结束日期 📅🔍
  final int endDate;

  /// 是否归档 🔍
  final bool archived;
  const FlexLoanAccountEntity({
    required this.accountId,
    required this.stakeholderId,
    required this.type,
    required this.rate,
    required this.cycle,
    required this.startDate,
    required this.endDate,
    required this.archived,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    map['stakeholder_id'] = Variable<int>(stakeholderId);
    {
      map['type'] = Variable<String>(
        $AccountFlexLoanTable.$convertertype.toSql(type),
      );
    }
    map['rate'] = Variable<double>(rate);
    {
      map['cycle'] = Variable<String>(
        $AccountFlexLoanTable.$convertercycle.toSql(cycle),
      );
    }
    map['start_date'] = Variable<int>(startDate);
    map['end_date'] = Variable<int>(endDate);
    map['archived'] = Variable<bool>(archived);
    return map;
  }

  AccountFlexLoanCompanion toCompanion(bool nullToAbsent) {
    return AccountFlexLoanCompanion(
      accountId: Value(accountId),
      stakeholderId: Value(stakeholderId),
      type: Value(type),
      rate: Value(rate),
      cycle: Value(cycle),
      startDate: Value(startDate),
      endDate: Value(endDate),
      archived: Value(archived),
    );
  }

  factory FlexLoanAccountEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlexLoanAccountEntity(
      accountId: serializer.fromJson<int>(json['accountId']),
      stakeholderId: serializer.fromJson<int>(json['stakeholderId']),
      type: $AccountFlexLoanTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      rate: serializer.fromJson<double>(json['rate']),
      cycle: $AccountFlexLoanTable.$convertercycle.fromJson(
        serializer.fromJson<String>(json['cycle']),
      ),
      startDate: serializer.fromJson<int>(json['startDate']),
      endDate: serializer.fromJson<int>(json['endDate']),
      archived: serializer.fromJson<bool>(json['archived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'stakeholderId': serializer.toJson<int>(stakeholderId),
      'type': serializer.toJson<String>(
        $AccountFlexLoanTable.$convertertype.toJson(type),
      ),
      'rate': serializer.toJson<double>(rate),
      'cycle': serializer.toJson<String>(
        $AccountFlexLoanTable.$convertercycle.toJson(cycle),
      ),
      'startDate': serializer.toJson<int>(startDate),
      'endDate': serializer.toJson<int>(endDate),
      'archived': serializer.toJson<bool>(archived),
    };
  }

  FlexLoanAccountEntity copyWith({
    int? accountId,
    int? stakeholderId,
    AccountLoanType? type,
    double? rate,
    LoanInterestCycle? cycle,
    int? startDate,
    int? endDate,
    bool? archived,
  }) => FlexLoanAccountEntity(
    accountId: accountId ?? this.accountId,
    stakeholderId: stakeholderId ?? this.stakeholderId,
    type: type ?? this.type,
    rate: rate ?? this.rate,
    cycle: cycle ?? this.cycle,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    archived: archived ?? this.archived,
  );
  FlexLoanAccountEntity copyWithCompanion(AccountFlexLoanCompanion data) {
    return FlexLoanAccountEntity(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      stakeholderId: data.stakeholderId.present
          ? data.stakeholderId.value
          : this.stakeholderId,
      type: data.type.present ? data.type.value : this.type,
      rate: data.rate.present ? data.rate.value : this.rate,
      cycle: data.cycle.present ? data.cycle.value : this.cycle,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      archived: data.archived.present ? data.archived.value : this.archived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FlexLoanAccountEntity(')
          ..write('accountId: $accountId, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('type: $type, ')
          ..write('rate: $rate, ')
          ..write('cycle: $cycle, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountId,
    stakeholderId,
    type,
    rate,
    cycle,
    startDate,
    endDate,
    archived,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlexLoanAccountEntity &&
          other.accountId == this.accountId &&
          other.stakeholderId == this.stakeholderId &&
          other.type == this.type &&
          other.rate == this.rate &&
          other.cycle == this.cycle &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.archived == this.archived);
}

class AccountFlexLoanCompanion extends UpdateCompanion<FlexLoanAccountEntity> {
  final Value<int> accountId;
  final Value<int> stakeholderId;
  final Value<AccountLoanType> type;
  final Value<double> rate;
  final Value<LoanInterestCycle> cycle;
  final Value<int> startDate;
  final Value<int> endDate;
  final Value<bool> archived;
  const AccountFlexLoanCompanion({
    this.accountId = const Value.absent(),
    this.stakeholderId = const Value.absent(),
    this.type = const Value.absent(),
    this.rate = const Value.absent(),
    this.cycle = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.archived = const Value.absent(),
  });
  AccountFlexLoanCompanion.insert({
    this.accountId = const Value.absent(),
    required int stakeholderId,
    required AccountLoanType type,
    required double rate,
    required LoanInterestCycle cycle,
    required int startDate,
    required int endDate,
    this.archived = const Value.absent(),
  }) : stakeholderId = Value(stakeholderId),
       type = Value(type),
       rate = Value(rate),
       cycle = Value(cycle),
       startDate = Value(startDate),
       endDate = Value(endDate);
  static Insertable<FlexLoanAccountEntity> custom({
    Expression<int>? accountId,
    Expression<int>? stakeholderId,
    Expression<String>? type,
    Expression<double>? rate,
    Expression<String>? cycle,
    Expression<int>? startDate,
    Expression<int>? endDate,
    Expression<bool>? archived,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (stakeholderId != null) 'stakeholder_id': stakeholderId,
      if (type != null) 'type': type,
      if (rate != null) 'rate': rate,
      if (cycle != null) 'cycle': cycle,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (archived != null) 'archived': archived,
    });
  }

  AccountFlexLoanCompanion copyWith({
    Value<int>? accountId,
    Value<int>? stakeholderId,
    Value<AccountLoanType>? type,
    Value<double>? rate,
    Value<LoanInterestCycle>? cycle,
    Value<int>? startDate,
    Value<int>? endDate,
    Value<bool>? archived,
  }) {
    return AccountFlexLoanCompanion(
      accountId: accountId ?? this.accountId,
      stakeholderId: stakeholderId ?? this.stakeholderId,
      type: type ?? this.type,
      rate: rate ?? this.rate,
      cycle: cycle ?? this.cycle,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      archived: archived ?? this.archived,
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
        $AccountFlexLoanTable.$convertertype.toSql(type.value),
      );
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (cycle.present) {
      map['cycle'] = Variable<String>(
        $AccountFlexLoanTable.$convertercycle.toSql(cycle.value),
      );
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountFlexLoanCompanion(')
          ..write('accountId: $accountId, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('type: $type, ')
          ..write('rate: $rate, ')
          ..write('cycle: $cycle, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }
}

class $AccountInvestTable extends AccountInvest
    with TableInfo<$AccountInvestTable, InvestAccountEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountInvestTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES account (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountInvestType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AccountInvestType>($AccountInvestTable.$convertertype);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [accountId, type, code];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_invest';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvestAccountEntity> instance, {
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
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId};
  @override
  InvestAccountEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvestAccountEntity(
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      type: $AccountInvestTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
    );
  }

  @override
  $AccountInvestTable createAlias(String alias) {
    return $AccountInvestTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountInvestType, String, String> $convertertype =
      const EnumNameConverter<AccountInvestType>(AccountInvestType.values);
}

class InvestAccountEntity extends DataClass
    implements Insertable<InvestAccountEntity> {
  /// 关联的账户唯一标识 🔑🔗
  final int accountId;

  /// 投资类型 ℹ️
  final AccountInvestType type;

  /// 对应资产代码
  final String? code;
  const InvestAccountEntity({
    required this.accountId,
    required this.type,
    this.code,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    {
      map['type'] = Variable<String>(
        $AccountInvestTable.$convertertype.toSql(type),
      );
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    return map;
  }

  AccountInvestCompanion toCompanion(bool nullToAbsent) {
    return AccountInvestCompanion(
      accountId: Value(accountId),
      type: Value(type),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
    );
  }

  factory InvestAccountEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvestAccountEntity(
      accountId: serializer.fromJson<int>(json['accountId']),
      type: $AccountInvestTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      code: serializer.fromJson<String?>(json['code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'type': serializer.toJson<String>(
        $AccountInvestTable.$convertertype.toJson(type),
      ),
      'code': serializer.toJson<String?>(code),
    };
  }

  InvestAccountEntity copyWith({
    int? accountId,
    AccountInvestType? type,
    Value<String?> code = const Value.absent(),
  }) => InvestAccountEntity(
    accountId: accountId ?? this.accountId,
    type: type ?? this.type,
    code: code.present ? code.value : this.code,
  );
  InvestAccountEntity copyWithCompanion(AccountInvestCompanion data) {
    return InvestAccountEntity(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      type: data.type.present ? data.type.value : this.type,
      code: data.code.present ? data.code.value : this.code,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvestAccountEntity(')
          ..write('accountId: $accountId, ')
          ..write('type: $type, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accountId, type, code);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvestAccountEntity &&
          other.accountId == this.accountId &&
          other.type == this.type &&
          other.code == this.code);
}

class AccountInvestCompanion extends UpdateCompanion<InvestAccountEntity> {
  final Value<int> accountId;
  final Value<AccountInvestType> type;
  final Value<String?> code;
  const AccountInvestCompanion({
    this.accountId = const Value.absent(),
    this.type = const Value.absent(),
    this.code = const Value.absent(),
  });
  AccountInvestCompanion.insert({
    this.accountId = const Value.absent(),
    required AccountInvestType type,
    this.code = const Value.absent(),
  }) : type = Value(type);
  static Insertable<InvestAccountEntity> custom({
    Expression<int>? accountId,
    Expression<String>? type,
    Expression<String>? code,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (type != null) 'type': type,
      if (code != null) 'code': code,
    });
  }

  AccountInvestCompanion copyWith({
    Value<int>? accountId,
    Value<AccountInvestType>? type,
    Value<String?>? code,
  }) {
    return AccountInvestCompanion(
      accountId: accountId ?? this.accountId,
      type: type ?? this.type,
      code: code ?? this.code,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $AccountInvestTable.$convertertype.toSql(type.value),
      );
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountInvestCompanion(')
          ..write('accountId: $accountId, ')
          ..write('type: $type, ')
          ..write('code: $code')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
      'REFERENCES account (id)',
    ),
  );
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
    'rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
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
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    rate,
    startDate,
    endDate,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
        _rateMeta,
        rate.isAcceptableOrUnknown(data['rate']!, _rateMeta),
      );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoanPlanEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoanPlanEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      rate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rate'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_date'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $LoanPlanTable createAlias(String alias) {
    return $LoanPlanTable(attachedDatabase, alias);
  }
}

class LoanPlanEntity extends DataClass implements Insertable<LoanPlanEntity> {
  /// 借贷计划唯一标识 🔑#️⃣
  final int id;

  /// 关联的账户唯一标识 🔗🔍
  final int accountId;

  /// 年化利率
  final double rate;

  /// 计划开始日期 📅🔍
  final int startDate;

  /// 计划结束日期 📅🔍
  final int? endDate;

  /// 备注
  final String? note;
  const LoanPlanEntity({
    required this.id,
    required this.accountId,
    required this.rate,
    required this.startDate,
    this.endDate,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_id'] = Variable<int>(accountId);
    map['rate'] = Variable<double>(rate);
    map['start_date'] = Variable<int>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<int>(endDate);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  LoanPlanCompanion toCompanion(bool nullToAbsent) {
    return LoanPlanCompanion(
      id: Value(id),
      accountId: Value(accountId),
      rate: Value(rate),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory LoanPlanEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoanPlanEntity(
      id: serializer.fromJson<int>(json['id']),
      accountId: serializer.fromJson<int>(json['accountId']),
      rate: serializer.fromJson<double>(json['rate']),
      startDate: serializer.fromJson<int>(json['startDate']),
      endDate: serializer.fromJson<int?>(json['endDate']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountId': serializer.toJson<int>(accountId),
      'rate': serializer.toJson<double>(rate),
      'startDate': serializer.toJson<int>(startDate),
      'endDate': serializer.toJson<int?>(endDate),
      'note': serializer.toJson<String?>(note),
    };
  }

  LoanPlanEntity copyWith({
    int? id,
    int? accountId,
    double? rate,
    int? startDate,
    Value<int?> endDate = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => LoanPlanEntity(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    rate: rate ?? this.rate,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    note: note.present ? note.value : this.note,
  );
  LoanPlanEntity copyWithCompanion(LoanPlanCompanion data) {
    return LoanPlanEntity(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      rate: data.rate.present ? data.rate.value : this.rate,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoanPlanEntity(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('rate: $rate, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, accountId, rate, startDate, endDate, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanPlanEntity &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.rate == this.rate &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.note == this.note);
}

class LoanPlanCompanion extends UpdateCompanion<LoanPlanEntity> {
  final Value<int> id;
  final Value<int> accountId;
  final Value<double> rate;
  final Value<int> startDate;
  final Value<int?> endDate;
  final Value<String?> note;
  const LoanPlanCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.rate = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.note = const Value.absent(),
  });
  LoanPlanCompanion.insert({
    this.id = const Value.absent(),
    required int accountId,
    this.rate = const Value.absent(),
    required int startDate,
    this.endDate = const Value.absent(),
    this.note = const Value.absent(),
  }) : accountId = Value(accountId),
       startDate = Value(startDate);
  static Insertable<LoanPlanEntity> custom({
    Expression<int>? id,
    Expression<int>? accountId,
    Expression<double>? rate,
    Expression<int>? startDate,
    Expression<int>? endDate,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (rate != null) 'rate': rate,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (note != null) 'note': note,
    });
  }

  LoanPlanCompanion copyWith({
    Value<int>? id,
    Value<int>? accountId,
    Value<double>? rate,
    Value<int>? startDate,
    Value<int?>? endDate,
    Value<String?>? note,
  }) {
    return LoanPlanCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      rate: rate ?? this.rate,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<int>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<int>(endDate.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoanPlanCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('rate: $rate, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
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
  static const VerificationMeta _loanPlanIdMeta = const VerificationMeta(
    'loanPlanId',
  );
  @override
  late final GeneratedColumn<int> loanPlanId = GeneratedColumn<int>(
    'loan_plan_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES loan_plan (id)',
    ),
  );
  static const VerificationMeta _periodMeta = const VerificationMeta('period');
  @override
  late final GeneratedColumn<int> period = GeneratedColumn<int>(
    'period',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
  static const VerificationMeta _interestMeta = const VerificationMeta(
    'interest',
  );
  @override
  late final GeneratedColumn<int> interest = GeneratedColumn<int>(
    'interest',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<bool> status = GeneratedColumn<bool>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("status" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    loanPlanId,
    period,
    amount,
    interest,
    date,
    status,
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
    if (data.containsKey('loan_plan_id')) {
      context.handle(
        _loanPlanIdMeta,
        loanPlanId.isAcceptableOrUnknown(
          data['loan_plan_id']!,
          _loanPlanIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_loanPlanIdMeta);
    }
    if (data.containsKey('period')) {
      context.handle(
        _periodMeta,
        period.isAcceptableOrUnknown(data['period']!, _periodMeta),
      );
    } else if (isInserting) {
      context.missing(_periodMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('interest')) {
      context.handle(
        _interestMeta,
        interest.isAcceptableOrUnknown(data['interest']!, _interestMeta),
      );
    } else if (isInserting) {
      context.missing(_interestMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
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
  Set<GeneratedColumn> get $primaryKey => {loanPlanId, period};
  @override
  LoanRecordEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoanRecordEntity(
      loanPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}loan_plan_id'],
      )!,
      period: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}period'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      interest: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interest'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}status'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $LoanRecordTable createAlias(String alias) {
    return $LoanRecordTable(attachedDatabase, alias);
  }
}

class LoanRecordEntity extends DataClass
    implements Insertable<LoanRecordEntity> {
  /// 关联的借贷计划唯一标识 🔑🔗🔍
  final int loanPlanId;

  /// 借贷期数 🔑
  final int period;

  /// 本金 💰
  final int amount;

  /// 利息 💰
  final int interest;

  /// 实际发生日期 📅🔍
  final int date;

  /// 状态 🔍
  final bool status;

  /// 备注
  final String? note;
  const LoanRecordEntity({
    required this.loanPlanId,
    required this.period,
    required this.amount,
    required this.interest,
    required this.date,
    required this.status,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['loan_plan_id'] = Variable<int>(loanPlanId);
    map['period'] = Variable<int>(period);
    map['amount'] = Variable<int>(amount);
    map['interest'] = Variable<int>(interest);
    map['date'] = Variable<int>(date);
    map['status'] = Variable<bool>(status);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  LoanRecordCompanion toCompanion(bool nullToAbsent) {
    return LoanRecordCompanion(
      loanPlanId: Value(loanPlanId),
      period: Value(period),
      amount: Value(amount),
      interest: Value(interest),
      date: Value(date),
      status: Value(status),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory LoanRecordEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoanRecordEntity(
      loanPlanId: serializer.fromJson<int>(json['loanPlanId']),
      period: serializer.fromJson<int>(json['period']),
      amount: serializer.fromJson<int>(json['amount']),
      interest: serializer.fromJson<int>(json['interest']),
      date: serializer.fromJson<int>(json['date']),
      status: serializer.fromJson<bool>(json['status']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'loanPlanId': serializer.toJson<int>(loanPlanId),
      'period': serializer.toJson<int>(period),
      'amount': serializer.toJson<int>(amount),
      'interest': serializer.toJson<int>(interest),
      'date': serializer.toJson<int>(date),
      'status': serializer.toJson<bool>(status),
      'note': serializer.toJson<String?>(note),
    };
  }

  LoanRecordEntity copyWith({
    int? loanPlanId,
    int? period,
    int? amount,
    int? interest,
    int? date,
    bool? status,
    Value<String?> note = const Value.absent(),
  }) => LoanRecordEntity(
    loanPlanId: loanPlanId ?? this.loanPlanId,
    period: period ?? this.period,
    amount: amount ?? this.amount,
    interest: interest ?? this.interest,
    date: date ?? this.date,
    status: status ?? this.status,
    note: note.present ? note.value : this.note,
  );
  LoanRecordEntity copyWithCompanion(LoanRecordCompanion data) {
    return LoanRecordEntity(
      loanPlanId: data.loanPlanId.present
          ? data.loanPlanId.value
          : this.loanPlanId,
      period: data.period.present ? data.period.value : this.period,
      amount: data.amount.present ? data.amount.value : this.amount,
      interest: data.interest.present ? data.interest.value : this.interest,
      date: data.date.present ? data.date.value : this.date,
      status: data.status.present ? data.status.value : this.status,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoanRecordEntity(')
          ..write('loanPlanId: $loanPlanId, ')
          ..write('period: $period, ')
          ..write('amount: $amount, ')
          ..write('interest: $interest, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(loanPlanId, period, amount, interest, date, status, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanRecordEntity &&
          other.loanPlanId == this.loanPlanId &&
          other.period == this.period &&
          other.amount == this.amount &&
          other.interest == this.interest &&
          other.date == this.date &&
          other.status == this.status &&
          other.note == this.note);
}

class LoanRecordCompanion extends UpdateCompanion<LoanRecordEntity> {
  final Value<int> loanPlanId;
  final Value<int> period;
  final Value<int> amount;
  final Value<int> interest;
  final Value<int> date;
  final Value<bool> status;
  final Value<String?> note;
  final Value<int> rowid;
  const LoanRecordCompanion({
    this.loanPlanId = const Value.absent(),
    this.period = const Value.absent(),
    this.amount = const Value.absent(),
    this.interest = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LoanRecordCompanion.insert({
    required int loanPlanId,
    required int period,
    required int amount,
    required int interest,
    required int date,
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : loanPlanId = Value(loanPlanId),
       period = Value(period),
       amount = Value(amount),
       interest = Value(interest),
       date = Value(date);
  static Insertable<LoanRecordEntity> custom({
    Expression<int>? loanPlanId,
    Expression<int>? period,
    Expression<int>? amount,
    Expression<int>? interest,
    Expression<int>? date,
    Expression<bool>? status,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (loanPlanId != null) 'loan_plan_id': loanPlanId,
      if (period != null) 'period': period,
      if (amount != null) 'amount': amount,
      if (interest != null) 'interest': interest,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LoanRecordCompanion copyWith({
    Value<int>? loanPlanId,
    Value<int>? period,
    Value<int>? amount,
    Value<int>? interest,
    Value<int>? date,
    Value<bool>? status,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return LoanRecordCompanion(
      loanPlanId: loanPlanId ?? this.loanPlanId,
      period: period ?? this.period,
      amount: amount ?? this.amount,
      interest: interest ?? this.interest,
      date: date ?? this.date,
      status: status ?? this.status,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (loanPlanId.present) {
      map['loan_plan_id'] = Variable<int>(loanPlanId.value);
    }
    if (period.present) {
      map['period'] = Variable<int>(period.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (interest.present) {
      map['interest'] = Variable<int>(interest.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoanRecordCompanion(')
          ..write('loanPlanId: $loanPlanId, ')
          ..write('period: $period, ')
          ..write('amount: $amount, ')
          ..write('interest: $interest, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('note: $note, ')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    id,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {name},
  ];
  @override
  ProjectEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      budget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}budget'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
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
  /// 项目唯一标识 🔑#️⃣
  final int id;

  /// 项目名称 ❄️
  final String name;

  /// 项目描述
  final String? description;

  /// 项目预算 💰
  final int budget;

  /// 项目图标
  final String? icon;

  /// 是否归档 🔍
  final bool archived;

  /// 创建时间 🕗
  final int createdAt;

  /// 更新时间 🕗
  final int updatedAt;

  /// 项目开始日期 📅🔍
  final int? startDate;

  /// 项目结束日期 📅🔍
  final int? endDate;
  const ProjectEntity({
    required this.id,
    required this.name,
    this.description,
    required this.budget,
    this.icon,
    required this.archived,
    required this.createdAt,
    required this.updatedAt,
    this.startDate,
    this.endDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['budget'] = Variable<int>(budget);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
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
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      budget: Value(budget),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
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
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      budget: serializer.fromJson<int>(json['budget']),
      icon: serializer.fromJson<String?>(json['icon']),
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
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'budget': serializer.toJson<int>(budget),
      'icon': serializer.toJson<String?>(icon),
      'archived': serializer.toJson<bool>(archived),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'startDate': serializer.toJson<int?>(startDate),
      'endDate': serializer.toJson<int?>(endDate),
    };
  }

  ProjectEntity copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
    int? budget,
    Value<String?> icon = const Value.absent(),
    bool? archived,
    int? createdAt,
    int? updatedAt,
    Value<int?> startDate = const Value.absent(),
    Value<int?> endDate = const Value.absent(),
  }) => ProjectEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    budget: budget ?? this.budget,
    icon: icon.present ? icon.value : this.icon,
    archived: archived ?? this.archived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
  );
  ProjectEntity copyWithCompanion(ProjectCompanion data) {
    return ProjectEntity(
      id: data.id.present ? data.id.value : this.id,
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
          ..write('id: $id, ')
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
    id,
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
          other.id == this.id &&
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
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> budget;
  final Value<String?> icon;
  final Value<bool> archived;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> startDate;
  final Value<int?> endDate;
  const ProjectCompanion({
    this.id = const Value.absent(),
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
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.budget = const Value.absent(),
    this.icon = const Value.absent(),
    this.archived = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  }) : name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProjectEntity> custom({
    Expression<int>? id,
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
      if (id != null) 'id': id,
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
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? budget,
    Value<String?>? icon,
    Value<bool>? archived,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? startDate,
    Value<int?>? endDate,
  }) {
    return ProjectCompanion(
      id: id ?? this.id,
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
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
          ..write('id: $id, ')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _undeletableMeta = const VerificationMeta(
    'undeletable',
  );
  @override
  late final GeneratedColumn<bool> undeletable = GeneratedColumn<bool>(
    'undeletable',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("undeletable" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
      'REFERENCES category (id)',
    ),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    icon,
    undeletable,
    parentId,
    weight,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('undeletable')) {
      context.handle(
        _undeletableMeta,
        undeletable.isAcceptableOrUnknown(
          data['undeletable']!,
          _undeletableMeta,
        ),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {name},
  ];
  @override
  CategoryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
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
      ),
      undeletable: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}undeletable'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weight'],
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
  /// 分类唯一标识 🔑#️⃣
  final int id;

  /// 分类名称 ❄️
  final String name;

  /// 分类类型 ℹ️🔍
  final CategoryType type;

  /// 分类图标
  final String? icon;

  /// 禁止删除标记
  final bool undeletable;

  /// 父级分类唯一标识 🔗🔍
  final int? parentId;

  /// 排序权重 🔍
  final int weight;
  const CategoryEntity({
    required this.id,
    required this.name,
    required this.type,
    this.icon,
    required this.undeletable,
    this.parentId,
    required this.weight,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>($CategoryTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    map['undeletable'] = Variable<bool>(undeletable);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['weight'] = Variable<int>(weight);
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      undeletable: Value(undeletable),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      weight: Value(weight),
    );
  }

  factory CategoryEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: $CategoryTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      icon: serializer.fromJson<String?>(json['icon']),
      undeletable: serializer.fromJson<bool>(json['undeletable']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      weight: serializer.fromJson<int>(json['weight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(
        $CategoryTable.$convertertype.toJson(type),
      ),
      'icon': serializer.toJson<String?>(icon),
      'undeletable': serializer.toJson<bool>(undeletable),
      'parentId': serializer.toJson<int?>(parentId),
      'weight': serializer.toJson<int>(weight),
    };
  }

  CategoryEntity copyWith({
    int? id,
    String? name,
    CategoryType? type,
    Value<String?> icon = const Value.absent(),
    bool? undeletable,
    Value<int?> parentId = const Value.absent(),
    int? weight,
  }) => CategoryEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    icon: icon.present ? icon.value : this.icon,
    undeletable: undeletable ?? this.undeletable,
    parentId: parentId.present ? parentId.value : this.parentId,
    weight: weight ?? this.weight,
  );
  CategoryEntity copyWithCompanion(CategoryCompanion data) {
    return CategoryEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      icon: data.icon.present ? data.icon.value : this.icon,
      undeletable: data.undeletable.present
          ? data.undeletable.value
          : this.undeletable,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      weight: data.weight.present ? data.weight.value : this.weight,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('icon: $icon, ')
          ..write('undeletable: $undeletable, ')
          ..write('parentId: $parentId, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, type, icon, undeletable, parentId, weight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.icon == this.icon &&
          other.undeletable == this.undeletable &&
          other.parentId == this.parentId &&
          other.weight == this.weight);
}

class CategoryCompanion extends UpdateCompanion<CategoryEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<CategoryType> type;
  final Value<String?> icon;
  final Value<bool> undeletable;
  final Value<int?> parentId;
  final Value<int> weight;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.icon = const Value.absent(),
    this.undeletable = const Value.absent(),
    this.parentId = const Value.absent(),
    this.weight = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required CategoryType type,
    this.icon = const Value.absent(),
    this.undeletable = const Value.absent(),
    this.parentId = const Value.absent(),
    this.weight = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<CategoryEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? icon,
    Expression<bool>? undeletable,
    Expression<int>? parentId,
    Expression<int>? weight,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (icon != null) 'icon': icon,
      if (undeletable != null) 'undeletable': undeletable,
      if (parentId != null) 'parent_id': parentId,
      if (weight != null) 'weight': weight,
    });
  }

  CategoryCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<CategoryType>? type,
    Value<String?>? icon,
    Value<bool>? undeletable,
    Value<int?>? parentId,
    Value<int>? weight,
  }) {
    return CategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      undeletable: undeletable ?? this.undeletable,
      parentId: parentId ?? this.parentId,
      weight: weight ?? this.weight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (undeletable.present) {
      map['undeletable'] = Variable<bool>(undeletable.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('icon: $icon, ')
          ..write('undeletable: $undeletable, ')
          ..write('parentId: $parentId, ')
          ..write('weight: $weight')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
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
  static const VerificationMeta _visibleMeta = const VerificationMeta(
    'visible',
  );
  @override
  late final GeneratedColumn<bool> visible = GeneratedColumn<bool>(
    'visible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("visible" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    visible,
    note,
    timestamp,
    createdAt,
    updatedAt,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('visible')) {
      context.handle(
        _visibleMeta,
        visible.isAcceptableOrUnknown(data['visible']!, _visibleMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: $TransactionsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      visible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}visible'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
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
  /// 交易唯一标识 🔑#️⃣
  final int id;

  /// 交易类型 ℹ️🔍
  final TransactionType type;

  /// 交易是否可见
  final bool visible;

  /// 交易备注
  final String? note;

  /// 交易发生时间戳 🕗🔍
  final int timestamp;

  /// 创建时间 🕗
  final int createdAt;

  /// 更新时间 🕗
  final int updatedAt;
  const TransactionEntity({
    required this.id,
    required this.type,
    required this.visible,
    this.note,
    required this.timestamp,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['type'] = Variable<String>(
        $TransactionsTable.$convertertype.toSql(type),
      );
    }
    map['visible'] = Variable<bool>(visible);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['timestamp'] = Variable<int>(timestamp);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      type: Value(type),
      visible: Value(visible),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      timestamp: Value(timestamp),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TransactionEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionEntity(
      id: serializer.fromJson<int>(json['id']),
      type: $TransactionsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      visible: serializer.fromJson<bool>(json['visible']),
      note: serializer.fromJson<String?>(json['note']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(
        $TransactionsTable.$convertertype.toJson(type),
      ),
      'visible': serializer.toJson<bool>(visible),
      'note': serializer.toJson<String?>(note),
      'timestamp': serializer.toJson<int>(timestamp),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  TransactionEntity copyWith({
    int? id,
    TransactionType? type,
    bool? visible,
    Value<String?> note = const Value.absent(),
    int? timestamp,
    int? createdAt,
    int? updatedAt,
  }) => TransactionEntity(
    id: id ?? this.id,
    type: type ?? this.type,
    visible: visible ?? this.visible,
    note: note.present ? note.value : this.note,
    timestamp: timestamp ?? this.timestamp,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TransactionEntity copyWithCompanion(TransactionsCompanion data) {
    return TransactionEntity(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      visible: data.visible.present ? data.visible.value : this.visible,
      note: data.note.present ? data.note.value : this.note,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionEntity(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('visible: $visible, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, type, visible, note, timestamp, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionEntity &&
          other.id == this.id &&
          other.type == this.type &&
          other.visible == this.visible &&
          other.note == this.note &&
          other.timestamp == this.timestamp &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransactionsCompanion extends UpdateCompanion<TransactionEntity> {
  final Value<int> id;
  final Value<TransactionType> type;
  final Value<bool> visible;
  final Value<String?> note;
  final Value<int> timestamp;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.visible = const Value.absent(),
    this.note = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required TransactionType type,
    this.visible = const Value.absent(),
    this.note = const Value.absent(),
    required int timestamp,
    required int createdAt,
    required int updatedAt,
  }) : type = Value(type),
       timestamp = Value(timestamp),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TransactionEntity> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<bool>? visible,
    Expression<String>? note,
    Expression<int>? timestamp,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (visible != null) 'visible': visible,
      if (note != null) 'note': note,
      if (timestamp != null) 'timestamp': timestamp,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransactionsCompanion copyWith({
    Value<int>? id,
    Value<TransactionType>? type,
    Value<bool>? visible,
    Value<String?>? note,
    Value<int>? timestamp,
    Value<int>? createdAt,
    Value<int>? updatedAt,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      visible: visible ?? this.visible,
      note: note ?? this.note,
      timestamp: timestamp ?? this.timestamp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $TransactionsTable.$convertertype.toSql(type.value),
      );
    }
    if (visible.present) {
      map['visible'] = Variable<bool>(visible.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('visible: $visible, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionMetaTable extends TransactionMeta
    with TableInfo<$TransactionMetaTable, TransactionMetaEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionMetaTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES transactions (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TransactionMetaScope, String>
  scope = GeneratedColumn<String>(
    'scope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<TransactionMetaScope>($TransactionMetaTable.$converterscope);
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
  List<GeneratedColumn> get $columns => [transactionId, scope, key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionMetaEntity> instance, {
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
  Set<GeneratedColumn> get $primaryKey => {transactionId, scope, key};
  @override
  TransactionMetaEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionMetaEntity(
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      scope: $TransactionMetaTable.$converterscope.fromSql(
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
  $TransactionMetaTable createAlias(String alias) {
    return $TransactionMetaTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionMetaScope, String, String>
  $converterscope = const EnumNameConverter<TransactionMetaScope>(
    TransactionMetaScope.values,
  );
}

class TransactionMetaEntity extends DataClass
    implements Insertable<TransactionMetaEntity> {
  /// 关联的交易唯一标识 🔑🔗
  final int transactionId;

  /// 元数据作用域 🔑ℹ️
  final TransactionMetaScope scope;

  /// 元数据键 🔑
  final String key;

  /// 元数据值
  final String value;
  const TransactionMetaEntity({
    required this.transactionId,
    required this.scope,
    required this.key,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['transaction_id'] = Variable<int>(transactionId);
    {
      map['scope'] = Variable<String>(
        $TransactionMetaTable.$converterscope.toSql(scope),
      );
    }
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  TransactionMetaCompanion toCompanion(bool nullToAbsent) {
    return TransactionMetaCompanion(
      transactionId: Value(transactionId),
      scope: Value(scope),
      key: Value(key),
      value: Value(value),
    );
  }

  factory TransactionMetaEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionMetaEntity(
      transactionId: serializer.fromJson<int>(json['transactionId']),
      scope: $TransactionMetaTable.$converterscope.fromJson(
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
      'transactionId': serializer.toJson<int>(transactionId),
      'scope': serializer.toJson<String>(
        $TransactionMetaTable.$converterscope.toJson(scope),
      ),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  TransactionMetaEntity copyWith({
    int? transactionId,
    TransactionMetaScope? scope,
    String? key,
    String? value,
  }) => TransactionMetaEntity(
    transactionId: transactionId ?? this.transactionId,
    scope: scope ?? this.scope,
    key: key ?? this.key,
    value: value ?? this.value,
  );
  TransactionMetaEntity copyWithCompanion(TransactionMetaCompanion data) {
    return TransactionMetaEntity(
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      scope: data.scope.present ? data.scope.value : this.scope,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionMetaEntity(')
          ..write('transactionId: $transactionId, ')
          ..write('scope: $scope, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(transactionId, scope, key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionMetaEntity &&
          other.transactionId == this.transactionId &&
          other.scope == this.scope &&
          other.key == this.key &&
          other.value == this.value);
}

class TransactionMetaCompanion extends UpdateCompanion<TransactionMetaEntity> {
  final Value<int> transactionId;
  final Value<TransactionMetaScope> scope;
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const TransactionMetaCompanion({
    this.transactionId = const Value.absent(),
    this.scope = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionMetaCompanion.insert({
    required int transactionId,
    required TransactionMetaScope scope,
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : transactionId = Value(transactionId),
       scope = Value(scope),
       key = Value(key),
       value = Value(value);
  static Insertable<TransactionMetaEntity> custom({
    Expression<int>? transactionId,
    Expression<String>? scope,
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (transactionId != null) 'transaction_id': transactionId,
      if (scope != null) 'scope': scope,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionMetaCompanion copyWith({
    Value<int>? transactionId,
    Value<TransactionMetaScope>? scope,
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return TransactionMetaCompanion(
      transactionId: transactionId ?? this.transactionId,
      scope: scope ?? this.scope,
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(
        $TransactionMetaTable.$converterscope.toSql(scope.value),
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
    return (StringBuffer('TransactionMetaCompanion(')
          ..write('transactionId: $transactionId, ')
          ..write('scope: $scope, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
      'REFERENCES transactions (id)',
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
      'REFERENCES account (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AmountChangeType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AmountChangeType>(
        $TransactionAmountDetailTable.$convertertype,
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
      'REFERENCES currency (code)',
    ),
  );
  static const VerificationMeta _occurAmountMeta = const VerificationMeta(
    'occurAmount',
  );
  @override
  late final GeneratedColumn<int> occurAmount = GeneratedColumn<int>(
    'occur_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localAmountMeta = const VerificationMeta(
    'localAmount',
  );
  @override
  late final GeneratedColumn<int> localAmount = GeneratedColumn<int>(
    'local_amount',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transactionId,
    accountId,
    type,
    currencyCode,
    occurAmount,
    localAmount,
    timestamp,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('occur_amount')) {
      context.handle(
        _occurAmountMeta,
        occurAmount.isAcceptableOrUnknown(
          data['occur_amount']!,
          _occurAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_occurAmountMeta);
    }
    if (data.containsKey('local_amount')) {
      context.handle(
        _localAmountMeta,
        localAmount.isAcceptableOrUnknown(
          data['local_amount']!,
          _localAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localAmountMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionAmountDetailEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionAmountDetailEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      type: $TransactionAmountDetailTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      occurAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occur_amount'],
      )!,
      localAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_amount'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $TransactionAmountDetailTable createAlias(String alias) {
    return $TransactionAmountDetailTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AmountChangeType, String, String> $convertertype =
      const EnumNameConverter<AmountChangeType>(AmountChangeType.values);
}

class TransactionAmountDetailEntity extends DataClass
    implements Insertable<TransactionAmountDetailEntity> {
  /// 交易金额明细唯一标识 🔑#️⃣
  final int id;

  /// 关联的交易唯一标识 🔗🔍
  final int transactionId;

  /// 关联的账户唯一标识 🔗🔍
  final int accountId;

  /// 金额变动类型 ℹ️
  final AmountChangeType type;

  /// 交易时货币代码 🔗
  final String currencyCode;

  /// 交易币种金额 💰
  final int occurAmount;

  /// 账本本币金额 💰
  final int localAmount;

  /// 金额变动发生时间戳 🕗🔍
  final int timestamp;
  const TransactionAmountDetailEntity({
    required this.id,
    required this.transactionId,
    required this.accountId,
    required this.type,
    required this.currencyCode,
    required this.occurAmount,
    required this.localAmount,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['transaction_id'] = Variable<int>(transactionId);
    map['account_id'] = Variable<int>(accountId);
    {
      map['type'] = Variable<String>(
        $TransactionAmountDetailTable.$convertertype.toSql(type),
      );
    }
    map['currency_code'] = Variable<String>(currencyCode);
    map['occur_amount'] = Variable<int>(occurAmount);
    map['local_amount'] = Variable<int>(localAmount);
    map['timestamp'] = Variable<int>(timestamp);
    return map;
  }

  TransactionAmountDetailCompanion toCompanion(bool nullToAbsent) {
    return TransactionAmountDetailCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      accountId: Value(accountId),
      type: Value(type),
      currencyCode: Value(currencyCode),
      occurAmount: Value(occurAmount),
      localAmount: Value(localAmount),
      timestamp: Value(timestamp),
    );
  }

  factory TransactionAmountDetailEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionAmountDetailEntity(
      id: serializer.fromJson<int>(json['id']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      type: $TransactionAmountDetailTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      occurAmount: serializer.fromJson<int>(json['occurAmount']),
      localAmount: serializer.fromJson<int>(json['localAmount']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transactionId': serializer.toJson<int>(transactionId),
      'accountId': serializer.toJson<int>(accountId),
      'type': serializer.toJson<String>(
        $TransactionAmountDetailTable.$convertertype.toJson(type),
      ),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'occurAmount': serializer.toJson<int>(occurAmount),
      'localAmount': serializer.toJson<int>(localAmount),
      'timestamp': serializer.toJson<int>(timestamp),
    };
  }

  TransactionAmountDetailEntity copyWith({
    int? id,
    int? transactionId,
    int? accountId,
    AmountChangeType? type,
    String? currencyCode,
    int? occurAmount,
    int? localAmount,
    int? timestamp,
  }) => TransactionAmountDetailEntity(
    id: id ?? this.id,
    transactionId: transactionId ?? this.transactionId,
    accountId: accountId ?? this.accountId,
    type: type ?? this.type,
    currencyCode: currencyCode ?? this.currencyCode,
    occurAmount: occurAmount ?? this.occurAmount,
    localAmount: localAmount ?? this.localAmount,
    timestamp: timestamp ?? this.timestamp,
  );
  TransactionAmountDetailEntity copyWithCompanion(
    TransactionAmountDetailCompanion data,
  ) {
    return TransactionAmountDetailEntity(
      id: data.id.present ? data.id.value : this.id,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      type: data.type.present ? data.type.value : this.type,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      occurAmount: data.occurAmount.present
          ? data.occurAmount.value
          : this.occurAmount,
      localAmount: data.localAmount.present
          ? data.localAmount.value
          : this.localAmount,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionAmountDetailEntity(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('accountId: $accountId, ')
          ..write('type: $type, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('occurAmount: $occurAmount, ')
          ..write('localAmount: $localAmount, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    transactionId,
    accountId,
    type,
    currencyCode,
    occurAmount,
    localAmount,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionAmountDetailEntity &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.accountId == this.accountId &&
          other.type == this.type &&
          other.currencyCode == this.currencyCode &&
          other.occurAmount == this.occurAmount &&
          other.localAmount == this.localAmount &&
          other.timestamp == this.timestamp);
}

class TransactionAmountDetailCompanion
    extends UpdateCompanion<TransactionAmountDetailEntity> {
  final Value<int> id;
  final Value<int> transactionId;
  final Value<int> accountId;
  final Value<AmountChangeType> type;
  final Value<String> currencyCode;
  final Value<int> occurAmount;
  final Value<int> localAmount;
  final Value<int> timestamp;
  const TransactionAmountDetailCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.type = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.occurAmount = const Value.absent(),
    this.localAmount = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  TransactionAmountDetailCompanion.insert({
    this.id = const Value.absent(),
    required int transactionId,
    required int accountId,
    required AmountChangeType type,
    required String currencyCode,
    required int occurAmount,
    required int localAmount,
    required int timestamp,
  }) : transactionId = Value(transactionId),
       accountId = Value(accountId),
       type = Value(type),
       currencyCode = Value(currencyCode),
       occurAmount = Value(occurAmount),
       localAmount = Value(localAmount),
       timestamp = Value(timestamp);
  static Insertable<TransactionAmountDetailEntity> custom({
    Expression<int>? id,
    Expression<int>? transactionId,
    Expression<int>? accountId,
    Expression<String>? type,
    Expression<String>? currencyCode,
    Expression<int>? occurAmount,
    Expression<int>? localAmount,
    Expression<int>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (accountId != null) 'account_id': accountId,
      if (type != null) 'type': type,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (occurAmount != null) 'occur_amount': occurAmount,
      if (localAmount != null) 'local_amount': localAmount,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  TransactionAmountDetailCompanion copyWith({
    Value<int>? id,
    Value<int>? transactionId,
    Value<int>? accountId,
    Value<AmountChangeType>? type,
    Value<String>? currencyCode,
    Value<int>? occurAmount,
    Value<int>? localAmount,
    Value<int>? timestamp,
  }) {
    return TransactionAmountDetailCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      accountId: accountId ?? this.accountId,
      type: type ?? this.type,
      currencyCode: currencyCode ?? this.currencyCode,
      occurAmount: occurAmount ?? this.occurAmount,
      localAmount: localAmount ?? this.localAmount,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $TransactionAmountDetailTable.$convertertype.toSql(type.value),
      );
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (occurAmount.present) {
      map['occur_amount'] = Variable<int>(occurAmount.value);
    }
    if (localAmount.present) {
      map['local_amount'] = Variable<int>(localAmount.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionAmountDetailCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('accountId: $accountId, ')
          ..write('type: $type, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('occurAmount: $occurAmount, ')
          ..write('localAmount: $localAmount, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $TransactionCountDetailTable extends TransactionCountDetail
    with TableInfo<$TransactionCountDetailTable, TransactionCountDetailEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionCountDetailTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
      'REFERENCES transactions (id)',
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
      'REFERENCES category (id)',
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
      'REFERENCES stakeholder (id)',
    ),
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
    'project_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES project (id)',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transactionId,
    categoryId,
    stakeholderId,
    projectId,
    amount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_count_detail';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionCountDetailEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('stakeholder_id')) {
      context.handle(
        _stakeholderIdMeta,
        stakeholderId.isAcceptableOrUnknown(
          data['stakeholder_id']!,
          _stakeholderIdMeta,
        ),
      );
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionCountDetailEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionCountDetailEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      stakeholderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stakeholder_id'],
      ),
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}project_id'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $TransactionCountDetailTable createAlias(String alias) {
    return $TransactionCountDetailTable(attachedDatabase, alias);
  }
}

class TransactionCountDetailEntity extends DataClass
    implements Insertable<TransactionCountDetailEntity> {
  /// 交易明细唯一标识 🔑#️⃣
  final int id;

  /// 关联的交易唯一标识 🔗🔍
  final int transactionId;

  /// 关联的分类唯一标识 🔗🔍
  final int categoryId;

  /// 相关方唯一标识 🔗🔍
  final int? stakeholderId;

  /// 项目唯一标识 🔗🔍
  final int? projectId;

  /// 记账金额 💰
  final int amount;
  const TransactionCountDetailEntity({
    required this.id,
    required this.transactionId,
    required this.categoryId,
    this.stakeholderId,
    this.projectId,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['transaction_id'] = Variable<int>(transactionId);
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || stakeholderId != null) {
      map['stakeholder_id'] = Variable<int>(stakeholderId);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<int>(projectId);
    }
    map['amount'] = Variable<int>(amount);
    return map;
  }

  TransactionCountDetailCompanion toCompanion(bool nullToAbsent) {
    return TransactionCountDetailCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      categoryId: Value(categoryId),
      stakeholderId: stakeholderId == null && nullToAbsent
          ? const Value.absent()
          : Value(stakeholderId),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      amount: Value(amount),
    );
  }

  factory TransactionCountDetailEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionCountDetailEntity(
      id: serializer.fromJson<int>(json['id']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      stakeholderId: serializer.fromJson<int?>(json['stakeholderId']),
      projectId: serializer.fromJson<int?>(json['projectId']),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transactionId': serializer.toJson<int>(transactionId),
      'categoryId': serializer.toJson<int>(categoryId),
      'stakeholderId': serializer.toJson<int?>(stakeholderId),
      'projectId': serializer.toJson<int?>(projectId),
      'amount': serializer.toJson<int>(amount),
    };
  }

  TransactionCountDetailEntity copyWith({
    int? id,
    int? transactionId,
    int? categoryId,
    Value<int?> stakeholderId = const Value.absent(),
    Value<int?> projectId = const Value.absent(),
    int? amount,
  }) => TransactionCountDetailEntity(
    id: id ?? this.id,
    transactionId: transactionId ?? this.transactionId,
    categoryId: categoryId ?? this.categoryId,
    stakeholderId: stakeholderId.present
        ? stakeholderId.value
        : this.stakeholderId,
    projectId: projectId.present ? projectId.value : this.projectId,
    amount: amount ?? this.amount,
  );
  TransactionCountDetailEntity copyWithCompanion(
    TransactionCountDetailCompanion data,
  ) {
    return TransactionCountDetailEntity(
      id: data.id.present ? data.id.value : this.id,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      stakeholderId: data.stakeholderId.present
          ? data.stakeholderId.value
          : this.stakeholderId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCountDetailEntity(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('projectId: $projectId, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    transactionId,
    categoryId,
    stakeholderId,
    projectId,
    amount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionCountDetailEntity &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.categoryId == this.categoryId &&
          other.stakeholderId == this.stakeholderId &&
          other.projectId == this.projectId &&
          other.amount == this.amount);
}

class TransactionCountDetailCompanion
    extends UpdateCompanion<TransactionCountDetailEntity> {
  final Value<int> id;
  final Value<int> transactionId;
  final Value<int> categoryId;
  final Value<int?> stakeholderId;
  final Value<int?> projectId;
  final Value<int> amount;
  const TransactionCountDetailCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.stakeholderId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.amount = const Value.absent(),
  });
  TransactionCountDetailCompanion.insert({
    this.id = const Value.absent(),
    required int transactionId,
    required int categoryId,
    this.stakeholderId = const Value.absent(),
    this.projectId = const Value.absent(),
    required int amount,
  }) : transactionId = Value(transactionId),
       categoryId = Value(categoryId),
       amount = Value(amount);
  static Insertable<TransactionCountDetailEntity> custom({
    Expression<int>? id,
    Expression<int>? transactionId,
    Expression<int>? categoryId,
    Expression<int>? stakeholderId,
    Expression<int>? projectId,
    Expression<int>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (categoryId != null) 'category_id': categoryId,
      if (stakeholderId != null) 'stakeholder_id': stakeholderId,
      if (projectId != null) 'project_id': projectId,
      if (amount != null) 'amount': amount,
    });
  }

  TransactionCountDetailCompanion copyWith({
    Value<int>? id,
    Value<int>? transactionId,
    Value<int>? categoryId,
    Value<int?>? stakeholderId,
    Value<int?>? projectId,
    Value<int>? amount,
  }) {
    return TransactionCountDetailCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      categoryId: categoryId ?? this.categoryId,
      stakeholderId: stakeholderId ?? this.stakeholderId,
      projectId: projectId ?? this.projectId,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (stakeholderId.present) {
      map['stakeholder_id'] = Variable<int>(stakeholderId.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCountDetailCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('projectId: $projectId, ')
          ..write('amount: $amount')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
      'REFERENCES transactions (id)',
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
      'REFERENCES currency (code)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<CategoryType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CategoryType>($TransactionReduceTable.$convertertype);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transactionId,
    currencyCode,
    type,
    amount,
    description,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionReduceEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionReduceEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      type: $TransactionReduceTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $TransactionReduceTable createAlias(String alias) {
    return $TransactionReduceTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CategoryType, String, String> $convertertype =
      const EnumNameConverter<CategoryType>(CategoryType.values);
}

class TransactionReduceEntity extends DataClass
    implements Insertable<TransactionReduceEntity> {
  /// 减项唯一标识 🔑#️⃣
  final int id;

  /// 关联的交易唯一标识 🔗🔍
  final int transactionId;

  /// 货币代码 🔗
  final String currencyCode;

  /// 减项类型 ℹ️
  final CategoryType type;

  /// 减项金额 💰
  final int amount;

  /// 减项说明
  final String? description;
  const TransactionReduceEntity({
    required this.id,
    required this.transactionId,
    required this.currencyCode,
    required this.type,
    required this.amount,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['transaction_id'] = Variable<int>(transactionId);
    map['currency_code'] = Variable<String>(currencyCode);
    {
      map['type'] = Variable<String>(
        $TransactionReduceTable.$convertertype.toSql(type),
      );
    }
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TransactionReduceCompanion toCompanion(bool nullToAbsent) {
    return TransactionReduceCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      currencyCode: Value(currencyCode),
      type: Value(type),
      amount: Value(amount),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory TransactionReduceEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionReduceEntity(
      id: serializer.fromJson<int>(json['id']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      type: $TransactionReduceTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      amount: serializer.fromJson<int>(json['amount']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transactionId': serializer.toJson<int>(transactionId),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'type': serializer.toJson<String>(
        $TransactionReduceTable.$convertertype.toJson(type),
      ),
      'amount': serializer.toJson<int>(amount),
      'description': serializer.toJson<String?>(description),
    };
  }

  TransactionReduceEntity copyWith({
    int? id,
    int? transactionId,
    String? currencyCode,
    CategoryType? type,
    int? amount,
    Value<String?> description = const Value.absent(),
  }) => TransactionReduceEntity(
    id: id ?? this.id,
    transactionId: transactionId ?? this.transactionId,
    currencyCode: currencyCode ?? this.currencyCode,
    type: type ?? this.type,
    amount: amount ?? this.amount,
    description: description.present ? description.value : this.description,
  );
  TransactionReduceEntity copyWithCompanion(TransactionReduceCompanion data) {
    return TransactionReduceEntity(
      id: data.id.present ? data.id.value : this.id,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      type: data.type.present ? data.type.value : this.type,
      amount: data.amount.present ? data.amount.value : this.amount,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionReduceEntity(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, transactionId, currencyCode, type, amount, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionReduceEntity &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.currencyCode == this.currencyCode &&
          other.type == this.type &&
          other.amount == this.amount &&
          other.description == this.description);
}

class TransactionReduceCompanion
    extends UpdateCompanion<TransactionReduceEntity> {
  final Value<int> id;
  final Value<int> transactionId;
  final Value<String> currencyCode;
  final Value<CategoryType> type;
  final Value<int> amount;
  final Value<String?> description;
  const TransactionReduceCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.description = const Value.absent(),
  });
  TransactionReduceCompanion.insert({
    this.id = const Value.absent(),
    required int transactionId,
    required String currencyCode,
    required CategoryType type,
    required int amount,
    this.description = const Value.absent(),
  }) : transactionId = Value(transactionId),
       currencyCode = Value(currencyCode),
       type = Value(type),
       amount = Value(amount);
  static Insertable<TransactionReduceEntity> custom({
    Expression<int>? id,
    Expression<int>? transactionId,
    Expression<String>? currencyCode,
    Expression<String>? type,
    Expression<int>? amount,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (description != null) 'description': description,
    });
  }

  TransactionReduceCompanion copyWith({
    Value<int>? id,
    Value<int>? transactionId,
    Value<String>? currencyCode,
    Value<CategoryType>? type,
    Value<int>? amount,
    Value<String?>? description,
  }) {
    return TransactionReduceCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      currencyCode: currencyCode ?? this.currencyCode,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $TransactionReduceTable.$convertertype.toSql(type.value),
      );
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionReduceCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('description: $description')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
      'REFERENCES transactions (id)',
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
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transactionId,
    amount,
    timestamp,
    description,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionRefundEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRefundEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $TransactionRefundTable createAlias(String alias) {
    return $TransactionRefundTable(attachedDatabase, alias);
  }
}

class TransactionRefundEntity extends DataClass
    implements Insertable<TransactionRefundEntity> {
  /// 退款唯一标识 🔑#️⃣
  final int id;

  /// 原始交易唯一标识 🔗🔍
  final int transactionId;

  /// 退款金额 💰
  final int amount;

  /// 退款时间戳 🕗🔍
  final int timestamp;

  /// 退款说明
  final String? description;
  const TransactionRefundEntity({
    required this.id,
    required this.transactionId,
    required this.amount,
    required this.timestamp,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['transaction_id'] = Variable<int>(transactionId);
    map['amount'] = Variable<int>(amount);
    map['timestamp'] = Variable<int>(timestamp);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TransactionRefundCompanion toCompanion(bool nullToAbsent) {
    return TransactionRefundCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      amount: Value(amount),
      timestamp: Value(timestamp),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory TransactionRefundEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRefundEntity(
      id: serializer.fromJson<int>(json['id']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      amount: serializer.fromJson<int>(json['amount']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transactionId': serializer.toJson<int>(transactionId),
      'amount': serializer.toJson<int>(amount),
      'timestamp': serializer.toJson<int>(timestamp),
      'description': serializer.toJson<String?>(description),
    };
  }

  TransactionRefundEntity copyWith({
    int? id,
    int? transactionId,
    int? amount,
    int? timestamp,
    Value<String?> description = const Value.absent(),
  }) => TransactionRefundEntity(
    id: id ?? this.id,
    transactionId: transactionId ?? this.transactionId,
    amount: amount ?? this.amount,
    timestamp: timestamp ?? this.timestamp,
    description: description.present ? description.value : this.description,
  );
  TransactionRefundEntity copyWithCompanion(TransactionRefundCompanion data) {
    return TransactionRefundEntity(
      id: data.id.present ? data.id.value : this.id,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      amount: data.amount.present ? data.amount.value : this.amount,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRefundEntity(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('amount: $amount, ')
          ..write('timestamp: $timestamp, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, transactionId, amount, timestamp, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRefundEntity &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.amount == this.amount &&
          other.timestamp == this.timestamp &&
          other.description == this.description);
}

class TransactionRefundCompanion
    extends UpdateCompanion<TransactionRefundEntity> {
  final Value<int> id;
  final Value<int> transactionId;
  final Value<int> amount;
  final Value<int> timestamp;
  final Value<String?> description;
  const TransactionRefundCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.amount = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.description = const Value.absent(),
  });
  TransactionRefundCompanion.insert({
    this.id = const Value.absent(),
    required int transactionId,
    required int amount,
    required int timestamp,
    this.description = const Value.absent(),
  }) : transactionId = Value(transactionId),
       amount = Value(amount),
       timestamp = Value(timestamp);
  static Insertable<TransactionRefundEntity> custom({
    Expression<int>? id,
    Expression<int>? transactionId,
    Expression<int>? amount,
    Expression<int>? timestamp,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (amount != null) 'amount': amount,
      if (timestamp != null) 'timestamp': timestamp,
      if (description != null) 'description': description,
    });
  }

  TransactionRefundCompanion copyWith({
    Value<int>? id,
    Value<int>? transactionId,
    Value<int>? amount,
    Value<int>? timestamp,
    Value<String?>? description,
  }) {
    return TransactionRefundCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRefundCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('amount: $amount, ')
          ..write('timestamp: $timestamp, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $TransactionRelationTable extends TransactionRelation
    with TableInfo<$TransactionRelationTable, TransactionRelationEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionRelationTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES transactions (id)',
    ),
  );
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
      'REFERENCES transactions (id)',
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
        $TransactionRelationTable.$convertertype,
      );
  @override
  List<GeneratedColumn> get $columns => [
    sourceTransactionId,
    targetTransactionId,
    type,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_relation';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRelationEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    sourceTransactionId,
    targetTransactionId,
  };
  @override
  TransactionRelationEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRelationEntity(
      sourceTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_transaction_id'],
      )!,
      targetTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_transaction_id'],
      )!,
      type: $TransactionRelationTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
    );
  }

  @override
  $TransactionRelationTable createAlias(String alias) {
    return $TransactionRelationTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionRelationType, String, String>
  $convertertype = const EnumNameConverter<TransactionRelationType>(
    TransactionRelationType.values,
  );
}

class TransactionRelationEntity extends DataClass
    implements Insertable<TransactionRelationEntity> {
  /// 源交易唯一标识 🔑🔗🔍
  final int sourceTransactionId;

  /// 目标交易唯一标识 🔑🔗🔍
  final int targetTransactionId;

  /// 关联关系类型 ℹ️
  final TransactionRelationType type;
  const TransactionRelationEntity({
    required this.sourceTransactionId,
    required this.targetTransactionId,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['source_transaction_id'] = Variable<int>(sourceTransactionId);
    map['target_transaction_id'] = Variable<int>(targetTransactionId);
    {
      map['type'] = Variable<String>(
        $TransactionRelationTable.$convertertype.toSql(type),
      );
    }
    return map;
  }

  TransactionRelationCompanion toCompanion(bool nullToAbsent) {
    return TransactionRelationCompanion(
      sourceTransactionId: Value(sourceTransactionId),
      targetTransactionId: Value(targetTransactionId),
      type: Value(type),
    );
  }

  factory TransactionRelationEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRelationEntity(
      sourceTransactionId: serializer.fromJson<int>(
        json['sourceTransactionId'],
      ),
      targetTransactionId: serializer.fromJson<int>(
        json['targetTransactionId'],
      ),
      type: $TransactionRelationTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sourceTransactionId': serializer.toJson<int>(sourceTransactionId),
      'targetTransactionId': serializer.toJson<int>(targetTransactionId),
      'type': serializer.toJson<String>(
        $TransactionRelationTable.$convertertype.toJson(type),
      ),
    };
  }

  TransactionRelationEntity copyWith({
    int? sourceTransactionId,
    int? targetTransactionId,
    TransactionRelationType? type,
  }) => TransactionRelationEntity(
    sourceTransactionId: sourceTransactionId ?? this.sourceTransactionId,
    targetTransactionId: targetTransactionId ?? this.targetTransactionId,
    type: type ?? this.type,
  );
  TransactionRelationEntity copyWithCompanion(
    TransactionRelationCompanion data,
  ) {
    return TransactionRelationEntity(
      sourceTransactionId: data.sourceTransactionId.present
          ? data.sourceTransactionId.value
          : this.sourceTransactionId,
      targetTransactionId: data.targetTransactionId.present
          ? data.targetTransactionId.value
          : this.targetTransactionId,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRelationEntity(')
          ..write('sourceTransactionId: $sourceTransactionId, ')
          ..write('targetTransactionId: $targetTransactionId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(sourceTransactionId, targetTransactionId, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRelationEntity &&
          other.sourceTransactionId == this.sourceTransactionId &&
          other.targetTransactionId == this.targetTransactionId &&
          other.type == this.type);
}

class TransactionRelationCompanion
    extends UpdateCompanion<TransactionRelationEntity> {
  final Value<int> sourceTransactionId;
  final Value<int> targetTransactionId;
  final Value<TransactionRelationType> type;
  final Value<int> rowid;
  const TransactionRelationCompanion({
    this.sourceTransactionId = const Value.absent(),
    this.targetTransactionId = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionRelationCompanion.insert({
    required int sourceTransactionId,
    required int targetTransactionId,
    required TransactionRelationType type,
    this.rowid = const Value.absent(),
  }) : sourceTransactionId = Value(sourceTransactionId),
       targetTransactionId = Value(targetTransactionId),
       type = Value(type);
  static Insertable<TransactionRelationEntity> custom({
    Expression<int>? sourceTransactionId,
    Expression<int>? targetTransactionId,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sourceTransactionId != null)
        'source_transaction_id': sourceTransactionId,
      if (targetTransactionId != null)
        'target_transaction_id': targetTransactionId,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionRelationCompanion copyWith({
    Value<int>? sourceTransactionId,
    Value<int>? targetTransactionId,
    Value<TransactionRelationType>? type,
    Value<int>? rowid,
  }) {
    return TransactionRelationCompanion(
      sourceTransactionId: sourceTransactionId ?? this.sourceTransactionId,
      targetTransactionId: targetTransactionId ?? this.targetTransactionId,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sourceTransactionId.present) {
      map['source_transaction_id'] = Variable<int>(sourceTransactionId.value);
    }
    if (targetTransactionId.present) {
      map['target_transaction_id'] = Variable<int>(targetTransactionId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $TransactionRelationTable.$convertertype.toSql(type.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRelationCompanion(')
          ..write('sourceTransactionId: $sourceTransactionId, ')
          ..write('targetTransactionId: $targetTransactionId, ')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<bool> status = GeneratedColumn<bool>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("status" IN (0, 1))',
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
    id,
    summary,
    status,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReimbursementEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReimbursementEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}status'],
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
  /// 报销唯一标识 🔑#️⃣
  final int id;

  /// 报销摘要
  final String summary;

  /// 报销状态 🔍
  final bool status;

  /// 创建时间 🕗
  final int createdAt;

  /// 更新时间 🕗
  final int updatedAt;
  const ReimbursementEntity({
    required this.id,
    required this.summary,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['summary'] = Variable<String>(summary);
    map['status'] = Variable<bool>(status);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  ReimbursementCompanion toCompanion(bool nullToAbsent) {
    return ReimbursementCompanion(
      id: Value(id),
      summary: Value(summary),
      status: Value(status),
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
      id: serializer.fromJson<int>(json['id']),
      summary: serializer.fromJson<String>(json['summary']),
      status: serializer.fromJson<bool>(json['status']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'summary': serializer.toJson<String>(summary),
      'status': serializer.toJson<bool>(status),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  ReimbursementEntity copyWith({
    int? id,
    String? summary,
    bool? status,
    int? createdAt,
    int? updatedAt,
  }) => ReimbursementEntity(
    id: id ?? this.id,
    summary: summary ?? this.summary,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ReimbursementEntity copyWithCompanion(ReimbursementCompanion data) {
    return ReimbursementEntity(
      id: data.id.present ? data.id.value : this.id,
      summary: data.summary.present ? data.summary.value : this.summary,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementEntity(')
          ..write('id: $id, ')
          ..write('summary: $summary, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, summary, status, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReimbursementEntity &&
          other.id == this.id &&
          other.summary == this.summary &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ReimbursementCompanion extends UpdateCompanion<ReimbursementEntity> {
  final Value<int> id;
  final Value<String> summary;
  final Value<bool> status;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const ReimbursementCompanion({
    this.id = const Value.absent(),
    this.summary = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ReimbursementCompanion.insert({
    this.id = const Value.absent(),
    required String summary,
    this.status = const Value.absent(),
    required int createdAt,
    required int updatedAt,
  }) : summary = Value(summary),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ReimbursementEntity> custom({
    Expression<int>? id,
    Expression<String>? summary,
    Expression<bool>? status,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (summary != null) 'summary': summary,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ReimbursementCompanion copyWith({
    Value<int>? id,
    Value<String>? summary,
    Value<bool>? status,
    Value<int>? createdAt,
    Value<int>? updatedAt,
  }) {
    return ReimbursementCompanion(
      id: id ?? this.id,
      summary: summary ?? this.summary,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
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
          ..write('id: $id, ')
          ..write('summary: $summary, ')
          ..write('status: $status, ')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
      'REFERENCES reimbursement (id)',
    ),
  );
  static const VerificationMeta _transactionCountDetailIdMeta =
      const VerificationMeta('transactionCountDetailId');
  @override
  late final GeneratedColumn<int> transactionCountDetailId =
      GeneratedColumn<int>(
        'transaction_count_detail_id',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transaction_count_detail (id)',
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
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reimbursementId,
    transactionCountDetailId,
    amount,
    description,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('transaction_count_detail_id')) {
      context.handle(
        _transactionCountDetailIdMeta,
        transactionCountDetailId.isAcceptableOrUnknown(
          data['transaction_count_detail_id']!,
          _transactionCountDetailIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionCountDetailIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReimbursementExpectationEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReimbursementExpectationEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      reimbursementId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reimbursement_id'],
      )!,
      transactionCountDetailId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_count_detail_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $ReimbursementExpectationTable createAlias(String alias) {
    return $ReimbursementExpectationTable(attachedDatabase, alias);
  }
}

class ReimbursementExpectationEntity extends DataClass
    implements Insertable<ReimbursementExpectationEntity> {
  /// 报销期望明细唯一标识 🔑#️⃣
  final int id;

  /// 关联的报销唯一标识 🔗🔍
  final int reimbursementId;

  /// 关联的交易收支明细唯一标识 🔗🔍
  final int transactionCountDetailId;

  /// 期望金额 💰
  final int amount;

  /// 期望说明
  final String? description;
  const ReimbursementExpectationEntity({
    required this.id,
    required this.reimbursementId,
    required this.transactionCountDetailId,
    required this.amount,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['reimbursement_id'] = Variable<int>(reimbursementId);
    map['transaction_count_detail_id'] = Variable<int>(
      transactionCountDetailId,
    );
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  ReimbursementExpectationCompanion toCompanion(bool nullToAbsent) {
    return ReimbursementExpectationCompanion(
      id: Value(id),
      reimbursementId: Value(reimbursementId),
      transactionCountDetailId: Value(transactionCountDetailId),
      amount: Value(amount),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory ReimbursementExpectationEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReimbursementExpectationEntity(
      id: serializer.fromJson<int>(json['id']),
      reimbursementId: serializer.fromJson<int>(json['reimbursementId']),
      transactionCountDetailId: serializer.fromJson<int>(
        json['transactionCountDetailId'],
      ),
      amount: serializer.fromJson<int>(json['amount']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reimbursementId': serializer.toJson<int>(reimbursementId),
      'transactionCountDetailId': serializer.toJson<int>(
        transactionCountDetailId,
      ),
      'amount': serializer.toJson<int>(amount),
      'description': serializer.toJson<String?>(description),
    };
  }

  ReimbursementExpectationEntity copyWith({
    int? id,
    int? reimbursementId,
    int? transactionCountDetailId,
    int? amount,
    Value<String?> description = const Value.absent(),
  }) => ReimbursementExpectationEntity(
    id: id ?? this.id,
    reimbursementId: reimbursementId ?? this.reimbursementId,
    transactionCountDetailId:
        transactionCountDetailId ?? this.transactionCountDetailId,
    amount: amount ?? this.amount,
    description: description.present ? description.value : this.description,
  );
  ReimbursementExpectationEntity copyWithCompanion(
    ReimbursementExpectationCompanion data,
  ) {
    return ReimbursementExpectationEntity(
      id: data.id.present ? data.id.value : this.id,
      reimbursementId: data.reimbursementId.present
          ? data.reimbursementId.value
          : this.reimbursementId,
      transactionCountDetailId: data.transactionCountDetailId.present
          ? data.transactionCountDetailId.value
          : this.transactionCountDetailId,
      amount: data.amount.present ? data.amount.value : this.amount,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementExpectationEntity(')
          ..write('id: $id, ')
          ..write('reimbursementId: $reimbursementId, ')
          ..write('transactionCountDetailId: $transactionCountDetailId, ')
          ..write('amount: $amount, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    reimbursementId,
    transactionCountDetailId,
    amount,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReimbursementExpectationEntity &&
          other.id == this.id &&
          other.reimbursementId == this.reimbursementId &&
          other.transactionCountDetailId == this.transactionCountDetailId &&
          other.amount == this.amount &&
          other.description == this.description);
}

class ReimbursementExpectationCompanion
    extends UpdateCompanion<ReimbursementExpectationEntity> {
  final Value<int> id;
  final Value<int> reimbursementId;
  final Value<int> transactionCountDetailId;
  final Value<int> amount;
  final Value<String?> description;
  const ReimbursementExpectationCompanion({
    this.id = const Value.absent(),
    this.reimbursementId = const Value.absent(),
    this.transactionCountDetailId = const Value.absent(),
    this.amount = const Value.absent(),
    this.description = const Value.absent(),
  });
  ReimbursementExpectationCompanion.insert({
    this.id = const Value.absent(),
    required int reimbursementId,
    required int transactionCountDetailId,
    required int amount,
    this.description = const Value.absent(),
  }) : reimbursementId = Value(reimbursementId),
       transactionCountDetailId = Value(transactionCountDetailId),
       amount = Value(amount);
  static Insertable<ReimbursementExpectationEntity> custom({
    Expression<int>? id,
    Expression<int>? reimbursementId,
    Expression<int>? transactionCountDetailId,
    Expression<int>? amount,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reimbursementId != null) 'reimbursement_id': reimbursementId,
      if (transactionCountDetailId != null)
        'transaction_count_detail_id': transactionCountDetailId,
      if (amount != null) 'amount': amount,
      if (description != null) 'description': description,
    });
  }

  ReimbursementExpectationCompanion copyWith({
    Value<int>? id,
    Value<int>? reimbursementId,
    Value<int>? transactionCountDetailId,
    Value<int>? amount,
    Value<String?>? description,
  }) {
    return ReimbursementExpectationCompanion(
      id: id ?? this.id,
      reimbursementId: reimbursementId ?? this.reimbursementId,
      transactionCountDetailId:
          transactionCountDetailId ?? this.transactionCountDetailId,
      amount: amount ?? this.amount,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reimbursementId.present) {
      map['reimbursement_id'] = Variable<int>(reimbursementId.value);
    }
    if (transactionCountDetailId.present) {
      map['transaction_count_detail_id'] = Variable<int>(
        transactionCountDetailId.value,
      );
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementExpectationCompanion(')
          ..write('id: $id, ')
          ..write('reimbursementId: $reimbursementId, ')
          ..write('transactionCountDetailId: $transactionCountDetailId, ')
          ..write('amount: $amount, ')
          ..write('description: $description')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
      'REFERENCES reimbursement (id)',
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
      'REFERENCES account (id)',
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
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reimbursementId,
    accountId,
    amount,
    timestamp,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReimbursementActualEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReimbursementActualEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      reimbursementId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reimbursement_id'],
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
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $ReimbursementActualTable createAlias(String alias) {
    return $ReimbursementActualTable(attachedDatabase, alias);
  }
}

class ReimbursementActualEntity extends DataClass
    implements Insertable<ReimbursementActualEntity> {
  /// 报销实际明细唯一标识 🔑#️⃣
  final int id;

  /// 关联的报销唯一标识 🔗🔍
  final int reimbursementId;

  /// 关联的账户唯一标识 🔗🔍
  final int accountId;

  /// 实际金额 💰
  final int amount;

  /// 报销时间 📅🔍
  final int timestamp;

  /// 备注
  final String? note;
  const ReimbursementActualEntity({
    required this.id,
    required this.reimbursementId,
    required this.accountId,
    required this.amount,
    required this.timestamp,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['reimbursement_id'] = Variable<int>(reimbursementId);
    map['account_id'] = Variable<int>(accountId);
    map['amount'] = Variable<int>(amount);
    map['timestamp'] = Variable<int>(timestamp);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  ReimbursementActualCompanion toCompanion(bool nullToAbsent) {
    return ReimbursementActualCompanion(
      id: Value(id),
      reimbursementId: Value(reimbursementId),
      accountId: Value(accountId),
      amount: Value(amount),
      timestamp: Value(timestamp),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory ReimbursementActualEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReimbursementActualEntity(
      id: serializer.fromJson<int>(json['id']),
      reimbursementId: serializer.fromJson<int>(json['reimbursementId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      amount: serializer.fromJson<int>(json['amount']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reimbursementId': serializer.toJson<int>(reimbursementId),
      'accountId': serializer.toJson<int>(accountId),
      'amount': serializer.toJson<int>(amount),
      'timestamp': serializer.toJson<int>(timestamp),
      'note': serializer.toJson<String?>(note),
    };
  }

  ReimbursementActualEntity copyWith({
    int? id,
    int? reimbursementId,
    int? accountId,
    int? amount,
    int? timestamp,
    Value<String?> note = const Value.absent(),
  }) => ReimbursementActualEntity(
    id: id ?? this.id,
    reimbursementId: reimbursementId ?? this.reimbursementId,
    accountId: accountId ?? this.accountId,
    amount: amount ?? this.amount,
    timestamp: timestamp ?? this.timestamp,
    note: note.present ? note.value : this.note,
  );
  ReimbursementActualEntity copyWithCompanion(
    ReimbursementActualCompanion data,
  ) {
    return ReimbursementActualEntity(
      id: data.id.present ? data.id.value : this.id,
      reimbursementId: data.reimbursementId.present
          ? data.reimbursementId.value
          : this.reimbursementId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      amount: data.amount.present ? data.amount.value : this.amount,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementActualEntity(')
          ..write('id: $id, ')
          ..write('reimbursementId: $reimbursementId, ')
          ..write('accountId: $accountId, ')
          ..write('amount: $amount, ')
          ..write('timestamp: $timestamp, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, reimbursementId, accountId, amount, timestamp, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReimbursementActualEntity &&
          other.id == this.id &&
          other.reimbursementId == this.reimbursementId &&
          other.accountId == this.accountId &&
          other.amount == this.amount &&
          other.timestamp == this.timestamp &&
          other.note == this.note);
}

class ReimbursementActualCompanion
    extends UpdateCompanion<ReimbursementActualEntity> {
  final Value<int> id;
  final Value<int> reimbursementId;
  final Value<int> accountId;
  final Value<int> amount;
  final Value<int> timestamp;
  final Value<String?> note;
  const ReimbursementActualCompanion({
    this.id = const Value.absent(),
    this.reimbursementId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.amount = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.note = const Value.absent(),
  });
  ReimbursementActualCompanion.insert({
    this.id = const Value.absent(),
    required int reimbursementId,
    required int accountId,
    required int amount,
    required int timestamp,
    this.note = const Value.absent(),
  }) : reimbursementId = Value(reimbursementId),
       accountId = Value(accountId),
       amount = Value(amount),
       timestamp = Value(timestamp);
  static Insertable<ReimbursementActualEntity> custom({
    Expression<int>? id,
    Expression<int>? reimbursementId,
    Expression<int>? accountId,
    Expression<int>? amount,
    Expression<int>? timestamp,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reimbursementId != null) 'reimbursement_id': reimbursementId,
      if (accountId != null) 'account_id': accountId,
      if (amount != null) 'amount': amount,
      if (timestamp != null) 'timestamp': timestamp,
      if (note != null) 'note': note,
    });
  }

  ReimbursementActualCompanion copyWith({
    Value<int>? id,
    Value<int>? reimbursementId,
    Value<int>? accountId,
    Value<int>? amount,
    Value<int>? timestamp,
    Value<String?>? note,
  }) {
    return ReimbursementActualCompanion(
      id: id ?? this.id,
      reimbursementId: reimbursementId ?? this.reimbursementId,
      accountId: accountId ?? this.accountId,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reimbursementId.present) {
      map['reimbursement_id'] = Variable<int>(reimbursementId.value);
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
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReimbursementActualCompanion(')
          ..write('id: $id, ')
          ..write('reimbursementId: $reimbursementId, ')
          ..write('accountId: $accountId, ')
          ..write('amount: $amount, ')
          ..write('timestamp: $timestamp, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

abstract class _$LedgerDatabase extends GeneratedDatabase {
  _$LedgerDatabase(QueryExecutor e) : super(e);
  $LedgerDatabaseManager get managers => $LedgerDatabaseManager(this);
  late final $CurrencyTable currency = $CurrencyTable(this);
  late final $AccountTable account = $AccountTable(this);
  late final $AccountMetaTable accountMeta = $AccountMetaTable(this);
  late final $AccountCreditTable accountCredit = $AccountCreditTable(this);
  late final $AccountPrepaidTable accountPrepaid = $AccountPrepaidTable(this);
  late final $StakeholderTable stakeholder = $StakeholderTable(this);
  late final $AccountPlanLoanTable accountPlanLoan = $AccountPlanLoanTable(
    this,
  );
  late final $AccountFlexLoanTable accountFlexLoan = $AccountFlexLoanTable(
    this,
  );
  late final $AccountInvestTable accountInvest = $AccountInvestTable(this);
  late final $LoanPlanTable loanPlan = $LoanPlanTable(this);
  late final $LoanRecordTable loanRecord = $LoanRecordTable(this);
  late final $ProjectTable project = $ProjectTable(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $TransactionMetaTable transactionMeta = $TransactionMetaTable(
    this,
  );
  late final $TransactionAmountDetailTable transactionAmountDetail =
      $TransactionAmountDetailTable(this);
  late final $TransactionCountDetailTable transactionCountDetail =
      $TransactionCountDetailTable(this);
  late final $TransactionReduceTable transactionReduce =
      $TransactionReduceTable(this);
  late final $TransactionRefundTable transactionRefund =
      $TransactionRefundTable(this);
  late final $TransactionRelationTable transactionRelation =
      $TransactionRelationTable(this);
  late final $ReimbursementTable reimbursement = $ReimbursementTable(this);
  late final $ReimbursementExpectationTable reimbursementExpectation =
      $ReimbursementExpectationTable(this);
  late final $ReimbursementActualTable reimbursementActual =
      $ReimbursementActualTable(this);
  late final CurrencyDao currencyDao = CurrencyDao(this as LedgerDatabase);
  late final AccountDao accountDao = AccountDao(this as LedgerDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as LedgerDatabase);
  late final StakeholderDao stakeholderDao = StakeholderDao(
    this as LedgerDatabase,
  );
  late final ProjectDao projectDao = ProjectDao(this as LedgerDatabase);
  late final TransactionDao transactionDao = TransactionDao(
    this as LedgerDatabase,
  );
  late final ReimbursementDao reimbursementDao = ReimbursementDao(
    this as LedgerDatabase,
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
    accountPrepaid,
    stakeholder,
    accountPlanLoan,
    accountFlexLoan,
    accountInvest,
    loanPlan,
    loanRecord,
    project,
    category,
    transactions,
    transactionMeta,
    transactionAmountDetail,
    transactionCountDetail,
    transactionReduce,
    transactionRefund,
    transactionRelation,
    reimbursement,
    reimbursementExpectation,
    reimbursementActual,
  ];
}

typedef $$CurrencyTableCreateCompanionBuilder =
    CurrencyCompanion Function({
      required String code,
      required String name,
      required String symbol,
      Value<bool> main,
      Value<CurrencyPosition> position,
      Value<int> decimal,
      Value<String> icon,
      Value<CurrencySource> source,
      Value<int> rowid,
    });
typedef $$CurrencyTableUpdateCompanionBuilder =
    CurrencyCompanion Function({
      Value<String> code,
      Value<String> name,
      Value<String> symbol,
      Value<bool> main,
      Value<CurrencyPosition> position,
      Value<int> decimal,
      Value<String> icon,
      Value<CurrencySource> source,
      Value<int> rowid,
    });

final class $$CurrencyTableReferences
    extends BaseReferences<_$LedgerDatabase, $CurrencyTable, CurrencyEntity> {
  $$CurrencyTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountTable, List<AccountEntity>>
  _accountRefsTable(_$LedgerDatabase db) => MultiTypedResultKey.fromTable(
    db.account,
    aliasName: $_aliasNameGenerator(db.currency.code, db.account.currencyCode),
  );

  $$AccountTableProcessedTableManager get accountRefs {
    final manager = $$AccountTableTableManager($_db, $_db.account).filter(
      (f) => f.currencyCode.code.sqlEquals($_itemColumn<String>('code')!),
    );

    final cache = $_typedResult.readTableOrNull(_accountRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionAmountDetailTable,
    List<TransactionAmountDetailEntity>
  >
  _transactionAmountDetailRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionAmountDetail,
        aliasName: $_aliasNameGenerator(
          db.currency.code,
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
          (f) => f.currencyCode.code.sqlEquals($_itemColumn<String>('code')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionAmountDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionReduceTable,
    List<TransactionReduceEntity>
  >
  _transactionReduceRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionReduce,
        aliasName: $_aliasNameGenerator(
          db.currency.code,
          db.transactionReduce.currencyCode,
        ),
      );

  $$TransactionReduceTableProcessedTableManager get transactionReduceRefs {
    final manager =
        $$TransactionReduceTableTableManager(
          $_db,
          $_db.transactionReduce,
        ).filter(
          (f) => f.currencyCode.code.sqlEquals($_itemColumn<String>('code')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionReduceRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CurrencyTableFilterComposer
    extends Composer<_$LedgerDatabase, $CurrencyTable> {
  $$CurrencyTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
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

  ColumnFilters<bool> get main => $composableBuilder(
    column: $table.main,
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
      getCurrentColumn: (t) => t.code,
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

  Expression<bool> transactionAmountDetailRefs(
    Expression<bool> Function($$TransactionAmountDetailTableFilterComposer f) f,
  ) {
    final $$TransactionAmountDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.code,
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

  Expression<bool> transactionReduceRefs(
    Expression<bool> Function($$TransactionReduceTableFilterComposer f) f,
  ) {
    final $$TransactionReduceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.code,
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
}

class $$CurrencyTableOrderingComposer
    extends Composer<_$LedgerDatabase, $CurrencyTable> {
  $$CurrencyTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
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

  ColumnOrderings<bool> get main => $composableBuilder(
    column: $table.main,
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
    extends Composer<_$LedgerDatabase, $CurrencyTable> {
  $$CurrencyTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumn<bool> get main =>
      $composableBuilder(column: $table.main, builder: (column) => column);

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
      getCurrentColumn: (t) => t.code,
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

  Expression<T> transactionAmountDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionAmountDetailTableAnnotationComposer a)
    f,
  ) {
    final $$TransactionAmountDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.code,
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

  Expression<T> transactionReduceRefs<T extends Object>(
    Expression<T> Function($$TransactionReduceTableAnnotationComposer a) f,
  ) {
    final $$TransactionReduceTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.code,
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
}

class $$CurrencyTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
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
            bool transactionAmountDetailRefs,
            bool transactionReduceRefs,
          })
        > {
  $$CurrencyTableTableManager(_$LedgerDatabase db, $CurrencyTable table)
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
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> symbol = const Value.absent(),
                Value<bool> main = const Value.absent(),
                Value<CurrencyPosition> position = const Value.absent(),
                Value<int> decimal = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<CurrencySource> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurrencyCompanion(
                code: code,
                name: name,
                symbol: symbol,
                main: main,
                position: position,
                decimal: decimal,
                icon: icon,
                source: source,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String code,
                required String name,
                required String symbol,
                Value<bool> main = const Value.absent(),
                Value<CurrencyPosition> position = const Value.absent(),
                Value<int> decimal = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<CurrencySource> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurrencyCompanion.insert(
                code: code,
                name: name,
                symbol: symbol,
                main: main,
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
                transactionAmountDetailRefs = false,
                transactionReduceRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (accountRefs) db.account,
                    if (transactionAmountDetailRefs) db.transactionAmountDetail,
                    if (transactionReduceRefs) db.transactionReduce,
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
                                (e) => e.currencyCode == item.code,
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
                                (e) => e.currencyCode == item.code,
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
                                (e) => e.currencyCode == item.code,
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
      _$LedgerDatabase,
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
        bool transactionAmountDetailRefs,
        bool transactionReduceRefs,
      })
    >;
typedef $$AccountTableCreateCompanionBuilder =
    AccountCompanion Function({
      Value<int> id,
      required String name,
      Value<String> description,
      Value<String> icon,
      required AccountType type,
      required String currencyCode,
      required int createdAt,
      required int updatedAt,
      Value<String?> note,
    });
typedef $$AccountTableUpdateCompanionBuilder =
    AccountCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> icon,
      Value<AccountType> type,
      Value<String> currencyCode,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String?> note,
    });

final class $$AccountTableReferences
    extends BaseReferences<_$LedgerDatabase, $AccountTable, AccountEntity> {
  $$AccountTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CurrencyTable _currencyCodeTable(_$LedgerDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(db.account.currencyCode, db.currency.code),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.code.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AccountMetaTable, List<AccountMetaEntity>>
  _accountMetaRefsTable(_$LedgerDatabase db) => MultiTypedResultKey.fromTable(
    db.accountMeta,
    aliasName: $_aliasNameGenerator(db.account.id, db.accountMeta.accountId),
  );

  $$AccountMetaTableProcessedTableManager get accountMetaRefs {
    final manager = $$AccountMetaTableTableManager(
      $_db,
      $_db.accountMeta,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountMetaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AccountCreditTable, List<CreditAccountEntity>>
  _accountCreditRefsTable(_$LedgerDatabase db) => MultiTypedResultKey.fromTable(
    db.accountCredit,
    aliasName: $_aliasNameGenerator(db.account.id, db.accountCredit.accountId),
  );

  $$AccountCreditTableProcessedTableManager get accountCreditRefs {
    final manager = $$AccountCreditTableTableManager(
      $_db,
      $_db.accountCredit,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountCreditRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AccountPlanLoanTable, List<PlanLoanAccountEntity>>
  _accountPlanLoanRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.accountPlanLoan,
        aliasName: $_aliasNameGenerator(
          db.account.id,
          db.accountPlanLoan.accountId,
        ),
      );

  $$AccountPlanLoanTableProcessedTableManager get accountPlanLoanRefs {
    final manager = $$AccountPlanLoanTableTableManager(
      $_db,
      $_db.accountPlanLoan,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _accountPlanLoanRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AccountFlexLoanTable, List<FlexLoanAccountEntity>>
  _accountFlexLoanRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.accountFlexLoan,
        aliasName: $_aliasNameGenerator(
          db.account.id,
          db.accountFlexLoan.accountId,
        ),
      );

  $$AccountFlexLoanTableProcessedTableManager get accountFlexLoanRefs {
    final manager = $$AccountFlexLoanTableTableManager(
      $_db,
      $_db.accountFlexLoan,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _accountFlexLoanRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AccountInvestTable, List<InvestAccountEntity>>
  _accountInvestRefsTable(_$LedgerDatabase db) => MultiTypedResultKey.fromTable(
    db.accountInvest,
    aliasName: $_aliasNameGenerator(db.account.id, db.accountInvest.accountId),
  );

  $$AccountInvestTableProcessedTableManager get accountInvestRefs {
    final manager = $$AccountInvestTableTableManager(
      $_db,
      $_db.accountInvest,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountInvestRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LoanPlanTable, List<LoanPlanEntity>>
  _loanPlanRefsTable(_$LedgerDatabase db) => MultiTypedResultKey.fromTable(
    db.loanPlan,
    aliasName: $_aliasNameGenerator(db.account.id, db.loanPlan.accountId),
  );

  $$LoanPlanTableProcessedTableManager get loanPlanRefs {
    final manager = $$LoanPlanTableTableManager(
      $_db,
      $_db.loanPlan,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_loanPlanRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionAmountDetailTable,
    List<TransactionAmountDetailEntity>
  >
  _transactionAmountDetailRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionAmountDetail,
        aliasName: $_aliasNameGenerator(
          db.account.id,
          db.transactionAmountDetail.accountId,
        ),
      );

  $$TransactionAmountDetailTableProcessedTableManager
  get transactionAmountDetailRefs {
    final manager = $$TransactionAmountDetailTableTableManager(
      $_db,
      $_db.transactionAmountDetail,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionAmountDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ReimbursementActualTable,
    List<ReimbursementActualEntity>
  >
  _reimbursementActualRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reimbursementActual,
        aliasName: $_aliasNameGenerator(
          db.account.id,
          db.reimbursementActual.accountId,
        ),
      );

  $$ReimbursementActualTableProcessedTableManager get reimbursementActualRefs {
    final manager = $$ReimbursementActualTableTableManager(
      $_db,
      $_db.reimbursementActual,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _reimbursementActualRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AccountTableFilterComposer
    extends Composer<_$LedgerDatabase, $AccountTable> {
  $$AccountTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
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
      getReferencedColumn: (t) => t.code,
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
      getCurrentColumn: (t) => t.id,
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
      getCurrentColumn: (t) => t.id,
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

  Expression<bool> accountPlanLoanRefs(
    Expression<bool> Function($$AccountPlanLoanTableFilterComposer f) f,
  ) {
    final $$AccountPlanLoanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountPlanLoan,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountPlanLoanTableFilterComposer(
            $db: $db,
            $table: $db.accountPlanLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> accountFlexLoanRefs(
    Expression<bool> Function($$AccountFlexLoanTableFilterComposer f) f,
  ) {
    final $$AccountFlexLoanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountFlexLoan,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountFlexLoanTableFilterComposer(
            $db: $db,
            $table: $db.accountFlexLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> accountInvestRefs(
    Expression<bool> Function($$AccountInvestTableFilterComposer f) f,
  ) {
    final $$AccountInvestTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountInvest,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountInvestTableFilterComposer(
            $db: $db,
            $table: $db.accountInvest,
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
      getCurrentColumn: (t) => t.id,
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

  Expression<bool> transactionAmountDetailRefs(
    Expression<bool> Function($$TransactionAmountDetailTableFilterComposer f) f,
  ) {
    final $$TransactionAmountDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
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

  Expression<bool> reimbursementActualRefs(
    Expression<bool> Function($$ReimbursementActualTableFilterComposer f) f,
  ) {
    final $$ReimbursementActualTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
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
    extends Composer<_$LedgerDatabase, $AccountTable> {
  $$AccountTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
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
      getReferencedColumn: (t) => t.code,
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
    extends Composer<_$LedgerDatabase, $AccountTable> {
  $$AccountTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

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
      getReferencedColumn: (t) => t.code,
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
      getCurrentColumn: (t) => t.id,
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
      getCurrentColumn: (t) => t.id,
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

  Expression<T> accountPlanLoanRefs<T extends Object>(
    Expression<T> Function($$AccountPlanLoanTableAnnotationComposer a) f,
  ) {
    final $$AccountPlanLoanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountPlanLoan,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountPlanLoanTableAnnotationComposer(
            $db: $db,
            $table: $db.accountPlanLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> accountFlexLoanRefs<T extends Object>(
    Expression<T> Function($$AccountFlexLoanTableAnnotationComposer a) f,
  ) {
    final $$AccountFlexLoanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountFlexLoan,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountFlexLoanTableAnnotationComposer(
            $db: $db,
            $table: $db.accountFlexLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> accountInvestRefs<T extends Object>(
    Expression<T> Function($$AccountInvestTableAnnotationComposer a) f,
  ) {
    final $$AccountInvestTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountInvest,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountInvestTableAnnotationComposer(
            $db: $db,
            $table: $db.accountInvest,
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
      getCurrentColumn: (t) => t.id,
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

  Expression<T> transactionAmountDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionAmountDetailTableAnnotationComposer a)
    f,
  ) {
    final $$TransactionAmountDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
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

  Expression<T> reimbursementActualRefs<T extends Object>(
    Expression<T> Function($$ReimbursementActualTableAnnotationComposer a) f,
  ) {
    final $$ReimbursementActualTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
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
          _$LedgerDatabase,
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
            bool accountPlanLoanRefs,
            bool accountFlexLoanRefs,
            bool accountInvestRefs,
            bool loanPlanRefs,
            bool transactionAmountDetailRefs,
            bool reimbursementActualRefs,
          })
        > {
  $$AccountTableTableManager(_$LedgerDatabase db, $AccountTable table)
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
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<AccountType> type = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => AccountCompanion(
                id: id,
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
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> description = const Value.absent(),
                Value<String> icon = const Value.absent(),
                required AccountType type,
                required String currencyCode,
                required int createdAt,
                required int updatedAt,
                Value<String?> note = const Value.absent(),
              }) => AccountCompanion.insert(
                id: id,
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
                accountPlanLoanRefs = false,
                accountFlexLoanRefs = false,
                accountInvestRefs = false,
                loanPlanRefs = false,
                transactionAmountDetailRefs = false,
                reimbursementActualRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (accountMetaRefs) db.accountMeta,
                    if (accountCreditRefs) db.accountCredit,
                    if (accountPlanLoanRefs) db.accountPlanLoan,
                    if (accountFlexLoanRefs) db.accountFlexLoan,
                    if (accountInvestRefs) db.accountInvest,
                    if (loanPlanRefs) db.loanPlan,
                    if (transactionAmountDetailRefs) db.transactionAmountDetail,
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
                                        .code,
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
                                (e) => e.accountId == item.id,
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
                                (e) => e.accountId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (accountPlanLoanRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          PlanLoanAccountEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._accountPlanLoanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).accountPlanLoanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (accountFlexLoanRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          FlexLoanAccountEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._accountFlexLoanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).accountFlexLoanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (accountInvestRefs)
                        await $_getPrefetchedData<
                          AccountEntity,
                          $AccountTable,
                          InvestAccountEntity
                        >(
                          currentTable: table,
                          referencedTable: $$AccountTableReferences
                              ._accountInvestRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountTableReferences(
                                db,
                                table,
                                p0,
                              ).accountInvestRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.id,
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
                                (e) => e.accountId == item.id,
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
                                (e) => e.accountId == item.id,
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
                                (e) => e.accountId == item.id,
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
      _$LedgerDatabase,
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
        bool accountPlanLoanRefs,
        bool accountFlexLoanRefs,
        bool accountInvestRefs,
        bool loanPlanRefs,
        bool transactionAmountDetailRefs,
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
        BaseReferences<_$LedgerDatabase, $AccountMetaTable, AccountMetaEntity> {
  $$AccountMetaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountTable _accountIdTable(_$LedgerDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.accountMeta.accountId, db.account.id),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountMetaTableFilterComposer
    extends Composer<_$LedgerDatabase, $AccountMetaTable> {
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
      getReferencedColumn: (t) => t.id,
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
    extends Composer<_$LedgerDatabase, $AccountMetaTable> {
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
      getReferencedColumn: (t) => t.id,
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
    extends Composer<_$LedgerDatabase, $AccountMetaTable> {
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
      getReferencedColumn: (t) => t.id,
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
          _$LedgerDatabase,
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
  $$AccountMetaTableTableManager(_$LedgerDatabase db, $AccountMetaTable table)
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
                                    .id,
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
      _$LedgerDatabase,
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
          _$LedgerDatabase,
          $AccountCreditTable,
          CreditAccountEntity
        > {
  $$AccountCreditTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AccountTable _accountIdTable(_$LedgerDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.accountCredit.accountId, db.account.id),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountCreditTableFilterComposer
    extends Composer<_$LedgerDatabase, $AccountCreditTable> {
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
      getReferencedColumn: (t) => t.id,
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
    extends Composer<_$LedgerDatabase, $AccountCreditTable> {
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
      getReferencedColumn: (t) => t.id,
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
    extends Composer<_$LedgerDatabase, $AccountCreditTable> {
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
      getReferencedColumn: (t) => t.id,
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
          _$LedgerDatabase,
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
  $$AccountCreditTableTableManager(
    _$LedgerDatabase db,
    $AccountCreditTable table,
  ) : super(
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
                                    .id,
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
      _$LedgerDatabase,
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
typedef $$AccountPrepaidTableCreateCompanionBuilder =
    AccountPrepaidCompanion Function({
      Value<int> prepaidAccountId,
      required int bonusAccountId,
      required AccountBonusMode bonusMode,
    });
typedef $$AccountPrepaidTableUpdateCompanionBuilder =
    AccountPrepaidCompanion Function({
      Value<int> prepaidAccountId,
      Value<int> bonusAccountId,
      Value<AccountBonusMode> bonusMode,
    });

final class $$AccountPrepaidTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $AccountPrepaidTable,
          PrepaidAccountEntity
        > {
  $$AccountPrepaidTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AccountTable _prepaidAccountIdTable(_$LedgerDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.accountPrepaid.prepaidAccountId, db.account.id),
      );

  $$AccountTableProcessedTableManager get prepaidAccountId {
    final $_column = $_itemColumn<int>('prepaid_account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_prepaidAccountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountTable _bonusAccountIdTable(_$LedgerDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.accountPrepaid.bonusAccountId, db.account.id),
      );

  $$AccountTableProcessedTableManager get bonusAccountId {
    final $_column = $_itemColumn<int>('bonus_account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bonusAccountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountPrepaidTableFilterComposer
    extends Composer<_$LedgerDatabase, $AccountPrepaidTable> {
  $$AccountPrepaidTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<AccountBonusMode, AccountBonusMode, String>
  get bonusMode => $composableBuilder(
    column: $table.bonusMode,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$AccountTableFilterComposer get prepaidAccountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prepaidAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

  $$AccountTableFilterComposer get bonusAccountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bonusAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

class $$AccountPrepaidTableOrderingComposer
    extends Composer<_$LedgerDatabase, $AccountPrepaidTable> {
  $$AccountPrepaidTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get bonusMode => $composableBuilder(
    column: $table.bonusMode,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountTableOrderingComposer get prepaidAccountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prepaidAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

  $$AccountTableOrderingComposer get bonusAccountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bonusAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

class $$AccountPrepaidTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $AccountPrepaidTable> {
  $$AccountPrepaidTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<AccountBonusMode, String> get bonusMode =>
      $composableBuilder(column: $table.bonusMode, builder: (column) => column);

  $$AccountTableAnnotationComposer get prepaidAccountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prepaidAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

  $$AccountTableAnnotationComposer get bonusAccountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bonusAccountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

class $$AccountPrepaidTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $AccountPrepaidTable,
          PrepaidAccountEntity,
          $$AccountPrepaidTableFilterComposer,
          $$AccountPrepaidTableOrderingComposer,
          $$AccountPrepaidTableAnnotationComposer,
          $$AccountPrepaidTableCreateCompanionBuilder,
          $$AccountPrepaidTableUpdateCompanionBuilder,
          (PrepaidAccountEntity, $$AccountPrepaidTableReferences),
          PrepaidAccountEntity,
          PrefetchHooks Function({bool prepaidAccountId, bool bonusAccountId})
        > {
  $$AccountPrepaidTableTableManager(
    _$LedgerDatabase db,
    $AccountPrepaidTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountPrepaidTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountPrepaidTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountPrepaidTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> prepaidAccountId = const Value.absent(),
                Value<int> bonusAccountId = const Value.absent(),
                Value<AccountBonusMode> bonusMode = const Value.absent(),
              }) => AccountPrepaidCompanion(
                prepaidAccountId: prepaidAccountId,
                bonusAccountId: bonusAccountId,
                bonusMode: bonusMode,
              ),
          createCompanionCallback:
              ({
                Value<int> prepaidAccountId = const Value.absent(),
                required int bonusAccountId,
                required AccountBonusMode bonusMode,
              }) => AccountPrepaidCompanion.insert(
                prepaidAccountId: prepaidAccountId,
                bonusAccountId: bonusAccountId,
                bonusMode: bonusMode,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountPrepaidTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({prepaidAccountId = false, bonusAccountId = false}) {
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
                        if (prepaidAccountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.prepaidAccountId,
                                    referencedTable:
                                        $$AccountPrepaidTableReferences
                                            ._prepaidAccountIdTable(db),
                                    referencedColumn:
                                        $$AccountPrepaidTableReferences
                                            ._prepaidAccountIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (bonusAccountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.bonusAccountId,
                                    referencedTable:
                                        $$AccountPrepaidTableReferences
                                            ._bonusAccountIdTable(db),
                                    referencedColumn:
                                        $$AccountPrepaidTableReferences
                                            ._bonusAccountIdTable(db)
                                            .id,
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

typedef $$AccountPrepaidTableProcessedTableManager =
    ProcessedTableManager<
      _$LedgerDatabase,
      $AccountPrepaidTable,
      PrepaidAccountEntity,
      $$AccountPrepaidTableFilterComposer,
      $$AccountPrepaidTableOrderingComposer,
      $$AccountPrepaidTableAnnotationComposer,
      $$AccountPrepaidTableCreateCompanionBuilder,
      $$AccountPrepaidTableUpdateCompanionBuilder,
      (PrepaidAccountEntity, $$AccountPrepaidTableReferences),
      PrepaidAccountEntity,
      PrefetchHooks Function({bool prepaidAccountId, bool bonusAccountId})
    >;
typedef $$StakeholderTableCreateCompanionBuilder =
    StakeholderCompanion Function({
      Value<int> id,
      required String name,
      required StakeholderType type,
      Value<String?> description,
      Value<String?> icon,
      Value<bool> archived,
      required int createdAt,
      required int updatedAt,
    });
typedef $$StakeholderTableUpdateCompanionBuilder =
    StakeholderCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<StakeholderType> type,
      Value<String?> description,
      Value<String?> icon,
      Value<bool> archived,
      Value<int> createdAt,
      Value<int> updatedAt,
    });

final class $$StakeholderTableReferences
    extends
        BaseReferences<_$LedgerDatabase, $StakeholderTable, StakeholderEntity> {
  $$StakeholderTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountPlanLoanTable, List<PlanLoanAccountEntity>>
  _accountPlanLoanRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.accountPlanLoan,
        aliasName: $_aliasNameGenerator(
          db.stakeholder.id,
          db.accountPlanLoan.stakeholderId,
        ),
      );

  $$AccountPlanLoanTableProcessedTableManager get accountPlanLoanRefs {
    final manager = $$AccountPlanLoanTableTableManager(
      $_db,
      $_db.accountPlanLoan,
    ).filter((f) => f.stakeholderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _accountPlanLoanRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AccountFlexLoanTable, List<FlexLoanAccountEntity>>
  _accountFlexLoanRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.accountFlexLoan,
        aliasName: $_aliasNameGenerator(
          db.stakeholder.id,
          db.accountFlexLoan.stakeholderId,
        ),
      );

  $$AccountFlexLoanTableProcessedTableManager get accountFlexLoanRefs {
    final manager = $$AccountFlexLoanTableTableManager(
      $_db,
      $_db.accountFlexLoan,
    ).filter((f) => f.stakeholderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _accountFlexLoanRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionCountDetailTable,
    List<TransactionCountDetailEntity>
  >
  _transactionCountDetailRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionCountDetail,
        aliasName: $_aliasNameGenerator(
          db.stakeholder.id,
          db.transactionCountDetail.stakeholderId,
        ),
      );

  $$TransactionCountDetailTableProcessedTableManager
  get transactionCountDetailRefs {
    final manager = $$TransactionCountDetailTableTableManager(
      $_db,
      $_db.transactionCountDetail,
    ).filter((f) => f.stakeholderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionCountDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StakeholderTableFilterComposer
    extends Composer<_$LedgerDatabase, $StakeholderTable> {
  $$StakeholderTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
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

  Expression<bool> accountPlanLoanRefs(
    Expression<bool> Function($$AccountPlanLoanTableFilterComposer f) f,
  ) {
    final $$AccountPlanLoanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountPlanLoan,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountPlanLoanTableFilterComposer(
            $db: $db,
            $table: $db.accountPlanLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> accountFlexLoanRefs(
    Expression<bool> Function($$AccountFlexLoanTableFilterComposer f) f,
  ) {
    final $$AccountFlexLoanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountFlexLoan,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountFlexLoanTableFilterComposer(
            $db: $db,
            $table: $db.accountFlexLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> transactionCountDetailRefs(
    Expression<bool> Function($$TransactionCountDetailTableFilterComposer f) f,
  ) {
    final $$TransactionCountDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.stakeholderId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
    extends Composer<_$LedgerDatabase, $StakeholderTable> {
  $$StakeholderTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
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
}

class $$StakeholderTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $StakeholderTable> {
  $$StakeholderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<StakeholderType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> accountPlanLoanRefs<T extends Object>(
    Expression<T> Function($$AccountPlanLoanTableAnnotationComposer a) f,
  ) {
    final $$AccountPlanLoanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountPlanLoan,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountPlanLoanTableAnnotationComposer(
            $db: $db,
            $table: $db.accountPlanLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> accountFlexLoanRefs<T extends Object>(
    Expression<T> Function($$AccountFlexLoanTableAnnotationComposer a) f,
  ) {
    final $$AccountFlexLoanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountFlexLoan,
      getReferencedColumn: (t) => t.stakeholderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountFlexLoanTableAnnotationComposer(
            $db: $db,
            $table: $db.accountFlexLoan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> transactionCountDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionCountDetailTableAnnotationComposer a) f,
  ) {
    final $$TransactionCountDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.stakeholderId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
          _$LedgerDatabase,
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
            bool accountPlanLoanRefs,
            bool accountFlexLoanRefs,
            bool transactionCountDetailRefs,
          })
        > {
  $$StakeholderTableTableManager(_$LedgerDatabase db, $StakeholderTable table)
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
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<StakeholderType> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => StakeholderCompanion(
                id: id,
                name: name,
                type: type,
                description: description,
                icon: icon,
                archived: archived,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required StakeholderType type,
                Value<String?> description = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                required int createdAt,
                required int updatedAt,
              }) => StakeholderCompanion.insert(
                id: id,
                name: name,
                type: type,
                description: description,
                icon: icon,
                archived: archived,
                createdAt: createdAt,
                updatedAt: updatedAt,
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
                accountPlanLoanRefs = false,
                accountFlexLoanRefs = false,
                transactionCountDetailRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (accountPlanLoanRefs) db.accountPlanLoan,
                    if (accountFlexLoanRefs) db.accountFlexLoan,
                    if (transactionCountDetailRefs) db.transactionCountDetail,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (accountPlanLoanRefs)
                        await $_getPrefetchedData<
                          StakeholderEntity,
                          $StakeholderTable,
                          PlanLoanAccountEntity
                        >(
                          currentTable: table,
                          referencedTable: $$StakeholderTableReferences
                              ._accountPlanLoanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StakeholderTableReferences(
                                db,
                                table,
                                p0,
                              ).accountPlanLoanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.stakeholderId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (accountFlexLoanRefs)
                        await $_getPrefetchedData<
                          StakeholderEntity,
                          $StakeholderTable,
                          FlexLoanAccountEntity
                        >(
                          currentTable: table,
                          referencedTable: $$StakeholderTableReferences
                              ._accountFlexLoanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StakeholderTableReferences(
                                db,
                                table,
                                p0,
                              ).accountFlexLoanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.stakeholderId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (transactionCountDetailRefs)
                        await $_getPrefetchedData<
                          StakeholderEntity,
                          $StakeholderTable,
                          TransactionCountDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$StakeholderTableReferences
                              ._transactionCountDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StakeholderTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionCountDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.stakeholderId == item.id,
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
      _$LedgerDatabase,
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
        bool accountPlanLoanRefs,
        bool accountFlexLoanRefs,
        bool transactionCountDetailRefs,
      })
    >;
typedef $$AccountPlanLoanTableCreateCompanionBuilder =
    AccountPlanLoanCompanion Function({
      Value<int> accountId,
      required int stakeholderId,
      required AccountLoanType type,
      Value<bool> archived,
    });
typedef $$AccountPlanLoanTableUpdateCompanionBuilder =
    AccountPlanLoanCompanion Function({
      Value<int> accountId,
      Value<int> stakeholderId,
      Value<AccountLoanType> type,
      Value<bool> archived,
    });

final class $$AccountPlanLoanTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $AccountPlanLoanTable,
          PlanLoanAccountEntity
        > {
  $$AccountPlanLoanTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AccountTable _accountIdTable(_$LedgerDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.accountPlanLoan.accountId, db.account.id),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StakeholderTable _stakeholderIdTable(_$LedgerDatabase db) =>
      db.stakeholder.createAlias(
        $_aliasNameGenerator(
          db.accountPlanLoan.stakeholderId,
          db.stakeholder.id,
        ),
      );

  $$StakeholderTableProcessedTableManager get stakeholderId {
    final $_column = $_itemColumn<int>('stakeholder_id')!;

    final manager = $$StakeholderTableTableManager(
      $_db,
      $_db.stakeholder,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stakeholderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountPlanLoanTableFilterComposer
    extends Composer<_$LedgerDatabase, $AccountPlanLoanTable> {
  $$AccountPlanLoanTableFilterComposer({
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

  ColumnFilters<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

class $$AccountPlanLoanTableOrderingComposer
    extends Composer<_$LedgerDatabase, $AccountPlanLoanTable> {
  $$AccountPlanLoanTableOrderingComposer({
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

  ColumnOrderings<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

class $$AccountPlanLoanTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $AccountPlanLoanTable> {
  $$AccountPlanLoanTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<AccountLoanType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

class $$AccountPlanLoanTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $AccountPlanLoanTable,
          PlanLoanAccountEntity,
          $$AccountPlanLoanTableFilterComposer,
          $$AccountPlanLoanTableOrderingComposer,
          $$AccountPlanLoanTableAnnotationComposer,
          $$AccountPlanLoanTableCreateCompanionBuilder,
          $$AccountPlanLoanTableUpdateCompanionBuilder,
          (PlanLoanAccountEntity, $$AccountPlanLoanTableReferences),
          PlanLoanAccountEntity,
          PrefetchHooks Function({bool accountId, bool stakeholderId})
        > {
  $$AccountPlanLoanTableTableManager(
    _$LedgerDatabase db,
    $AccountPlanLoanTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountPlanLoanTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountPlanLoanTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountPlanLoanTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                Value<int> stakeholderId = const Value.absent(),
                Value<AccountLoanType> type = const Value.absent(),
                Value<bool> archived = const Value.absent(),
              }) => AccountPlanLoanCompanion(
                accountId: accountId,
                stakeholderId: stakeholderId,
                type: type,
                archived: archived,
              ),
          createCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                required int stakeholderId,
                required AccountLoanType type,
                Value<bool> archived = const Value.absent(),
              }) => AccountPlanLoanCompanion.insert(
                accountId: accountId,
                stakeholderId: stakeholderId,
                type: type,
                archived: archived,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountPlanLoanTableReferences(db, table, e),
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
                                referencedTable:
                                    $$AccountPlanLoanTableReferences
                                        ._accountIdTable(db),
                                referencedColumn:
                                    $$AccountPlanLoanTableReferences
                                        ._accountIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (stakeholderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.stakeholderId,
                                referencedTable:
                                    $$AccountPlanLoanTableReferences
                                        ._stakeholderIdTable(db),
                                referencedColumn:
                                    $$AccountPlanLoanTableReferences
                                        ._stakeholderIdTable(db)
                                        .id,
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

typedef $$AccountPlanLoanTableProcessedTableManager =
    ProcessedTableManager<
      _$LedgerDatabase,
      $AccountPlanLoanTable,
      PlanLoanAccountEntity,
      $$AccountPlanLoanTableFilterComposer,
      $$AccountPlanLoanTableOrderingComposer,
      $$AccountPlanLoanTableAnnotationComposer,
      $$AccountPlanLoanTableCreateCompanionBuilder,
      $$AccountPlanLoanTableUpdateCompanionBuilder,
      (PlanLoanAccountEntity, $$AccountPlanLoanTableReferences),
      PlanLoanAccountEntity,
      PrefetchHooks Function({bool accountId, bool stakeholderId})
    >;
typedef $$AccountFlexLoanTableCreateCompanionBuilder =
    AccountFlexLoanCompanion Function({
      Value<int> accountId,
      required int stakeholderId,
      required AccountLoanType type,
      required double rate,
      required LoanInterestCycle cycle,
      required int startDate,
      required int endDate,
      Value<bool> archived,
    });
typedef $$AccountFlexLoanTableUpdateCompanionBuilder =
    AccountFlexLoanCompanion Function({
      Value<int> accountId,
      Value<int> stakeholderId,
      Value<AccountLoanType> type,
      Value<double> rate,
      Value<LoanInterestCycle> cycle,
      Value<int> startDate,
      Value<int> endDate,
      Value<bool> archived,
    });

final class $$AccountFlexLoanTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $AccountFlexLoanTable,
          FlexLoanAccountEntity
        > {
  $$AccountFlexLoanTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AccountTable _accountIdTable(_$LedgerDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.accountFlexLoan.accountId, db.account.id),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StakeholderTable _stakeholderIdTable(_$LedgerDatabase db) =>
      db.stakeholder.createAlias(
        $_aliasNameGenerator(
          db.accountFlexLoan.stakeholderId,
          db.stakeholder.id,
        ),
      );

  $$StakeholderTableProcessedTableManager get stakeholderId {
    final $_column = $_itemColumn<int>('stakeholder_id')!;

    final manager = $$StakeholderTableTableManager(
      $_db,
      $_db.stakeholder,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stakeholderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountFlexLoanTableFilterComposer
    extends Composer<_$LedgerDatabase, $AccountFlexLoanTable> {
  $$AccountFlexLoanTableFilterComposer({
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

  ColumnFilters<double> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LoanInterestCycle, LoanInterestCycle, String>
  get cycle => $composableBuilder(
    column: $table.cycle,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

class $$AccountFlexLoanTableOrderingComposer
    extends Composer<_$LedgerDatabase, $AccountFlexLoanTable> {
  $$AccountFlexLoanTableOrderingComposer({
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

  ColumnOrderings<double> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cycle => $composableBuilder(
    column: $table.cycle,
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

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

class $$AccountFlexLoanTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $AccountFlexLoanTable> {
  $$AccountFlexLoanTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<AccountLoanType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LoanInterestCycle, String> get cycle =>
      $composableBuilder(column: $table.cycle, builder: (column) => column);

  GeneratedColumn<int> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<int> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

class $$AccountFlexLoanTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $AccountFlexLoanTable,
          FlexLoanAccountEntity,
          $$AccountFlexLoanTableFilterComposer,
          $$AccountFlexLoanTableOrderingComposer,
          $$AccountFlexLoanTableAnnotationComposer,
          $$AccountFlexLoanTableCreateCompanionBuilder,
          $$AccountFlexLoanTableUpdateCompanionBuilder,
          (FlexLoanAccountEntity, $$AccountFlexLoanTableReferences),
          FlexLoanAccountEntity,
          PrefetchHooks Function({bool accountId, bool stakeholderId})
        > {
  $$AccountFlexLoanTableTableManager(
    _$LedgerDatabase db,
    $AccountFlexLoanTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountFlexLoanTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountFlexLoanTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountFlexLoanTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                Value<int> stakeholderId = const Value.absent(),
                Value<AccountLoanType> type = const Value.absent(),
                Value<double> rate = const Value.absent(),
                Value<LoanInterestCycle> cycle = const Value.absent(),
                Value<int> startDate = const Value.absent(),
                Value<int> endDate = const Value.absent(),
                Value<bool> archived = const Value.absent(),
              }) => AccountFlexLoanCompanion(
                accountId: accountId,
                stakeholderId: stakeholderId,
                type: type,
                rate: rate,
                cycle: cycle,
                startDate: startDate,
                endDate: endDate,
                archived: archived,
              ),
          createCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                required int stakeholderId,
                required AccountLoanType type,
                required double rate,
                required LoanInterestCycle cycle,
                required int startDate,
                required int endDate,
                Value<bool> archived = const Value.absent(),
              }) => AccountFlexLoanCompanion.insert(
                accountId: accountId,
                stakeholderId: stakeholderId,
                type: type,
                rate: rate,
                cycle: cycle,
                startDate: startDate,
                endDate: endDate,
                archived: archived,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountFlexLoanTableReferences(db, table, e),
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
                                referencedTable:
                                    $$AccountFlexLoanTableReferences
                                        ._accountIdTable(db),
                                referencedColumn:
                                    $$AccountFlexLoanTableReferences
                                        ._accountIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (stakeholderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.stakeholderId,
                                referencedTable:
                                    $$AccountFlexLoanTableReferences
                                        ._stakeholderIdTable(db),
                                referencedColumn:
                                    $$AccountFlexLoanTableReferences
                                        ._stakeholderIdTable(db)
                                        .id,
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

typedef $$AccountFlexLoanTableProcessedTableManager =
    ProcessedTableManager<
      _$LedgerDatabase,
      $AccountFlexLoanTable,
      FlexLoanAccountEntity,
      $$AccountFlexLoanTableFilterComposer,
      $$AccountFlexLoanTableOrderingComposer,
      $$AccountFlexLoanTableAnnotationComposer,
      $$AccountFlexLoanTableCreateCompanionBuilder,
      $$AccountFlexLoanTableUpdateCompanionBuilder,
      (FlexLoanAccountEntity, $$AccountFlexLoanTableReferences),
      FlexLoanAccountEntity,
      PrefetchHooks Function({bool accountId, bool stakeholderId})
    >;
typedef $$AccountInvestTableCreateCompanionBuilder =
    AccountInvestCompanion Function({
      Value<int> accountId,
      required AccountInvestType type,
      Value<String?> code,
    });
typedef $$AccountInvestTableUpdateCompanionBuilder =
    AccountInvestCompanion Function({
      Value<int> accountId,
      Value<AccountInvestType> type,
      Value<String?> code,
    });

final class $$AccountInvestTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $AccountInvestTable,
          InvestAccountEntity
        > {
  $$AccountInvestTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AccountTable _accountIdTable(_$LedgerDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.accountInvest.accountId, db.account.id),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountInvestTableFilterComposer
    extends Composer<_$LedgerDatabase, $AccountInvestTable> {
  $$AccountInvestTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<AccountInvestType, AccountInvestType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

class $$AccountInvestTableOrderingComposer
    extends Composer<_$LedgerDatabase, $AccountInvestTable> {
  $$AccountInvestTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

class $$AccountInvestTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $AccountInvestTable> {
  $$AccountInvestTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<AccountInvestType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

class $$AccountInvestTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $AccountInvestTable,
          InvestAccountEntity,
          $$AccountInvestTableFilterComposer,
          $$AccountInvestTableOrderingComposer,
          $$AccountInvestTableAnnotationComposer,
          $$AccountInvestTableCreateCompanionBuilder,
          $$AccountInvestTableUpdateCompanionBuilder,
          (InvestAccountEntity, $$AccountInvestTableReferences),
          InvestAccountEntity,
          PrefetchHooks Function({bool accountId})
        > {
  $$AccountInvestTableTableManager(
    _$LedgerDatabase db,
    $AccountInvestTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountInvestTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountInvestTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountInvestTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                Value<AccountInvestType> type = const Value.absent(),
                Value<String?> code = const Value.absent(),
              }) => AccountInvestCompanion(
                accountId: accountId,
                type: type,
                code: code,
              ),
          createCompanionCallback:
              ({
                Value<int> accountId = const Value.absent(),
                required AccountInvestType type,
                Value<String?> code = const Value.absent(),
              }) => AccountInvestCompanion.insert(
                accountId: accountId,
                type: type,
                code: code,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountInvestTableReferences(db, table, e),
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
                                referencedTable: $$AccountInvestTableReferences
                                    ._accountIdTable(db),
                                referencedColumn: $$AccountInvestTableReferences
                                    ._accountIdTable(db)
                                    .id,
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

typedef $$AccountInvestTableProcessedTableManager =
    ProcessedTableManager<
      _$LedgerDatabase,
      $AccountInvestTable,
      InvestAccountEntity,
      $$AccountInvestTableFilterComposer,
      $$AccountInvestTableOrderingComposer,
      $$AccountInvestTableAnnotationComposer,
      $$AccountInvestTableCreateCompanionBuilder,
      $$AccountInvestTableUpdateCompanionBuilder,
      (InvestAccountEntity, $$AccountInvestTableReferences),
      InvestAccountEntity,
      PrefetchHooks Function({bool accountId})
    >;
typedef $$LoanPlanTableCreateCompanionBuilder =
    LoanPlanCompanion Function({
      Value<int> id,
      required int accountId,
      Value<double> rate,
      required int startDate,
      Value<int?> endDate,
      Value<String?> note,
    });
typedef $$LoanPlanTableUpdateCompanionBuilder =
    LoanPlanCompanion Function({
      Value<int> id,
      Value<int> accountId,
      Value<double> rate,
      Value<int> startDate,
      Value<int?> endDate,
      Value<String?> note,
    });

final class $$LoanPlanTableReferences
    extends BaseReferences<_$LedgerDatabase, $LoanPlanTable, LoanPlanEntity> {
  $$LoanPlanTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountTable _accountIdTable(_$LedgerDatabase db) => db.account
      .createAlias($_aliasNameGenerator(db.loanPlan.accountId, db.account.id));

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LoanRecordTable, List<LoanRecordEntity>>
  _loanRecordRefsTable(_$LedgerDatabase db) => MultiTypedResultKey.fromTable(
    db.loanRecord,
    aliasName: $_aliasNameGenerator(db.loanPlan.id, db.loanRecord.loanPlanId),
  );

  $$LoanRecordTableProcessedTableManager get loanRecordRefs {
    final manager = $$LoanRecordTableTableManager(
      $_db,
      $_db.loanRecord,
    ).filter((f) => f.loanPlanId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_loanRecordRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LoanPlanTableFilterComposer
    extends Composer<_$LedgerDatabase, $LoanPlanTable> {
  $$LoanPlanTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rate => $composableBuilder(
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

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountTableFilterComposer get accountId {
    final $$AccountTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

  Expression<bool> loanRecordRefs(
    Expression<bool> Function($$LoanRecordTableFilterComposer f) f,
  ) {
    final $$LoanRecordTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.loanRecord,
      getReferencedColumn: (t) => t.loanPlanId,
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
}

class $$LoanPlanTableOrderingComposer
    extends Composer<_$LedgerDatabase, $LoanPlanTable> {
  $$LoanPlanTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rate => $composableBuilder(
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

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountTableOrderingComposer get accountId {
    final $$AccountTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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
    extends Composer<_$LedgerDatabase, $LoanPlanTable> {
  $$LoanPlanTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<int> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<int> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$AccountTableAnnotationComposer get accountId {
    final $$AccountTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.account,
      getReferencedColumn: (t) => t.id,
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

  Expression<T> loanRecordRefs<T extends Object>(
    Expression<T> Function($$LoanRecordTableAnnotationComposer a) f,
  ) {
    final $$LoanRecordTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.loanRecord,
      getReferencedColumn: (t) => t.loanPlanId,
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
}

class $$LoanPlanTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $LoanPlanTable,
          LoanPlanEntity,
          $$LoanPlanTableFilterComposer,
          $$LoanPlanTableOrderingComposer,
          $$LoanPlanTableAnnotationComposer,
          $$LoanPlanTableCreateCompanionBuilder,
          $$LoanPlanTableUpdateCompanionBuilder,
          (LoanPlanEntity, $$LoanPlanTableReferences),
          LoanPlanEntity,
          PrefetchHooks Function({bool accountId, bool loanRecordRefs})
        > {
  $$LoanPlanTableTableManager(_$LedgerDatabase db, $LoanPlanTable table)
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
                Value<int> id = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<double> rate = const Value.absent(),
                Value<int> startDate = const Value.absent(),
                Value<int?> endDate = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => LoanPlanCompanion(
                id: id,
                accountId: accountId,
                rate: rate,
                startDate: startDate,
                endDate: endDate,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int accountId,
                Value<double> rate = const Value.absent(),
                required int startDate,
                Value<int?> endDate = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => LoanPlanCompanion.insert(
                id: id,
                accountId: accountId,
                rate: rate,
                startDate: startDate,
                endDate: endDate,
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
          prefetchHooksCallback: ({accountId = false, loanRecordRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (loanRecordRefs) db.loanRecord],
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
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (loanRecordRefs)
                    await $_getPrefetchedData<
                      LoanPlanEntity,
                      $LoanPlanTable,
                      LoanRecordEntity
                    >(
                      currentTable: table,
                      referencedTable: $$LoanPlanTableReferences
                          ._loanRecordRefsTable(db),
                      managerFromTypedResult: (p0) => $$LoanPlanTableReferences(
                        db,
                        table,
                        p0,
                      ).loanRecordRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.loanPlanId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LoanPlanTableProcessedTableManager =
    ProcessedTableManager<
      _$LedgerDatabase,
      $LoanPlanTable,
      LoanPlanEntity,
      $$LoanPlanTableFilterComposer,
      $$LoanPlanTableOrderingComposer,
      $$LoanPlanTableAnnotationComposer,
      $$LoanPlanTableCreateCompanionBuilder,
      $$LoanPlanTableUpdateCompanionBuilder,
      (LoanPlanEntity, $$LoanPlanTableReferences),
      LoanPlanEntity,
      PrefetchHooks Function({bool accountId, bool loanRecordRefs})
    >;
typedef $$LoanRecordTableCreateCompanionBuilder =
    LoanRecordCompanion Function({
      required int loanPlanId,
      required int period,
      required int amount,
      required int interest,
      required int date,
      Value<bool> status,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$LoanRecordTableUpdateCompanionBuilder =
    LoanRecordCompanion Function({
      Value<int> loanPlanId,
      Value<int> period,
      Value<int> amount,
      Value<int> interest,
      Value<int> date,
      Value<bool> status,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$LoanRecordTableReferences
    extends
        BaseReferences<_$LedgerDatabase, $LoanRecordTable, LoanRecordEntity> {
  $$LoanRecordTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LoanPlanTable _loanPlanIdTable(_$LedgerDatabase db) =>
      db.loanPlan.createAlias(
        $_aliasNameGenerator(db.loanRecord.loanPlanId, db.loanPlan.id),
      );

  $$LoanPlanTableProcessedTableManager get loanPlanId {
    final $_column = $_itemColumn<int>('loan_plan_id')!;

    final manager = $$LoanPlanTableTableManager(
      $_db,
      $_db.loanPlan,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_loanPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LoanRecordTableFilterComposer
    extends Composer<_$LedgerDatabase, $LoanRecordTable> {
  $$LoanRecordTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get interest => $composableBuilder(
    column: $table.interest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$LoanPlanTableFilterComposer get loanPlanId {
    final $$LoanPlanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.loanPlanId,
      referencedTable: $db.loanPlan,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$LoanRecordTableOrderingComposer
    extends Composer<_$LedgerDatabase, $LoanRecordTable> {
  $$LoanRecordTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get interest => $composableBuilder(
    column: $table.interest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$LoanPlanTableOrderingComposer get loanPlanId {
    final $$LoanPlanTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.loanPlanId,
      referencedTable: $db.loanPlan,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoanPlanTableOrderingComposer(
            $db: $db,
            $table: $db.loanPlan,
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
    extends Composer<_$LedgerDatabase, $LoanRecordTable> {
  $$LoanRecordTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get period =>
      $composableBuilder(column: $table.period, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get interest =>
      $composableBuilder(column: $table.interest, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$LoanPlanTableAnnotationComposer get loanPlanId {
    final $$LoanPlanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.loanPlanId,
      referencedTable: $db.loanPlan,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$LoanRecordTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $LoanRecordTable,
          LoanRecordEntity,
          $$LoanRecordTableFilterComposer,
          $$LoanRecordTableOrderingComposer,
          $$LoanRecordTableAnnotationComposer,
          $$LoanRecordTableCreateCompanionBuilder,
          $$LoanRecordTableUpdateCompanionBuilder,
          (LoanRecordEntity, $$LoanRecordTableReferences),
          LoanRecordEntity,
          PrefetchHooks Function({bool loanPlanId})
        > {
  $$LoanRecordTableTableManager(_$LedgerDatabase db, $LoanRecordTable table)
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
                Value<int> loanPlanId = const Value.absent(),
                Value<int> period = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> interest = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<bool> status = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LoanRecordCompanion(
                loanPlanId: loanPlanId,
                period: period,
                amount: amount,
                interest: interest,
                date: date,
                status: status,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int loanPlanId,
                required int period,
                required int amount,
                required int interest,
                required int date,
                Value<bool> status = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LoanRecordCompanion.insert(
                loanPlanId: loanPlanId,
                period: period,
                amount: amount,
                interest: interest,
                date: date,
                status: status,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LoanRecordTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({loanPlanId = false}) {
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
                    if (loanPlanId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.loanPlanId,
                                referencedTable: $$LoanRecordTableReferences
                                    ._loanPlanIdTable(db),
                                referencedColumn: $$LoanRecordTableReferences
                                    ._loanPlanIdTable(db)
                                    .id,
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
      _$LedgerDatabase,
      $LoanRecordTable,
      LoanRecordEntity,
      $$LoanRecordTableFilterComposer,
      $$LoanRecordTableOrderingComposer,
      $$LoanRecordTableAnnotationComposer,
      $$LoanRecordTableCreateCompanionBuilder,
      $$LoanRecordTableUpdateCompanionBuilder,
      (LoanRecordEntity, $$LoanRecordTableReferences),
      LoanRecordEntity,
      PrefetchHooks Function({bool loanPlanId})
    >;
typedef $$ProjectTableCreateCompanionBuilder =
    ProjectCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
      Value<int> budget,
      Value<String?> icon,
      Value<bool> archived,
      required int createdAt,
      required int updatedAt,
      Value<int?> startDate,
      Value<int?> endDate,
    });
typedef $$ProjectTableUpdateCompanionBuilder =
    ProjectCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
      Value<int> budget,
      Value<String?> icon,
      Value<bool> archived,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> startDate,
      Value<int?> endDate,
    });

final class $$ProjectTableReferences
    extends BaseReferences<_$LedgerDatabase, $ProjectTable, ProjectEntity> {
  $$ProjectTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $TransactionCountDetailTable,
    List<TransactionCountDetailEntity>
  >
  _transactionCountDetailRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionCountDetail,
        aliasName: $_aliasNameGenerator(
          db.project.id,
          db.transactionCountDetail.projectId,
        ),
      );

  $$TransactionCountDetailTableProcessedTableManager
  get transactionCountDetailRefs {
    final manager = $$TransactionCountDetailTableTableManager(
      $_db,
      $_db.transactionCountDetail,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionCountDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProjectTableFilterComposer
    extends Composer<_$LedgerDatabase, $ProjectTable> {
  $$ProjectTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
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

  Expression<bool> transactionCountDetailRefs(
    Expression<bool> Function($$TransactionCountDetailTableFilterComposer f) f,
  ) {
    final $$TransactionCountDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.projectId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
    extends Composer<_$LedgerDatabase, $ProjectTable> {
  $$ProjectTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
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
}

class $$ProjectTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $ProjectTable> {
  $$ProjectTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

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

  Expression<T> transactionCountDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionCountDetailTableAnnotationComposer a) f,
  ) {
    final $$TransactionCountDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.projectId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
          _$LedgerDatabase,
          $ProjectTable,
          ProjectEntity,
          $$ProjectTableFilterComposer,
          $$ProjectTableOrderingComposer,
          $$ProjectTableAnnotationComposer,
          $$ProjectTableCreateCompanionBuilder,
          $$ProjectTableUpdateCompanionBuilder,
          (ProjectEntity, $$ProjectTableReferences),
          ProjectEntity,
          PrefetchHooks Function({bool transactionCountDetailRefs})
        > {
  $$ProjectTableTableManager(_$LedgerDatabase db, $ProjectTable table)
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
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> budget = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> startDate = const Value.absent(),
                Value<int?> endDate = const Value.absent(),
              }) => ProjectCompanion(
                id: id,
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
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> budget = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> startDate = const Value.absent(),
                Value<int?> endDate = const Value.absent(),
              }) => ProjectCompanion.insert(
                id: id,
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
          prefetchHooksCallback: ({transactionCountDetailRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionCountDetailRefs) db.transactionCountDetail,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionCountDetailRefs)
                    await $_getPrefetchedData<
                      ProjectEntity,
                      $ProjectTable,
                      TransactionCountDetailEntity
                    >(
                      currentTable: table,
                      referencedTable: $$ProjectTableReferences
                          ._transactionCountDetailRefsTable(db),
                      managerFromTypedResult: (p0) => $$ProjectTableReferences(
                        db,
                        table,
                        p0,
                      ).transactionCountDetailRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.projectId == item.id),
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
      _$LedgerDatabase,
      $ProjectTable,
      ProjectEntity,
      $$ProjectTableFilterComposer,
      $$ProjectTableOrderingComposer,
      $$ProjectTableAnnotationComposer,
      $$ProjectTableCreateCompanionBuilder,
      $$ProjectTableUpdateCompanionBuilder,
      (ProjectEntity, $$ProjectTableReferences),
      ProjectEntity,
      PrefetchHooks Function({bool transactionCountDetailRefs})
    >;
typedef $$CategoryTableCreateCompanionBuilder =
    CategoryCompanion Function({
      Value<int> id,
      required String name,
      required CategoryType type,
      Value<String?> icon,
      Value<bool> undeletable,
      Value<int?> parentId,
      Value<int> weight,
    });
typedef $$CategoryTableUpdateCompanionBuilder =
    CategoryCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<CategoryType> type,
      Value<String?> icon,
      Value<bool> undeletable,
      Value<int?> parentId,
      Value<int> weight,
    });

final class $$CategoryTableReferences
    extends BaseReferences<_$LedgerDatabase, $CategoryTable, CategoryEntity> {
  $$CategoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoryTable _parentIdTable(_$LedgerDatabase db) => db.category
      .createAlias($_aliasNameGenerator(db.category.parentId, db.category.id));

  $$CategoryTableProcessedTableManager? get parentId {
    final $_column = $_itemColumn<int>('parent_id');
    if ($_column == null) return null;
    final manager = $$CategoryTableTableManager(
      $_db,
      $_db.category,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $TransactionCountDetailTable,
    List<TransactionCountDetailEntity>
  >
  _transactionCountDetailRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionCountDetail,
        aliasName: $_aliasNameGenerator(
          db.category.id,
          db.transactionCountDetail.categoryId,
        ),
      );

  $$TransactionCountDetailTableProcessedTableManager
  get transactionCountDetailRefs {
    final manager = $$TransactionCountDetailTableTableManager(
      $_db,
      $_db.transactionCountDetail,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionCountDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoryTableFilterComposer
    extends Composer<_$LedgerDatabase, $CategoryTable> {
  $$CategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnFilters<bool> get undeletable => $composableBuilder(
    column: $table.undeletable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoryTableFilterComposer get parentId {
    final $$CategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.id,
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

  Expression<bool> transactionCountDetailRefs(
    Expression<bool> Function($$TransactionCountDetailTableFilterComposer f) f,
  ) {
    final $$TransactionCountDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
    extends Composer<_$LedgerDatabase, $CategoryTable> {
  $$CategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnOrderings<bool> get undeletable => $composableBuilder(
    column: $table.undeletable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoryTableOrderingComposer get parentId {
    final $$CategoryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.id,
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
    extends Composer<_$LedgerDatabase, $CategoryTable> {
  $$CategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CategoryType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<bool> get undeletable => $composableBuilder(
    column: $table.undeletable,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  $$CategoryTableAnnotationComposer get parentId {
    final $$CategoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.id,
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

  Expression<T> transactionCountDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionCountDetailTableAnnotationComposer a) f,
  ) {
    final $$TransactionCountDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
          _$LedgerDatabase,
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
            bool transactionCountDetailRefs,
          })
        > {
  $$CategoryTableTableManager(_$LedgerDatabase db, $CategoryTable table)
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
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<CategoryType> type = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<bool> undeletable = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<int> weight = const Value.absent(),
              }) => CategoryCompanion(
                id: id,
                name: name,
                type: type,
                icon: icon,
                undeletable: undeletable,
                parentId: parentId,
                weight: weight,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required CategoryType type,
                Value<String?> icon = const Value.absent(),
                Value<bool> undeletable = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<int> weight = const Value.absent(),
              }) => CategoryCompanion.insert(
                id: id,
                name: name,
                type: type,
                icon: icon,
                undeletable: undeletable,
                parentId: parentId,
                weight: weight,
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
              ({parentId = false, transactionCountDetailRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionCountDetailRefs) db.transactionCountDetail,
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
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionCountDetailRefs)
                        await $_getPrefetchedData<
                          CategoryEntity,
                          $CategoryTable,
                          TransactionCountDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CategoryTableReferences
                              ._transactionCountDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoryTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionCountDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.id,
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
      _$LedgerDatabase,
      $CategoryTable,
      CategoryEntity,
      $$CategoryTableFilterComposer,
      $$CategoryTableOrderingComposer,
      $$CategoryTableAnnotationComposer,
      $$CategoryTableCreateCompanionBuilder,
      $$CategoryTableUpdateCompanionBuilder,
      (CategoryEntity, $$CategoryTableReferences),
      CategoryEntity,
      PrefetchHooks Function({bool parentId, bool transactionCountDetailRefs})
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      Value<int> id,
      required TransactionType type,
      Value<bool> visible,
      Value<String?> note,
      required int timestamp,
      required int createdAt,
      required int updatedAt,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<int> id,
      Value<TransactionType> type,
      Value<bool> visible,
      Value<String?> note,
      Value<int> timestamp,
      Value<int> createdAt,
      Value<int> updatedAt,
    });

final class $$TransactionsTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $TransactionsTable,
          TransactionEntity
        > {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionMetaTable, List<TransactionMetaEntity>>
  _transactionMetaRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionMeta,
        aliasName: $_aliasNameGenerator(
          db.transactions.id,
          db.transactionMeta.transactionId,
        ),
      );

  $$TransactionMetaTableProcessedTableManager get transactionMetaRefs {
    final manager = $$TransactionMetaTableTableManager(
      $_db,
      $_db.transactionMeta,
    ).filter((f) => f.transactionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionMetaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionAmountDetailTable,
    List<TransactionAmountDetailEntity>
  >
  _transactionAmountDetailRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionAmountDetail,
        aliasName: $_aliasNameGenerator(
          db.transactions.id,
          db.transactionAmountDetail.transactionId,
        ),
      );

  $$TransactionAmountDetailTableProcessedTableManager
  get transactionAmountDetailRefs {
    final manager = $$TransactionAmountDetailTableTableManager(
      $_db,
      $_db.transactionAmountDetail,
    ).filter((f) => f.transactionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionAmountDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionCountDetailTable,
    List<TransactionCountDetailEntity>
  >
  _transactionCountDetailRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionCountDetail,
        aliasName: $_aliasNameGenerator(
          db.transactions.id,
          db.transactionCountDetail.transactionId,
        ),
      );

  $$TransactionCountDetailTableProcessedTableManager
  get transactionCountDetailRefs {
    final manager = $$TransactionCountDetailTableTableManager(
      $_db,
      $_db.transactionCountDetail,
    ).filter((f) => f.transactionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionCountDetailRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TransactionReduceTable,
    List<TransactionReduceEntity>
  >
  _transactionReduceRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionReduce,
        aliasName: $_aliasNameGenerator(
          db.transactions.id,
          db.transactionReduce.transactionId,
        ),
      );

  $$TransactionReduceTableProcessedTableManager get transactionReduceRefs {
    final manager = $$TransactionReduceTableTableManager(
      $_db,
      $_db.transactionReduce,
    ).filter((f) => f.transactionId.id.sqlEquals($_itemColumn<int>('id')!));

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
  _transactionRefundRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionRefund,
        aliasName: $_aliasNameGenerator(
          db.transactions.id,
          db.transactionRefund.transactionId,
        ),
      );

  $$TransactionRefundTableProcessedTableManager get transactionRefundRefs {
    final manager = $$TransactionRefundTableTableManager(
      $_db,
      $_db.transactionRefund,
    ).filter((f) => f.transactionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionRefundRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$LedgerDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TransactionType, TransactionType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get visible => $composableBuilder(
    column: $table.visible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
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

  Expression<bool> transactionMetaRefs(
    Expression<bool> Function($$TransactionMetaTableFilterComposer f) f,
  ) {
    final $$TransactionMetaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactionMeta,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionMetaTableFilterComposer(
            $db: $db,
            $table: $db.transactionMeta,
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
          getCurrentColumn: (t) => t.id,
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

  Expression<bool> transactionCountDetailRefs(
    Expression<bool> Function($$TransactionCountDetailTableFilterComposer f) f,
  ) {
    final $$TransactionCountDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
      getCurrentColumn: (t) => t.id,
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
      getCurrentColumn: (t) => t.id,
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
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$LedgerDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get visible => $composableBuilder(
    column: $table.visible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
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
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TransactionType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get visible =>
      $composableBuilder(column: $table.visible, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> transactionMetaRefs<T extends Object>(
    Expression<T> Function($$TransactionMetaTableAnnotationComposer a) f,
  ) {
    final $$TransactionMetaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactionMeta,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionMetaTableAnnotationComposer(
            $db: $db,
            $table: $db.transactionMeta,
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
          getCurrentColumn: (t) => t.id,
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

  Expression<T> transactionCountDetailRefs<T extends Object>(
    Expression<T> Function($$TransactionCountDetailTableAnnotationComposer a) f,
  ) {
    final $$TransactionCountDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
          getCurrentColumn: (t) => t.id,
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
          getCurrentColumn: (t) => t.id,
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
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
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
            bool transactionMetaRefs,
            bool transactionAmountDetailRefs,
            bool transactionCountDetailRefs,
            bool transactionReduceRefs,
            bool transactionRefundRefs,
          })
        > {
  $$TransactionsTableTableManager(_$LedgerDatabase db, $TransactionsTable table)
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
                Value<int> id = const Value.absent(),
                Value<TransactionType> type = const Value.absent(),
                Value<bool> visible = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                type: type,
                visible: visible,
                note: note,
                timestamp: timestamp,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required TransactionType type,
                Value<bool> visible = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required int timestamp,
                required int createdAt,
                required int updatedAt,
              }) => TransactionsCompanion.insert(
                id: id,
                type: type,
                visible: visible,
                note: note,
                timestamp: timestamp,
                createdAt: createdAt,
                updatedAt: updatedAt,
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
                transactionMetaRefs = false,
                transactionAmountDetailRefs = false,
                transactionCountDetailRefs = false,
                transactionReduceRefs = false,
                transactionRefundRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionMetaRefs) db.transactionMeta,
                    if (transactionAmountDetailRefs) db.transactionAmountDetail,
                    if (transactionCountDetailRefs) db.transactionCountDetail,
                    if (transactionReduceRefs) db.transactionReduce,
                    if (transactionRefundRefs) db.transactionRefund,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionMetaRefs)
                        await $_getPrefetchedData<
                          TransactionEntity,
                          $TransactionsTable,
                          TransactionMetaEntity
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._transactionMetaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionMetaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.id,
                              ),
                          typedResults: items,
                        ),
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
                                (e) => e.transactionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (transactionCountDetailRefs)
                        await $_getPrefetchedData<
                          TransactionEntity,
                          $TransactionsTable,
                          TransactionCountDetailEntity
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._transactionCountDetailRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionCountDetailRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.id,
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
                                (e) => e.transactionId == item.id,
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
                                (e) => e.transactionId == item.id,
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
      _$LedgerDatabase,
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
        bool transactionMetaRefs,
        bool transactionAmountDetailRefs,
        bool transactionCountDetailRefs,
        bool transactionReduceRefs,
        bool transactionRefundRefs,
      })
    >;
typedef $$TransactionMetaTableCreateCompanionBuilder =
    TransactionMetaCompanion Function({
      required int transactionId,
      required TransactionMetaScope scope,
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$TransactionMetaTableUpdateCompanionBuilder =
    TransactionMetaCompanion Function({
      Value<int> transactionId,
      Value<TransactionMetaScope> scope,
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

final class $$TransactionMetaTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $TransactionMetaTable,
          TransactionMetaEntity
        > {
  $$TransactionMetaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$LedgerDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionMeta.transactionId,
          db.transactions.id,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionMetaTableFilterComposer
    extends Composer<_$LedgerDatabase, $TransactionMetaTable> {
  $$TransactionMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<
    TransactionMetaScope,
    TransactionMetaScope,
    String
  >
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

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

class $$TransactionMetaTableOrderingComposer
    extends Composer<_$LedgerDatabase, $TransactionMetaTable> {
  $$TransactionMetaTableOrderingComposer({
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

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

class $$TransactionMetaTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $TransactionMetaTable> {
  $$TransactionMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<TransactionMetaScope, String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

class $$TransactionMetaTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $TransactionMetaTable,
          TransactionMetaEntity,
          $$TransactionMetaTableFilterComposer,
          $$TransactionMetaTableOrderingComposer,
          $$TransactionMetaTableAnnotationComposer,
          $$TransactionMetaTableCreateCompanionBuilder,
          $$TransactionMetaTableUpdateCompanionBuilder,
          (TransactionMetaEntity, $$TransactionMetaTableReferences),
          TransactionMetaEntity,
          PrefetchHooks Function({bool transactionId})
        > {
  $$TransactionMetaTableTableManager(
    _$LedgerDatabase db,
    $TransactionMetaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> transactionId = const Value.absent(),
                Value<TransactionMetaScope> scope = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionMetaCompanion(
                transactionId: transactionId,
                scope: scope,
                key: key,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int transactionId,
                required TransactionMetaScope scope,
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => TransactionMetaCompanion.insert(
                transactionId: transactionId,
                scope: scope,
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionMetaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transactionId = false}) {
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
                                    $$TransactionMetaTableReferences
                                        ._transactionIdTable(db),
                                referencedColumn:
                                    $$TransactionMetaTableReferences
                                        ._transactionIdTable(db)
                                        .id,
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

typedef $$TransactionMetaTableProcessedTableManager =
    ProcessedTableManager<
      _$LedgerDatabase,
      $TransactionMetaTable,
      TransactionMetaEntity,
      $$TransactionMetaTableFilterComposer,
      $$TransactionMetaTableOrderingComposer,
      $$TransactionMetaTableAnnotationComposer,
      $$TransactionMetaTableCreateCompanionBuilder,
      $$TransactionMetaTableUpdateCompanionBuilder,
      (TransactionMetaEntity, $$TransactionMetaTableReferences),
      TransactionMetaEntity,
      PrefetchHooks Function({bool transactionId})
    >;
typedef $$TransactionAmountDetailTableCreateCompanionBuilder =
    TransactionAmountDetailCompanion Function({
      Value<int> id,
      required int transactionId,
      required int accountId,
      required AmountChangeType type,
      required String currencyCode,
      required int occurAmount,
      required int localAmount,
      required int timestamp,
    });
typedef $$TransactionAmountDetailTableUpdateCompanionBuilder =
    TransactionAmountDetailCompanion Function({
      Value<int> id,
      Value<int> transactionId,
      Value<int> accountId,
      Value<AmountChangeType> type,
      Value<String> currencyCode,
      Value<int> occurAmount,
      Value<int> localAmount,
      Value<int> timestamp,
    });

final class $$TransactionAmountDetailTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $TransactionAmountDetailTable,
          TransactionAmountDetailEntity
        > {
  $$TransactionAmountDetailTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$LedgerDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionAmountDetail.transactionId,
          db.transactions.id,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountTable _accountIdTable(_$LedgerDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(
          db.transactionAmountDetail.accountId,
          db.account.id,
        ),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CurrencyTable _currencyCodeTable(_$LedgerDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(
          db.transactionAmountDetail.currencyCode,
          db.currency.code,
        ),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.code.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionAmountDetailTableFilterComposer
    extends Composer<_$LedgerDatabase, $TransactionAmountDetailTable> {
  $$TransactionAmountDetailTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AmountChangeType, AmountChangeType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get occurAmount => $composableBuilder(
    column: $table.occurAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get localAmount => $composableBuilder(
    column: $table.localAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.code,
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
    extends Composer<_$LedgerDatabase, $TransactionAmountDetailTable> {
  $$TransactionAmountDetailTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occurAmount => $composableBuilder(
    column: $table.occurAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get localAmount => $composableBuilder(
    column: $table.localAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.code,
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
    extends Composer<_$LedgerDatabase, $TransactionAmountDetailTable> {
  $$TransactionAmountDetailTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AmountChangeType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get occurAmount => $composableBuilder(
    column: $table.occurAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get localAmount => $composableBuilder(
    column: $table.localAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.code,
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
          _$LedgerDatabase,
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
    _$LedgerDatabase db,
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
                Value<int> id = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<AmountChangeType> type = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int> occurAmount = const Value.absent(),
                Value<int> localAmount = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
              }) => TransactionAmountDetailCompanion(
                id: id,
                transactionId: transactionId,
                accountId: accountId,
                type: type,
                currencyCode: currencyCode,
                occurAmount: occurAmount,
                localAmount: localAmount,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int transactionId,
                required int accountId,
                required AmountChangeType type,
                required String currencyCode,
                required int occurAmount,
                required int localAmount,
                required int timestamp,
              }) => TransactionAmountDetailCompanion.insert(
                id: id,
                transactionId: transactionId,
                accountId: accountId,
                type: type,
                currencyCode: currencyCode,
                occurAmount: occurAmount,
                localAmount: localAmount,
                timestamp: timestamp,
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
                                            .id,
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
                                            .id,
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
                                            .code,
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
      _$LedgerDatabase,
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
typedef $$TransactionCountDetailTableCreateCompanionBuilder =
    TransactionCountDetailCompanion Function({
      Value<int> id,
      required int transactionId,
      required int categoryId,
      Value<int?> stakeholderId,
      Value<int?> projectId,
      required int amount,
    });
typedef $$TransactionCountDetailTableUpdateCompanionBuilder =
    TransactionCountDetailCompanion Function({
      Value<int> id,
      Value<int> transactionId,
      Value<int> categoryId,
      Value<int?> stakeholderId,
      Value<int?> projectId,
      Value<int> amount,
    });

final class $$TransactionCountDetailTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $TransactionCountDetailTable,
          TransactionCountDetailEntity
        > {
  $$TransactionCountDetailTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$LedgerDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionCountDetail.transactionId,
          db.transactions.id,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoryTable _categoryIdTable(_$LedgerDatabase db) =>
      db.category.createAlias(
        $_aliasNameGenerator(
          db.transactionCountDetail.categoryId,
          db.category.id,
        ),
      );

  $$CategoryTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoryTableTableManager(
      $_db,
      $_db.category,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StakeholderTable _stakeholderIdTable(_$LedgerDatabase db) =>
      db.stakeholder.createAlias(
        $_aliasNameGenerator(
          db.transactionCountDetail.stakeholderId,
          db.stakeholder.id,
        ),
      );

  $$StakeholderTableProcessedTableManager? get stakeholderId {
    final $_column = $_itemColumn<int>('stakeholder_id');
    if ($_column == null) return null;
    final manager = $$StakeholderTableTableManager(
      $_db,
      $_db.stakeholder,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stakeholderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProjectTable _projectIdTable(_$LedgerDatabase db) =>
      db.project.createAlias(
        $_aliasNameGenerator(
          db.transactionCountDetail.projectId,
          db.project.id,
        ),
      );

  $$ProjectTableProcessedTableManager? get projectId {
    final $_column = $_itemColumn<int>('project_id');
    if ($_column == null) return null;
    final manager = $$ProjectTableTableManager(
      $_db,
      $_db.project,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ReimbursementExpectationTable,
    List<ReimbursementExpectationEntity>
  >
  _reimbursementExpectationRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reimbursementExpectation,
        aliasName: $_aliasNameGenerator(
          db.transactionCountDetail.id,
          db.reimbursementExpectation.transactionCountDetailId,
        ),
      );

  $$ReimbursementExpectationTableProcessedTableManager
  get reimbursementExpectationRefs {
    final manager =
        $$ReimbursementExpectationTableTableManager(
          $_db,
          $_db.reimbursementExpectation,
        ).filter(
          (f) =>
              f.transactionCountDetailId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _reimbursementExpectationRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransactionCountDetailTableFilterComposer
    extends Composer<_$LedgerDatabase, $TransactionCountDetailTable> {
  $$TransactionCountDetailTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

  $$StakeholderTableFilterComposer get stakeholderId {
    final $$StakeholderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.id,
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

  $$ProjectTableFilterComposer get projectId {
    final $$ProjectTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.id,
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

  Expression<bool> reimbursementExpectationRefs(
    Expression<bool> Function($$ReimbursementExpectationTableFilterComposer f)
    f,
  ) {
    final $$ReimbursementExpectationTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.reimbursementExpectation,
          getReferencedColumn: (t) => t.transactionCountDetailId,
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

class $$TransactionCountDetailTableOrderingComposer
    extends Composer<_$LedgerDatabase, $TransactionCountDetailTable> {
  $$TransactionCountDetailTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

  $$StakeholderTableOrderingComposer get stakeholderId {
    final $$StakeholderTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.id,
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

  $$ProjectTableOrderingComposer get projectId {
    final $$ProjectTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.id,
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

class $$TransactionCountDetailTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $TransactionCountDetailTable> {
  $$TransactionCountDetailTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

  $$StakeholderTableAnnotationComposer get stakeholderId {
    final $$StakeholderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stakeholderId,
      referencedTable: $db.stakeholder,
      getReferencedColumn: (t) => t.id,
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

  $$ProjectTableAnnotationComposer get projectId {
    final $$ProjectTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.id,
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

  Expression<T> reimbursementExpectationRefs<T extends Object>(
    Expression<T> Function($$ReimbursementExpectationTableAnnotationComposer a)
    f,
  ) {
    final $$ReimbursementExpectationTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.reimbursementExpectation,
          getReferencedColumn: (t) => t.transactionCountDetailId,
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

class $$TransactionCountDetailTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $TransactionCountDetailTable,
          TransactionCountDetailEntity,
          $$TransactionCountDetailTableFilterComposer,
          $$TransactionCountDetailTableOrderingComposer,
          $$TransactionCountDetailTableAnnotationComposer,
          $$TransactionCountDetailTableCreateCompanionBuilder,
          $$TransactionCountDetailTableUpdateCompanionBuilder,
          (
            TransactionCountDetailEntity,
            $$TransactionCountDetailTableReferences,
          ),
          TransactionCountDetailEntity,
          PrefetchHooks Function({
            bool transactionId,
            bool categoryId,
            bool stakeholderId,
            bool projectId,
            bool reimbursementExpectationRefs,
          })
        > {
  $$TransactionCountDetailTableTableManager(
    _$LedgerDatabase db,
    $TransactionCountDetailTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionCountDetailTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$TransactionCountDetailTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TransactionCountDetailTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int?> stakeholderId = const Value.absent(),
                Value<int?> projectId = const Value.absent(),
                Value<int> amount = const Value.absent(),
              }) => TransactionCountDetailCompanion(
                id: id,
                transactionId: transactionId,
                categoryId: categoryId,
                stakeholderId: stakeholderId,
                projectId: projectId,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int transactionId,
                required int categoryId,
                Value<int?> stakeholderId = const Value.absent(),
                Value<int?> projectId = const Value.absent(),
                required int amount,
              }) => TransactionCountDetailCompanion.insert(
                id: id,
                transactionId: transactionId,
                categoryId: categoryId,
                stakeholderId: stakeholderId,
                projectId: projectId,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionCountDetailTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                transactionId = false,
                categoryId = false,
                stakeholderId = false,
                projectId = false,
                reimbursementExpectationRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (reimbursementExpectationRefs)
                      db.reimbursementExpectation,
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
                                        $$TransactionCountDetailTableReferences
                                            ._transactionIdTable(db),
                                    referencedColumn:
                                        $$TransactionCountDetailTableReferences
                                            ._transactionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable:
                                        $$TransactionCountDetailTableReferences
                                            ._categoryIdTable(db),
                                    referencedColumn:
                                        $$TransactionCountDetailTableReferences
                                            ._categoryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (stakeholderId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.stakeholderId,
                                    referencedTable:
                                        $$TransactionCountDetailTableReferences
                                            ._stakeholderIdTable(db),
                                    referencedColumn:
                                        $$TransactionCountDetailTableReferences
                                            ._stakeholderIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (projectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.projectId,
                                    referencedTable:
                                        $$TransactionCountDetailTableReferences
                                            ._projectIdTable(db),
                                    referencedColumn:
                                        $$TransactionCountDetailTableReferences
                                            ._projectIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (reimbursementExpectationRefs)
                        await $_getPrefetchedData<
                          TransactionCountDetailEntity,
                          $TransactionCountDetailTable,
                          ReimbursementExpectationEntity
                        >(
                          currentTable: table,
                          referencedTable:
                              $$TransactionCountDetailTableReferences
                                  ._reimbursementExpectationRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionCountDetailTableReferences(
                                db,
                                table,
                                p0,
                              ).reimbursementExpectationRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionCountDetailId == item.id,
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

typedef $$TransactionCountDetailTableProcessedTableManager =
    ProcessedTableManager<
      _$LedgerDatabase,
      $TransactionCountDetailTable,
      TransactionCountDetailEntity,
      $$TransactionCountDetailTableFilterComposer,
      $$TransactionCountDetailTableOrderingComposer,
      $$TransactionCountDetailTableAnnotationComposer,
      $$TransactionCountDetailTableCreateCompanionBuilder,
      $$TransactionCountDetailTableUpdateCompanionBuilder,
      (TransactionCountDetailEntity, $$TransactionCountDetailTableReferences),
      TransactionCountDetailEntity,
      PrefetchHooks Function({
        bool transactionId,
        bool categoryId,
        bool stakeholderId,
        bool projectId,
        bool reimbursementExpectationRefs,
      })
    >;
typedef $$TransactionReduceTableCreateCompanionBuilder =
    TransactionReduceCompanion Function({
      Value<int> id,
      required int transactionId,
      required String currencyCode,
      required CategoryType type,
      required int amount,
      Value<String?> description,
    });
typedef $$TransactionReduceTableUpdateCompanionBuilder =
    TransactionReduceCompanion Function({
      Value<int> id,
      Value<int> transactionId,
      Value<String> currencyCode,
      Value<CategoryType> type,
      Value<int> amount,
      Value<String?> description,
    });

final class $$TransactionReduceTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $TransactionReduceTable,
          TransactionReduceEntity
        > {
  $$TransactionReduceTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$LedgerDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionReduce.transactionId,
          db.transactions.id,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CurrencyTable _currencyCodeTable(_$LedgerDatabase db) =>
      db.currency.createAlias(
        $_aliasNameGenerator(
          db.transactionReduce.currencyCode,
          db.currency.code,
        ),
      );

  $$CurrencyTableProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $$CurrencyTableTableManager(
      $_db,
      $_db.currency,
    ).filter((f) => f.code.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionReduceTableFilterComposer
    extends Composer<_$LedgerDatabase, $TransactionReduceTable> {
  $$TransactionReduceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CategoryType, CategoryType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

  $$CurrencyTableFilterComposer get currencyCode {
    final $$CurrencyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.code,
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
    extends Composer<_$LedgerDatabase, $TransactionReduceTable> {
  $$TransactionReduceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

  $$CurrencyTableOrderingComposer get currencyCode {
    final $$CurrencyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.code,
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
    extends Composer<_$LedgerDatabase, $TransactionReduceTable> {
  $$TransactionReduceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CategoryType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

  $$CurrencyTableAnnotationComposer get currencyCode {
    final $$CurrencyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyCode,
      referencedTable: $db.currency,
      getReferencedColumn: (t) => t.code,
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
          _$LedgerDatabase,
          $TransactionReduceTable,
          TransactionReduceEntity,
          $$TransactionReduceTableFilterComposer,
          $$TransactionReduceTableOrderingComposer,
          $$TransactionReduceTableAnnotationComposer,
          $$TransactionReduceTableCreateCompanionBuilder,
          $$TransactionReduceTableUpdateCompanionBuilder,
          (TransactionReduceEntity, $$TransactionReduceTableReferences),
          TransactionReduceEntity,
          PrefetchHooks Function({bool transactionId, bool currencyCode})
        > {
  $$TransactionReduceTableTableManager(
    _$LedgerDatabase db,
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
                Value<int> id = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<CategoryType> type = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => TransactionReduceCompanion(
                id: id,
                transactionId: transactionId,
                currencyCode: currencyCode,
                type: type,
                amount: amount,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int transactionId,
                required String currencyCode,
                required CategoryType type,
                required int amount,
                Value<String?> description = const Value.absent(),
              }) => TransactionReduceCompanion.insert(
                id: id,
                transactionId: transactionId,
                currencyCode: currencyCode,
                type: type,
                amount: amount,
                description: description,
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
              ({transactionId = false, currencyCode = false}) {
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
                                            .id,
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
                                            .code,
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
      _$LedgerDatabase,
      $TransactionReduceTable,
      TransactionReduceEntity,
      $$TransactionReduceTableFilterComposer,
      $$TransactionReduceTableOrderingComposer,
      $$TransactionReduceTableAnnotationComposer,
      $$TransactionReduceTableCreateCompanionBuilder,
      $$TransactionReduceTableUpdateCompanionBuilder,
      (TransactionReduceEntity, $$TransactionReduceTableReferences),
      TransactionReduceEntity,
      PrefetchHooks Function({bool transactionId, bool currencyCode})
    >;
typedef $$TransactionRefundTableCreateCompanionBuilder =
    TransactionRefundCompanion Function({
      Value<int> id,
      required int transactionId,
      required int amount,
      required int timestamp,
      Value<String?> description,
    });
typedef $$TransactionRefundTableUpdateCompanionBuilder =
    TransactionRefundCompanion Function({
      Value<int> id,
      Value<int> transactionId,
      Value<int> amount,
      Value<int> timestamp,
      Value<String?> description,
    });

final class $$TransactionRefundTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $TransactionRefundTable,
          TransactionRefundEntity
        > {
  $$TransactionRefundTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$LedgerDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionRefund.transactionId,
          db.transactions.id,
        ),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionRefundTableFilterComposer
    extends Composer<_$LedgerDatabase, $TransactionRefundTable> {
  $$TransactionRefundTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

class $$TransactionRefundTableOrderingComposer
    extends Composer<_$LedgerDatabase, $TransactionRefundTable> {
  $$TransactionRefundTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

class $$TransactionRefundTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $TransactionRefundTable> {
  $$TransactionRefundTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

class $$TransactionRefundTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $TransactionRefundTable,
          TransactionRefundEntity,
          $$TransactionRefundTableFilterComposer,
          $$TransactionRefundTableOrderingComposer,
          $$TransactionRefundTableAnnotationComposer,
          $$TransactionRefundTableCreateCompanionBuilder,
          $$TransactionRefundTableUpdateCompanionBuilder,
          (TransactionRefundEntity, $$TransactionRefundTableReferences),
          TransactionRefundEntity,
          PrefetchHooks Function({bool transactionId})
        > {
  $$TransactionRefundTableTableManager(
    _$LedgerDatabase db,
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
                Value<int> id = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => TransactionRefundCompanion(
                id: id,
                transactionId: transactionId,
                amount: amount,
                timestamp: timestamp,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int transactionId,
                required int amount,
                required int timestamp,
                Value<String?> description = const Value.absent(),
              }) => TransactionRefundCompanion.insert(
                id: id,
                transactionId: transactionId,
                amount: amount,
                timestamp: timestamp,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionRefundTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transactionId = false}) {
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
                                        .id,
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
      _$LedgerDatabase,
      $TransactionRefundTable,
      TransactionRefundEntity,
      $$TransactionRefundTableFilterComposer,
      $$TransactionRefundTableOrderingComposer,
      $$TransactionRefundTableAnnotationComposer,
      $$TransactionRefundTableCreateCompanionBuilder,
      $$TransactionRefundTableUpdateCompanionBuilder,
      (TransactionRefundEntity, $$TransactionRefundTableReferences),
      TransactionRefundEntity,
      PrefetchHooks Function({bool transactionId})
    >;
typedef $$TransactionRelationTableCreateCompanionBuilder =
    TransactionRelationCompanion Function({
      required int sourceTransactionId,
      required int targetTransactionId,
      required TransactionRelationType type,
      Value<int> rowid,
    });
typedef $$TransactionRelationTableUpdateCompanionBuilder =
    TransactionRelationCompanion Function({
      Value<int> sourceTransactionId,
      Value<int> targetTransactionId,
      Value<TransactionRelationType> type,
      Value<int> rowid,
    });

final class $$TransactionRelationTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $TransactionRelationTable,
          TransactionRelationEntity
        > {
  $$TransactionRelationTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _sourceTransactionIdTable(_$LedgerDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionRelation.sourceTransactionId,
          db.transactions.id,
        ),
      );

  $$TransactionsTableProcessedTableManager get sourceTransactionId {
    final $_column = $_itemColumn<int>('source_transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceTransactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionsTable _targetTransactionIdTable(_$LedgerDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(
          db.transactionRelation.targetTransactionId,
          db.transactions.id,
        ),
      );

  $$TransactionsTableProcessedTableManager get targetTransactionId {
    final $_column = $_itemColumn<int>('target_transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_targetTransactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionRelationTableFilterComposer
    extends Composer<_$LedgerDatabase, $TransactionRelationTable> {
  $$TransactionRelationTableFilterComposer({
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

  $$TransactionsTableFilterComposer get sourceTransactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

  $$TransactionsTableFilterComposer get targetTransactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

class $$TransactionRelationTableOrderingComposer
    extends Composer<_$LedgerDatabase, $TransactionRelationTable> {
  $$TransactionRelationTableOrderingComposer({
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

  $$TransactionsTableOrderingComposer get sourceTransactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

  $$TransactionsTableOrderingComposer get targetTransactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

class $$TransactionRelationTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $TransactionRelationTable> {
  $$TransactionRelationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<TransactionRelationType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get sourceTransactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

  $$TransactionsTableAnnotationComposer get targetTransactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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

class $$TransactionRelationTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $TransactionRelationTable,
          TransactionRelationEntity,
          $$TransactionRelationTableFilterComposer,
          $$TransactionRelationTableOrderingComposer,
          $$TransactionRelationTableAnnotationComposer,
          $$TransactionRelationTableCreateCompanionBuilder,
          $$TransactionRelationTableUpdateCompanionBuilder,
          (TransactionRelationEntity, $$TransactionRelationTableReferences),
          TransactionRelationEntity,
          PrefetchHooks Function({
            bool sourceTransactionId,
            bool targetTransactionId,
          })
        > {
  $$TransactionRelationTableTableManager(
    _$LedgerDatabase db,
    $TransactionRelationTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionRelationTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionRelationTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TransactionRelationTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> sourceTransactionId = const Value.absent(),
                Value<int> targetTransactionId = const Value.absent(),
                Value<TransactionRelationType> type = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionRelationCompanion(
                sourceTransactionId: sourceTransactionId,
                targetTransactionId: targetTransactionId,
                type: type,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int sourceTransactionId,
                required int targetTransactionId,
                required TransactionRelationType type,
                Value<int> rowid = const Value.absent(),
              }) => TransactionRelationCompanion.insert(
                sourceTransactionId: sourceTransactionId,
                targetTransactionId: targetTransactionId,
                type: type,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionRelationTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({sourceTransactionId = false, targetTransactionId = false}) {
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
                        if (sourceTransactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceTransactionId,
                                    referencedTable:
                                        $$TransactionRelationTableReferences
                                            ._sourceTransactionIdTable(db),
                                    referencedColumn:
                                        $$TransactionRelationTableReferences
                                            ._sourceTransactionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (targetTransactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.targetTransactionId,
                                    referencedTable:
                                        $$TransactionRelationTableReferences
                                            ._targetTransactionIdTable(db),
                                    referencedColumn:
                                        $$TransactionRelationTableReferences
                                            ._targetTransactionIdTable(db)
                                            .id,
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

typedef $$TransactionRelationTableProcessedTableManager =
    ProcessedTableManager<
      _$LedgerDatabase,
      $TransactionRelationTable,
      TransactionRelationEntity,
      $$TransactionRelationTableFilterComposer,
      $$TransactionRelationTableOrderingComposer,
      $$TransactionRelationTableAnnotationComposer,
      $$TransactionRelationTableCreateCompanionBuilder,
      $$TransactionRelationTableUpdateCompanionBuilder,
      (TransactionRelationEntity, $$TransactionRelationTableReferences),
      TransactionRelationEntity,
      PrefetchHooks Function({
        bool sourceTransactionId,
        bool targetTransactionId,
      })
    >;
typedef $$ReimbursementTableCreateCompanionBuilder =
    ReimbursementCompanion Function({
      Value<int> id,
      required String summary,
      Value<bool> status,
      required int createdAt,
      required int updatedAt,
    });
typedef $$ReimbursementTableUpdateCompanionBuilder =
    ReimbursementCompanion Function({
      Value<int> id,
      Value<String> summary,
      Value<bool> status,
      Value<int> createdAt,
      Value<int> updatedAt,
    });

final class $$ReimbursementTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $ReimbursementTable,
          ReimbursementEntity
        > {
  $$ReimbursementTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $ReimbursementExpectationTable,
    List<ReimbursementExpectationEntity>
  >
  _reimbursementExpectationRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reimbursementExpectation,
        aliasName: $_aliasNameGenerator(
          db.reimbursement.id,
          db.reimbursementExpectation.reimbursementId,
        ),
      );

  $$ReimbursementExpectationTableProcessedTableManager
  get reimbursementExpectationRefs {
    final manager = $$ReimbursementExpectationTableTableManager(
      $_db,
      $_db.reimbursementExpectation,
    ).filter((f) => f.reimbursementId.id.sqlEquals($_itemColumn<int>('id')!));

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
  _reimbursementActualRefsTable(_$LedgerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reimbursementActual,
        aliasName: $_aliasNameGenerator(
          db.reimbursement.id,
          db.reimbursementActual.reimbursementId,
        ),
      );

  $$ReimbursementActualTableProcessedTableManager get reimbursementActualRefs {
    final manager = $$ReimbursementActualTableTableManager(
      $_db,
      $_db.reimbursementActual,
    ).filter((f) => f.reimbursementId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _reimbursementActualRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ReimbursementTableFilterComposer
    extends Composer<_$LedgerDatabase, $ReimbursementTable> {
  $$ReimbursementTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get status => $composableBuilder(
    column: $table.status,
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

  Expression<bool> reimbursementExpectationRefs(
    Expression<bool> Function($$ReimbursementExpectationTableFilterComposer f)
    f,
  ) {
    final $$ReimbursementExpectationTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
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
      getCurrentColumn: (t) => t.id,
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
    extends Composer<_$LedgerDatabase, $ReimbursementTable> {
  $$ReimbursementTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get status => $composableBuilder(
    column: $table.status,
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
}

class $$ReimbursementTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $ReimbursementTable> {
  $$ReimbursementTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<bool> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> reimbursementExpectationRefs<T extends Object>(
    Expression<T> Function($$ReimbursementExpectationTableAnnotationComposer a)
    f,
  ) {
    final $$ReimbursementExpectationTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
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
          getCurrentColumn: (t) => t.id,
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
          _$LedgerDatabase,
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
            bool reimbursementExpectationRefs,
            bool reimbursementActualRefs,
          })
        > {
  $$ReimbursementTableTableManager(
    _$LedgerDatabase db,
    $ReimbursementTable table,
  ) : super(
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
                Value<int> id = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<bool> status = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => ReimbursementCompanion(
                id: id,
                summary: summary,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String summary,
                Value<bool> status = const Value.absent(),
                required int createdAt,
                required int updatedAt,
              }) => ReimbursementCompanion.insert(
                id: id,
                summary: summary,
                status: status,
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
                  addJoins: null,
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
                                (e) => e.reimbursementId == item.id,
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
                                (e) => e.reimbursementId == item.id,
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
      _$LedgerDatabase,
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
        bool reimbursementExpectationRefs,
        bool reimbursementActualRefs,
      })
    >;
typedef $$ReimbursementExpectationTableCreateCompanionBuilder =
    ReimbursementExpectationCompanion Function({
      Value<int> id,
      required int reimbursementId,
      required int transactionCountDetailId,
      required int amount,
      Value<String?> description,
    });
typedef $$ReimbursementExpectationTableUpdateCompanionBuilder =
    ReimbursementExpectationCompanion Function({
      Value<int> id,
      Value<int> reimbursementId,
      Value<int> transactionCountDetailId,
      Value<int> amount,
      Value<String?> description,
    });

final class $$ReimbursementExpectationTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $ReimbursementExpectationTable,
          ReimbursementExpectationEntity
        > {
  $$ReimbursementExpectationTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ReimbursementTable _reimbursementIdTable(_$LedgerDatabase db) =>
      db.reimbursement.createAlias(
        $_aliasNameGenerator(
          db.reimbursementExpectation.reimbursementId,
          db.reimbursement.id,
        ),
      );

  $$ReimbursementTableProcessedTableManager get reimbursementId {
    final $_column = $_itemColumn<int>('reimbursement_id')!;

    final manager = $$ReimbursementTableTableManager(
      $_db,
      $_db.reimbursement,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reimbursementIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionCountDetailTable _transactionCountDetailIdTable(
    _$LedgerDatabase db,
  ) => db.transactionCountDetail.createAlias(
    $_aliasNameGenerator(
      db.reimbursementExpectation.transactionCountDetailId,
      db.transactionCountDetail.id,
    ),
  );

  $$TransactionCountDetailTableProcessedTableManager
  get transactionCountDetailId {
    final $_column = $_itemColumn<int>('transaction_count_detail_id')!;

    final manager = $$TransactionCountDetailTableTableManager(
      $_db,
      $_db.transactionCountDetail,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _transactionCountDetailIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReimbursementExpectationTableFilterComposer
    extends Composer<_$LedgerDatabase, $ReimbursementExpectationTable> {
  $$ReimbursementExpectationTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$ReimbursementTableFilterComposer get reimbursementId {
    final $$ReimbursementTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.id,
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

  $$TransactionCountDetailTableFilterComposer get transactionCountDetailId {
    final $$TransactionCountDetailTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionCountDetailId,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableFilterComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
    extends Composer<_$LedgerDatabase, $ReimbursementExpectationTable> {
  $$ReimbursementExpectationTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$ReimbursementTableOrderingComposer get reimbursementId {
    final $$ReimbursementTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.id,
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

  $$TransactionCountDetailTableOrderingComposer get transactionCountDetailId {
    final $$TransactionCountDetailTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionCountDetailId,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableOrderingComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
    extends Composer<_$LedgerDatabase, $ReimbursementExpectationTable> {
  $$ReimbursementExpectationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$ReimbursementTableAnnotationComposer get reimbursementId {
    final $$ReimbursementTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.id,
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

  $$TransactionCountDetailTableAnnotationComposer get transactionCountDetailId {
    final $$TransactionCountDetailTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.transactionCountDetailId,
          referencedTable: $db.transactionCountDetail,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCountDetailTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionCountDetail,
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
          _$LedgerDatabase,
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
            bool transactionCountDetailId,
          })
        > {
  $$ReimbursementExpectationTableTableManager(
    _$LedgerDatabase db,
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
                Value<int> id = const Value.absent(),
                Value<int> reimbursementId = const Value.absent(),
                Value<int> transactionCountDetailId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => ReimbursementExpectationCompanion(
                id: id,
                reimbursementId: reimbursementId,
                transactionCountDetailId: transactionCountDetailId,
                amount: amount,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int reimbursementId,
                required int transactionCountDetailId,
                required int amount,
                Value<String?> description = const Value.absent(),
              }) => ReimbursementExpectationCompanion.insert(
                id: id,
                reimbursementId: reimbursementId,
                transactionCountDetailId: transactionCountDetailId,
                amount: amount,
                description: description,
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
              ({reimbursementId = false, transactionCountDetailId = false}) {
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
                                            .id,
                                  )
                                  as T;
                        }
                        if (transactionCountDetailId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn:
                                        table.transactionCountDetailId,
                                    referencedTable:
                                        $$ReimbursementExpectationTableReferences
                                            ._transactionCountDetailIdTable(db),
                                    referencedColumn:
                                        $$ReimbursementExpectationTableReferences
                                            ._transactionCountDetailIdTable(db)
                                            .id,
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
      _$LedgerDatabase,
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
        bool transactionCountDetailId,
      })
    >;
typedef $$ReimbursementActualTableCreateCompanionBuilder =
    ReimbursementActualCompanion Function({
      Value<int> id,
      required int reimbursementId,
      required int accountId,
      required int amount,
      required int timestamp,
      Value<String?> note,
    });
typedef $$ReimbursementActualTableUpdateCompanionBuilder =
    ReimbursementActualCompanion Function({
      Value<int> id,
      Value<int> reimbursementId,
      Value<int> accountId,
      Value<int> amount,
      Value<int> timestamp,
      Value<String?> note,
    });

final class $$ReimbursementActualTableReferences
    extends
        BaseReferences<
          _$LedgerDatabase,
          $ReimbursementActualTable,
          ReimbursementActualEntity
        > {
  $$ReimbursementActualTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ReimbursementTable _reimbursementIdTable(_$LedgerDatabase db) =>
      db.reimbursement.createAlias(
        $_aliasNameGenerator(
          db.reimbursementActual.reimbursementId,
          db.reimbursement.id,
        ),
      );

  $$ReimbursementTableProcessedTableManager get reimbursementId {
    final $_column = $_itemColumn<int>('reimbursement_id')!;

    final manager = $$ReimbursementTableTableManager(
      $_db,
      $_db.reimbursement,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reimbursementIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountTable _accountIdTable(_$LedgerDatabase db) =>
      db.account.createAlias(
        $_aliasNameGenerator(db.reimbursementActual.accountId, db.account.id),
      );

  $$AccountTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableManager(
      $_db,
      $_db.account,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReimbursementActualTableFilterComposer
    extends Composer<_$LedgerDatabase, $ReimbursementActualTable> {
  $$ReimbursementActualTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$ReimbursementTableFilterComposer get reimbursementId {
    final $$ReimbursementTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

class $$ReimbursementActualTableOrderingComposer
    extends Composer<_$LedgerDatabase, $ReimbursementActualTable> {
  $$ReimbursementActualTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$ReimbursementTableOrderingComposer get reimbursementId {
    final $$ReimbursementTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

class $$ReimbursementActualTableAnnotationComposer
    extends Composer<_$LedgerDatabase, $ReimbursementActualTable> {
  $$ReimbursementActualTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$ReimbursementTableAnnotationComposer get reimbursementId {
    final $$ReimbursementTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reimbursementId,
      referencedTable: $db.reimbursement,
      getReferencedColumn: (t) => t.id,
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
      getReferencedColumn: (t) => t.id,
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

class $$ReimbursementActualTableTableManager
    extends
        RootTableManager<
          _$LedgerDatabase,
          $ReimbursementActualTable,
          ReimbursementActualEntity,
          $$ReimbursementActualTableFilterComposer,
          $$ReimbursementActualTableOrderingComposer,
          $$ReimbursementActualTableAnnotationComposer,
          $$ReimbursementActualTableCreateCompanionBuilder,
          $$ReimbursementActualTableUpdateCompanionBuilder,
          (ReimbursementActualEntity, $$ReimbursementActualTableReferences),
          ReimbursementActualEntity,
          PrefetchHooks Function({bool reimbursementId, bool accountId})
        > {
  $$ReimbursementActualTableTableManager(
    _$LedgerDatabase db,
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
                Value<int> id = const Value.absent(),
                Value<int> reimbursementId = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => ReimbursementActualCompanion(
                id: id,
                reimbursementId: reimbursementId,
                accountId: accountId,
                amount: amount,
                timestamp: timestamp,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int reimbursementId,
                required int accountId,
                required int amount,
                required int timestamp,
                Value<String?> note = const Value.absent(),
              }) => ReimbursementActualCompanion.insert(
                id: id,
                reimbursementId: reimbursementId,
                accountId: accountId,
                amount: amount,
                timestamp: timestamp,
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
              ({reimbursementId = false, accountId = false}) {
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
                                            .id,
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
                                            .id,
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
      _$LedgerDatabase,
      $ReimbursementActualTable,
      ReimbursementActualEntity,
      $$ReimbursementActualTableFilterComposer,
      $$ReimbursementActualTableOrderingComposer,
      $$ReimbursementActualTableAnnotationComposer,
      $$ReimbursementActualTableCreateCompanionBuilder,
      $$ReimbursementActualTableUpdateCompanionBuilder,
      (ReimbursementActualEntity, $$ReimbursementActualTableReferences),
      ReimbursementActualEntity,
      PrefetchHooks Function({bool reimbursementId, bool accountId})
    >;

class $LedgerDatabaseManager {
  final _$LedgerDatabase _db;
  $LedgerDatabaseManager(this._db);
  $$CurrencyTableTableManager get currency =>
      $$CurrencyTableTableManager(_db, _db.currency);
  $$AccountTableTableManager get account =>
      $$AccountTableTableManager(_db, _db.account);
  $$AccountMetaTableTableManager get accountMeta =>
      $$AccountMetaTableTableManager(_db, _db.accountMeta);
  $$AccountCreditTableTableManager get accountCredit =>
      $$AccountCreditTableTableManager(_db, _db.accountCredit);
  $$AccountPrepaidTableTableManager get accountPrepaid =>
      $$AccountPrepaidTableTableManager(_db, _db.accountPrepaid);
  $$StakeholderTableTableManager get stakeholder =>
      $$StakeholderTableTableManager(_db, _db.stakeholder);
  $$AccountPlanLoanTableTableManager get accountPlanLoan =>
      $$AccountPlanLoanTableTableManager(_db, _db.accountPlanLoan);
  $$AccountFlexLoanTableTableManager get accountFlexLoan =>
      $$AccountFlexLoanTableTableManager(_db, _db.accountFlexLoan);
  $$AccountInvestTableTableManager get accountInvest =>
      $$AccountInvestTableTableManager(_db, _db.accountInvest);
  $$LoanPlanTableTableManager get loanPlan =>
      $$LoanPlanTableTableManager(_db, _db.loanPlan);
  $$LoanRecordTableTableManager get loanRecord =>
      $$LoanRecordTableTableManager(_db, _db.loanRecord);
  $$ProjectTableTableManager get project =>
      $$ProjectTableTableManager(_db, _db.project);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$TransactionMetaTableTableManager get transactionMeta =>
      $$TransactionMetaTableTableManager(_db, _db.transactionMeta);
  $$TransactionAmountDetailTableTableManager get transactionAmountDetail =>
      $$TransactionAmountDetailTableTableManager(
        _db,
        _db.transactionAmountDetail,
      );
  $$TransactionCountDetailTableTableManager get transactionCountDetail =>
      $$TransactionCountDetailTableTableManager(
        _db,
        _db.transactionCountDetail,
      );
  $$TransactionReduceTableTableManager get transactionReduce =>
      $$TransactionReduceTableTableManager(_db, _db.transactionReduce);
  $$TransactionRefundTableTableManager get transactionRefund =>
      $$TransactionRefundTableTableManager(_db, _db.transactionRefund);
  $$TransactionRelationTableTableManager get transactionRelation =>
      $$TransactionRelationTableTableManager(_db, _db.transactionRelation);
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
