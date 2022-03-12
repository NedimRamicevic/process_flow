import 'package:flutter/material.dart';
import 'package:process_flow/models/task.dart';
import 'package:process_flow/screens/tasks/task.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> taskList = <TaskModel>[
    TaskModel(taskName: "Nedim", taskDesc: "Rastum", isDone: true, id: 1),
    TaskModel(taskName: "Nedim", taskDesc: "Rastum", isDone: false, id: 2)
  ];

  void addTask(TaskModel task) {
    taskList.add(task);
    notifyListeners();
  }

  void deleteTask(int taskId) {
    taskList.removeWhere((element) => element.id == taskId);
    notifyListeners();
  }

  void editTask(TaskModel task) {}
}
