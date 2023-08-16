import 'package:flutter/material.dart';
import 'package:learning/todoey/model/task_data.dart';
import 'package:provider/provider.dart';

import '../screen/tasks_screen.dart';

class TasksHeader extends StatelessWidget {
  const TasksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Icon(Icons.list, size: 30, color: appThemeColor),
          ),
          const SizedBox(height: 28),
          const Text(
            'Todoey',
            style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
          ),
          Text(
            '${context.watch<TaskData>().taskCount} Tasks',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
