import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/application/configs/routers/app_pages.dart';
import 'package:management_project/presentation/modules/home/controllers/home_controller.dart';
import 'package:management_project/presentation/shared/card_project.dart';
import 'package:management_project/presentation/shared/card_summary.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          top: false,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Stack(
                      children: [
                        SvgPicture.asset("assets/images/background.svg"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Halo, Bagus",
                                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      "Pengendali Lapangan",
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () => Get.toNamed(Routes.notification),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.notifications_none_outlined,
                                      color: AppColor.colorTitle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GridView(
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3.3 / 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              children: const [
                                CardSummary(
                                  label: "Sedang Berjalan",
                                  value: "30",
                                  icon: Icon(
                                    Icons.hourglass_empty_outlined,
                                    color: AppColor.colorTitle,
                                  ),
                                  colorBackground: AppColor.appBackground,
                                  colorBackgroundIcon: const Color.fromRGBO(244, 247, 255, 1),
                                ),
                                CardSummary(
                                  label: "Deadline",
                                  value: "30",
                                  icon: Icon(
                                    Icons.alarm,
                                    color: AppColor.colorOrange,
                                  ),
                                  colorBackground: AppColor.appBackground,
                                  colorBackgroundIcon: Color.fromRGBO(255, 246, 244, 1),
                                ),
                                CardSummary(
                                  label: "Selesai",
                                  value: "30",
                                  icon: Icon(
                                    Icons.check_circle_outline_outlined,
                                    color: AppColor.colorGreen,
                                  ),
                                  colorBackground: AppColor.appBackground,
                                  colorBackgroundIcon: Color.fromRGBO(244, 255, 249, 1),
                                ),
                                CardSummary(
                                  label: "Total Pekerjaan",
                                  value: "30",
                                  icon: Icon(
                                    Icons.list_alt_outlined,
                                    color: Colors.black,
                                  ),
                                  colorBackground: Color.fromRGBO(45, 50, 64, 1),
                                  colorBackgroundIcon: Color.fromRGBO(244, 247, 255, 1),
                                  colorBorder: Color.fromRGBO(78, 78, 78, 1),
                                  labelColor: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Daftar Project Terakhir",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColor.colorBlack,
                            fontSize: 16,
                          ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.projects.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CardProject(projectModel: controller.projects[index]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
