import 'package:json_annotation/json_annotation.dart';

class ProjectHomeEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name_proyek")
  String? projectName;
  @JsonKey(name: "name_perusahaan")
  String? companyName;
  @JsonKey(name: "week")
  int? week;
  @JsonKey(name: "realization")
  dynamic realization;
  @JsonKey(name: "deadline")
  String? deadline;

  ProjectHomeEntity(
      {this.id, this.projectName, this.companyName, this.week, this.realization, this.deadline});
}
