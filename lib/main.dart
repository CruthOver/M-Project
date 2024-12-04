import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_theme.dart';
import 'package:management_project/application/configs/routers/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "MANAGEMENT PROYEK",
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.dashboard,
      defaultTransition: Transition.rightToLeft,
      theme: AppTheme().lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
