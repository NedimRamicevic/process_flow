import 'package:flutter/material.dart';
import 'package:process_flow/extensions/context_extension.dart';

class Task extends StatelessWidget {
  const Task({Key? key, required this.taskName, required this.taskDescription})
      : super(key: key);

  final taskName;
  final taskDescription;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.access_alarm),
      title: Text(
        taskName,
        style: context.title,
      ),
      subtitle: Text(
        taskDescription,
        style: context.desc,
      ),
    );
  }
}
