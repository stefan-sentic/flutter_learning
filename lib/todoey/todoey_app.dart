import 'package:flutter/material.dart';
import 'package:learning/todoey/screen/tasks_screen.dart';
import 'package:provider/provider.dart';

import 'model/task_data.dart';

class TodoeyApp extends StatelessWidget {
  const TodoeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final taskData = TaskData();

    return ChangeNotifierProvider<TaskData>(
      create: (context) => taskData,
      child: const TasksScreen(),
    );
  }
}
