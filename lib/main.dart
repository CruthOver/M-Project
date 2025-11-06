import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:management_project/application/configs/app_const.dart';
import 'package:management_project/application/configs/app_theme.dart';
import 'package:management_project/application/configs/routers/app_pages.dart';
import 'package:management_project/application/service/session_service.dart';
import 'package:management_project/application/utils/get_di.dart';

Future<void> main() async {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  // await Sessions.unsetUserSessions();
  App.userToken = await Sessions.getUserToken() ?? "";
  bool isExpired = false;
  bool isLogged = await Sessions.isLogged;
  initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      MyApp(
        isLogged: isLogged && !isExpired,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool? isLogged;
  const MyApp({super.key, this.isLogged = false});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "MANAGEMENT PROYEK",
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: isLogged! ? Routes.dashboard : Routes.login,
      defaultTransition: Transition.rightToLeft,
      theme: AppTheme().lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
