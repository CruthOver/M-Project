import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/data/models/progress/progress_model.dart';
import 'package:management_project/domain/entities/project_detail_entity.dart';
part 'project_detail_model.g.dart';

@JsonSerializable()
class ProjectDetailModel extends ProjectDetailEntity {
  ProjectDetailModel(
      {super.projectName,
      super.projectNo,
      super.companyName,
      super.status,
      super.location,
      super.createdAt,
      super.projectValue,
      super.dateStart,
      super.dateEnd,
      super.description,
      super.progress});

  factory ProjectDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectDetailModelToJson(this);
}
