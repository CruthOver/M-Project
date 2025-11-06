import 'package:get/get.dart';
import 'package:management_project/domain/usecases/project_summary_use_case.dart';
import 'package:management_project/presentation/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(projectSummaryUseCase: Get.find<ProjectSummaryUseCase>()));
  }
}
