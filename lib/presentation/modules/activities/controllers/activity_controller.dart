import 'package:get/get.dart';
import 'package:management_project/data/models/activity_model.dart';

class ActivityController extends GetxController {
  var activities = <ActivityModel>[].obs;

  @override
  void onInit() {
    activities.value = [
      ActivityModel(
        title: "Progress Project",
        desc:
            "Kamu mengupload progress mingguan pada project perbaikan jalan merunda periode minggu ke- 5.",
        duration: "5h",
      ),
      ActivityModel(
        title: "Progress Project",
        desc:
            "Kamu mengupload progress mingguan pada project perbaikan jalan merunda periode minggu ke- 5.",
        duration: "5h",
      ),
      ActivityModel(
        title: "Progress Project",
        desc:
            "Kamu mengupload progress mingguan pada project perbaikan jalan merunda periode minggu ke- 5.",
        duration: "5h",
      ),
      ActivityModel(
        title: "Progress Project",
        desc:
            "Kamu mengupload progress mingguan pada project perbaikan jalan merunda periode minggu ke- 5.",
        duration: "5h",
      ),
      ActivityModel(
        title: "Progress Project",
        desc:
            "Kamu mengupload progress mingguan pada project perbaikan jalan merunda periode minggu ke- 5.",
        duration: "5h",
      ),
      ActivityModel(
        title: "Progress Project",
        desc:
            "Kamu mengupload progress mingguan pada project perbaikan jalan merunda periode minggu ke- 5.",
        duration: "5h",
      ),
      ActivityModel(
        title: "Progress Project",
        desc:
            "Kamu mengupload progress mingguan pada project perbaikan jalan merunda periode minggu ke- 5.",
        duration: "5h",
      ),
    ];
    super.onInit();
  }
}
