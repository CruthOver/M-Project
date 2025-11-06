import 'package:get/get.dart';
import 'package:management_project/data/repositories/activity_repository_impl.dart';
import 'package:management_project/data/repositories/auth_repository_impl.dart';
import 'package:management_project/data/repositories/notification_repository_impl.dart';
import 'package:management_project/data/repositories/profile_repository_impl.dart';
import 'package:management_project/data/repositories/progress_repository_impl.dart';
import 'package:management_project/data/repositories/project_repository_impl.dart';
import 'package:management_project/domain/usecases/change_password_use_case.dart';
import 'package:management_project/domain/usecases/get_activities_use_case.dart';
import 'package:management_project/domain/usecases/get_notification_use_case.dart';
import 'package:management_project/domain/usecases/get_profile_use_case.dart';
import 'package:management_project/domain/usecases/login_use_case.dart';
import 'package:management_project/domain/usecases/logout_use_case.dart';
import 'package:management_project/domain/usecases/progress_detail_use_case.dart';
import 'package:management_project/domain/usecases/project_detail_use_case.dart';
import 'package:management_project/domain/usecases/project_summary_use_case.dart';
import 'package:management_project/domain/usecases/project_use_case.dart';
import 'package:management_project/domain/usecases/rincian_project_use_case.dart';
import 'package:management_project/domain/usecases/submit_progress_use_case.dart';
import 'package:management_project/domain/usecases/update_profile_use_case.dart';

class DependencyCreator {
  static init() {
    //Repositories
    Get.lazyPut(() => AuthRepositoryImpl(), fenix: true);
    Get.lazyPut(() => ProjectRepositoryImpl(), fenix: true);
    Get.lazyPut(() => ProgressRepositoryImpl(), fenix: true);
    Get.lazyPut(() => ProfileRepositoryImpl(), fenix: true);
    Get.lazyPut(() => ActivityRepositoryImpl(), fenix: true);
    Get.lazyPut(() => NotificationRepositoryImpl(), fenix: true);

    //Use Case
    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => LogoutUseCase(Get.find<AuthRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => ProjectSummaryUseCase(Get.find<ProjectRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => ProjectListUseCase(Get.find<ProjectRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => ProjectDetailUseCase(Get.find<ProjectRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => ProgressDetailUseCase(Get.find<ProgressRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => SubmitProgressUseCase(Get.find<ProgressRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => GetProfileUseCase(Get.find<ProfileRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => ChangePasswordUseCase(Get.find<ProfileRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => GetActivityUseCase(Get.find<ActivityRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => UpdateProfileUseCase(Get.find<ProfileRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => RincianProjectUseCase(Get.find<ProjectRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => GetNotificationUseCase(Get.find<NotificationRepositoryImpl>()), fenix: true);
  }
}
