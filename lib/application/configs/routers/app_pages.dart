import 'package:get/get.dart';
import 'package:management_project/presentation/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:management_project/presentation/modules/dashboard/views/pages/dashboard_page.dart';
import 'package:management_project/presentation/modules/notifications/bindings/notification_binding.dart';
import 'package:management_project/presentation/modules/notifications/views/pages/notification_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(name: _Paths.dashboard, binding: DashboardBinding(), page: () => const DashboardPage()),
    GetPage(
        name: _Paths.notification,
        binding: NotificationBinding(),
        page: () => const NotificationPage()),
  ];
}
