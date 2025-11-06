import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/data/models/project/project_home_model.dart';
import 'package:management_project/data/models/project/project_summary_model.dart';
import 'package:management_project/data/models/user/user_model.dart';
import 'package:management_project/domain/entities/project_dashboard_entity.dart';
part 'project_dashboard_model.g.dart';

@JsonSerializable()
class ProjectDashboardModel extends ProjectDashboardEntity {
  ProjectDashboardModel({super.user, super.project, super.projects});

  factory ProjectDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDashboardModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectDashboardModelToJson(this);
}
