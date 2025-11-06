import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/presentation/modules/login/controller/login_controller.dart';
import 'package:management_project/presentation/shared/custom_textfield.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background-login.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Sistem Pengawasan & Pengendalian Kegiatan",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Masuk ke aplikasi untuk mengakses fitur dan data penting.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: AppColor.colorDescGrey,
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username",
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColor.colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              CustomTextField(
                                controller: controller.nipController.value,
                                hintText: "Masukkan Username",
                                borderColor: const Color.fromRGBO(211, 212, 212, 1),
                                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: const Color.fromRGBO(211, 212, 212, 1),
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Password",
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColor.colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              CustomTextField(
                                controller: controller.passwordController.value,
                                hintText: "Masukkan Password",
                                borderColor: const Color.fromRGBO(211, 212, 212, 1),
                                obscureText: !controller.isShowPassword.value,
                                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: const Color.fromRGBO(211, 212, 212, 1),
                                    ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.isShowPassword.toggle();
                                  },
                                  icon: Icon(
                                      controller.isShowPassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: const Color.fromRGBO(211, 212, 212, 1)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () async {
                                if (controller.isLoading.value) {
                                  return;
                                }
                                controller.doLogin();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColor.colorTitle,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: controller.isLoading.value
                                  ? const SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: CircularProgressIndicator(),
                                    )
                                  : Text(
                                      "Login",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "Ⓒ 2024 SNIPER",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.appBackground,
                      ),
                ),
              ],
            ),
          ),
        ));
  }
}
