import 'package:flutter/material.dart';
import 'package:realm/realm.dart';  // import realm package

part 'schema.realm.dart'; // declare a part file.

@RealmModel() 
class _RealmColor {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late int colorR;
  late int colorG;
  late int colorB;
  late int alpha;
  
    _RealmColor FromFlutterColor(Color color) {
    return _RealmColor()
      ..colorR = color.red
      ..colorG = color.green
      ..colorB = color.blue
      ..alpha = color.alpha;
  }

  Color toFlutterColor() {
    return Color.fromARGB(alpha, colorR, colorG, colorB);
  }
}

//the basic informations about a subject
@RealmModel() 
class _Subject {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String name;
  late _RealmColor? color;
}

@RealmModel()
class _EventType {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String name;
  late bool isTermPaper;
  late _RealmColor? color;

}


@RealmModel()
class _Event {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String description;
  late _Subject? subject;
  late _EventType? type;
  late DateTime deadline;
  late bool isDone;
  late double? mark;
}

@RealmModel()
class _SchoolYear {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String name;
  late _RealmColor? color;
  late DateTime start;
  late DateTime end;
}
