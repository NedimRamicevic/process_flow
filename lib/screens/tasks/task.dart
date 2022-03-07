import 'package:flutter/material.dart';
import 'package:process_flow/extensions/context_extension.dart';

class Task extends StatelessWidget {
  const Task({Key? key, required this.taskName, required this.taskDescription})
      : super(key: key);

  final taskName;
  final taskDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.lowHeighthValue,
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
    );
  }
}
