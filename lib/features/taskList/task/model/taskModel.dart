import 'package:json_annotation/json_annotation.dart';

part 'taskModel.g.dart';

@JsonSerializable()
class TaskModel {
  // DateTime createdTime;
  String taskDesc;
  String taskName;
  bool isDone;
  String? id;

  TaskModel(
      { //required this.createdTime,
      required this.id,
      required this.isDone,
      required this.taskName,
      required this.taskDesc});

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  // TaskModel(
  //       //createdTime: Utils.toDateTime(json['createdTime']),
  //       taskName: json['title'],
  //       taskDesc: json['description'],
  //       id: json['id'],
  //       isDone: json['isDone'],
  //     );

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  // {
  //       //'createdTime': Utils.fromDateTimeToJson(createdTime),
  //       'title': taskName,
  //       'description': taskDesc,
  //       'id': id,
  //       'isDone': isDone,
  //     };
}
