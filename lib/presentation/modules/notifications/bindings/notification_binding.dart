import 'package:get/get.dart';
import 'package:management_project/domain/usecases/get_notification_use_case.dart';
import 'package:management_project/presentation/modules/notifications/controllers/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController(
          getNotificationUseCase: Get.find<GetNotificationUseCase>(),
        ));
  }
}
