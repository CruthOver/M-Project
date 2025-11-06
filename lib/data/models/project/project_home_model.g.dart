// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectHomeModel _$ProjectHomeModelFromJson(Map<String, dynamic> json) =>
    ProjectHomeModel(
      id: (json['id'] as num?)?.toInt(),
      projectName: json['name_proyek'] as String?,
      companyName: json['name_perusahaan'] as String?,
      week: (json['week'] as num?)?.toInt(),
      realization: json['realization'],
      deadline: json['deadline'] as String?,
    );

Map<String, dynamic> _$ProjectHomeModelToJson(ProjectHomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_proyek': instance.projectName,
      'name_perusahaan': instance.companyName,
      'week': instance.week,
      'realization': instance.realization,
      'deadline': instance.deadline,
    };
