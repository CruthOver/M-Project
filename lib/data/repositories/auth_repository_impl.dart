import 'package:flutter/material.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/user/user_model.dart';
import 'package:management_project/data/remotes/services/auth_service.dart';
import 'package:management_project/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<BaseResponseModel<Map<String, dynamic>>> logout() async {
    final response = await AuthService().logout();
    return BaseResponseModel<Map<String, dynamic>>(
      data: response.data ?? {},
      meta: response.meta,
      success: response.success,
    );
  }

  @override
  Future<BaseResponseModel<UserModel>> signIn(Map<String, dynamic> data) async {
    final response = await AuthService().signIn(data);
    BaseResponseModel<UserModel> baseResponseModel = BaseResponseModel<UserModel>(
      meta: response.meta,
      success: response.success,
    );
    if (response.data != null) {
      UserModel model = UserModel.fromJson(response.data);
      baseResponseModel.data = model;
    }
    return baseResponseModel;
  }
}
