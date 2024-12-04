import 'package:get/get.dart';
import 'package:management_project/presentation/modules/activities/controllers/activity_controller.dart';
import 'package:management_project/presentation/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:management_project/presentation/modules/home/controllers/home_controller.dart';
import 'package:management_project/presentation/modules/projects/controllers/project_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProjectController());
    Get.lazyPut(() => ActivityController());
  }
}
