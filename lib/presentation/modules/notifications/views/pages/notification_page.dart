import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/application/configs/routers/app_pages.dart';
import 'package:management_project/presentation/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:management_project/presentation/modules/home/controllers/home_controller.dart';
import 'package:management_project/presentation/modules/notifications/controllers/notification_controller.dart';
import 'package:management_project/presentation/shared/card_notification.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 2.0,
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: Text(
              "Notifikasi",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: Colors.white,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.buttonNotificationType.length,
                  itemBuilder: (context, index) {
                    return Obx(() => Row(
                          children: [
                            TextButton(
                              onPressed: () async {
                                controller.selectedButtonType.value = index;
                                if (controller.buttonNotificationType[index] == "Deadline") {
                                  controller.selectedButtonString.value = "warning";
                                } else if (controller.buttonNotificationType[index] == "Report") {
                                  controller.selectedButtonString.value = "success";
                                } else {
                                  controller.selectedButtonString.value = "";
                                }
                                await controller.getListNotification();
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: controller.selectedButtonType.value == index
                                          ? AppColor.colorTitle
                                          : AppColor.colorBorder),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                              ),
                              child: Text(
                                controller.buttonNotificationType[index],
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: controller.selectedButtonType.value == index
                                          ? AppColor.colorTitle
                                          : Colors.black,
                                      fontWeight: controller.selectedButtonType.value == index
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            )
                          ],
                        ));
                  },
                ),
              ),
              Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.notificationList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              int projectId =
                                  int.tryParse(controller.notificationList[index].projectId!) ?? 0;
                              if (controller.notificationList[index].isSuccess == "deadline") {
                                if (projectId > 0) {
                                  Get.toNamed(Routes.projectDetail, arguments: projectId);
                                }
                              } else {
                                DashboardController dashboardCtrl = Get.find();
                                dashboardCtrl.selectedMenuIndex.value = 1;
                                Get.back();
                              }
                            },
                            child: CardNotification(
                              notificationModel: controller.notificationList[index],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ));
  }
}
