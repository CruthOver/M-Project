import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/data/models/project/project_model.dart';
import 'package:management_project/domain/entities/get_project_home_entity.dart';
part 'get_project_home_model.g.dart';

@JsonSerializable()
class GetProjectHomeModel extends GetProjectHomeEntity {
  GetProjectHomeModel({super.projects, super.totalProjectDeadline});

  factory GetProjectHomeModel.fromJson(Map<String, dynamic> json) =>
      _$GetProjectHomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetProjectHomeModelToJson(this);
}
