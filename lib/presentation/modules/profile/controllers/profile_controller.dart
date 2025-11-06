import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/application/configs/routers/app_pages.dart';
import 'package:management_project/application/service/session_service.dart';
import 'package:management_project/data/models/user/user_model.dart';
import 'package:management_project/domain/usecases/get_profile_use_case.dart';
import 'package:management_project/domain/usecases/logout_use_case.dart';
import 'package:management_project/domain/usecases/update_profile_use_case.dart';

class ProfileController extends GetxController {
  final LogoutUseCase logoutUseCase;
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  ProfileController(
      {required this.logoutUseCase,
      required this.getProfileUseCase,
      required this.updateProfileUseCase});

  var userProfile = UserModel().obs;
  var fullNameCtrl = TextEditingController().obs;
  var userNameCtrl = TextEditingController().obs;
  var emailCtrl = TextEditingController().obs;
  var photoFile = XFile("").obs;
  var isLogout = false.obs;
  var isLoading = false.obs;
  var isCanSubmit = false.obs;
  var isUpdateProfile = false.obs;

  @override
  void onInit() async {
    // fullNameCtrl.value.text = "Derrick L. Thoman";
    // userNameCtrl.value.text = "derrickth";
    // emailCtrl.value.text = "derrickthoman@gmail.com";
    await getProfile();

    fullNameCtrl.value.addListener(
      () {
        setBtnUpdateActive();
      },
    );

    emailCtrl.value.addListener(
      () {
        setBtnUpdateActive();
      },
    );
    super.onInit();
  }

  Future<void> getProfile() async {
    isLoading.toggle();
    final response = await getProfileUseCase.execute();
    if (response.success!) {
      isLoading.toggle();
      userProfile.value = response.data!;

      fullNameCtrl.value.text = userProfile.value.name ?? "-";
      userNameCtrl.value.text = userProfile.value.username ?? "-";
      emailCtrl.value.text = userProfile.value.email ?? "-";
      setBtnUpdateActive();
    } else {
      isLoading.toggle();
      Get.snackbar("Gagal", "Gagal mengambil data profile user");
    }
  }

  Future<void> updateProfile() async {
    isUpdateProfile.toggle();
    Map<String, dynamic> data = {
      "name": fullNameCtrl.value.text,
      "email": emailCtrl.value.text,
      "username": userProfile.value.username,
    };

    if (photoFile.value.path.isNotEmpty) {
      data['image'] = MultipartFile(
        File(photoFile.value.path),
        filename: photoFile.value.name,
      );
    }
    final response = await updateProfileUseCase.execute(data);
    if (response.success!) {
      isUpdateProfile.toggle();
      Get.snackbar("Berhasil", "Update Profile berhasil",
          backgroundColor: AppColor.colorGreen, colorText: Colors.white);
    } else {
      isUpdateProfile.toggle();
      Get.snackbar("Gagal", "Update Profile gagal",
          backgroundColor: AppColor.colorRed, colorText: Colors.white);
    }
  }

  Future<void> logout() async {
    isLogout.toggle();
    final response = await logoutUseCase.execute();
    if (response.success!) {
      await Sessions.unsetUserSessions();
      isLogout.toggle();
      Get.offAllNamed(Routes.login);
      Get.snackbar(
        "Berhasil",
        "Logout telah Berhasil",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      isLogout.toggle();
      Get.snackbar(
        "Gagal",
        "Logout telah Gagal",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void setBtnUpdateActive() {
    if ((fullNameCtrl.value.text != userProfile.value.name && fullNameCtrl.value.text != "-") ||
        (emailCtrl.value.text != userProfile.value.email && emailCtrl.value.text != "-") ||
        photoFile.value.path.isNotEmpty) {
      isCanSubmit.value = true;
    } else {
      isCanSubmit.value = false;
    }
  }

  Future<void> imagePicker() async {
    final ImagePicker picker = ImagePicker();
    XFile? selectedFiles = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (selectedFiles != null) {
      photoFile.value = selectedFiles;
      setBtnUpdateActive();
    }
  }

  Future<void> imagePickCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      imageQuality: 80,
      requestFullMetadata: true,
      source: ImageSource.camera,
    );

    if (file != null) {
      photoFile.value = file;
      setBtnUpdateActive();
    }
  }
}
