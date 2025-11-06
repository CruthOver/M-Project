import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/data/models/notification_model.dart';
import 'package:management_project/domain/usecases/get_notification_use_case.dart';

class NotificationController extends GetxController {
  final GetNotificationUseCase getNotificationUseCase;

  NotificationController({required this.getNotificationUseCase});
  var notificationList = <NotificationModel>[].obs;
  var buttonNotificationType = <String>[].obs;
  var selectedButtonType = 0.obs;
  var selectedButtonString = "".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    buttonNotificationType.value = ["Semua", "Deadline", "Report"];
    getListNotification();
    super.onInit();
  }

  Future<void> getListNotification() async {
    isLoading.toggle();
    Map<String, dynamic> params = {
      "type": selectedButtonString.value,
      "is_read": "",
    };
    final response = await getNotificationUseCase.execute(params);
    if (response.success!) {
      notificationList.value = response.data!;
      isLoading.toggle();
    } else {
      isLoading.toggle();
      Get.snackbar("Gagal", "Ambil data notifikasi gagal",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }
}
