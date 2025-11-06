import 'package:get/get.dart';
import 'package:management_project/data/models/project/project_detail_model.dart';
import 'package:management_project/domain/usecases/project_detail_use_case.dart';

class ReportController extends GetxController {
  final ProjectDetailUseCase projectDetailUseCase;

  ReportController({required this.projectDetailUseCase});

  var projectDetail = ProjectDetailModel().obs;
  var projectId = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      projectId.value = Get.arguments;
    }
    getDetailProject();
    super.onInit();
  }

  Future<void> getDetailProject() async {
    isLoading.toggle();
    final response = await projectDetailUseCase.execute(projectId.value.toString());
    if (response.success!) {
      projectDetail.value = response.data!;
      isLoading.toggle();
    } else {
      isLoading.toggle();
      Get.snackbar("Gagal", "Gagal mengambil detail proyek");
    }
  }
}
