

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:realm/realm.dart';
import 'package:school_manager/database/schema.dart';
import 'package:school_manager/utils/DateTimeToString.dart';

Future<SchoolYear?> showAddSchoolyearDialog(BuildContext context, SchoolYear? initSchoolYear) {
  String name = initSchoolYear?.name ?? "";
  Color color = initSchoolYear?.color?.toFlutterColor() ?? Colors.deepOrange;
  DateTime start = initSchoolYear?.start ?? DateTime.now();
  DateTime end = initSchoolYear?.end ?? DateTime.now();


  return showDialog<SchoolYear>(
    context: context,
    builder: (context) {
      return Dialog(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: TextEditingController(text: name),
                  decoration: new InputDecoration(
                    hintText: 'Name',
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [TextButton(onPressed: () {
                  showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2100)).then((value) {
                    setState(() {
                      start = value ?? start;
                    });
                  },);
                }, child: Text("From: " + dateTimeToString(start))),TextButton(onPressed: () {
                  showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2100)).then((value) {
                    setState(() {
                      end = value ?? end;
                    });
                  },);
                }, child: Text("To: " + dateTimeToString(end)))],),
                Expanded(
                    child: Center(
                      child: ColorPicker(
                                    pickerColor: color,
                                    onColorChanged: (value) {
                      color = value;
                                    },
                                  ),
                    )),
                FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop(SchoolYear(
                          ObjectId(), name,start,end, color: RealmColor(ObjectId(),color.red, color.green, color.blue, color.alpha)));
                    },
                    child: Text("OK"))
              ],
                      ),
                    );
            }
          ));
    },
  );
}
