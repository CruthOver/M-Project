import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/project/get_project_home_model.dart';
import 'package:management_project/data/models/project/project_model.dart';
import 'package:management_project/domain/usecases/project_use_case.dart';

class ProjectController extends GetxController {
  final ProjectListUseCase projectListUseCase;

  ProjectController({required this.projectListUseCase});

  var searchCtrl = TextEditingController().obs;
  var projects = <ProjectModel>[].obs;
  var data = GetProjectHomeModel().obs;
  var buttonList = <String>[].obs;
  var selectedBtnIndex = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getProjectList();

    buttonList.value = ["Semua", "Sedang Berjalan", "Selesai", "Deadline"];
    super.onInit();
  }

  Future<void> getProjectList() async {
    isLoading.toggle();
    Map<String, dynamic> query = {
      "query": searchCtrl.value.text.trim(),
      "status": selectedBtnIndex.value == 0 ? "" : (selectedBtnIndex.value + 1).toString(),
      "deadline": selectedBtnIndex.value == (buttonList.length - 1) ? "true" : "",
    };
    final BaseResponseModel<GetProjectHomeModel> response = await projectListUseCase.execute(query);
    if (response.success!) {
      isLoading.toggle();
      data.value = response.data!;
      projects.value = response.data!.projects ?? [];
    } else {
      isLoading.toggle();
      Get.snackbar("Gagal", "Gagal mendapatkan data proyek");
    }
  }
}
