import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/data/models/project/project_home_model.dart';
import 'package:management_project/data/models/project/project_summary_model.dart';
import 'package:management_project/data/models/user/user_model.dart';

class ProjectDashboardEntity {
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "project")
  ProjectSummaryModel? project;
  @JsonKey(name: "projects")
  List<ProjectHomeModel>? projects;

  ProjectDashboardEntity({this.user, this.project, this.projects});
}
