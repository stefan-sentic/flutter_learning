import 'package:flutter/material.dart';
import 'package:learning/todoey/screen/tasks_screen.dart';

import '../task.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(Task) addTaskCallback;

  const AddTaskScreen({super.key, required this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    String taskName = "";
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appThemeColor,
                fontSize: 24,
              ),
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Enter task name"),
              autofocus: true,
              onChanged: (newValue) {
                taskName = newValue;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: appThemeColor),
              onPressed: () {
                addTaskCallback(Task(name: taskName));
              },
              child: const Text("Add"),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
