// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Repo extends DataClass implements Insertable<Repo> {
  final int id;
  final String? node_id;
  final String? name;
  final String? description;
  final String? language;
  final int? open_issues;
  final int? watchers;
  const Repo(
      {required this.id,
      this.node_id,
      this.name,
      this.description,
      this.language,
      this.open_issues,
      this.watchers});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || node_id != null) {
      map['node_id'] = Variable<String>(node_id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || open_issues != null) {
      map['open_issues'] = Variable<int>(open_issues);
    }
    if (!nullToAbsent || watchers != null) {
      map['watchers'] = Variable<int>(watchers);
    }
    return map;
  }

  ReposCompanion toCompanion(bool nullToAbsent) {
    return ReposCompanion(
      id: Value(id),
      node_id: node_id == null && nullToAbsent
          ? const Value.absent()
          : Value(node_id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      open_issues: open_issues == null && nullToAbsent
          ? const Value.absent()
          : Value(open_issues),
      watchers: watchers == null && nullToAbsent
          ? const Value.absent()
          : Value(watchers),
    );
  }

  factory Repo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Repo(
      id: serializer.fromJson<int>(json['id']),
      node_id: serializer.fromJson<String?>(json['node_id']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      language: serializer.fromJson<String?>(json['language']),
      open_issues: serializer.fromJson<int?>(json['open_issues']),
      watchers: serializer.fromJson<int?>(json['watchers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'node_id': serializer.toJson<String?>(node_id),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
      'language': serializer.toJson<String?>(language),
      'open_issues': serializer.toJson<int?>(open_issues),
      'watchers': serializer.toJson<int?>(watchers),
    };
  }

  Repo copyWith(
          {int? id,
          Value<String?> node_id = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> language = const Value.absent(),
          Value<int?> open_issues = const Value.absent(),
          Value<int?> watchers = const Value.absent()}) =>
      Repo(
        id: id ?? this.id,
        node_id: node_id.present ? node_id.value : this.node_id,
        name: name.present ? name.value : this.name,
        description: description.present ? description.value : this.description,
        language: language.present ? language.value : this.language,
        open_issues: open_issues.present ? open_issues.value : this.open_issues,
        watchers: watchers.present ? watchers.value : this.watchers,
      );
  @override
  String toString() {
    return (StringBuffer('Repo(')
          ..write('id: $id, ')
          ..write('node_id: $node_id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('language: $language, ')
          ..write('open_issues: $open_issues, ')
          ..write('watchers: $watchers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, node_id, name, description, language, open_issues, watchers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Repo &&
          other.id == this.id &&
          other.node_id == this.node_id &&
          other.name == this.name &&
          other.description == this.description &&
          other.language == this.language &&
          other.open_issues == this.open_issues &&
          other.watchers == this.watchers);
}

class ReposCompanion extends UpdateCompanion<Repo> {
  final Value<int> id;
  final Value<String?> node_id;
  final Value<String?> name;
  final Value<String?> description;
  final Value<String?> language;
  final Value<int?> open_issues;
  final Value<int?> watchers;
  const ReposCompanion({
    this.id = const Value.absent(),
    this.node_id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.language = const Value.absent(),
    this.open_issues = const Value.absent(),
    this.watchers = const Value.absent(),
  });
  ReposCompanion.insert({
    required int id,
    this.node_id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.language = const Value.absent(),
    this.open_issues = const Value.absent(),
    this.watchers = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Repo> custom({
    Expression<int>? id,
    Expression<String>? node_id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? language,
    Expression<int>? open_issues,
    Expression<int>? watchers,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (node_id != null) 'node_id': node_id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (language != null) 'language': language,
      if (open_issues != null) 'open_issues': open_issues,
      if (watchers != null) 'watchers': watchers,
    });
  }

  ReposCompanion copyWith(
      {Value<int>? id,
      Value<String?>? node_id,
      Value<String?>? name,
      Value<String?>? description,
      Value<String?>? language,
      Value<int?>? open_issues,
      Value<int?>? watchers}) {
    return ReposCompanion(
      id: id ?? this.id,
      node_id: node_id ?? this.node_id,
      name: name ?? this.name,
      description: description ?? this.description,
      language: language ?? this.language,
      open_issues: open_issues ?? this.open_issues,
      watchers: watchers ?? this.watchers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (node_id.present) {
      map['node_id'] = Variable<String>(node_id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (open_issues.present) {
      map['open_issues'] = Variable<int>(open_issues.value);
    }
    if (watchers.present) {
      map['watchers'] = Variable<int>(watchers.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReposCompanion(')
          ..write('id: $id, ')
          ..write('node_id: $node_id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('language: $language, ')
          ..write('open_issues: $open_issues, ')
          ..write('watchers: $watchers')
          ..write(')'))
        .toString();
  }
}

class $ReposTable extends Repos with TableInfo<$ReposTable, Repo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReposTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _node_idMeta = const VerificationMeta('node_id');
  @override
  late final GeneratedColumn<String> node_id = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _languageMeta = const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _open_issuesMeta =
      const VerificationMeta('open_issues');
  @override
  late final GeneratedColumn<int> open_issues = GeneratedColumn<int>(
      'open_issues', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _watchersMeta = const VerificationMeta('watchers');
  @override
  late final GeneratedColumn<int> watchers = GeneratedColumn<int>(
      'watchers', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, node_id, name, description, language, open_issues, watchers];
  @override
  String get aliasedName => _alias ?? 'repos';
  @override
  String get actualTableName => 'repos';
  @override
  VerificationContext validateIntegrity(Insertable<Repo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('node_id')) {
      context.handle(_node_idMeta,
          node_id.isAcceptableOrUnknown(data['node_id']!, _node_idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('open_issues')) {
      context.handle(
          _open_issuesMeta,
          open_issues.isAcceptableOrUnknown(
              data['open_issues']!, _open_issuesMeta));
    }
    if (data.containsKey('watchers')) {
      context.handle(_watchersMeta,
          watchers.isAcceptableOrUnknown(data['watchers']!, _watchersMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Repo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Repo(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      node_id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      language: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      open_issues: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}open_issues']),
      watchers: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}watchers']),
    );
  }

  @override
  $ReposTable createAlias(String alias) {
    return $ReposTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $ReposTable repos = $ReposTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [repos];
}
