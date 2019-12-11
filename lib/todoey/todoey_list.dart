import 'package:flutter/material.dart';
import 'package:flutter_learn/todoey/todoey_item.dart';
import 'package:flutter_learn/todoey/todoey_task_model_provider.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, myData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final currentTodo = myData.todos[index];
            return GestureDetector(
              onLongPress: () {
                myData.deleteTodo(currentTodo);
              },
              child: ItemListTodo(
                todo: currentTodo.name,
                value: currentTodo.value,
                onChangedCheck: (v) {
                  myData.updateTodo(currentTodo);
                },
              ),
            );
          },
          itemCount: myData.count,
        );
      },
    );
  }
}
