import 'dart:async';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'local_db.g.dart';

class CachedQueueItems extends Table {
  TextColumn get assignmentItemId => text()(); // uuid string
  TextColumn get assignmentId => text()();
  TextColumn get contactId => text()();
  TextColumn get name => text()();
  TextColumn get phone => text()();
  TextColumn get pcf => text().nullable()();
  IntColumn get sortIndex => integer()();
  BoolColumn get done => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {assignmentItemId};
}

class OutboxCallLogs extends Table {
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get assignmentItemId => text()();
  TextColumn get assignmentId => text()();
  TextColumn get contactId => text()();
  TextColumn get contactName => text()();
  TextColumn get phone => text()();
  TextColumn get pcf => text().nullable()();

  TextColumn get outcome => text()(); // reached/no_answer/...
  TextColumn get tag => text()();     // OK/ISSUE
  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending/synced/failed
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
}

class LocalKv extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [CachedQueueItems, OutboxCallLogs, LocalKv])
class LocalDb extends _$LocalDb {
  LocalDb() : super(driftDatabase(name: 'callcenter_local'));

  @override
  int get schemaVersion => 1;

  Future<void> setCursor(String assignmentId, int index) async {
    await into(localKv).insertOnConflictUpdate(LocalKvCompanion(
      key: Value('cursor:$assignmentId'),
      value: Value(index.toString()),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<int> getCursor(String assignmentId) async {
    final row = await (select(localKv)..where((t) => t.key.equals('cursor:$assignmentId'))).getSingleOrNull();
    return int.tryParse(row?.value ?? '') ?? 0;
  }
}
