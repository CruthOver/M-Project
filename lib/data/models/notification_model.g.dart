// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: (json['id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      message: json['pesan'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      isSuccess: json['is_success'] as String?,
      projectId: json['proyek_id'] as String?,
      description: json['keterangan'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'pesan': instance.message,
      'status': instance.status,
      'created_at': instance.createdAt,
      'is_success': instance.isSuccess,
      'proyek_id': instance.projectId,
      'keterangan': instance.description,
    };
