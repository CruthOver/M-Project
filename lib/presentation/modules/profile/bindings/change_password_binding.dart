import 'package:get/get.dart';
import 'package:management_project/domain/usecases/change_password_use_case.dart';
import 'package:management_project/presentation/modules/profile/controllers/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ChangePasswordController(changePasswordUseCase: Get.find<ChangePasswordUseCase>()));
  }
}
