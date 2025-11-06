// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      projectName: json['nama_project'] as String?,
      activity: json['aktifitas'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'nama_project': instance.projectName,
      'aktifitas': instance.activity,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
