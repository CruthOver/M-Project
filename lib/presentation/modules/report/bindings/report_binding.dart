import 'package:get/get.dart';
import 'package:management_project/domain/usecases/project_detail_use_case.dart';
import 'package:management_project/presentation/modules/report/controllers/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportController(projectDetailUseCase: Get.find<ProjectDetailUseCase>()));
  }
}
