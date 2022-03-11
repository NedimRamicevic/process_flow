import 'package:flutter/material.dart';
import 'package:process_flow/provider/task_provider.dart';
import 'package:process_flow/screens/tasks/bottomNavBar.dart';
import 'package:provider/provider.dart';

import 'settingsForm.dart';
import 'taskList.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Container(
        color: Colors.amber,
        child: const TaskList(),
      ),
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
