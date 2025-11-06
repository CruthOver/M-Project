import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/remotes/base_services.dart';
import 'package:management_project/data/remotes/endpoint.dart';

class AuthService extends BaseServices {
  Future<BaseResponseModel> signIn(Map<String, dynamic> body) async {
    return await postData(EndPoint.endPointLogin, body);
  }

  Future<BaseResponseModel> logout() async {
    return await postData(EndPoint.endPointLogout, {});
  }
}
