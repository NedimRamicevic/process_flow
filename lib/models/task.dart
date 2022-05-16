class TaskModel {
  // DateTime createdTime;
  String taskDesc;
  String taskName;
  bool isDone;
  String id;

  TaskModel(
      { //required this.createdTime,
      required this.id,
      required this.isDone,
      required this.taskName,
      required this.taskDesc});

  static TaskModel fromJson(Map<String, dynamic> json) => TaskModel(
        //createdTime: Utils.toDateTime(json['createdTime']),
        taskName: json['title'],
        taskDesc: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        //'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': taskName,
        'description': taskDesc,
        'id': id,
        'isDone': isDone,
      };
}
