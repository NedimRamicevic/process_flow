import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:process_flow/extensions/context_extension.dart';
import 'package:process_flow/models/task.dart';
import 'package:process_flow/screens/tasks/task.dart';
import 'package:process_flow/screens/tasks/update_task.dart';
import 'package:provider/provider.dart';

class TaskListWithStream extends StatefulWidget {
  const TaskListWithStream({Key? key}) : super(key: key);

  @override
  State<TaskListWithStream> createState() => _TaskListWithStreamState();
}

class _TaskListWithStreamState extends State<TaskListWithStream> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> taskList = Provider.of<List<TaskModel>>(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: context.mediumHeightValue),
      margin: EdgeInsets.all(context.lowHeighthValue),
      child: (Provider.of<List<TaskModel>?>(context) == null)
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: taskList.length,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4,
                  crossAxisCount: 1,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0),
              itemBuilder: (BuildContext ctx, int index) {
                return Slidable(
                  key: ValueKey(taskList[index].id),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: ((context) {
                          null;
                        }),
                        backgroundColor: Theme.of(context).colorScheme.onError,
                        foregroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (ctx) {
                          showDialog(
                              context: context,
                              builder: (context) => UpdateTask(
                                  id: taskList[index].id.toString()));
                        },
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  child: Task(
                    taskName: taskList[index].taskName,
                    taskDescription: taskList[index].taskDesc,
                    isDone: taskList[index].isDone,
                  ),
                );
              },
            ),
    );
  }
}
