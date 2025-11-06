import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/domain/entities/project_summary_entity.dart';
part 'project_summary_model.g.dart';

@JsonSerializable()
class ProjectSummaryModel extends ProjectSummaryEntity {
  ProjectSummaryModel({super.onGoing, super.deadline, super.finished, super.totalJob});

  factory ProjectSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectSummaryModelToJson(this);
}
