import 'package:flutter/material.dart';
import 'package:process_flow/screens/tasks/task.dart';
import 'package:process_flow/screens/tasks/taskList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Container(
          color: Colors.amber,
          child: const TaskList(),
        ));
  }
}
