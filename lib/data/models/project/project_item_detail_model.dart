import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/domain/entities/project_item_detail_entity.dart';
part 'project_item_detail_model.g.dart';

@JsonSerializable()
class ProjectItemDetailModel extends ProjectItemDetailEntity {
  ProjectItemDetailModel(
      {super.program,
      super.activity,
      super.subActivity,
      super.workName,
      super.workNo,
      super.companyName,
      super.consultant,
      super.startDate,
      super.endDate,
      super.anggaran,
      super.status,
      super.contractNo,
      super.bastNo,
      super.bapNo,
      super.adendum,
      super.adendumNo,
      super.contractDate,
      super.bastDate,
      super.bapDate,
      super.adendumDate,
      super.workLocation,
      super.description});

  factory ProjectItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectItemDetailModelToJson(this);

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
