import 'package:get/get.dart';
import 'package:management_project/data/models/project_model.dart';

class HomeController extends GetxController {
  var projects = <ProjectModel>[].obs;

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
    super.onInit();
  }
}
