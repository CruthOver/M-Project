// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      mode: json['mode'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      image: json['image'] as String?,
      accessToken: json['accessToken'] as String?,
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'status': instance.status,
      'mode': instance.mode,
      'message': instance.message,
      'email': instance.email,
      'username': instance.username,
      'name': instance.name,
      'role': instance.role,
      'image': instance.image,
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
    };
