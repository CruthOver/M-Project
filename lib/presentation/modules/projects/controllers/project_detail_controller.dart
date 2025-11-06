import 'package:get/get.dart';
import 'package:management_project/application/helpers/date_helper.dart';
import 'package:management_project/data/models/project/project_item_detail_model.dart';
import 'package:management_project/domain/usecases/rincian_project_use_case.dart';

class ProjectDetailController extends GetxController {
  final RincianProjectUseCase rincianProjectUseCase;

  ProjectDetailController({required this.rincianProjectUseCase});

  var projectItem = ProjectItemDetailModel().obs;
  var projectId = 0.obs;
  var isLoading = false.obs;
  var isMinus = false.obs;

  @override
  void onInit() async {
    if (Get.arguments != null) {
      projectId.value = Get.arguments;
    }

    await getDetailProject();
    super.onInit();
  }

  Future<void> getDetailProject() async {
    isLoading.toggle();
    final response = await rincianProjectUseCase.execute(projectId.toString());
    if (response.success!) {
      isLoading.toggle();
      projectItem.value = response.data!;
      int days = DateHelper.remainingDay(projectItem.value.endDate ?? "").inDays;
      if (days < 0) {
        isMinus.value = true;
      }
    } else {
      isLoading.toggle();
      Get.snackbar("Gagal", "Gagal mendapatkan data detail proyek");
    }
  }
}
