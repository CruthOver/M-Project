import 'package:flutter/material.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel(
      {super.projectName,
      super.companyName,
      super.duration,
      super.deadlineDate,
      super.status,
      super.progress});

  Color colorStatus() {
    if (status == "Belum Mulai") {
      return const Color.fromRGBO(33, 37, 41, 1);
    } else if (status == "Sedang Berjalan") {
      return AppColor.colorBlue;
    } else if (status == "Selesai" || status == "Selesai & Terlambat") {
      return AppColor.colorGreen;
    } else if (status == "Belum Melapor") {
      return AppColor.colorOrange;
    }
    return Colors.white;
  }
}
