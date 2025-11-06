import 'package:get/get.dart';
import 'package:management_project/domain/usecases/progress_detail_use_case.dart';
import 'package:management_project/domain/usecases/submit_progress_use_case.dart';
import 'package:management_project/presentation/modules/progress/controllers/progress_controller.dart';

class ProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProgressController(
        progressDetailUseCase: Get.find<ProgressDetailUseCase>(),
        submitProgressUseCase: Get.find<SubmitProgressUseCase>(),
      ),
    );
  }
}
