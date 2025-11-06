import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/domain/entities/notification_entity.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends NotificationEntity {
  NotificationModel(
      {super.id,
      super.userId,
      super.message,
      super.status,
      super.createdAt,
      super.isSuccess,
      super.projectId,
      super.description});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  String generateTitle() {
    if (isSuccess == "success") {
      return "Project Report";
    } else {
      return "Project Deadline";
    }
  }

  String duration() {
    DateTime now = DateTime.now();
    DateTime current = DateTime.tryParse(createdAt!) ?? now;

    Duration diff = now.difference(current);
    if (diff.inDays > 0) {
      return "${diff.inDays}d";
    } else if ((diff.inHours % 24) > 0) {
      return "${diff.inHours % 24}h";
    } else if ((diff.inMinutes % 60) > 0) {
      return "${diff.inHours % 60}m";
    } else {
      return "0m";
    }
  }
}
