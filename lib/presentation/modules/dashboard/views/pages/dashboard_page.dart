import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/presentation/modules/dashboard/controllers/dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Center(
            child: controller.pages[controller.selectedMenuIndex.value],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColor.appBackground,
            elevation: 5.0,
            onTap: controller.onChangeMenu,
            currentIndex: controller.selectedMenuIndex.value,
            items: [
              const BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home_filled,
                  color: AppColor.colorTitle,
                ),
                icon: Icon(
                  Icons.home_filled,
                  color: AppColor.colorGrey,
                ),
                label: "Beranda",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  "assets/icons/cube.svg",
                  colorFilter: const ColorFilter.mode(AppColor.colorTitle, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset("assets/icons/cube.svg"),
                label: "Proyek",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  "assets/icons/activity.svg",
                  colorFilter: const ColorFilter.mode(AppColor.colorTitle, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset("assets/icons/activity.svg"),
                label: "Activity",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  "assets/icons/profile.svg",
                  colorFilter: const ColorFilter.mode(AppColor.colorTitle, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset("assets/icons/profile.svg"),
                label: "Profile",
              ),
            ],
          ),
        ));
  }
}
