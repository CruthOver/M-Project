// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_item_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectItemDetailModel _$ProjectItemDetailModelFromJson(
        Map<String, dynamic> json) =>
    ProjectItemDetailModel(
      program: json['program'] as String?,
      activity: json['aktivitas'] as String?,
      subActivity: json['sub_aktivitas'] as String?,
      workName: json['nama_pekerjaan'] as String?,
      workNo: json['no_pekerjaan'] as String?,
      companyName: json['perusahaan'] as String?,
      consultant: json['konsultan'] as String?,
      startDate: json['tgl_mulai'] as String?,
      endDate: json['tgl_akhir'] as String?,
      anggaran: json['anggaran'] as String?,
      status: json['status'] as String?,
      contractNo: json['nomor_kontrak'] as String?,
      bastNo: json['nomor_bast'] as String?,
      bapNo: json['nomor_bap'] as String?,
      adendum: json['adendum'] as String?,
      adendumNo: json['nomor_adendum'] as String?,
      contractDate: json['tgl_kontrak'] as String?,
      bastDate: json['tgl_bast'] as String?,
      bapDate: json['tgl_bap'] as String?,
      adendumDate: json['tgl_adendum'] as String?,
      workLocation: json['lokasi_pekerjaan'] as String?,
      description: json['deskripsi'] as String?,
    );

Map<String, dynamic> _$ProjectItemDetailModelToJson(
        ProjectItemDetailModel instance) =>
    <String, dynamic>{
      'program': instance.program,
      'aktivitas': instance.activity,
      'sub_aktivitas': instance.subActivity,
      'nama_pekerjaan': instance.workName,
      'no_pekerjaan': instance.workNo,
      'perusahaan': instance.companyName,
      'konsultan': instance.consultant,
      'tgl_mulai': instance.startDate,
      'tgl_akhir': instance.endDate,
      'anggaran': instance.anggaran,
      'status': instance.status,
      'nomor_kontrak': instance.contractNo,
      'nomor_bast': instance.bastNo,
      'nomor_bap': instance.bapNo,
      'adendum': instance.adendum,
      'nomor_adendum': instance.adendumNo,
      'tgl_kontrak': instance.contractDate,
      'tgl_bast': instance.bastDate,
      'tgl_bap': instance.bapDate,
      'tgl_adendum': instance.adendumDate,
      'lokasi_pekerjaan': instance.workLocation,
      'deskripsi': instance.description,
    };
