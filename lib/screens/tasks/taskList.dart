import 'package:flutter/material.dart';
import 'package:process_flow/extensions/context_extension.dart';
import 'package:process_flow/models/task.dart';
import 'package:process_flow/provider/task_provider.dart';
import 'package:process_flow/screens/tasks/task.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<TaskProvider>(
        builder: ((context, value, child) {
          return GridView.builder(
            itemCount: value.taskList.length,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext ctx, int index) {
              return Task(
                  taskName: value.taskList[index].taskName,
                  taskDescription: value.taskList[index].taskDesc);
            },
          );
        }),
      ),
    );
  }
}
