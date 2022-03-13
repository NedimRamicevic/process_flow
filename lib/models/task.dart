class TaskModel {
  final String taskDesc;
  final String taskName;
  final bool isDone;
  final int id;

  TaskModel(
      {required this.id,
      required this.isDone,
      required this.taskName,
      required this.taskDesc});
}
