import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/remotes/base_services.dart';
import 'package:management_project/data/remotes/endpoint.dart';

class NotificationService extends BaseServices {
  Future<BaseResponseModel> getListNotification(Map<String, dynamic> query) async {
    return await getData(EndPoint.endPointNotification, query: query);
  }
}
