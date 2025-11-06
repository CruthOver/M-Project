import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/data/models/meta/meta_model.dart';

class BaseResponseEntity<T> {
  @JsonKey(name: "data")
  T? data;
  @JsonKey(name: "meta")
  MetaModel? meta;
  bool? success;

  BaseResponseEntity({this.data, this.meta, this.success});
}
