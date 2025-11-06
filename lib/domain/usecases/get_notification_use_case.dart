import 'package:management_project/application/core/usecase/usecase.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/notification_model.dart';
import 'package:management_project/domain/repositories/notification_repository.dart';

class GetNotificationUseCase
    extends UseCase<BaseResponseModel<List<NotificationModel>>, Map<String, dynamic>> {
  final NotificationRepository notificationRepository;

  GetNotificationUseCase(this.notificationRepository);

  @override
  Future<BaseResponseModel<List<NotificationModel>>> execute(Map<String, dynamic> params) async {
    return await notificationRepository.getListNotification(params);
  }
}
