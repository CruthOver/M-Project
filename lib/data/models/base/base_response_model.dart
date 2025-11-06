import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/data/models/meta/meta_model.dart';
import 'package:management_project/domain/entities/base_response_entity.dart';
part 'base_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseModel<T> extends BaseResponseEntity<T> {
  BaseResponseModel({super.data, super.meta, super.success});

  factory BaseResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseModelFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseModelToJson(this, toJsonT);
}
