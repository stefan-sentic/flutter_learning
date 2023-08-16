import 'package:flutter/material.dart';
import 'package:learning/todoey/component/task_item.dart';
import 'package:learning/todoey/model/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, tasksData, child) {
      return ListView.builder(
        itemCount: tasksData.taskCount,
        itemBuilder: (context, index) {
          return TaskItem(
            task: tasksData.getTask(index),
            taskCompletionCallback: (isTaskFinished) {
              tasksData.updateTaskCompletion(index);
            },
            taskDeleteCallback: () {
              tasksData.removeTask(index);
            },
          );
        },
      );
    });
  }
}
