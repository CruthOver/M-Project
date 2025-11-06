import 'package:get/get.dart';
import 'package:management_project/presentation/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:management_project/presentation/modules/dashboard/views/pages/dashboard_page.dart';
import 'package:management_project/presentation/modules/login/bindings/login_binding.dart';
import 'package:management_project/presentation/modules/login/views/pages/login_page.dart';
import 'package:management_project/presentation/modules/notifications/bindings/notification_binding.dart';
import 'package:management_project/presentation/modules/notifications/views/pages/notification_page.dart';
import 'package:management_project/presentation/modules/profile/bindings/change_password_binding.dart';
import 'package:management_project/presentation/modules/profile/views/pages/change_password_page.dart';
import 'package:management_project/presentation/modules/progress/bindings/progress_binding.dart';
import 'package:management_project/presentation/modules/progress/views/pages/progress_page.dart';
import 'package:management_project/presentation/modules/projects/bindings/project_detail_binding.dart';
import 'package:management_project/presentation/modules/projects/views/pages/project_detail_page.dart';
import 'package:management_project/presentation/modules/report/bindings/report_binding.dart';
import 'package:management_project/presentation/modules/report/views/pages/report_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(name: _Paths.login, binding: LoginBinding(), page: () => const LoginPage()),
    GetPage(name: _Paths.dashboard, binding: DashboardBinding(), page: () => const DashboardPage()),
    GetPage(
        name: _Paths.notification,
        binding: NotificationBinding(),
        page: () => const NotificationPage()),
    GetPage(name: _Paths.projectDetail, binding: ReportBinding(), page: () => const ReportView()),
    GetPage(
        name: _Paths.projectDetails,
        binding: ProjectDetailBinding(),
        page: () => const ProjectDetailPage()),
    GetPage(
        name: _Paths.inputProgress, binding: ProgressBinding(), page: () => const ProgressPage()),
    GetPage(
        name: _Paths.changePassword,
        binding: ChangePasswordBinding(),
        page: () => const ChangePasswordPage()),
  ];
}
