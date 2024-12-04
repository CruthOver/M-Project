import 'package:get/get.dart';
import 'package:management_project/data/models/project_model.dart';

class ProjectController extends GetxController {
  var projects = <ProjectModel>[].obs;
  var buttonList = <String>[].obs;
  var selectedBtnIndex = 0.obs;

  @override
  void onInit() {
    projects.value = [
      ProjectModel(
          status: "Belum Mulai",
          companyName: "PT Astra International Tbk",
          deadlineDate: "05 Okt 2023",
          projectName: "Proyek Perbaikan Jalan Marunda",
          progress: 0,
          duration: "2 Minggu"),
      ProjectModel(
          status: "Sedang Berjalan",
          companyName: "PT Astra International Tbk",
          deadlineDate: "05 Okt 2023",
          projectName: "Proyek Perbaikan Jalan Marunda",
          progress: 40,
          duration: "3 Minggu"),
      ProjectModel(
          status: "Sedang Berjalan",
          companyName: "PT Astra International Tbk",
          deadlineDate: "05 Okt 2023",
          projectName: "Proyek Perbaikan Jalan Marunda",
          progress: 60,
          duration: "1 Minggu"),
    ];

    buttonList.value = [
      "Semua",
      "Belum Mulai",
      "Sedang Berjalan",
      "Butuh Penilaian",
    ];
    super.onInit();
  }
}
