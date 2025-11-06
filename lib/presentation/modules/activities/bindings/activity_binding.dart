import 'package:get/get.dart';
import 'package:management_project/domain/usecases/get_activities_use_case.dart';
import 'package:management_project/presentation/modules/activities/controllers/activity_controller.dart';

class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityController(getActivityUseCase: Get.find<GetActivityUseCase>()));
  }
}
