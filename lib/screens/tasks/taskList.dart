import 'package:flutter/material.dart';
import 'package:process_flow/extensions/context_extension.dart';
import 'package:process_flow/screens/tasks/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: context.mediumHeightValue),
      margin: EdgeInsets.all(context.lowHeighthValue),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 20,
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 20,
        children: const [
          Task(taskName: "Nedim", taskDescription: "Naber"),
          Task(taskName: "Nedim", taskDescription: "Naber"),
          Task(taskName: "Nedim", taskDescription: "Naber"),
          Task(taskName: "Nedim", taskDescription: "Naber"),
          Task(taskName: "Nedim", taskDescription: "Naber"),
          Task(taskName: "Nedim", taskDescription: "Naber"),
          Task(taskName: "Nedim", taskDescription: "Naber"),
          Task(taskName: "Nedim", taskDescription: "Naber"),
        ],
      ),
    );
  }
}
