import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:school_manager/database/schema.dart';
import 'package:school_manager/main.dart';
import 'package:school_manager/widgets/pages/subjects/addSubjectDialog.dart';

class SubjectListTile extends StatelessWidget {
  SubjectListTile(
      {super.key,
      required this.subject,
      required this.onRemove,
      required this.onEdit});

  Subject subject;
  Function() onRemove;
  Function(Subject) onEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: ValueKey<ObjectId>(subject.id),
        onDismissed: (direction) {
          onRemove();
        },
        background: Container(
          color: Colors.red,
          child: Icon(Icons.delete),
        ),
        child: SizedBox(
          height: 64,
          width: double.infinity,
          child: InkWell(
            onTap: () {
              onEdit(subject);
            },
            child: Container(
              decoration: BoxDecoration(
                color: subject.color?.toFlutterColor(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    subject.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  List<Subject> subjects = [];

  void initState() {
    super.initState();
    var realmSubjects = appState.database.all<Subject>();
    subjects = realmSubjects.toList();
    realmSubjects.changes.listen((event) {
      setState(() {
        realmSubjects = appState.database.all<Subject>();
        subjects = realmSubjects.toList();
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
                "Subjects",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              IconButton(
                  onPressed: () {
                    showAddSubjectDialog(context, null).then((value) {
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
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              return SubjectListTile(
                subject: subjects[index],
                onRemove: () {
                  appState.database.write(() {
                    appState.database.delete<Subject>(subjects[index]);
                  });
                },
                onEdit: (subject) {
                  showAddSubjectDialog(context, subject).then((value) {
                    if (value != null) {
                      appState.database.write(() {
                        subject.name = value.name;
                        subject.color = value.color;
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
