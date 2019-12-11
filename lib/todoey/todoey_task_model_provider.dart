import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'todoey_task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _todos = [];

  void addTask(Task newTask) {
    _todos.add(newTask);
    notifyListeners();
  }

  int get count {
    return _todos.length;
  }

  UnmodifiableListView<Task> get todos {
    return UnmodifiableListView(_todos);
  }

  void updateTodo(Task t) {
    t.toggleDone();
    notifyListeners();
  }

  void deleteTodo(Task t) {
    _todos.remove(t);
    notifyListeners();
  }
}
