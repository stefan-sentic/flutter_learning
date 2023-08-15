import 'package:flutter/material.dart';
import 'package:learning/todoey/component/task_item.dart';

import '../task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          task: widget.tasks[index],
          taskCompletionCallback: (isTaskFinished) {
            setState(() {
              widget.tasks[index].isFinished = isTaskFinished ?? false;
            });
          },
        );
      },
    );
  }
}
