import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/domain/entities/user_entity.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel(
      {super.status,
      super.message,
      super.mode,
      super.email,
      super.username,
      super.name,
      super.role,
      super.image,
      super.accessToken,
      super.tokenType});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
