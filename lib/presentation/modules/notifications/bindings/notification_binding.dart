import 'package:get/get.dart';
import 'package:management_project/presentation/modules/notifications/controllers/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
