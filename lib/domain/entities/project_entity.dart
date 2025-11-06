import 'package:json_annotation/json_annotation.dart';

class ProjectEntity {
  @JsonKey(name: "id")
  int? projectId;
  @JsonKey(name: "penyedia_id")
  int? penyediaId;
  @JsonKey(name: "perusahaan")
  String? companyName;
  @JsonKey(name: "nama")
  String? projectName;
  @JsonKey(name: "deadline")
  String? deadlineDate;
  @JsonKey(name: "no_pekerjaan")
  String? workNo;
  @JsonKey(name: "week")
  int? week;
  @JsonKey(name: "duration")
  String? duration;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  String? location;
  String? projectDate;
  @JsonKey(name: "realization")
  dynamic realization;

  ProjectEntity(
      {this.projectId,
      this.projectName,
      this.companyName,
      this.deadlineDate,
      this.week,
      this.location,
      this.projectDate,
      this.duration,
      this.status,
      this.realization});
}
