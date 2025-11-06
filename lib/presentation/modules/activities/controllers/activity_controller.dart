import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/data/models/activity/activity_model.dart';
import 'package:management_project/domain/usecases/get_activities_use_case.dart';

class ActivityController extends GetxController {
  final GetActivityUseCase getActivityUseCase;

  ActivityController({required this.getActivityUseCase});

  var activities = <ActivityModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getListActivity();
    super.onInit();
  }

  Future<void> getListActivity() async {
    isLoading.toggle();
    final response = await getActivityUseCase.execute();
    if (response.success!) {
      isLoading.toggle();
      activities.value = response.data;
    } else {
      isLoading.toggle();
      Get.snackbar("Gagal", "Ambil data aktifitas gagal",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }
}
