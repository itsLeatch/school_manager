import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:school_manager/database/schema.dart';
import 'package:school_manager/main.dart';
import 'package:school_manager/utils/DateTimeToString.dart';

class TableView extends StatefulWidget {
  TableView({super.key, required this.filter, this.showFealdForMark = false});
  //remove the element if the function returns false
  bool Function(Event) filter;
  bool showFealdForMark;

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  List<DataColumn> columns = [
    DataColumn(
        label: Expanded(
      child: Text("Description"),
    )),
    DataColumn(
        label: Expanded(
      child: Text("Subject"),
    )),
    DataColumn(
        label: Expanded(
      child: Text("Type"),
    )),
    DataColumn(
        label: Expanded(
      child: Text("Date"),
    )),
    DataColumn(
        label: Expanded(
      child: Text("Done"),
    )),
  ];

  List<TextEditingController> descriptionControllers = [];
  List<DataRow> rows = [];
  late RealmResults<Event> databaseEventEntries;

  void checkForEmpty(RealmResults<Event> events) {
    print("Hi");
    appState.database.writeAsync(() {
        var removedItems = events.where((element) =>
            element.description.isEmpty &&
            element.mark == null &&
            element.subject == null &&
            element.type == null);
        appState.database.deleteMany(removedItems);

        //add an empty event at the end to add new events later
        Event emptyLast = Event(ObjectId(), "", DateTime.now(), false);
        appState.database.add(emptyLast);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.showFealdForMark) {
      columns.add(DataColumn(
          label: Expanded(
        child: Text("Mark"),
      )));
    }

    databaseEventEntries = appState.database.all<Event>();
    databaseEventEntries.changes.listen(
      (event) {
        databaseEventEntries = appState.database.all<Event>();
        setState(() {
          buildDatabaseEntries(databaseEventEntries);
        });
      },
    );

    checkForEmpty(databaseEventEntries);
    //because the function above triggers a change event the the databaseEventEntries will be updated
    //buildDatabaseEntries(databaseEventEntries);
  }

  void buildDatabaseEntries(RealmResults<Event> events) {
    descriptionControllers = List.generate(events.length, (index) {
      return TextEditingController(text: events[index].description)
        ..addListener(() {
          setState(() {
            appState.database.write(
              () {
                events[index].description = descriptionControllers[index].text;
              },
            );
          });
        });
    });

    rows = List.generate(events.length, (index) {
      Event e = events[index];
      return DataRow(cells: [
        DataCell(TextField(
          controller: descriptionControllers[index],
          onChanged: (value) {
            e.description = value;
          },
        )),
        DataCell(Container(
            color: e.subject?.color?.toFlutterColor(),
            child: Center(child: Text(e.subject?.name ?? "")))),
        DataCell(Container(
            color: e.type?.color?.toFlutterColor(),
            child: Center(child: Text(e.type?.name ?? "")))),
        DataCell(
            onTap: () => print("implement date picker"),
            Text(dateTimeToString(e.deadline))),
        DataCell(Checkbox(
            value: e.isDone,
            onChanged: (value) {
              setState(() {
                appState.database.write(() {
                  e.isDone = value ?? false;
                });
              });
            })),
        if (widget.showFealdForMark) DataCell(Text(e.mark.toString()))
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: DataTable(
        columns: columns,
        rows: rows,
      ),
    );
  }
}
