import 'package:flutter/material.dart';
import 'package:school_manager/database/schema.dart';
import 'package:school_manager/main.dart';
import 'package:school_manager/widgets/pages/Events/tableView.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return TableView(
      filter: (Event event) {
        return true;
      },
    );
  }
}