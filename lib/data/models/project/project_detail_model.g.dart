// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetailModel _$ProjectDetailModelFromJson(Map<String, dynamic> json) =>
    ProjectDetailModel(
      projectName: json['nama_proyek'] as String?,
      projectNo: json['nomor_proyek'] as String?,
      companyName: json['nama_perusahaan'] as String?,
      status: (json['status'] as num?)?.toInt(),
      location: json['lokasi'] as String?,
      createdAt: json['tanggal_dibuat'] as String?,
      projectValue: json['nilai_proyek'] as String?,
      dateStart: json['tanggal_mulai'] as String?,
      dateEnd: json['tanggal_selesai'] as String?,
      description: json['deskripsi'] as String?,
      progress: (json['proyek_has_progress'] as List<dynamic>?)
          ?.map((e) => ProgressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectDetailModelToJson(ProjectDetailModel instance) =>
    <String, dynamic>{
      'nama_proyek': instance.projectName,
      'nomor_proyek': instance.projectNo,
      'nama_perusahaan': instance.companyName,
      'status': instance.status,
      'lokasi': instance.location,
      'tanggal_dibuat': instance.createdAt,
      'nilai_proyek': instance.projectValue,
      'tanggal_mulai': instance.dateStart,
      'tanggal_selesai': instance.dateEnd,
      'deskripsi': instance.description,
      'proyek_has_progress': instance.progress,
    };
