import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:process_flow/models/task.dart';

class FirestoreDatabaseService {
  final CollectionReference taskCollection =
      FirebaseFirestore.instance.collection("task");

  final String uid;

  FirestoreDatabaseService({required this.uid});

  Stream<List<TaskModel>> get tasks {
    return taskCollection.snapshots().map(_taskListFromSnapshot);
  }

  List<TaskModel> _taskListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return TaskModel(
          id: e['id'],
          isDone: e['isDone'],
          taskName: e['title'],
          taskDesc: e['description']);
    }).toList();
  }
}
