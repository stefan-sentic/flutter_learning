import 'package:flutter/material.dart';
import 'package:learning/todoey/component/tasks_header.dart';
import 'package:learning/todoey/model/task_data.dart';
import 'package:learning/todoey/screen/add_task_screen.dart';
import 'package:provider/provider.dart';

import '../component/task_list.dart';

const appThemeColor = Colors.lightBlueAccent;

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(context),
      backgroundColor: appThemeColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TasksHeader(),
          buildList(),
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: appThemeColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        final model = Provider.of<TaskData>(context,listen:false);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          builder: (context) => ListenableProvider(
            create: (context) => model,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildList() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: TaskList(),
        ),
      ),
    );
  }
}
