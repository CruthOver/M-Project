import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/user/user_model.dart';
import 'package:management_project/data/remotes/services/profile_service.dart';
import 'package:management_project/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<BaseResponseModel<Map<String, dynamic>>> changeProfile(Map<String, dynamic> data) async {
    final response = await ProfileService().changeProfile(data);
    return BaseResponseModel(
      data: response.data,
      meta: response.meta,
      success: response.success,
    );
  }

  @override
  Future<BaseResponseModel<UserModel>> getProfile() async {
    final response = await ProfileService().getProfile();
    UserModel model = UserModel.fromJson(response.data['data']);
    return BaseResponseModel(
      data: model,
      meta: response.meta,
      success: response.success,
    );
  }

  @override
  Future<BaseResponseModel<Map<String, dynamic>>> updateProfile(Map<String, dynamic> data) async {
    final response = await ProfileService().changeProfile(data);
    return BaseResponseModel(
      data: response.data,
      meta: response.meta,
      success: response.success,
    );
  }
}
