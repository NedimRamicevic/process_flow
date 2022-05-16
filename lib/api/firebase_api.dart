import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:process_flow/models/task.dart';

class FirebaseApi {
  static Future<String> createTask(TaskModel task) async {
    final docTask = FirebaseFirestore.instance.collection("tasks").doc();

    task.id = docTask.id;
    await docTask.set(task.toJson());
    return docTask.id;
  }
}

