import 'package:flutter/material.dart';
import 'package:process_flow/models/task.dart';
import 'package:process_flow/screens/tasks/task.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> taskList = <TaskModel>[];

  void addTask(TaskModel task) {
    taskList.add(task);
    notifyListeners();
  }
}
