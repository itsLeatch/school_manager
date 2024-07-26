// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Subject extends _Subject with RealmEntity, RealmObjectBase, RealmObject {
  Subject(
    ObjectId id,
    String name,
    int colorR,
    int colorG,
    int colorB,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'colorR', colorR);
    RealmObjectBase.set(this, 'colorG', colorG);
    RealmObjectBase.set(this, 'colorB', colorB);
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
      'colorR': colorR.toEJson(),
      'colorG': colorG.toEJson(),
      'colorB': colorB.toEJson(),
    };
  }

  static EJsonValue _toEJson(Subject value) => value.toEJson();
  static Subject _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'colorR': EJsonValue colorR,
        'colorG': EJsonValue colorG,
        'colorB': EJsonValue colorB,
      } =>
        Subject(
          fromEJson(id),
          fromEJson(name),
          fromEJson(colorR),
          fromEJson(colorG),
          fromEJson(colorB),
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
      SchemaProperty('colorR', RealmPropertyType.int),
      SchemaProperty('colorG', RealmPropertyType.int),
      SchemaProperty('colorB', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class MarkCollection extends _MarkCollection
    with RealmEntity, RealmObjectBase, RealmObject {
  MarkCollection(
    ObjectId id,
    String name, {
    Iterable<SubjectMarksPerCollection> subjectMarks = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set<RealmList<SubjectMarksPerCollection>>(this,
        'subjectMarks', RealmList<SubjectMarksPerCollection>(subjectMarks));
  }

  MarkCollection._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  RealmList<SubjectMarksPerCollection> get subjectMarks =>
      RealmObjectBase.get<SubjectMarksPerCollection>(this, 'subjectMarks')
          as RealmList<SubjectMarksPerCollection>;
  @override
  set subjectMarks(covariant RealmList<SubjectMarksPerCollection> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<MarkCollection>> get changes =>
      RealmObjectBase.getChanges<MarkCollection>(this);

  @override
  Stream<RealmObjectChanges<MarkCollection>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<MarkCollection>(this, keyPaths);

  @override
  MarkCollection freeze() => RealmObjectBase.freezeObject<MarkCollection>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'subjectMarks': subjectMarks.toEJson(),
    };
  }

  static EJsonValue _toEJson(MarkCollection value) => value.toEJson();
  static MarkCollection _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'subjectMarks': EJsonValue subjectMarks,
      } =>
        MarkCollection(
          fromEJson(id),
          fromEJson(name),
          subjectMarks: fromEJson(subjectMarks),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(MarkCollection._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, MarkCollection, 'MarkCollection', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('subjectMarks', RealmPropertyType.object,
          linkTarget: 'SubjectMarksPerCollection',
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class SubjectMarksPerCollection extends _SubjectMarksPerCollection
    with RealmEntity, RealmObjectBase, RealmObject {
  SubjectMarksPerCollection(
    ObjectId id, {
    Subject? subjectReferenz,
    Iterable<int> marks = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'subjectReferenz', subjectReferenz);
    RealmObjectBase.set<RealmList<int>>(this, 'marks', RealmList<int>(marks));
  }

  SubjectMarksPerCollection._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  Subject? get subjectReferenz =>
      RealmObjectBase.get<Subject>(this, 'subjectReferenz') as Subject?;
  @override
  set subjectReferenz(covariant Subject? value) =>
      RealmObjectBase.set(this, 'subjectReferenz', value);

  @override
  RealmList<int> get marks =>
      RealmObjectBase.get<int>(this, 'marks') as RealmList<int>;
  @override
  set marks(covariant RealmList<int> value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<SubjectMarksPerCollection>> get changes =>
      RealmObjectBase.getChanges<SubjectMarksPerCollection>(this);

  @override
  Stream<RealmObjectChanges<SubjectMarksPerCollection>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<SubjectMarksPerCollection>(this, keyPaths);

  @override
  SubjectMarksPerCollection freeze() =>
      RealmObjectBase.freezeObject<SubjectMarksPerCollection>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'subjectReferenz': subjectReferenz.toEJson(),
      'marks': marks.toEJson(),
    };
  }

  static EJsonValue _toEJson(SubjectMarksPerCollection value) =>
      value.toEJson();
  static SubjectMarksPerCollection _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'subjectReferenz': EJsonValue subjectReferenz,
        'marks': EJsonValue marks,
      } =>
        SubjectMarksPerCollection(
          fromEJson(id),
          subjectReferenz: fromEJson(subjectReferenz),
          marks: fromEJson(marks),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(SubjectMarksPerCollection._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, SubjectMarksPerCollection,
        'SubjectMarksPerCollection', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('subjectReferenz', RealmPropertyType.object,
          optional: true, linkTarget: 'Subject'),
      SchemaProperty('marks', RealmPropertyType.int,
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
