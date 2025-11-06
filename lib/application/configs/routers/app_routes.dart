part of 'app_pages.dart';

abstract class Routes {
  static const init = _Paths.init;
  static const login = _Paths.login;
  static const dashboard = _Paths.dashboard;
  static const notification = _Paths.notification;
  static const projectDetail = _Paths.projectDetail;
  static const projectDetails = _Paths.projectDetails;
  static const inputProgress = _Paths.inputProgress;
  static const changePassword = _Paths.changePassword;
}

abstract class _Paths {
  static const init = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const notification = '/notification';
  static const projectDetail = '/project-detail';
  static const projectDetails = '/project-details';
  static const inputProgress = '/input-progress';
  static const changePassword = '/change-password';
}
