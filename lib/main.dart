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
  PageController pageController = PageController();

  final Duration pageAnimationDuartion = const Duration(milliseconds: 300);
  final Curve pageAnimationCurve = Curves.easeInOut;

  // update this value if some touch inputs happen, without the navigation bar involved
  int currentPageIndex = 0;

  //keep the page index even on state changes
  final Key pageViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page?.round() ?? 0;
        print(currentPageIndex);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<AppPage> pages = [
      AppPage(
          "Settings",
          Icons.settings,
          Container(color: Colors.blue)),
      AppPage(
          "Home",
          Icons.home,
          Container(
            color: Colors.red,
          )),
      AppPage("Subjects", Icons.book, Container(color: Colors.green)),
      AppPage("Marks", Icons.grade, Container(color: Colors.yellow)),
    ];

    return MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        home: appScaffold(
            navigationBar: NavigationBar(
              selectedIndex: currentPageIndex,
              onDestinationSelected: (value) {
                setState(() {
                  pageController.animateToPage(value,
                      duration: pageAnimationDuartion,
                      curve: pageAnimationCurve);
                });
              },
              destinations: List.generate(pages.length, (index) {
                return NavigationDestination(
                    label: pages[index].title, icon: Icon(pages[index].icon));
              }),
            ),
            navigationRail: NavigationRail(
              selectedIndex:
                  currentPageIndex, // this value must be updated when the page changes
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: (value) {
                setState(() {
                  pageController.animateToPage(value,
                      duration: pageAnimationDuartion,
                      curve: pageAnimationCurve);
                });
              },
              destinations: List.generate(pages.length, (index) {
                return NavigationRailDestination(
                    icon: Icon(pages[index].icon),
                    label: Text(pages[index].title));
              }),
            ),
            body: PageView(
              key: pageViewKey,
              controller: pageController,
              scrollDirection: Axis.vertical,
              children: List.generate(
                pages.length,
                (index) {
                  return pages[index].page;
                },
              ),
            )));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
