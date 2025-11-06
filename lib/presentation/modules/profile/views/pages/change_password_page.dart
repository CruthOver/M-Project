import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/presentation/modules/profile/controllers/change_password_controller.dart';
import 'package:management_project/presentation/shared/custom_textfield.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({super.key});

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
              "Ubah Kata Sandi",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._form(context,
                      label: "Kata Sandi Lama", controller: controller.oldPasswordCtrl.value),
                  const SizedBox(
                    height: 8,
                  ),
                  ..._form(context,
                      label: "Kata Sandi Baru", controller: controller.newPasswordCtrl.value),
                  const SizedBox(
                    height: 8,
                  ),
                  ..._form(context,
                      label: "Konfirmasi Kata Sandi Baru",
                      controller: controller.newPasswordConfirmCtrl.value),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () async {
                        if (!controller.isCanSubmit.value) {
                          return;
                        }
                        await controller.changeProfile();
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
                      child: controller.isLoading.value
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              "Ubah",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: controller.isCanSubmit.value
                                        ? Colors.white
                                        : AppColor.colorDescGrey,
                                  ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _form(BuildContext context, {required String label, required TextEditingController controller}) {
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
        enabled: true,
        fillColor: Colors.white,
        obscureText: true,
        borderColor: const Color.fromRGBO(206, 212, 218, 1),
      ),
    ];
  }
}
