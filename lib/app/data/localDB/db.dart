import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

class Repos extends Table {
  IntColumn get id => integer()();
  TextColumn get node_id => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get language => text().nullable()();
  IntColumn get open_issues => integer().nullable()();
  IntColumn get watchers => integer().nullable()();
}

@DriftDatabase(tables: [Repos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future insertRepo(repo) => into(repos).insert(repo);
  Future<List<Repo>> getAllRepos(int limit, int offset) =>
      (select(repos)..limit(limit, offset: offset)).get();
  void deleteAllRepos() => delete(repos).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    },
  );
}
