// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectSummaryModel _$ProjectSummaryModelFromJson(Map<String, dynamic> json) =>
    ProjectSummaryModel(
      onGoing: (json['sedang_berjalan'] as num?)?.toInt(),
      deadline: (json['deadline'] as num?)?.toInt(),
      finished: (json['selesai'] as num?)?.toInt(),
      totalJob: (json['total_pekerjaan'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProjectSummaryModelToJson(
        ProjectSummaryModel instance) =>
    <String, dynamic>{
      'sedang_berjalan': instance.onGoing,
      'deadline': instance.deadline,
      'selesai': instance.finished,
      'total_pekerjaan': instance.totalJob,
    };
