import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:realm/realm.dart';
import 'package:school_manager/database/schema.dart';

Future<Subject?> showAddSubjectDialog(BuildContext context, Subject? initSubject) {
  String name = initSubject?.name ?? "";
  Color color = Colors.cyan;

  if(initSubject != null) {
    color = Color.fromARGB(255, initSubject.colorR, initSubject.colorG, initSubject.colorB);
  }

  return showDialog<Subject>(
    context: context,
    builder: (context) {
      return Dialog(
          child: Padding(
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
                  Navigator.of(context).pop(Subject(
                      ObjectId(), name, color.red, color.green, color.blue));
                },
                child: Text("OK"))
          ],
        ),
      ));
    },
  );
}
