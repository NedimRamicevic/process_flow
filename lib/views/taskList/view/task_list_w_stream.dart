library task_list_w_stream;

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:process_flow/views/taskList/service/firestore_database_service.dart';
import '../model/taskModel.dart';
import './task.dart';
import './update_task.dart';
import 'package:process_flow/shared/extensions/context_extension.dart';
import 'package:provider/provider.dart';

import 'update_task.dart';

part 'slidable_list_item.dart';

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
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: context.mediumHeightValue),
      // margin: EdgeInsets.all(context.lowHeighthValue),
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
                return SlidableListItem(taskList: taskList, index: index);
              },
            ),
    );
  }
}
