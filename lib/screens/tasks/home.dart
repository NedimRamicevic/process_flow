import 'package:flutter/material.dart';
import 'package:process_flow/provider/firestore_database_service.dart';
import 'package:process_flow/screens/tasks/bottom_navbar.dart';
import 'package:provider/provider.dart';

import 'settings_form.dart';
import 'task_list_w/stream.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final title = "App Bar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamProvider.value(
          value: FirestoreDatabaseService(uid: "11").tasks,
          initialData: null,
          child: const TaskListWithStream()),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: const TaskAddForm(),
                );
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
