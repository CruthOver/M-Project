import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:management_project/data/models/progress/progress_model.dart';
import 'package:management_project/domain/usecases/progress_detail_use_case.dart';
import 'package:management_project/domain/usecases/submit_progress_use_case.dart';

class ProgressController extends GetxController {
  final ProgressDetailUseCase progressDetailUseCase;
  final SubmitProgressUseCase submitProgressUseCase;
  ProgressController({required this.progressDetailUseCase, required this.submitProgressUseCase});

  var progressDetail = ProgressModel().obs;
  var realizationCtrl = TextEditingController().obs;
  var deviationCtrl = TextEditingController().obs;
  var realizationMoneyCtrl = TextEditingController().obs;
  var workDescCtrl = TextEditingController().obs;
  var notesCtrl = TextEditingController().obs;
  var projectId = 0.obs;
  var progressId = 0.obs;
  var statusProject = 0.obs;
  var isLoading = false.obs;
  var deviationValue = 0.0.obs;
  var isSubmit = false.obs;
  var showBtnSubmit = true.obs;
  var isReported = false.obs;

  var files = <XFile>[].obs;

  @override
  void onInit() async {
    if (Get.arguments != null) {
      debugPrint("Arguments : ${Get.arguments}");
      progressId.value = Get.arguments['progress_id'];
      projectId.value = Get.arguments['project_id'];
      statusProject.value = Get.arguments['status_project'];
    }
    await getDetailProgress();
    deviationCtrl.value.text = deviationValue.value.toString();
    realizationCtrl.value.addListener(
      () {
        if (realizationCtrl.value.text.trim().isNotEmpty) {
          String replace = realizationCtrl.value.text.replaceAll(",", ".");
          double realizationValue = double.tryParse(replace) ?? 0;
          double targetValue = progressDetail.value.getTarget();
          //double.tryParse(progressDetail.value.target ?? "0") ?? 0;

          deviationValue.value = realizationValue - targetValue;
          deviationCtrl.value.text = deviationValue.value.toString();
        } else {
          deviationValue.value = 0.0;
          deviationCtrl.value.text = deviationValue.value.toString();
        }
      },
    );
    super.onInit();
  }

  Future<void> submitProgress() async {
    if (!validationForm()) {
      return;
    }
    isSubmit.toggle();
    Map<String, dynamic> data = {
      "realization": realizationCtrl.value.text,
      "target": progressDetail.value.target.toString(),
      "deviation": deviationCtrl.value.text,
      "notes": notesCtrl.value.text,
      "works_has_done": workDescCtrl.value.text,
      "keuangan": realizationMoneyCtrl.value.text.trim(),
    };
    List<MultipartFile> multipartFiles = [];
    for (var i = 0; i < files.length; i++) {
      multipartFiles.add(
        MultipartFile(
          File(files[i].path),
          filename: files[i].name,
        ),
      );
    }
    data['upload_foto[]'] = multipartFiles;
    final response = await submitProgressUseCase.execute((projectId.value, progressId.value, data));
    if (response.success!) {
      isSubmit.toggle();
      Get.back();
      Get.closeCurrentSnackbar();
      Get.snackbar("Berhasil", "Laporan Progress berhasil dibuat",
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      isSubmit.toggle();
      Get.snackbar("[Error]", "Terjadi kesalahan saat laporan progress",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }

  Future<void> getDetailProgress() async {
    isLoading.toggle();
    Map<String, dynamic> query = {
      "project_id": projectId.value.toString(),
      "progress_id": progressId.value.toString(),
    };
    final response = await progressDetailUseCase.execute(query);
    if (response.success!) {
      isLoading.toggle();
      progressDetail.value = response.data!;

      if (progressDetail.value.status == 'reported' && statusProject.value != 3) {
        realizationCtrl.value.text = progressDetail.value.getRealization().toString();
        deviationCtrl.value.text =
            progressDetail.value.getDeviation().toString(); //progressDetail.value.deviation
        notesCtrl.value.text = progressDetail.value.notes ?? "";
        deviationValue.value = progressDetail.value
            .getDeviation(); //double.tryParse(progressDetail.value.deviation ?? "0") ?? 0.0;
        isReported.value = true;
        realizationMoneyCtrl.value.text = progressDetail.value.keuangan.toString();
        workDescCtrl.value.text = progressDetail.value.workHasDone != null
            ? progressDetail.value.workHasDone.toString()
            : "";
      }

      if (progressDetail.value.status == 'reported' && statusProject.value == 3) {
        showBtnSubmit.value = false;
      }
    } else {
      isLoading.toggle();
      Get.snackbar("Gagal", "Gagal mendapatkan data proyek");
    }
  }

  Future<void> imagePicker() async {
    if (files.length == 5) {
      Get.closeCurrentSnackbar();
      Get.snackbar("Peringatan!!!", "Jumlah foto sudah maksimal",
          backgroundColor: Colors.amber, colorText: Colors.black);
      return;
    }

    final ImagePicker picker = ImagePicker();
    if (5 - files.length < 2) {
      XFile? selectedFiles = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        requestFullMetadata: true,
      );
      if (selectedFiles != null) {
        files.add(selectedFiles);
      }
    } else {
      List<XFile> selectedFiles = await picker.pickMultiImage(
        imageQuality: 80,
        requestFullMetadata: true,
        limit: 5 - files.length,
      );

      for (var file in selectedFiles) {
        if (files.length < 5) {
          files.add(file);
        }
      }
    }
  }

  Future<void> imagePickCamera() async {
    if (files.length == 5) {
      Get.closeCurrentSnackbar();
      Get.snackbar("Peringatan!!!", "Jumlah foto sudah maksimal",
          backgroundColor: Colors.amber, colorText: Colors.black);
      return;
    }
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      imageQuality: 80,
      requestFullMetadata: true,
      source: ImageSource.camera,
    );

    if (file != null) {
      files.add(file);
    }
  }

  bool validationForm() {
    String message = "";
    if (realizationCtrl.value.text.isEmpty) {
      message = "Realisasi wajib diisi";
    } else if (workDescCtrl.value.text.isEmpty) {
      message = "Pekerjaan yang dilaksanakan wajib diisi";
    } else if (notesCtrl.value.text.isEmpty) {
      message = "Catatan harus diisi";
    }

    if (files.isEmpty && progressDetail.value.documents!.isEmpty) {
      message = "Foto harus ada minimal 1";
    }

    if (message.isNotEmpty) {
      Get.snackbar("Validasi Gagal", message,
          backgroundColor: Colors.amber, colorText: Colors.black);
      return false;
    }
    return true;
  }
}
