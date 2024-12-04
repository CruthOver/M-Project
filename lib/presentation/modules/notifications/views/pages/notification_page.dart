import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/presentation/modules/notifications/controllers/notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(),
    );
  }
}
