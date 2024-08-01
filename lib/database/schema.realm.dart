// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class RealmColor extends _RealmColor
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmColor(
    ObjectId id,
    int colorR,
    int colorG,
    int colorB,
    int alpha,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'colorR', colorR);
    RealmObjectBase.set(this, 'colorG', colorG);
    RealmObjectBase.set(this, 'colorB', colorB);
    RealmObjectBase.set(this, 'alpha', alpha);
  }

  RealmColor._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  int get colorR => RealmObjectBase.get<int>(this, 'colorR') as int;
  @override
  set colorR(int value) => RealmObjectBase.set(this, 'colorR', value);

  @override
  int get colorG => RealmObjectBase.get<int>(this, 'colorG') as int;
  @override
  set colorG(int value) => RealmObjectBase.set(this, 'colorG', value);

  @override
  int get colorB => RealmObjectBase.get<int>(this, 'colorB') as int;
  @override
  set colorB(int value) => RealmObjectBase.set(this, 'colorB', value);

  @override
  int get alpha => RealmObjectBase.get<int>(this, 'alpha') as int;
  @override
  set alpha(int value) => RealmObjectBase.set(this, 'alpha', value);

  @override
  Stream<RealmObjectChanges<RealmColor>> get changes =>
      RealmObjectBase.getChanges<RealmColor>(this);

  @override
  Stream<RealmObjectChanges<RealmColor>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<RealmColor>(this, keyPaths);

  @override
  RealmColor freeze() => RealmObjectBase.freezeObject<RealmColor>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'colorR': colorR.toEJson(),
      'colorG': colorG.toEJson(),
      'colorB': colorB.toEJson(),
      'alpha': alpha.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmColor value) => value.toEJson();
  static RealmColor _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'colorR': EJsonValue colorR,
        'colorG': EJsonValue colorG,
        'colorB': EJsonValue colorB,
        'alpha': EJsonValue alpha,
      } =>
        RealmColor(
          fromEJson(id),
          fromEJson(colorR),
          fromEJson(colorG),
          fromEJson(colorB),
          fromEJson(alpha),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmColor._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, RealmColor, 'RealmColor', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('colorR', RealmPropertyType.int),
      SchemaProperty('colorG', RealmPropertyType.int),
      SchemaProperty('colorB', RealmPropertyType.int),
      SchemaProperty('alpha', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Subject extends _Subject with RealmEntity, RealmObjectBase, RealmObject {
  Subject(
    ObjectId id,
    String name, {
    RealmColor? color,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'color', color);
  }

  Subject._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  RealmColor? get color =>
      RealmObjectBase.get<RealmColor>(this, 'color') as RealmColor?;
  @override
  set color(covariant RealmColor? value) =>
      RealmObjectBase.set(this, 'color', value);

  @override
  Stream<RealmObjectChanges<Subject>> get changes =>
      RealmObjectBase.getChanges<Subject>(this);

  @override
  Stream<RealmObjectChanges<Subject>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Subject>(this, keyPaths);

  @override
  Subject freeze() => RealmObjectBase.freezeObject<Subject>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'color': color.toEJson(),
    };
  }

  static EJsonValue _toEJson(Subject value) => value.toEJson();
  static Subject _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'color': EJsonValue color,
      } =>
        Subject(
          fromEJson(id),
          fromEJson(name),
          color: fromEJson(color),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Subject._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Subject, 'Subject', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('color', RealmPropertyType.object,
          optional: true, linkTarget: 'RealmColor'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class TermPaperType extends _TermPaperType
    with RealmEntity, RealmObjectBase, RealmObject {
  TermPaperType(
    ObjectId id,
    String name, {
    RealmColor? color,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'color', color);
  }

  TermPaperType._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  RealmColor? get color =>
      RealmObjectBase.get<RealmColor>(this, 'color') as RealmColor?;
  @override
  set color(covariant RealmColor? value) =>
      RealmObjectBase.set(this, 'color', value);

  @override
  Stream<RealmObjectChanges<TermPaperType>> get changes =>
      RealmObjectBase.getChanges<TermPaperType>(this);

  @override
  Stream<RealmObjectChanges<TermPaperType>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<TermPaperType>(this, keyPaths);

  @override
  TermPaperType freeze() => RealmObjectBase.freezeObject<TermPaperType>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'color': color.toEJson(),
    };
  }

  static EJsonValue _toEJson(TermPaperType value) => value.toEJson();
  static TermPaperType _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'color': EJsonValue color,
      } =>
        TermPaperType(
          fromEJson(id),
          fromEJson(name),
          color: fromEJson(color),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TermPaperType._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, TermPaperType, 'TermPaperType', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('color', RealmPropertyType.object,
          optional: true, linkTarget: 'RealmColor'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class TermPaper extends _TermPaper
    with RealmEntity, RealmObjectBase, RealmObject {
  TermPaper(
    ObjectId id,
    String name,
    String description,
    DateTime deadline, {
    Subject? subject,
    TermPaperType? type,
    double? mark,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'subject', subject);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'deadline', deadline);
    RealmObjectBase.set(this, 'mark', mark);
  }

  TermPaper._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  Subject? get subject =>
      RealmObjectBase.get<Subject>(this, 'subject') as Subject?;
  @override
  set subject(covariant Subject? value) =>
      RealmObjectBase.set(this, 'subject', value);

  @override
  TermPaperType? get type =>
      RealmObjectBase.get<TermPaperType>(this, 'type') as TermPaperType?;
  @override
  set type(covariant TermPaperType? value) =>
      RealmObjectBase.set(this, 'type', value);

  @override
  DateTime get deadline =>
      RealmObjectBase.get<DateTime>(this, 'deadline') as DateTime;
  @override
  set deadline(DateTime value) => RealmObjectBase.set(this, 'deadline', value);

  @override
  double? get mark => RealmObjectBase.get<double>(this, 'mark') as double?;
  @override
  set mark(double? value) => RealmObjectBase.set(this, 'mark', value);

  @override
  Stream<RealmObjectChanges<TermPaper>> get changes =>
      RealmObjectBase.getChanges<TermPaper>(this);

  @override
  Stream<RealmObjectChanges<TermPaper>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<TermPaper>(this, keyPaths);

  @override
  TermPaper freeze() => RealmObjectBase.freezeObject<TermPaper>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'description': description.toEJson(),
      'subject': subject.toEJson(),
      'type': type.toEJson(),
      'deadline': deadline.toEJson(),
      'mark': mark.toEJson(),
    };
  }

  static EJsonValue _toEJson(TermPaper value) => value.toEJson();
  static TermPaper _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'description': EJsonValue description,
        'subject': EJsonValue subject,
        'type': EJsonValue type,
        'deadline': EJsonValue deadline,
        'mark': EJsonValue mark,
      } =>
        TermPaper(
          fromEJson(id),
          fromEJson(name),
          fromEJson(description),
          fromEJson(deadline),
          subject: fromEJson(subject),
          type: fromEJson(type),
          mark: fromEJson(mark),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TermPaper._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, TermPaper, 'TermPaper', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('subject', RealmPropertyType.object,
          optional: true, linkTarget: 'Subject'),
      SchemaProperty('type', RealmPropertyType.object,
          optional: true, linkTarget: 'TermPaperType'),
      SchemaProperty('deadline', RealmPropertyType.timestamp),
      SchemaProperty('mark', RealmPropertyType.double, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class SchoolYear extends _SchoolYear
    with RealmEntity, RealmObjectBase, RealmObject {
  SchoolYear(
    ObjectId id,
    String name,
    DateTime start,
    DateTime end,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'start', start);
    RealmObjectBase.set(this, 'end', end);
  }

  SchoolYear._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  DateTime get start =>
      RealmObjectBase.get<DateTime>(this, 'start') as DateTime;
  @override
  set start(DateTime value) => RealmObjectBase.set(this, 'start', value);

  @override
  DateTime get end => RealmObjectBase.get<DateTime>(this, 'end') as DateTime;
  @override
  set end(DateTime value) => RealmObjectBase.set(this, 'end', value);

  @override
  Stream<RealmObjectChanges<SchoolYear>> get changes =>
      RealmObjectBase.getChanges<SchoolYear>(this);

  @override
  Stream<RealmObjectChanges<SchoolYear>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<SchoolYear>(this, keyPaths);

  @override
  SchoolYear freeze() => RealmObjectBase.freezeObject<SchoolYear>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'start': start.toEJson(),
      'end': end.toEJson(),
    };
  }

  static EJsonValue _toEJson(SchoolYear value) => value.toEJson();
  static SchoolYear _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'start': EJsonValue start,
        'end': EJsonValue end,
      } =>
        SchoolYear(
          fromEJson(id),
          fromEJson(name),
          fromEJson(start),
          fromEJson(end),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(SchoolYear._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, SchoolYear, 'SchoolYear', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('start', RealmPropertyType.timestamp),
      SchemaProperty('end', RealmPropertyType.timestamp),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
