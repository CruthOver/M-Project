import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/presentation/modules/activities/views/pages/activity_page.dart';
import 'package:management_project/presentation/modules/home/views/pages/home_page.dart';
import 'package:management_project/presentation/modules/profile/views/pages/profile_page.dart';
import 'package:management_project/presentation/modules/projects/views/pages/project_page.dart';

class DashboardController extends GetxController {
  var selectedMenuIndex = 0.obs;
  var pages = <Widget>[].obs;

  @override
  void onInit() {
    pages.value = [
      const HomePage(),
      const ProjectPage(),
      const ActivityPage(),
      const ProfilePage()
    ];
    super.onInit();
  }

  void onChangeMenu(int index) {
    selectedMenuIndex.value = index;
  }
}
