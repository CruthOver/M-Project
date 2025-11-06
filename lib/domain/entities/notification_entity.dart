import 'package:json_annotation/json_annotation.dart';

class NotificationEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "pesan")
  String? message;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "is_success")
  String? isSuccess;
  @JsonKey(name: "proyek_id")
  String? projectId;
  @JsonKey(name: "keterangan")
  String? description;

  NotificationEntity(
      {this.id,
      this.userId,
      this.message,
      this.status,
      this.createdAt,
      this.isSuccess,
      this.projectId,
      this.description});
}
