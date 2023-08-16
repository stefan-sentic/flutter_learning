import 'package:flutter/cupertino.dart';
import 'package:learning/todoey/model/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy detergent', isFinished: true),
  ];

  Task getTask(int index) => _tasks[index];

  int get taskCount => _tasks.length;

  void addTask(String task) {
    _tasks.add(Task(name: task));
    notifyListeners();
  }

  void updateTaskCompletion(int index) {
    _tasks[index].isFinished = !_tasks[index].isFinished;
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
