import 'package:realm/realm.dart';  // import realm package

part 'schema.realm.dart'; // declare a part file.

//the basic informations about a subject
@RealmModel() 
class _Subject {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String name;
  //The color in hex format
  late String colorCode;  
}
// for every new school year a new collection of marks is created
@RealmModel()
class _MarkCollection {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String name;
  late List<_SubjectMarksPerCollection> subjectMarks;
}

// the marks for a subject in a collection are store here
@RealmModel() 
class _SubjectMarksPerCollection {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late _Subject? subjectReferenz;
  //The color in hex format
  late List<int> marks; 
}