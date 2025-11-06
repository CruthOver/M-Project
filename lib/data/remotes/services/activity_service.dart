import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/remotes/base_services.dart';
import 'package:management_project/data/remotes/endpoint.dart';

class ActivityService extends BaseServices {
  Future<BaseResponseModel> getListActivity() async {
    return await getData(EndPoint.endPointListActivity);
  }
}
