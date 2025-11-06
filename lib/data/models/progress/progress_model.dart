import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/domain/entities/progress_entity.dart';
part 'progress_model.g.dart';

@JsonSerializable()
class ProgressModel extends ProgressEntity {
  ProgressModel(
      {super.id,
      super.projectId,
      super.week,
      super.dateStart,
      super.dateEnd,
      super.timeRemaining,
      super.timeRunning,
      super.target,
      super.realization,
      super.deviation,
      super.keuangan,
      super.workHasDone,
      super.notes,
      super.reportBy,
      super.reportAt,
      super.status,
      super.createdAt,
      super.updatedAt,
      super.documents});

  factory ProgressModel.fromJson(Map<String, dynamic> json) => _$ProgressModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProgressModelToJson(this);

  Color colorStatus() {
    if (status == "not reported") {
      return Colors.red;
    } else if (status == "belum melapor") {
      return const Color.fromRGBO(250, 152, 62, 1);
    } else if (status == "selesai" || status == "telesai terlambat" || status == 'reported') {
      return AppColor.colorGreen;
    }
    return Colors.black;
  }

  bool checkTargetCompleted() {
    double realization = double.tryParse(this.realization ?? "0.0") ?? 0.0;
    double target = double.tryParse(this.target ?? "0.0") ?? 0.0;

    // debugPrint("Check : ${realization <= target}");
    if (status == 'reported' && realization >= target) {
      return true;
    } else if (status != 'reported') {
      return true;
    }
    return false;
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

  double getTarget() {
    if (target == null) {
      return 0;
    } else if (target is String) {
      return double.tryParse(target) ?? 0;
    } else if (target is num) {
      return target;
    }
    return 0;
  }

  double getDeviation() {
    if (deviation == null) {
      return 0;
    } else if (deviation is String) {
      return double.tryParse(deviation) ?? 0;
    } else if (deviation is num) {
      return deviation;
    }
    return 0;
  }
}
