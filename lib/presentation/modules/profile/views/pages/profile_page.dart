import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/application/configs/routers/app_pages.dart';
import 'package:management_project/presentation/modules/profile/controllers/profile_controller.dart';
import 'package:management_project/presentation/shared/custom_textfield.dart';
import 'package:photo_view/photo_view.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            elevation: 2.0,
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: Text(
              "Akun",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          body: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(vertical: 16),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.bottomSheet(
                                        PhotoViewGestureDetectorScope(
                                          axis: Axis.vertical,
                                          child: PhotoView(
                                            imageProvider: controller.photoFile.value.path.isEmpty
                                                ? controller.userProfile.value.image != null
                                                    ? NetworkImage(
                                                        controller.userProfile.value.image!)
                                                    : const AssetImage(
                                                        "assets/images/people-1.jpeg")
                                                : FileImage(File(controller.photoFile.value.path)),
                                            backgroundDecoration: BoxDecoration(
                                              color: Colors.black.withAlpha(240),
                                            ),
                                          ),
                                        ),
                                        backgroundColor: Colors.transparent,
                                        shape: const ContinuousRectangleBorder(),
                                        isScrollControlled: true,
                                      );
                                    },
                                    child: CircleAvatar(
                                      backgroundImage: controller.photoFile.value.path.isEmpty
                                          ? controller.userProfile.value.image != null
                                              ? NetworkImage(controller.userProfile.value.image!)
                                              : const AssetImage("assets/images/people-1.jpeg")
                                          : FileImage(File(controller.photoFile.value.path)),
                                      radius: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextButton.icon(
                                    onPressed: () {
                                      Get.bottomSheet(_bottomSheet(context),
                                          backgroundColor: Colors.white);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                          color: AppColor.colorTitle,
                                        ),
                                      ),
                                    ),
                                    label: Text(
                                      "Ganti Foto",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: AppColor.colorTitle,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    icon: const Icon(
                                      Icons.edit,
                                      color: AppColor.colorTitle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Data Diri",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColor.colorBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            ..._form(
                              context,
                              label: "Nama Lengkap",
                              controller: controller.fullNameCtrl.value,
                              enabled: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ..._form(
                              context,
                              label: "Username",
                              controller: controller.userNameCtrl.value,
                              enabled: false,
                              fillColor: const Color.fromRGBO(246, 246, 246, 1),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ..._form(
                              context,
                              label: "Email",
                              controller: controller.emailCtrl.value,
                              enabled: true,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                onPressed: () async {
                                  if (controller.isCanSubmit.value) {
                                    await controller.updateProfile();
                                  }
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: controller.isCanSubmit.value
                                      ? AppColor.colorTitle
                                      : const Color.fromRGBO(217, 217, 217, 1),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: controller.isUpdateProfile.value
                                    ? const SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                        "Simpan Perubahan",
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.changePassword,
                                      arguments: controller.userProfile.value);
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Ubah Kata Sandi",
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: AppColor.colorTitle,
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                onPressed: () async {
                                  await controller.logout();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(color: AppColor.colorRed)),
                                ),
                                child: controller.isLogout.value
                                    ? const SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                        "Logout",
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              color: AppColor.colorRed,
                                            ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    controller.isLogout.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const SizedBox(),
                  ],
                ),
        ));
  }

  _form(BuildContext context,
      {required String label,
      required TextEditingController controller,
      bool? enabled = false,
      Color? fillColor = Colors.white}) {
    return [
      Text(
        label,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: const Color.fromRGBO(108, 117, 125, 1)),
      ),
      CustomTextField(
        controller: controller,
        enabled: enabled,
        fillColor: fillColor,
        borderColor: const Color.fromRGBO(206, 212, 218, 1),
      ),
    ];
  }

  _bottomSheet(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 12,
        ),
        Container(
          width: 40,
          height: 6,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(234, 235, 235, 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Text(
            "Upload Foto",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColor.colorBlack,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: InkWell(
                  onTap: () async {
                    await controller.imagePicker();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(249, 249, 249, 1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.colorBorder,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.image,
                          size: 32,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Galeri",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: AppColor.colorDescGrey,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: InkWell(
                  onTap: () async {
                    await controller.imagePickCamera();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(249, 249, 249, 1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.colorBorder,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.camera_alt,
                          size: 32,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Foto",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: AppColor.colorDescGrey,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
