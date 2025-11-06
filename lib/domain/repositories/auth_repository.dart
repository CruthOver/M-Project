import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/user/user_model.dart';

abstract class AuthRepository {
  Future<BaseResponseModel<UserModel>> signIn(Map<String, dynamic> data);
  Future<BaseResponseModel<Map<String, dynamic>>> logout();
}
