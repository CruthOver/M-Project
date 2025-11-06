import 'package:json_annotation/json_annotation.dart';

class UserEntity {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "mode")
  String? mode;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "accessToken")
  String? accessToken;
  @JsonKey(name: "tokenType")
  String? tokenType;

  UserEntity(
      {this.status,
      this.mode,
      this.message,
      this.email,
      this.username,
      this.name,
      this.role,
      this.image,
      this.accessToken,
      this.tokenType});
}
