import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/user/user_model.dart';

abstract class ProfileRepository {
  Future<BaseResponseModel<Map<String, dynamic>>> changeProfile(Map<String, dynamic> data);
  Future<BaseResponseModel<UserModel>> getProfile();
  Future<BaseResponseModel<Map<String, dynamic>>> updateProfile(Map<String, dynamic> data);
}
