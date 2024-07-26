import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class AppState extends InheritedWidget {
  AppState({
    super.key,
    required Configuration configuration,
    required super.child,
  }){
    database = Realm(configuration);
  }

  late Realm database;

  static AppState? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppState>();
  }

  static AppState of(BuildContext context) {
    final AppState? result = maybeOf(context);
    assert(result != null, 'No AppState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppState oldWidget) => database != oldWidget.database;
}

