import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:school_manager/database/schema.dart';
import 'package:school_manager/widgets/basic/appScaffold.dart';

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

class AppPage {
  final String title;
  final IconData icon;
  final Widget page;

  AppPage(this.title, this.icon, this.page);
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    List<AppPage> pages = [
      AppPage("Home", Icons.home, Container()),
      AppPage("Subjects", Icons.book, Container()),
      AppPage("Marks", Icons.grade, Container()),
      AppPage("Settings", Icons.settings, Container())
    ];

    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
        home: appScaffold(
      navigationBar: NavigationBar(
        destinations: List.generate(pages.length, (index) {
          return NavigationDestination(
              label: pages[index].title, icon: Icon(pages[index].icon));
        }),
      ),navigationRail: NavigationRail(selectedIndex: 0,labelType: NavigationRailLabelType.all,
        destinations: List.generate(pages.length, (index) {
          return NavigationRailDestination(
              icon: Icon(pages[index].icon), label: Text(pages[index].title));
        }),
      ),body: pages[0].page
    ));
  }
}
