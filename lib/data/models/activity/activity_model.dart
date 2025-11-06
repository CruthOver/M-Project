import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/domain/entities/activity_entity.dart';
part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel extends ActivityEntity {
  ActivityModel({super.projectName, super.activity, super.createdAt, super.updatedAt});

  factory ActivityModel.fromJson(Map<String, dynamic> json) => _$ActivityModelFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);

  String duration() {
    if (createdAt != null) {
      DateTime a = DateFormat('y-MM-dd H:m:s').parse(createdAt!);
      DateTime b = DateTime.now();

      Duration difference = b.difference(a);
      int hours = difference.inHours % 24;
      return "$hours h";
    }
    return "-";
  }
}
