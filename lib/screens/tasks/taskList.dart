import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:process_flow/extensions/context_extension.dart';
import 'package:process_flow/provider/task_provider.dart';
import 'package:process_flow/screens/tasks/task.dart';
import 'package:process_flow/screens/tasks/updateTask.dart';
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
        builder: ((ctx1, value, child) {
          return GridView.builder(
            itemCount: value.taskList.length,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4,
                crossAxisCount: 1,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0),
            itemBuilder: (BuildContext ctx, int index) {
              return Slidable(
                key: ValueKey(value.taskList[index].id),
                startActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context) {
                        value.deleteTask(index);
                      }),
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: (ctx) {
                        showDialog(
                            context: context,
                            builder: (context) => UpdateTask(
                                id: value.taskList[index].id.toString()));
                      },
                      backgroundColor: const Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Edit',
                    ),
                  ],
                ),
                child: Task(
                  taskName: value.taskList[index].taskName,
                  taskDescription: value.taskList[index].taskDesc,
                  isDone: value.taskList[index].isDone,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
