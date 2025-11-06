import 'package:get/get.dart';
import 'package:management_project/domain/usecases/get_activities_use_case.dart';
import 'package:management_project/domain/usecases/get_profile_use_case.dart';
import 'package:management_project/domain/usecases/logout_use_case.dart';
import 'package:management_project/domain/usecases/project_summary_use_case.dart';
import 'package:management_project/domain/usecases/project_use_case.dart';
import 'package:management_project/domain/usecases/update_profile_use_case.dart';
import 'package:management_project/presentation/modules/activities/controllers/activity_controller.dart';
import 'package:management_project/presentation/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:management_project/presentation/modules/home/controllers/home_controller.dart';
import 'package:management_project/presentation/modules/profile/controllers/profile_controller.dart';
import 'package:management_project/presentation/modules/projects/controllers/project_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController(projectSummaryUseCase: Get.find<ProjectSummaryUseCase>()));
    Get.lazyPut(() => ProjectController(projectListUseCase: Get.find<ProjectListUseCase>()));
    Get.lazyPut(() => ActivityController(getActivityUseCase: Get.find<GetActivityUseCase>()));
    Get.lazyPut(() => ProfileController(
        logoutUseCase: Get.find<LogoutUseCase>(),
        getProfileUseCase: Get.find<GetProfileUseCase>(),
        updateProfileUseCase: Get.find<UpdateProfileUseCase>()));
  }
}
