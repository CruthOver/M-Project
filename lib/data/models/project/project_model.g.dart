// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      projectName: json['nama'] as String?,
      companyName: json['perusahaan'] as String?,
      duration: json['duration'] as String?,
      deadlineDate: json['deadline'] as String?,
      status: (json['status'] as num?)?.toInt(),
      realization: json['realization'],
      location: json['location'] as String?,
      projectDate: json['projectDate'] as String?,
      projectId: (json['id'] as num?)?.toInt(),
      week: (json['week'] as num?)?.toInt(),
    )
      ..penyediaId = (json['penyedia_id'] as num?)?.toInt()
      ..workNo = json['no_pekerjaan'] as String?
      ..createdAt = json['created_at'] as String?;

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.projectId,
      'penyedia_id': instance.penyediaId,
      'perusahaan': instance.companyName,
      'nama': instance.projectName,
      'deadline': instance.deadlineDate,
      'no_pekerjaan': instance.workNo,
      'week': instance.week,
      'duration': instance.duration,
      'status': instance.status,
      'created_at': instance.createdAt,
      'location': instance.location,
      'projectDate': instance.projectDate,
      'realization': instance.realization,
    };
