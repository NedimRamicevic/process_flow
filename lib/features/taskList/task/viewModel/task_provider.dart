import 'package:flutter/material.dart';
import '../model/taskModel.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> taskList = <TaskModel>[
    TaskModel(taskName: "Nedim", taskDesc: "Rastum", isDone: true, id: "0"),
    TaskModel(taskName: "Nedim", taskDesc: "Rastum", isDone: false, id: "1")
  ];

  // void addTask(TaskModel task) => FirebaseApi.createTask(task);

  void addTask(TaskModel task) {
    taskList.add(task);
  }

  void deleteTask(String taskId) {
    taskList.removeWhere((element) => element.id == taskId);
    notifyListeners();
  }

  void editTask(TaskModel task) {}
}
