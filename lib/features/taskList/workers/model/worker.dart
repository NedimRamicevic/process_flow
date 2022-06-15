import 'package:json_annotation/json_annotation.dart';

part 'worker.g.dart';

@JsonSerializable()
class Worker {
  int? id;
  String? name;
  String? username;
  String? email;

  Worker({this.id, this.name, this.username, this.email});

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerToJson(this);
}
