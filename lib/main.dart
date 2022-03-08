import 'package:flutter/material.dart';
import 'package:process_flow/provider/task_provider.dart';
import 'package:process_flow/screens/tasks/task.dart';
import 'package:process_flow/screens/tasks/taskList.dart';

import 'screens/tasks/settingsForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: const SettingsForm(),
            );
          });
    }

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Container(
            color: Colors.amber,
            child: const TaskList(),
          ),
          bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(Icons.school),
                    onPressed: null,
                  ),
                ],
              )),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: null,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}
