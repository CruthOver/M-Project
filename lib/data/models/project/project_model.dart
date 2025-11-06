import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/domain/entities/project_entity.dart';
part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel extends ProjectEntity {
  ProjectModel(
      {super.projectName,
      super.companyName,
      super.duration,
      super.deadlineDate,
      super.status,
      super.realization,
      super.location,
      super.projectDate,
      super.projectId,
      super.week});

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);

  Color colorStatus() {
    if (status == 0) {
      return const Color.fromRGBO(33, 37, 41, 1);
    } else if (status == 2) {
      return AppColor.colorBlue;
    } else if (status == 3) {
      return AppColor.colorGreen;
    } else if (status == 4) {
      return AppColor.colorOrange;
    }
    return Colors.white;
  }

  String statusName() {
    if (status == 2) {
      return "Sedang Berjalan";
    } else if (status == 3) {
      return "Selesai";
    }
    return "Belum Mulai";
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
