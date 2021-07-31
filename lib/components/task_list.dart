import 'package:flutter/material.dart';
import 'package:todo_list/components/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: (bool? checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallback: () {
              taskData.removeTask(index);
            },
          );
        },
        itemCount: taskData.tasks.length,
      );
    });
  }
}
