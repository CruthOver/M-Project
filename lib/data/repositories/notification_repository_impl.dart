import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/notification_model.dart';
import 'package:management_project/data/remotes/services/notification_service.dart';
import 'package:management_project/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  @override
  Future<BaseResponseModel<List<NotificationModel>>> getListNotification(
      Map<String, dynamic> query) async {
    final response = await NotificationService().getListNotification(query);
    List<dynamic> data = response.data['data_notifikasi'];
    List<NotificationModel> model = List.from(data.map((e) => NotificationModel.fromJson(e)));
    return BaseResponseModel(
      data: model,
      meta: response.meta,
      success: response.success,
    );
  }
}
