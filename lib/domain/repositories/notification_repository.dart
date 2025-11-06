import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<BaseResponseModel<List<NotificationModel>>> getListNotification(Map<String, dynamic> query);
}
