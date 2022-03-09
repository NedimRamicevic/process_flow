import 'package:flutter/material.dart';
import 'package:process_flow/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> taskList = <TaskModel>[
    TaskModel(taskName: "Nedim", taskDesc: "Rastum"),
    TaskModel(taskName: "Nedim", taskDesc: "Rastum")
  ];

  void addTask(TaskModel task) {
    taskList.add(task);
    notifyListeners();
  }
}
