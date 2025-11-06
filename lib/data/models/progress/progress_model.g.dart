// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressModel _$ProgressModelFromJson(Map<String, dynamic> json) =>
    ProgressModel(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['proyek_id'] as num?)?.toInt(),
      week: (json['week'] as num?)?.toInt(),
      dateStart: json['start_date'] as String?,
      dateEnd: json['end_date'] as String?,
      timeRemaining: (json['waktu_tersisa'] as num?)?.toInt(),
      timeRunning: (json['waktu_berjalan'] as num?)?.toInt(),
      target: json['target'],
      realization: json['realization'],
      deviation: json['deviation'],
      keuangan: json['keuangan'],
      workHasDone: json['works_has_done'] as String?,
      notes: json['notes'] as String?,
      reportBy: json['report_by'] as String?,
      reportAt: json['report_at'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      documents: (json['proyek_progress_has_document'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ProgressModelToJson(ProgressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'proyek_id': instance.projectId,
      'week': instance.week,
      'start_date': instance.dateStart,
      'end_date': instance.dateEnd,
      'waktu_tersisa': instance.timeRemaining,
      'waktu_berjalan': instance.timeRunning,
      'target': instance.target,
      'realization': instance.realization,
      'deviation': instance.deviation,
      'keuangan': instance.keuangan,
      'works_has_done': instance.workHasDone,
      'notes': instance.notes,
      'report_by': instance.reportBy,
      'report_at': instance.reportAt,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'proyek_progress_has_document': instance.documents,
    };
