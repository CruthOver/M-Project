import 'package:get/get.dart';
import 'package:management_project/data/models/project/project_dashboard_model.dart';
import 'package:management_project/domain/usecases/project_summary_use_case.dart';
import 'package:management_project/presentation/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:management_project/presentation/modules/projects/controllers/project_controller.dart';

class HomeController extends GetxController {
  final ProjectSummaryUseCase projectSummaryUseCase;

  HomeController({required this.projectSummaryUseCase});
  var summary = ProjectDashboardModel().obs;
  var isLoading = false.obs;
  // var projects = <ProjectModel>[].obs;

  @override
  void onInit() {
    getSummaryProject();
    super.onInit();
  }

  Future<void> getSummaryProject() async {
    isLoading.toggle();
    final response = await projectSummaryUseCase.execute();
    if (response.success!) {
      isLoading.toggle();
      summary.value = response.data!;
    } else {
      isLoading.toggle();
    }
  }

  Future<void> goToProjectTab(int index) async {
    DashboardController dashboardController = Get.find<DashboardController>();
    ProjectController projectController = Get.find<ProjectController>();
    dashboardController.selectedMenuIndex.value = 1;
    projectController.selectedBtnIndex.value = index;
    await projectController.getProjectList();
  }
}
