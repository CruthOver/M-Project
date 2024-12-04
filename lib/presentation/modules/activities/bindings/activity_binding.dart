import 'package:get/get.dart';
import 'package:management_project/presentation/modules/activities/controllers/activity_controller.dart';

class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityController());
  }
}
