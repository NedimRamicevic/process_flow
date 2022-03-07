import 'package:flutter/material.dart';
import 'package:process_flow/extensions/context_extension.dart';

class Task extends StatelessWidget {
  const Task({Key? key, required this.taskName, required this.taskDescription})
      : super(key: key);

  final taskName;
  final taskDescription;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.lowWidthValue,
                vertical: context.mediumHeightValue),
            child: Column(children: [
              Text(
                taskName,
                style: context.title,
              ),
              Text(
                taskDescription,
                style: context.desc,
              )
            ])),
      ),
    );
  }
}
