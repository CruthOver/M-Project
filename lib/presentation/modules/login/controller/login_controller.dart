import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_const.dart';
import 'package:management_project/application/configs/routers/app_pages.dart';
import 'package:management_project/application/helpers/app_helper.dart';
import 'package:management_project/application/service/session_service.dart';
import 'package:management_project/domain/usecases/login_use_case.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  LoginController({required this.loginUseCase});
  var nipController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isShowPassword = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> doLogin() async {
    String deviceId = await AppHelper.getDeviceId();
    if (nipController.value.text.trim().isEmpty) {
      Get.snackbar("Validasi", "NIP harus disii", backgroundColor: Colors.amber);
      return;
    }
    if (passwordController.value.text.trim().isEmpty) {
      Get.snackbar("Validasi", "Password harus disii", backgroundColor: Colors.amber);
      return;
    }
    Map<String, dynamic> body = {
      "username": nipController.value.text.trim(),
      "password": passwordController.value.text.trim(),
      "device_token": deviceId,
    };
    isLoading.toggle();
    final response = await loginUseCase.execute(body);
    if (response.success!) {
      isLoading.toggle();
      Sessions.setUserToken(token: response.data!.accessToken!);
      Sessions.setUserSessions(userData: response.data!);
      App.userToken = response.data!.accessToken!;
      Get.offAndToNamed(Routes.dashboard);
    } else {
      isLoading.toggle();
      Get.snackbar("[Failed]", response.meta!.status ?? "Gagal Login");
    }
  }
}
