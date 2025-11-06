import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/domain/entities/meta_entity.dart';
part 'meta_model.g.dart';

@JsonSerializable()
class MetaModel extends MetaEntity {
  MetaModel({super.status, super.statusCode});

  factory MetaModel.fromJson(Map<String, dynamic> json) => _$MetaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}
