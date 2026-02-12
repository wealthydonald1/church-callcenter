// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $CachedQueueItemsTable extends CachedQueueItems
    with TableInfo<$CachedQueueItemsTable, CachedQueueItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedQueueItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _assignmentItemIdMeta = const VerificationMeta(
    'assignmentItemId',
  );
  @override
  late final GeneratedColumn<String> assignmentItemId = GeneratedColumn<String>(
    'assignment_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assignmentIdMeta = const VerificationMeta(
    'assignmentId',
  );
  @override
  late final GeneratedColumn<String> assignmentId = GeneratedColumn<String>(
    'assignment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactIdMeta = const VerificationMeta(
    'contactId',
  );
  @override
  late final GeneratedColumn<String> contactId = GeneratedColumn<String>(
    'contact_id',
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
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pcfMeta = const VerificationMeta('pcf');
  @override
  late final GeneratedColumn<String> pcf = GeneratedColumn<String>(
    'pcf',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortIndexMeta = const VerificationMeta(
    'sortIndex',
  );
  @override
  late final GeneratedColumn<int> sortIndex = GeneratedColumn<int>(
    'sort_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
    'done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    assignmentItemId,
    assignmentId,
    contactId,
    name,
    phone,
    pcf,
    sortIndex,
    done,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_queue_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedQueueItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('assignment_item_id')) {
      context.handle(
        _assignmentItemIdMeta,
        assignmentItemId.isAcceptableOrUnknown(
          data['assignment_item_id']!,
          _assignmentItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assignmentItemIdMeta);
    }
    if (data.containsKey('assignment_id')) {
      context.handle(
        _assignmentIdMeta,
        assignmentId.isAcceptableOrUnknown(
          data['assignment_id']!,
          _assignmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assignmentIdMeta);
    }
    if (data.containsKey('contact_id')) {
      context.handle(
        _contactIdMeta,
        contactId.isAcceptableOrUnknown(data['contact_id']!, _contactIdMeta),
      );
    } else if (isInserting) {
      context.missing(_contactIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('pcf')) {
      context.handle(
        _pcfMeta,
        pcf.isAcceptableOrUnknown(data['pcf']!, _pcfMeta),
      );
    }
    if (data.containsKey('sort_index')) {
      context.handle(
        _sortIndexMeta,
        sortIndex.isAcceptableOrUnknown(data['sort_index']!, _sortIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_sortIndexMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
        _doneMeta,
        done.isAcceptableOrUnknown(data['done']!, _doneMeta),
      );
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
  Set<GeneratedColumn> get $primaryKey => {assignmentItemId};
  @override
  CachedQueueItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedQueueItem(
      assignmentItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assignment_item_id'],
      )!,
      assignmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assignment_id'],
      )!,
      contactId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      pcf: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pcf'],
      ),
      sortIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_index'],
      )!,
      done: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}done'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CachedQueueItemsTable createAlias(String alias) {
    return $CachedQueueItemsTable(attachedDatabase, alias);
  }
}

class CachedQueueItem extends DataClass implements Insertable<CachedQueueItem> {
  final String assignmentItemId;
  final String assignmentId;
  final String contactId;
  final String name;
  final String phone;
  final String? pcf;
  final int sortIndex;
  final bool done;
  final DateTime updatedAt;
  const CachedQueueItem({
    required this.assignmentItemId,
    required this.assignmentId,
    required this.contactId,
    required this.name,
    required this.phone,
    this.pcf,
    required this.sortIndex,
    required this.done,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['assignment_item_id'] = Variable<String>(assignmentItemId);
    map['assignment_id'] = Variable<String>(assignmentId);
    map['contact_id'] = Variable<String>(contactId);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || pcf != null) {
      map['pcf'] = Variable<String>(pcf);
    }
    map['sort_index'] = Variable<int>(sortIndex);
    map['done'] = Variable<bool>(done);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedQueueItemsCompanion toCompanion(bool nullToAbsent) {
    return CachedQueueItemsCompanion(
      assignmentItemId: Value(assignmentItemId),
      assignmentId: Value(assignmentId),
      contactId: Value(contactId),
      name: Value(name),
      phone: Value(phone),
      pcf: pcf == null && nullToAbsent ? const Value.absent() : Value(pcf),
      sortIndex: Value(sortIndex),
      done: Value(done),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedQueueItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedQueueItem(
      assignmentItemId: serializer.fromJson<String>(json['assignmentItemId']),
      assignmentId: serializer.fromJson<String>(json['assignmentId']),
      contactId: serializer.fromJson<String>(json['contactId']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      pcf: serializer.fromJson<String?>(json['pcf']),
      sortIndex: serializer.fromJson<int>(json['sortIndex']),
      done: serializer.fromJson<bool>(json['done']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'assignmentItemId': serializer.toJson<String>(assignmentItemId),
      'assignmentId': serializer.toJson<String>(assignmentId),
      'contactId': serializer.toJson<String>(contactId),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'pcf': serializer.toJson<String?>(pcf),
      'sortIndex': serializer.toJson<int>(sortIndex),
      'done': serializer.toJson<bool>(done),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedQueueItem copyWith({
    String? assignmentItemId,
    String? assignmentId,
    String? contactId,
    String? name,
    String? phone,
    Value<String?> pcf = const Value.absent(),
    int? sortIndex,
    bool? done,
    DateTime? updatedAt,
  }) => CachedQueueItem(
    assignmentItemId: assignmentItemId ?? this.assignmentItemId,
    assignmentId: assignmentId ?? this.assignmentId,
    contactId: contactId ?? this.contactId,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    pcf: pcf.present ? pcf.value : this.pcf,
    sortIndex: sortIndex ?? this.sortIndex,
    done: done ?? this.done,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CachedQueueItem copyWithCompanion(CachedQueueItemsCompanion data) {
    return CachedQueueItem(
      assignmentItemId: data.assignmentItemId.present
          ? data.assignmentItemId.value
          : this.assignmentItemId,
      assignmentId: data.assignmentId.present
          ? data.assignmentId.value
          : this.assignmentId,
      contactId: data.contactId.present ? data.contactId.value : this.contactId,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      pcf: data.pcf.present ? data.pcf.value : this.pcf,
      sortIndex: data.sortIndex.present ? data.sortIndex.value : this.sortIndex,
      done: data.done.present ? data.done.value : this.done,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedQueueItem(')
          ..write('assignmentItemId: $assignmentItemId, ')
          ..write('assignmentId: $assignmentId, ')
          ..write('contactId: $contactId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('pcf: $pcf, ')
          ..write('sortIndex: $sortIndex, ')
          ..write('done: $done, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    assignmentItemId,
    assignmentId,
    contactId,
    name,
    phone,
    pcf,
    sortIndex,
    done,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedQueueItem &&
          other.assignmentItemId == this.assignmentItemId &&
          other.assignmentId == this.assignmentId &&
          other.contactId == this.contactId &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.pcf == this.pcf &&
          other.sortIndex == this.sortIndex &&
          other.done == this.done &&
          other.updatedAt == this.updatedAt);
}

class CachedQueueItemsCompanion extends UpdateCompanion<CachedQueueItem> {
  final Value<String> assignmentItemId;
  final Value<String> assignmentId;
  final Value<String> contactId;
  final Value<String> name;
  final Value<String> phone;
  final Value<String?> pcf;
  final Value<int> sortIndex;
  final Value<bool> done;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedQueueItemsCompanion({
    this.assignmentItemId = const Value.absent(),
    this.assignmentId = const Value.absent(),
    this.contactId = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.pcf = const Value.absent(),
    this.sortIndex = const Value.absent(),
    this.done = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedQueueItemsCompanion.insert({
    required String assignmentItemId,
    required String assignmentId,
    required String contactId,
    required String name,
    required String phone,
    this.pcf = const Value.absent(),
    required int sortIndex,
    this.done = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : assignmentItemId = Value(assignmentItemId),
       assignmentId = Value(assignmentId),
       contactId = Value(contactId),
       name = Value(name),
       phone = Value(phone),
       sortIndex = Value(sortIndex),
       updatedAt = Value(updatedAt);
  static Insertable<CachedQueueItem> custom({
    Expression<String>? assignmentItemId,
    Expression<String>? assignmentId,
    Expression<String>? contactId,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? pcf,
    Expression<int>? sortIndex,
    Expression<bool>? done,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (assignmentItemId != null) 'assignment_item_id': assignmentItemId,
      if (assignmentId != null) 'assignment_id': assignmentId,
      if (contactId != null) 'contact_id': contactId,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (pcf != null) 'pcf': pcf,
      if (sortIndex != null) 'sort_index': sortIndex,
      if (done != null) 'done': done,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedQueueItemsCompanion copyWith({
    Value<String>? assignmentItemId,
    Value<String>? assignmentId,
    Value<String>? contactId,
    Value<String>? name,
    Value<String>? phone,
    Value<String?>? pcf,
    Value<int>? sortIndex,
    Value<bool>? done,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CachedQueueItemsCompanion(
      assignmentItemId: assignmentItemId ?? this.assignmentItemId,
      assignmentId: assignmentId ?? this.assignmentId,
      contactId: contactId ?? this.contactId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      pcf: pcf ?? this.pcf,
      sortIndex: sortIndex ?? this.sortIndex,
      done: done ?? this.done,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (assignmentItemId.present) {
      map['assignment_item_id'] = Variable<String>(assignmentItemId.value);
    }
    if (assignmentId.present) {
      map['assignment_id'] = Variable<String>(assignmentId.value);
    }
    if (contactId.present) {
      map['contact_id'] = Variable<String>(contactId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (pcf.present) {
      map['pcf'] = Variable<String>(pcf.value);
    }
    if (sortIndex.present) {
      map['sort_index'] = Variable<int>(sortIndex.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedQueueItemsCompanion(')
          ..write('assignmentItemId: $assignmentItemId, ')
          ..write('assignmentId: $assignmentId, ')
          ..write('contactId: $contactId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('pcf: $pcf, ')
          ..write('sortIndex: $sortIndex, ')
          ..write('done: $done, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OutboxCallLogsTable extends OutboxCallLogs
    with TableInfo<$OutboxCallLogsTable, OutboxCallLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutboxCallLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _assignmentItemIdMeta = const VerificationMeta(
    'assignmentItemId',
  );
  @override
  late final GeneratedColumn<String> assignmentItemId = GeneratedColumn<String>(
    'assignment_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assignmentIdMeta = const VerificationMeta(
    'assignmentId',
  );
  @override
  late final GeneratedColumn<String> assignmentId = GeneratedColumn<String>(
    'assignment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactIdMeta = const VerificationMeta(
    'contactId',
  );
  @override
  late final GeneratedColumn<String> contactId = GeneratedColumn<String>(
    'contact_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactNameMeta = const VerificationMeta(
    'contactName',
  );
  @override
  late final GeneratedColumn<String> contactName = GeneratedColumn<String>(
    'contact_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pcfMeta = const VerificationMeta('pcf');
  @override
  late final GeneratedColumn<String> pcf = GeneratedColumn<String>(
    'pcf',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _outcomeMeta = const VerificationMeta(
    'outcome',
  );
  @override
  late final GeneratedColumn<String> outcome = GeneratedColumn<String>(
    'outcome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    assignmentItemId,
    assignmentId,
    contactId,
    contactName,
    phone,
    pcf,
    outcome,
    tag,
    notes,
    createdAt,
    status,
    retryCount,
    lastError,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outbox_call_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<OutboxCallLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('assignment_item_id')) {
      context.handle(
        _assignmentItemIdMeta,
        assignmentItemId.isAcceptableOrUnknown(
          data['assignment_item_id']!,
          _assignmentItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assignmentItemIdMeta);
    }
    if (data.containsKey('assignment_id')) {
      context.handle(
        _assignmentIdMeta,
        assignmentId.isAcceptableOrUnknown(
          data['assignment_id']!,
          _assignmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assignmentIdMeta);
    }
    if (data.containsKey('contact_id')) {
      context.handle(
        _contactIdMeta,
        contactId.isAcceptableOrUnknown(data['contact_id']!, _contactIdMeta),
      );
    } else if (isInserting) {
      context.missing(_contactIdMeta);
    }
    if (data.containsKey('contact_name')) {
      context.handle(
        _contactNameMeta,
        contactName.isAcceptableOrUnknown(
          data['contact_name']!,
          _contactNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contactNameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('pcf')) {
      context.handle(
        _pcfMeta,
        pcf.isAcceptableOrUnknown(data['pcf']!, _pcfMeta),
      );
    }
    if (data.containsKey('outcome')) {
      context.handle(
        _outcomeMeta,
        outcome.isAcceptableOrUnknown(data['outcome']!, _outcomeMeta),
      );
    } else if (isInserting) {
      context.missing(_outcomeMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
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
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  OutboxCallLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboxCallLog(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      assignmentItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assignment_item_id'],
      )!,
      assignmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assignment_id'],
      )!,
      contactId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_id'],
      )!,
      contactName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      pcf: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pcf'],
      ),
      outcome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outcome'],
      )!,
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
    );
  }

  @override
  $OutboxCallLogsTable createAlias(String alias) {
    return $OutboxCallLogsTable(attachedDatabase, alias);
  }
}

class OutboxCallLog extends DataClass implements Insertable<OutboxCallLog> {
  final int localId;
  final String assignmentItemId;
  final String assignmentId;
  final String contactId;
  final String contactName;
  final String phone;
  final String? pcf;
  final String outcome;
  final String tag;
  final String? notes;
  final DateTime createdAt;
  final String status;
  final int retryCount;
  final String? lastError;
  const OutboxCallLog({
    required this.localId,
    required this.assignmentItemId,
    required this.assignmentId,
    required this.contactId,
    required this.contactName,
    required this.phone,
    this.pcf,
    required this.outcome,
    required this.tag,
    this.notes,
    required this.createdAt,
    required this.status,
    required this.retryCount,
    this.lastError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['assignment_item_id'] = Variable<String>(assignmentItemId);
    map['assignment_id'] = Variable<String>(assignmentId);
    map['contact_id'] = Variable<String>(contactId);
    map['contact_name'] = Variable<String>(contactName);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || pcf != null) {
      map['pcf'] = Variable<String>(pcf);
    }
    map['outcome'] = Variable<String>(outcome);
    map['tag'] = Variable<String>(tag);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['status'] = Variable<String>(status);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  OutboxCallLogsCompanion toCompanion(bool nullToAbsent) {
    return OutboxCallLogsCompanion(
      localId: Value(localId),
      assignmentItemId: Value(assignmentItemId),
      assignmentId: Value(assignmentId),
      contactId: Value(contactId),
      contactName: Value(contactName),
      phone: Value(phone),
      pcf: pcf == null && nullToAbsent ? const Value.absent() : Value(pcf),
      outcome: Value(outcome),
      tag: Value(tag),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      status: Value(status),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory OutboxCallLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutboxCallLog(
      localId: serializer.fromJson<int>(json['localId']),
      assignmentItemId: serializer.fromJson<String>(json['assignmentItemId']),
      assignmentId: serializer.fromJson<String>(json['assignmentId']),
      contactId: serializer.fromJson<String>(json['contactId']),
      contactName: serializer.fromJson<String>(json['contactName']),
      phone: serializer.fromJson<String>(json['phone']),
      pcf: serializer.fromJson<String?>(json['pcf']),
      outcome: serializer.fromJson<String>(json['outcome']),
      tag: serializer.fromJson<String>(json['tag']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      status: serializer.fromJson<String>(json['status']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'assignmentItemId': serializer.toJson<String>(assignmentItemId),
      'assignmentId': serializer.toJson<String>(assignmentId),
      'contactId': serializer.toJson<String>(contactId),
      'contactName': serializer.toJson<String>(contactName),
      'phone': serializer.toJson<String>(phone),
      'pcf': serializer.toJson<String?>(pcf),
      'outcome': serializer.toJson<String>(outcome),
      'tag': serializer.toJson<String>(tag),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'status': serializer.toJson<String>(status),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  OutboxCallLog copyWith({
    int? localId,
    String? assignmentItemId,
    String? assignmentId,
    String? contactId,
    String? contactName,
    String? phone,
    Value<String?> pcf = const Value.absent(),
    String? outcome,
    String? tag,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    String? status,
    int? retryCount,
    Value<String?> lastError = const Value.absent(),
  }) => OutboxCallLog(
    localId: localId ?? this.localId,
    assignmentItemId: assignmentItemId ?? this.assignmentItemId,
    assignmentId: assignmentId ?? this.assignmentId,
    contactId: contactId ?? this.contactId,
    contactName: contactName ?? this.contactName,
    phone: phone ?? this.phone,
    pcf: pcf.present ? pcf.value : this.pcf,
    outcome: outcome ?? this.outcome,
    tag: tag ?? this.tag,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    status: status ?? this.status,
    retryCount: retryCount ?? this.retryCount,
    lastError: lastError.present ? lastError.value : this.lastError,
  );
  OutboxCallLog copyWithCompanion(OutboxCallLogsCompanion data) {
    return OutboxCallLog(
      localId: data.localId.present ? data.localId.value : this.localId,
      assignmentItemId: data.assignmentItemId.present
          ? data.assignmentItemId.value
          : this.assignmentItemId,
      assignmentId: data.assignmentId.present
          ? data.assignmentId.value
          : this.assignmentId,
      contactId: data.contactId.present ? data.contactId.value : this.contactId,
      contactName: data.contactName.present
          ? data.contactName.value
          : this.contactName,
      phone: data.phone.present ? data.phone.value : this.phone,
      pcf: data.pcf.present ? data.pcf.value : this.pcf,
      outcome: data.outcome.present ? data.outcome.value : this.outcome,
      tag: data.tag.present ? data.tag.value : this.tag,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      status: data.status.present ? data.status.value : this.status,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutboxCallLog(')
          ..write('localId: $localId, ')
          ..write('assignmentItemId: $assignmentItemId, ')
          ..write('assignmentId: $assignmentId, ')
          ..write('contactId: $contactId, ')
          ..write('contactName: $contactName, ')
          ..write('phone: $phone, ')
          ..write('pcf: $pcf, ')
          ..write('outcome: $outcome, ')
          ..write('tag: $tag, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    assignmentItemId,
    assignmentId,
    contactId,
    contactName,
    phone,
    pcf,
    outcome,
    tag,
    notes,
    createdAt,
    status,
    retryCount,
    lastError,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutboxCallLog &&
          other.localId == this.localId &&
          other.assignmentItemId == this.assignmentItemId &&
          other.assignmentId == this.assignmentId &&
          other.contactId == this.contactId &&
          other.contactName == this.contactName &&
          other.phone == this.phone &&
          other.pcf == this.pcf &&
          other.outcome == this.outcome &&
          other.tag == this.tag &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.status == this.status &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError);
}

class OutboxCallLogsCompanion extends UpdateCompanion<OutboxCallLog> {
  final Value<int> localId;
  final Value<String> assignmentItemId;
  final Value<String> assignmentId;
  final Value<String> contactId;
  final Value<String> contactName;
  final Value<String> phone;
  final Value<String?> pcf;
  final Value<String> outcome;
  final Value<String> tag;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<String> status;
  final Value<int> retryCount;
  final Value<String?> lastError;
  const OutboxCallLogsCompanion({
    this.localId = const Value.absent(),
    this.assignmentItemId = const Value.absent(),
    this.assignmentId = const Value.absent(),
    this.contactId = const Value.absent(),
    this.contactName = const Value.absent(),
    this.phone = const Value.absent(),
    this.pcf = const Value.absent(),
    this.outcome = const Value.absent(),
    this.tag = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
  });
  OutboxCallLogsCompanion.insert({
    this.localId = const Value.absent(),
    required String assignmentItemId,
    required String assignmentId,
    required String contactId,
    required String contactName,
    required String phone,
    this.pcf = const Value.absent(),
    required String outcome,
    required String tag,
    this.notes = const Value.absent(),
    required DateTime createdAt,
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
  }) : assignmentItemId = Value(assignmentItemId),
       assignmentId = Value(assignmentId),
       contactId = Value(contactId),
       contactName = Value(contactName),
       phone = Value(phone),
       outcome = Value(outcome),
       tag = Value(tag),
       createdAt = Value(createdAt);
  static Insertable<OutboxCallLog> custom({
    Expression<int>? localId,
    Expression<String>? assignmentItemId,
    Expression<String>? assignmentId,
    Expression<String>? contactId,
    Expression<String>? contactName,
    Expression<String>? phone,
    Expression<String>? pcf,
    Expression<String>? outcome,
    Expression<String>? tag,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<String>? status,
    Expression<int>? retryCount,
    Expression<String>? lastError,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (assignmentItemId != null) 'assignment_item_id': assignmentItemId,
      if (assignmentId != null) 'assignment_id': assignmentId,
      if (contactId != null) 'contact_id': contactId,
      if (contactName != null) 'contact_name': contactName,
      if (phone != null) 'phone': phone,
      if (pcf != null) 'pcf': pcf,
      if (outcome != null) 'outcome': outcome,
      if (tag != null) 'tag': tag,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
    });
  }

  OutboxCallLogsCompanion copyWith({
    Value<int>? localId,
    Value<String>? assignmentItemId,
    Value<String>? assignmentId,
    Value<String>? contactId,
    Value<String>? contactName,
    Value<String>? phone,
    Value<String?>? pcf,
    Value<String>? outcome,
    Value<String>? tag,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<String>? status,
    Value<int>? retryCount,
    Value<String?>? lastError,
  }) {
    return OutboxCallLogsCompanion(
      localId: localId ?? this.localId,
      assignmentItemId: assignmentItemId ?? this.assignmentItemId,
      assignmentId: assignmentId ?? this.assignmentId,
      contactId: contactId ?? this.contactId,
      contactName: contactName ?? this.contactName,
      phone: phone ?? this.phone,
      pcf: pcf ?? this.pcf,
      outcome: outcome ?? this.outcome,
      tag: tag ?? this.tag,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (assignmentItemId.present) {
      map['assignment_item_id'] = Variable<String>(assignmentItemId.value);
    }
    if (assignmentId.present) {
      map['assignment_id'] = Variable<String>(assignmentId.value);
    }
    if (contactId.present) {
      map['contact_id'] = Variable<String>(contactId.value);
    }
    if (contactName.present) {
      map['contact_name'] = Variable<String>(contactName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (pcf.present) {
      map['pcf'] = Variable<String>(pcf.value);
    }
    if (outcome.present) {
      map['outcome'] = Variable<String>(outcome.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutboxCallLogsCompanion(')
          ..write('localId: $localId, ')
          ..write('assignmentItemId: $assignmentItemId, ')
          ..write('assignmentId: $assignmentId, ')
          ..write('contactId: $contactId, ')
          ..write('contactName: $contactName, ')
          ..write('phone: $phone, ')
          ..write('pcf: $pcf, ')
          ..write('outcome: $outcome, ')
          ..write('tag: $tag, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }
}

class $LocalKvTable extends LocalKv with TableInfo<$LocalKvTable, LocalKvData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalKvTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_kv';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalKvData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  LocalKvData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalKvData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LocalKvTable createAlias(String alias) {
    return $LocalKvTable(attachedDatabase, alias);
  }
}

class LocalKvData extends DataClass implements Insertable<LocalKvData> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const LocalKvData({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LocalKvCompanion toCompanion(bool nullToAbsent) {
    return LocalKvCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalKvData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalKvData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalKvData copyWith({String? key, String? value, DateTime? updatedAt}) =>
      LocalKvData(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  LocalKvData copyWithCompanion(LocalKvCompanion data) {
    return LocalKvData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalKvData(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalKvData &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class LocalKvCompanion extends UpdateCompanion<LocalKvData> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LocalKvCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalKvCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<LocalKvData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalKvCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return LocalKvCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalKvCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDb extends GeneratedDatabase {
  _$LocalDb(QueryExecutor e) : super(e);
  $LocalDbManager get managers => $LocalDbManager(this);
  late final $CachedQueueItemsTable cachedQueueItems = $CachedQueueItemsTable(
    this,
  );
  late final $OutboxCallLogsTable outboxCallLogs = $OutboxCallLogsTable(this);
  late final $LocalKvTable localKv = $LocalKvTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedQueueItems,
    outboxCallLogs,
    localKv,
  ];
}

typedef $$CachedQueueItemsTableCreateCompanionBuilder =
    CachedQueueItemsCompanion Function({
      required String assignmentItemId,
      required String assignmentId,
      required String contactId,
      required String name,
      required String phone,
      Value<String?> pcf,
      required int sortIndex,
      Value<bool> done,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CachedQueueItemsTableUpdateCompanionBuilder =
    CachedQueueItemsCompanion Function({
      Value<String> assignmentItemId,
      Value<String> assignmentId,
      Value<String> contactId,
      Value<String> name,
      Value<String> phone,
      Value<String?> pcf,
      Value<int> sortIndex,
      Value<bool> done,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CachedQueueItemsTableFilterComposer
    extends Composer<_$LocalDb, $CachedQueueItemsTable> {
  $$CachedQueueItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get assignmentItemId => $composableBuilder(
    column: $table.assignmentItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assignmentId => $composableBuilder(
    column: $table.assignmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactId => $composableBuilder(
    column: $table.contactId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pcf => $composableBuilder(
    column: $table.pcf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortIndex => $composableBuilder(
    column: $table.sortIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedQueueItemsTableOrderingComposer
    extends Composer<_$LocalDb, $CachedQueueItemsTable> {
  $$CachedQueueItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get assignmentItemId => $composableBuilder(
    column: $table.assignmentItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assignmentId => $composableBuilder(
    column: $table.assignmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactId => $composableBuilder(
    column: $table.contactId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pcf => $composableBuilder(
    column: $table.pcf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortIndex => $composableBuilder(
    column: $table.sortIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedQueueItemsTableAnnotationComposer
    extends Composer<_$LocalDb, $CachedQueueItemsTable> {
  $$CachedQueueItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get assignmentItemId => $composableBuilder(
    column: $table.assignmentItemId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get assignmentId => $composableBuilder(
    column: $table.assignmentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contactId =>
      $composableBuilder(column: $table.contactId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get pcf =>
      $composableBuilder(column: $table.pcf, builder: (column) => column);

  GeneratedColumn<int> get sortIndex =>
      $composableBuilder(column: $table.sortIndex, builder: (column) => column);

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedQueueItemsTableTableManager
    extends
        RootTableManager<
          _$LocalDb,
          $CachedQueueItemsTable,
          CachedQueueItem,
          $$CachedQueueItemsTableFilterComposer,
          $$CachedQueueItemsTableOrderingComposer,
          $$CachedQueueItemsTableAnnotationComposer,
          $$CachedQueueItemsTableCreateCompanionBuilder,
          $$CachedQueueItemsTableUpdateCompanionBuilder,
          (
            CachedQueueItem,
            BaseReferences<_$LocalDb, $CachedQueueItemsTable, CachedQueueItem>,
          ),
          CachedQueueItem,
          PrefetchHooks Function()
        > {
  $$CachedQueueItemsTableTableManager(
    _$LocalDb db,
    $CachedQueueItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedQueueItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedQueueItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedQueueItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> assignmentItemId = const Value.absent(),
                Value<String> assignmentId = const Value.absent(),
                Value<String> contactId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String?> pcf = const Value.absent(),
                Value<int> sortIndex = const Value.absent(),
                Value<bool> done = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedQueueItemsCompanion(
                assignmentItemId: assignmentItemId,
                assignmentId: assignmentId,
                contactId: contactId,
                name: name,
                phone: phone,
                pcf: pcf,
                sortIndex: sortIndex,
                done: done,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String assignmentItemId,
                required String assignmentId,
                required String contactId,
                required String name,
                required String phone,
                Value<String?> pcf = const Value.absent(),
                required int sortIndex,
                Value<bool> done = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedQueueItemsCompanion.insert(
                assignmentItemId: assignmentItemId,
                assignmentId: assignmentId,
                contactId: contactId,
                name: name,
                phone: phone,
                pcf: pcf,
                sortIndex: sortIndex,
                done: done,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedQueueItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDb,
      $CachedQueueItemsTable,
      CachedQueueItem,
      $$CachedQueueItemsTableFilterComposer,
      $$CachedQueueItemsTableOrderingComposer,
      $$CachedQueueItemsTableAnnotationComposer,
      $$CachedQueueItemsTableCreateCompanionBuilder,
      $$CachedQueueItemsTableUpdateCompanionBuilder,
      (
        CachedQueueItem,
        BaseReferences<_$LocalDb, $CachedQueueItemsTable, CachedQueueItem>,
      ),
      CachedQueueItem,
      PrefetchHooks Function()
    >;
typedef $$OutboxCallLogsTableCreateCompanionBuilder =
    OutboxCallLogsCompanion Function({
      Value<int> localId,
      required String assignmentItemId,
      required String assignmentId,
      required String contactId,
      required String contactName,
      required String phone,
      Value<String?> pcf,
      required String outcome,
      required String tag,
      Value<String?> notes,
      required DateTime createdAt,
      Value<String> status,
      Value<int> retryCount,
      Value<String?> lastError,
    });
typedef $$OutboxCallLogsTableUpdateCompanionBuilder =
    OutboxCallLogsCompanion Function({
      Value<int> localId,
      Value<String> assignmentItemId,
      Value<String> assignmentId,
      Value<String> contactId,
      Value<String> contactName,
      Value<String> phone,
      Value<String?> pcf,
      Value<String> outcome,
      Value<String> tag,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<String> status,
      Value<int> retryCount,
      Value<String?> lastError,
    });

class $$OutboxCallLogsTableFilterComposer
    extends Composer<_$LocalDb, $OutboxCallLogsTable> {
  $$OutboxCallLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assignmentItemId => $composableBuilder(
    column: $table.assignmentItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assignmentId => $composableBuilder(
    column: $table.assignmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactId => $composableBuilder(
    column: $table.contactId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pcf => $composableBuilder(
    column: $table.pcf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OutboxCallLogsTableOrderingComposer
    extends Composer<_$LocalDb, $OutboxCallLogsTable> {
  $$OutboxCallLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assignmentItemId => $composableBuilder(
    column: $table.assignmentItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assignmentId => $composableBuilder(
    column: $table.assignmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactId => $composableBuilder(
    column: $table.contactId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pcf => $composableBuilder(
    column: $table.pcf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OutboxCallLogsTableAnnotationComposer
    extends Composer<_$LocalDb, $OutboxCallLogsTable> {
  $$OutboxCallLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get assignmentItemId => $composableBuilder(
    column: $table.assignmentItemId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get assignmentId => $composableBuilder(
    column: $table.assignmentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contactId =>
      $composableBuilder(column: $table.contactId, builder: (column) => column);

  GeneratedColumn<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get pcf =>
      $composableBuilder(column: $table.pcf, builder: (column) => column);

  GeneratedColumn<String> get outcome =>
      $composableBuilder(column: $table.outcome, builder: (column) => column);

  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$OutboxCallLogsTableTableManager
    extends
        RootTableManager<
          _$LocalDb,
          $OutboxCallLogsTable,
          OutboxCallLog,
          $$OutboxCallLogsTableFilterComposer,
          $$OutboxCallLogsTableOrderingComposer,
          $$OutboxCallLogsTableAnnotationComposer,
          $$OutboxCallLogsTableCreateCompanionBuilder,
          $$OutboxCallLogsTableUpdateCompanionBuilder,
          (
            OutboxCallLog,
            BaseReferences<_$LocalDb, $OutboxCallLogsTable, OutboxCallLog>,
          ),
          OutboxCallLog,
          PrefetchHooks Function()
        > {
  $$OutboxCallLogsTableTableManager(_$LocalDb db, $OutboxCallLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutboxCallLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutboxCallLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutboxCallLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String> assignmentItemId = const Value.absent(),
                Value<String> assignmentId = const Value.absent(),
                Value<String> contactId = const Value.absent(),
                Value<String> contactName = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String?> pcf = const Value.absent(),
                Value<String> outcome = const Value.absent(),
                Value<String> tag = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
              }) => OutboxCallLogsCompanion(
                localId: localId,
                assignmentItemId: assignmentItemId,
                assignmentId: assignmentId,
                contactId: contactId,
                contactName: contactName,
                phone: phone,
                pcf: pcf,
                outcome: outcome,
                tag: tag,
                notes: notes,
                createdAt: createdAt,
                status: status,
                retryCount: retryCount,
                lastError: lastError,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                required String assignmentItemId,
                required String assignmentId,
                required String contactId,
                required String contactName,
                required String phone,
                Value<String?> pcf = const Value.absent(),
                required String outcome,
                required String tag,
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
              }) => OutboxCallLogsCompanion.insert(
                localId: localId,
                assignmentItemId: assignmentItemId,
                assignmentId: assignmentId,
                contactId: contactId,
                contactName: contactName,
                phone: phone,
                pcf: pcf,
                outcome: outcome,
                tag: tag,
                notes: notes,
                createdAt: createdAt,
                status: status,
                retryCount: retryCount,
                lastError: lastError,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OutboxCallLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDb,
      $OutboxCallLogsTable,
      OutboxCallLog,
      $$OutboxCallLogsTableFilterComposer,
      $$OutboxCallLogsTableOrderingComposer,
      $$OutboxCallLogsTableAnnotationComposer,
      $$OutboxCallLogsTableCreateCompanionBuilder,
      $$OutboxCallLogsTableUpdateCompanionBuilder,
      (
        OutboxCallLog,
        BaseReferences<_$LocalDb, $OutboxCallLogsTable, OutboxCallLog>,
      ),
      OutboxCallLog,
      PrefetchHooks Function()
    >;
typedef $$LocalKvTableCreateCompanionBuilder =
    LocalKvCompanion Function({
      required String key,
      required String value,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$LocalKvTableUpdateCompanionBuilder =
    LocalKvCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$LocalKvTableFilterComposer extends Composer<_$LocalDb, $LocalKvTable> {
  $$LocalKvTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalKvTableOrderingComposer
    extends Composer<_$LocalDb, $LocalKvTable> {
  $$LocalKvTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalKvTableAnnotationComposer
    extends Composer<_$LocalDb, $LocalKvTable> {
  $$LocalKvTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LocalKvTableTableManager
    extends
        RootTableManager<
          _$LocalDb,
          $LocalKvTable,
          LocalKvData,
          $$LocalKvTableFilterComposer,
          $$LocalKvTableOrderingComposer,
          $$LocalKvTableAnnotationComposer,
          $$LocalKvTableCreateCompanionBuilder,
          $$LocalKvTableUpdateCompanionBuilder,
          (LocalKvData, BaseReferences<_$LocalDb, $LocalKvTable, LocalKvData>),
          LocalKvData,
          PrefetchHooks Function()
        > {
  $$LocalKvTableTableManager(_$LocalDb db, $LocalKvTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalKvTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalKvTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalKvTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalKvCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LocalKvCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalKvTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDb,
      $LocalKvTable,
      LocalKvData,
      $$LocalKvTableFilterComposer,
      $$LocalKvTableOrderingComposer,
      $$LocalKvTableAnnotationComposer,
      $$LocalKvTableCreateCompanionBuilder,
      $$LocalKvTableUpdateCompanionBuilder,
      (LocalKvData, BaseReferences<_$LocalDb, $LocalKvTable, LocalKvData>),
      LocalKvData,
      PrefetchHooks Function()
    >;

class $LocalDbManager {
  final _$LocalDb _db;
  $LocalDbManager(this._db);
  $$CachedQueueItemsTableTableManager get cachedQueueItems =>
      $$CachedQueueItemsTableTableManager(_db, _db.cachedQueueItems);
  $$OutboxCallLogsTableTableManager get outboxCallLogs =>
      $$OutboxCallLogsTableTableManager(_db, _db.outboxCallLogs);
  $$LocalKvTableTableManager get localKv =>
      $$LocalKvTableTableManager(_db, _db.localKv);
}
