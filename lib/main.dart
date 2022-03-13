import 'package:flutter/material.dart';
import 'package:process_flow/screens/tasks/home.dart';
import 'package:provider/provider.dart';

import 'provider/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: const MaterialApp(title: 'Flutter Demo', home: Home()));
  }
}
