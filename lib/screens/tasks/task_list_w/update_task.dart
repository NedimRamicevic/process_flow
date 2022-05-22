import 'package:flutter/material.dart';
import 'package:process_flow/provider/firestore_database_service.dart';
import 'package:provider/provider.dart';

import '../../../models/task.dart';
import '../../../shared/constants.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  final _formKey = GlobalKey<FormState>();

  final String _title = "Edit Task";
  String _taskName = "";
  String _taskDesc = "";
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
          key: _formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(_title),
            const CustomSizedBox(
              size: 20,
            ),
            TextFormField(
              decoration: textInputDecoration,
              onChanged: (val) => setState(() => _taskDesc = val),
            ),
            const CustomSizedBox(
              size: 20,
            ),
            TextFormField(
              decoration: textInputDecoration,
              onChanged: (val) => setState(() => _taskName = val),
            ),
            const CustomSizedBox(
              size: 20,
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
                  Provider.of<FirestoreDatabaseService>(context, listen: false)
                      .updateTask(TaskModel(
                          taskName: _taskName,
                          taskDesc: _taskDesc,
                          isDone: _isChecked,
                          id: widget.id));
                  Navigator.of(context).pop();
                }),
                child: const Text("Update")),
          ])),
    );
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
