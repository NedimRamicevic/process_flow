import 'package:flutter/material.dart';
import 'package:process_flow/models/task.dart';
import 'package:process_flow/provider/task_provider.dart';
import 'package:provider/provider.dart';

import '../../shared/constants.dart';

class TaskAddForm extends StatefulWidget {
  const TaskAddForm({Key? key}) : super(key: key);

  @override
  State<TaskAddForm> createState() => _TaskAddFormState();
}

class _TaskAddFormState extends State<TaskAddForm> {
  final _formKey = GlobalKey<FormState>();

  String _taskName = "";
  String _taskDesc = "";
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          const Text("Update Your Settings"),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: textInputDecoration,
            onChanged: (val) => setState(() => _taskDesc = val),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: textInputDecoration,
            onChanged: (val) => setState(() => _taskName = val),
          ),
          const SizedBox(
            height: 10,
          ),
          Checkbox(
              value: _isChecked,
              onChanged: (val) {
                setState(() {
                  _isChecked = !_isChecked;
                });
              }),
          ElevatedButton(
              onPressed: (() {
                Provider.of<TaskProvider>(context, listen: false).addTask(
                    TaskModel(
                        taskName: _taskName,
                        taskDesc: _taskDesc,
                        isDone: _isChecked,
                        id: Provider.of<TaskProvider>(context, listen: false)
                                .taskList
                                .length +
                            1));
              }),
              child: const Text("Update")),
        ]));
  }
}
