import 'package:flutter/material.dart';
import 'package:learning/todoey/model/task.dart';
import 'package:learning/todoey/screen/tasks_screen.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final void Function(bool?) taskCompletionCallback;
  final VoidCallback taskDeleteCallback;

  const TaskItem(
      {super.key,
      required this.task,
      required this.taskCompletionCallback,
      required this.taskDeleteCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: taskDeleteCallback,
      title: Text(
        task.name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          decoration: task.isFinished ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: task.isFinished,
        onChanged: taskCompletionCallback,
        activeColor: appThemeColor,
      ),
    );
  }
}
