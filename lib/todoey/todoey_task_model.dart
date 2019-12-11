import 'package:flutter/cupertino.dart';

class Task {
  final String name;
  bool value;

  Task({@required this.name, this.value = false});

  void toggleDone() {
    value = !value;
  }
}
