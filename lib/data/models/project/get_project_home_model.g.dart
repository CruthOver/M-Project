// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_project_home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProjectHomeModel _$GetProjectHomeModelFromJson(Map<String, dynamic> json) =>
    GetProjectHomeModel(
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalProjectDeadline: (json['proyek_melewati_deadline'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProjectHomeModelToJson(
        GetProjectHomeModel instance) =>
    <String, dynamic>{
      'proyek_melewati_deadline': instance.totalProjectDeadline,
      'projects': instance.projects,
    };
