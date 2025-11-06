import 'package:json_annotation/json_annotation.dart';

class MetaEntity {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "statusCode")
  int? statusCode;

  MetaEntity({this.status, this.statusCode});
}
