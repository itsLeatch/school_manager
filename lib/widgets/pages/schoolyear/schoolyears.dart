import 'package:flutter/material.dart';
import 'package:school_manager/database/schema.dart';
import 'package:school_manager/main.dart';
import 'package:school_manager/widgets/pages/schoolyear/addSchoolyear.dart';
import 'package:school_manager/widgets/pages/subjects/addSubjectDialog.dart';

class SchoolYearTile extends StatelessWidget {
  SchoolYearTile(
      {super.key,
      required this.schoolYear,
      required this.onRemove,
      required this.onEdit});

  SchoolYear schoolYear;
  Function() onRemove;
  Function(SchoolYear) onEdit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
           onTap: () {
          onEdit(schoolYear);
        } ,
          child: Container(
            decoration: BoxDecoration(
              color: schoolYear.color?.toFlutterColor(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                          child: Text(
                    schoolYear.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ))),
                  IconButton(onPressed: onRemove, icon: Icon(Icons.delete))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SchoolYearPage extends StatefulWidget {
  const SchoolYearPage({super.key});

  @override
  State<SchoolYearPage> createState() => _SchoolYearPageState();
}

class _SchoolYearPageState extends State<SchoolYearPage> {
  List<SchoolYear> schoolYears = [];

  void initState() {
    super.initState();
    var realmSchoolYears = appState.database.all<SchoolYear>();
    schoolYears = realmSchoolYears.toList();
    realmSchoolYears.changes.listen((event) {
      setState(() {
        schoolYears = realmSchoolYears.toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Schoolyears",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              IconButton(
                  onPressed: () {
                    showAddSchoolyearDialog(context, null).then((value) {
                      if (value != null) {
                        appState.database.write(() {
                          appState.database.add(value);
                        });
                      }
                    });
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemCount: schoolYears.length,
            itemBuilder: (context, index) {
              return SchoolYearTile(
                schoolYear: schoolYears[index],
                onRemove: () {
                  appState.database.write(() {
                    appState.database.delete<SchoolYear>(schoolYears[index]);
                  });
                },
                onEdit: (schoolYear) {
                  showAddSchoolyearDialog(context, schoolYear).then((value) {
                    if (value != null) {
                      appState.database.write(() {
                        schoolYear.name = value.name;
                        schoolYear.color = value.color;
                      });
                    }
                  });
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
