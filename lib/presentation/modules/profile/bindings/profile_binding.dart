import 'package:get/get.dart';
import 'package:management_project/domain/usecases/get_profile_use_case.dart';
import 'package:management_project/domain/usecases/logout_use_case.dart';
import 'package:management_project/domain/usecases/update_profile_use_case.dart';
import 'package:management_project/presentation/modules/profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(
        logoutUseCase: Get.find<LogoutUseCase>(),
        getProfileUseCase: Get.find<GetProfileUseCase>(),
        updateProfileUseCase: Get.find<UpdateProfileUseCase>()));
  }
}
