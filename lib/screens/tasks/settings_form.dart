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
          const CustomSizedBox(size: 20),
          TextFormField(
            decoration: textInputDecoration,
            onChanged: (val) => setState(() => _taskDesc = val),
          ),
          const CustomSizedBox(size: 20),
          TextFormField(
            decoration: textInputDecoration,
            onChanged: (val) => setState(() => _taskName = val),
          ),
          const CustomSizedBox(size: 20),
          Checkbox(
              value: _isChecked,
              onChanged: (val) {
                setState(() {
                  _isChecked = !_isChecked;
                });
              }),
          ElevatedButton(
              onPressed: (() {
                Provider.of<TaskProvider>(context, listen: true).addTask(
                    TaskModel(
                        taskName: _taskName,
                        taskDesc: _taskDesc,
                        isDone: _isChecked,
                        id: (Provider.of<TaskProvider>(context, listen: false)
                                    .taskList
                                    .length +
                                1)
                            .toString()));
              }),
              child: const Text("Update")),
        ]));
  }
}

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    Key? key,
    required this.size,
  }) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}
