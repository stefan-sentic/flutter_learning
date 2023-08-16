import 'package:flutter/material.dart';
import 'package:learning/todoey/model/task_data.dart';
import 'package:learning/todoey/screen/tasks_screen.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String taskName = "";
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
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
                Provider.of<TaskData>(context, listen: false).addTask(taskName);
                Navigator.pop(context);
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
