import 'package:get/get.dart';
import 'package:management_project/domain/usecases/rincian_project_use_case.dart';
import 'package:management_project/presentation/modules/projects/controllers/project_detail_controller.dart';

class ProjectDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ProjectDetailController(rincianProjectUseCase: Get.find<RincianProjectUseCase>()));
  }
}
