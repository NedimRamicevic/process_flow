import 'package:flutter/material.dart';
import 'package:process_flow/models/task.dart';
import 'package:process_flow/provider/firestore_database_service.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_guid/flutter_guid.dart';
import '../../shared/constants.dart';

class TaskAddForm extends StatefulWidget {
  const TaskAddForm({Key? key}) : super(key: key);

  @override
  State<TaskAddForm> createState() => _TaskAddFormState();
}

class _TaskAddFormState extends State<TaskAddForm> {
  final _formKey = GlobalKey<FormState>();

  final String _title = "Add Task";
  String _taskName = "";
  String _taskDesc = "";
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Card(
        elevation: 0,
        child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(_title),
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
                    Provider.of<FirestoreDatabaseService>(context,
                            listen: false)
                        .addTask(TaskModel(
                            taskName: _taskName,
                            taskDesc: _taskDesc,
                            isDone: _isChecked,
                            id: Guid.newGuid.toString()));
                    Navigator.of(context).pop();
                  }),
                  child: const Text("Update")),
            ])),
      ),
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
