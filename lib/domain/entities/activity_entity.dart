import 'package:json_annotation/json_annotation.dart';

class ActivityEntity {
  @JsonKey(name: "nama_project")
  String? projectName;
  @JsonKey(name: "aktifitas")
  String? activity;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  ActivityEntity({this.projectName, this.activity, this.createdAt, this.updatedAt});
}
