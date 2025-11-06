import 'package:json_annotation/json_annotation.dart';

class ProjectSummaryEntity {
  @JsonKey(name: "sedang_berjalan")
  int? onGoing;
  @JsonKey(name: "deadline")
  int? deadline;
  @JsonKey(name: "selesai")
  int? finished;
  @JsonKey(name: "total_pekerjaan")
  int? totalJob;

  ProjectSummaryEntity({this.onGoing, this.deadline, this.finished, this.totalJob});
}
