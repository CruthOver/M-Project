// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDashboardModel _$ProjectDashboardModelFromJson(
        Map<String, dynamic> json) =>
    ProjectDashboardModel(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      project: json['project'] == null
          ? null
          : ProjectSummaryModel.fromJson(
              json['project'] as Map<String, dynamic>),
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => ProjectHomeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectDashboardModelToJson(
        ProjectDashboardModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'project': instance.project,
      'projects': instance.projects,
    };
