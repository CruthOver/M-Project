import 'package:json_annotation/json_annotation.dart';

class ProgressEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "proyek_id")
  int? projectId;
  @JsonKey(name: "week")
  int? week;
  @JsonKey(name: "start_date")
  String? dateStart;
  @JsonKey(name: "end_date")
  String? dateEnd;
  @JsonKey(name: "waktu_tersisa")
  int? timeRemaining;
  @JsonKey(name: "waktu_berjalan")
  int? timeRunning;
  @JsonKey(name: "target")
  dynamic target;
  @JsonKey(name: "realization")
  dynamic realization;
  @JsonKey(name: "deviation")
  dynamic deviation;
  @JsonKey(name: "keuangan")
  dynamic keuangan;
  @JsonKey(name: "works_has_done")
  String? workHasDone;
  @JsonKey(name: "notes")
  String? notes;
  @JsonKey(name: "report_by")
  String? reportBy;
  @JsonKey(name: "report_at")
  String? reportAt;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "proyek_progress_has_document")
  List<Map<String, dynamic>>? documents;

  ProgressEntity(
      {this.id,
      this.projectId,
      this.week,
      this.dateStart,
      this.dateEnd,
      this.timeRemaining,
      this.timeRunning,
      this.target,
      this.realization,
      this.deviation,
      this.keuangan,
      this.notes,
      this.workHasDone,
      this.reportBy,
      this.reportAt,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.documents});
}
