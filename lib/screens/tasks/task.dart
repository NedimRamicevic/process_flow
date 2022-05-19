import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task(
      {Key? key,
      required this.isDone,
      required this.taskName,
      required this.taskDescription})
      : super(key: key);

  final String taskName;
  final String taskDescription;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        leading: const Icon(Icons.access_alarm),
        title: Text(
          taskName,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          taskDescription,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        trailing: Text(
          isDone.toString(),
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );
  }
}
