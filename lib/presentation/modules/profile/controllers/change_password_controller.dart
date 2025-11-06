import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:management_project/data/models/user/user_model.dart';
import 'package:management_project/domain/usecases/change_password_use_case.dart';

class ChangePasswordController extends GetxController {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordController({required this.changePasswordUseCase});

  var userProfile = UserModel().obs;
  var oldPasswordCtrl = TextEditingController().obs;
  var newPasswordCtrl = TextEditingController().obs;
  var newPasswordConfirmCtrl = TextEditingController().obs;

  var isLoading = false.obs;
  var isCanSubmit = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      userProfile.value = Get.arguments;
    }
    oldPasswordCtrl.value.addListener(
      () {
        setBtnActive();
      },
    );

    newPasswordCtrl.value.addListener(
      () {
        setBtnActive();
      },
    );

    newPasswordConfirmCtrl.value.addListener(
      () {
        setBtnActive();
      },
    );
    super.onInit();
  }

  void setBtnActive() {
    if ((oldPasswordCtrl.value.text.isNotEmpty && oldPasswordCtrl.value.text.length >= 6) &&
        (newPasswordCtrl.value.text.isNotEmpty && newPasswordCtrl.value.text.length >= 6) &&
        newPasswordConfirmCtrl.value.text == newPasswordCtrl.value.text) {
      isCanSubmit.value = true;
    } else {
      isCanSubmit.value = false;
    }
  }

  Future<void> changeProfile() async {
    isLoading.toggle();
    Map<String, dynamic> params = {
      "name": userProfile.value.name,
      "email": userProfile.value.email,
      "username": userProfile.value.username,
      "password_old": oldPasswordCtrl.value.text,
      "password_new": newPasswordCtrl.value.text,
      "password_confirm": newPasswordConfirmCtrl.value.text,
    };
    final response = await changePasswordUseCase.execute(params);
    if (response.success!) {
      isLoading.toggle();
      Get.back();
      Get.snackbar("Berhasil", "Ubah Password berhasil");
    } else {
      isLoading.toggle();
      Get.snackbar("Gagal", "Gagal mengubah password");
    }
  }
}
