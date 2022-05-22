import 'package:flutter/material.dart';
import 'package:process_flow/provider/firestore_database_service.dart';
import 'package:process_flow/screens/tasks/bottom_navbar.dart';
import 'package:provider/provider.dart';

import '../../provider/bottom_navbar_provider.dart';
import 'add_task.dart';
import 'task_list_w/stream.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final title = "App Bar";
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarNotfier>(
      builder: (context, value, _) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(title),
        ),
        body: (value.sort == "all")
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
                    child: const TaskListWithStream()),
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
}
