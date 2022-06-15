// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String,
      isDone: json['isDone'] as bool,
      taskName: json['taskName'] as String,
      taskDesc: json['taskDesc'] as String,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'taskDesc': instance.taskDesc,
      'taskName': instance.taskName,
      'isDone': instance.isDone,
      'id': instance.id,
    };
