import 'package:flutter/material.dart';
import 'package:process_flow/screens/tasks/task.dart';

class taskProvider extends ChangeNotifier {
  List taskList = [];

  void addTask(Task task) {
    taskList.add(task);
    notifyListeners();
  }
}
