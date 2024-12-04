import 'package:get/get.dart';
import 'package:management_project/presentation/modules/projects/controllers/project_controller.dart';

class ProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectController());
  }
}
