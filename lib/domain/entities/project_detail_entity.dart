import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/data/models/progress/progress_model.dart';

class ProjectDetailEntity {
  @JsonKey(name: "nama_proyek")
  String? projectName;
  @JsonKey(name: "nomor_proyek")
  String? projectNo;
  @JsonKey(name: "nama_perusahaan")
  String? companyName;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "lokasi")
  String? location;
  @JsonKey(name: "tanggal_dibuat")
  String? createdAt;
  @JsonKey(name: "nilai_proyek")
  String? projectValue;
  @JsonKey(name: "tanggal_mulai")
  String? dateStart;
  @JsonKey(name: "tanggal_selesai")
  String? dateEnd;
  @JsonKey(name: "deskripsi")
  String? description;
  @JsonKey(name: "proyek_has_progress")
  List<ProgressModel>? progress;

  ProjectDetailEntity(
      {this.projectName,
      this.projectNo,
      this.companyName,
      this.status,
      this.location,
      this.createdAt,
      this.projectValue,
      this.dateStart,
      this.dateEnd,
      this.description,
      this.progress});
}
