import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:process_flow/views/tasks/model/task.dart';

class FirestoreDatabaseService {
  final CollectionReference taskCollection =
      FirebaseFirestore.instance.collection("task");

  final String uid;

  FirestoreDatabaseService({required this.uid});

  Stream<List<TaskModel>?> get tasks {
    return taskCollection.snapshots().map(_taskListFromSnapshot);
  }

  Stream<TaskModel> get task {
    return taskCollection.doc(uid).snapshots().map(_taskModelFromSnapshot);
  }

  Stream<List<TaskModel>?> get tasksDone {
    return taskCollection
        .where('isDone', isEqualTo: true)
        .snapshots()
        .map(_taskListFromSnapshot);
  }

  Stream<List<TaskModel>?> get tasksUndone {
    return taskCollection
        .where('isDone', isEqualTo: false)
        .snapshots()
        .map(_taskListFromSnapshot);
  }

  Future createTask(String id,
      {String title = "new Task",
      String description = "new",
      bool isDone = false}) async {
    return await taskCollection.doc(id).set({
      'title': title,
      'description': description,
      'id': id,
      'isDone': isDone
    }, SetOptions(merge: true));
  }

  Future updateTask(TaskModel taskModel) async {
    return await taskCollection.doc(taskModel.id).set({
      'id': taskModel.id,
      'description': taskModel.taskDesc,
      'title': taskModel.taskName,
      'isDone': taskModel.isDone
    }, SetOptions(merge: true));
  }

  Future addTask(TaskModel taskModel) async {
    return await taskCollection.doc(taskModel.id).set({
      'id': taskModel.id,
      'description': taskModel.taskDesc,
      'title': taskModel.taskName,
      'isDone': taskModel.isDone
    }, SetOptions(merge: true));
  }

  void deleteTask(id) {
    taskCollection.doc(id).delete();
  }

  TaskModel _taskModelFromSnapshot(DocumentSnapshot snapshot) {
    return TaskModel(
        id: snapshot["id"],
        isDone: snapshot["isDone"],
        taskName: snapshot["title"],
        taskDesc: snapshot["description"]);
  }

  List<TaskModel>? _taskListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return TaskModel(
          id: e['id'],
          isDone: e['isDone'],
          taskName: e['title'],
          taskDesc: e['description']);
    }).toList();
  }
}
