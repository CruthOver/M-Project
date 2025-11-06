import 'package:get/get.dart';
import 'package:management_project/domain/usecases/login_use_case.dart';
import 'package:management_project/presentation/modules/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(loginUseCase: Get.find<LoginUseCase>()));
  }
}
