import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/remotes/base_services.dart';
import 'package:management_project/data/remotes/endpoint.dart';

class ProfileService extends BaseServices {
  Future<BaseResponseModel> getProfile() async {
    return await getData(EndPoint.endPointProfile);
  }

  Future<BaseResponseModel> changeProfile(Map<String, dynamic> data) async {
    bool hasFile = false;
    if (data.containsKey("image")) {
      hasFile = true;
    }
    return await postData(EndPoint.endPointProfile, data, isFormData: true, isExistFile: hasFile);
  }
}
