import 'package:flutter/material.dart';
import './task/model/taskModel.dart';
import './task/service/firestore_database_service.dart';
import './task/view/bottom_navbar.dart';
import 'package:provider/provider.dart';
import '../../provider/bottom_navbar_provider.dart';
import './task/view/add_task.dart';
import './task/view/task_list_w_stream.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final title = "Task List";
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarNotfier>(
      builder: (context, value, _) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(title),
        ),
        body: sortTask(value),
        bottomNavigationBar: const BottomNavBar(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const TaskAddForm();
                });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  StreamProvider<List<TaskModel>?> sortTask(BottomNavBarNotfier value) {
    return (value.sort == "all")
        ? StreamProvider.value(
            value: FirestoreDatabaseService(uid: "11").tasks,
            initialData: null,
            child: const TaskListWithStream())
        : (value.sort == "isDone")
            ? StreamProvider.value(
                value: FirestoreDatabaseService(uid: "11").tasksDone,
                initialData: null,
                child: const TaskListWithStream())
            : StreamProvider.value(
                value: FirestoreDatabaseService(uid: "11").tasksUndone,
                initialData: null,
                child: const TaskListWithStream());
  }
}
