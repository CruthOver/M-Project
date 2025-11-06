import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/data/models/project/project_model.dart';

class GetProjectHomeEntity {
  @JsonKey(name: "proyek_melewati_deadline")
  int? totalProjectDeadline;
  @JsonKey(name: "projects")
  List<ProjectModel>? projects;

  GetProjectHomeEntity({this.projects, this.totalProjectDeadline});
}
