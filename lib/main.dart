import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:school_manager/database/schema.dart';

void main() {
  runApp(Homescreen());
}

class Homescreen extends StatefulWidget {
  late Realm database;

  Homescreen({super.key}) {
    init();
  }

  void init() {
    loadDatabase();
  }

  void loadDatabase() {
    var config = Configuration.local([
      Subject.schema,
      MarkCollection.schema,
      SubjectMarksPerCollection.schema
    ]);
    database = Realm(config);
  }

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
