import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/domain/entities/project_home_entity.dart';
part 'project_home_model.g.dart';

@JsonSerializable()
class ProjectHomeModel extends ProjectHomeEntity {
  ProjectHomeModel(
      {super.id,
      super.projectName,
      super.companyName,
      super.week,
      super.realization,
      super.deadline});

  factory ProjectHomeModel.fromJson(Map<String, dynamic> json) => _$ProjectHomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectHomeModelToJson(this);

  Color colorStatus(String status) {
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

  double getRealization() {
    if (realization == null) {
      return 0;
    } else if (realization is String) {
      return double.tryParse(realization) ?? 0;
    } else if (realization is num) {
      return realization;
    }
    return 0;
  }
}
