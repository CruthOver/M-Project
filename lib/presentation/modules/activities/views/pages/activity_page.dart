import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/presentation/modules/activities/controllers/activity_controller.dart';
import 'package:management_project/presentation/shared/card_activity.dart';

class ActivityPage extends GetView<ActivityController> {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 2.0,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Aktivitas",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.colorBlack,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListView.builder(
            itemCount: controller.activities.length,
            itemBuilder: (context, index) {
              return CardActivity(activityModel: controller.activities[index]);
            },
          ),
        ),
      ),
    );
  }
}
