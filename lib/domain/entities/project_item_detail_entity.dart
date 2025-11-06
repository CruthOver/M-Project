import 'package:json_annotation/json_annotation.dart';

class ProjectItemDetailEntity {
  @JsonKey(name: "program")
  String? program;
  @JsonKey(name: "aktivitas")
  String? activity;
  @JsonKey(name: "sub_aktivitas")
  String? subActivity;
  @JsonKey(name: "nama_pekerjaan")
  String? workName;
  @JsonKey(name: "no_pekerjaan")
  String? workNo;
  @JsonKey(name: "perusahaan")
  String? companyName;
  @JsonKey(name: "konsultan")
  String? consultant;
  @JsonKey(name: "tgl_mulai")
  String? startDate;
  @JsonKey(name: "tgl_akhir")
  String? endDate;
  @JsonKey(name: "anggaran")
  String? anggaran;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "nomor_kontrak")
  String? contractNo;
  @JsonKey(name: "nomor_bast")
  String? bastNo;
  @JsonKey(name: "nomor_bap")
  String? bapNo;
  @JsonKey(name: "adendum")
  String? adendum;
  @JsonKey(name: "nomor_adendum")
  String? adendumNo;
  @JsonKey(name: "tgl_kontrak")
  String? contractDate;
  @JsonKey(name: "tgl_bast")
  String? bastDate;
  @JsonKey(name: "tgl_bap")
  String? bapDate;
  @JsonKey(name: "tgl_adendum")
  String? adendumDate;
  @JsonKey(name: "lokasi_pekerjaan")
  String? workLocation;
  @JsonKey(name: "deskripsi")
  String? description;

  ProjectItemDetailEntity(
      {this.program,
      this.activity,
      this.subActivity,
      this.workName,
      this.workNo,
      this.companyName,
      this.consultant,
      this.startDate,
      this.endDate,
      this.anggaran,
      this.status,
      this.contractNo,
      this.bastNo,
      this.bapNo,
      this.adendum,
      this.adendumNo,
      this.contractDate,
      this.bastDate,
      this.bapDate,
      this.adendumDate,
      this.workLocation,
      this.description});
}
