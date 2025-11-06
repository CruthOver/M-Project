import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/application/helpers/date_helper.dart';
import 'package:management_project/presentation/modules/progress/controllers/progress_controller.dart';
import 'package:management_project/presentation/shared/custom_textfield.dart';
import 'package:photo_view/photo_view.dart';

class ProgressPage extends GetView<ProgressController> {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            elevation: 2.0,
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: Text(
              "Input Progress",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          body: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                              const BorderSide(color: Color.fromRGBO(230, 230, 230, 1), width: 1.0),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(230, 230, 230, 1),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/ic_day.svg",
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    controller.progressDetail.value.week == null
                                        ? "N/A"
                                        : "Minggu ${controller.progressDetail.value.week}",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: AppColor.colorBlack,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Periode",
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: AppColor.colorSubtitleGrey,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${DateHelper.formatDateFullMonth(controller.progressDetail.value.dateStart!)} - "
                                    "${DateHelper.formatDateFullMonth(controller.progressDetail.value.dateEnd!)} "
                                    "(${DateHelper.differenceDate(controller.progressDetail.value.dateStart!, controller.progressDetail.value.dateEnd!)})",
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: AppColor.colorBlack,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Waktu Berjalan",
                                              style:
                                                  Theme.of(context).textTheme.labelSmall!.copyWith(
                                                        color: AppColor.colorSubtitleGrey,
                                                      ),
                                            ),
                                            Text(
                                              "${controller.progressDetail.value.timeRunning} Hari",
                                              style:
                                                  Theme.of(context).textTheme.bodySmall!.copyWith(
                                                        color: AppColor.colorBlack,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Waktu Tersisa",
                                              style:
                                                  Theme.of(context).textTheme.labelSmall!.copyWith(
                                                        color: AppColor.colorSubtitleGrey,
                                                      ),
                                            ),
                                            Text(
                                              "${controller.progressDetail.value.timeRemaining} Hari",
                                              style:
                                                  Theme.of(context).textTheme.bodySmall!.copyWith(
                                                        color: AppColor.colorBlack,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Progress Rencana",
                                              style:
                                                  Theme.of(context).textTheme.labelSmall!.copyWith(
                                                        color: AppColor.colorSubtitleGrey,
                                                      ),
                                            ),
                                            Text(
                                              "${controller.progressDetail.value.getTarget()}%",
                                              //controller.progressDetail.value.target
                                              style:
                                                  Theme.of(context).textTheme.bodySmall!.copyWith(
                                                        color: AppColor.colorBlack,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                      //     border: Border.all(
                      //       color: const Color.fromRGBO(230, 230, 230, 1),
                      //     ),
                      //   ),
                      //   child: ,
                      // ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(234, 244, 255, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(106, 159, 217, 1),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info_outline_rounded,
                              color: Color.fromRGBO(59, 111, 217, 1),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Setiap field yang diisi akan tersimpan otomatis",
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color.fromRGBO(59, 111, 217, 1),
                                  ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _formRow(
                        context,
                        label: "Realisasi (%)",
                        controller: controller.realizationCtrl.value,
                        inputType: TextInputType.number,
                        enabled: !(controller.progressDetail.value.status == 'reported' &&
                            controller.statusProject.value == 3),
                      ),
                      _formRow(context,
                          label: "Deviasi (%) *otomatis",
                          controller: controller.deviationCtrl.value,
                          enabled: false,
                          fillColor: controller.deviationValue.value == 0
                              ? const Color.fromRGBO(244, 244, 244, 1)
                              : controller.deviationValue.value < 0
                                  ? const Color.fromRGBO(255, 246, 246, 1)
                                  : const Color.fromRGBO(242, 255, 249, 1),
                          borderColor: controller.deviationValue.value == 0
                              ? null
                              : controller.deviationValue.value < 0
                                  ? const Color.fromRGBO(192, 36, 37, 1)
                                  : const Color.fromRGBO(0, 157, 85, 1)),
                      _formRow(
                        context,
                        label: "Realisasi Keuangan",
                        controller: controller.realizationMoneyCtrl.value,
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(),
                      ),
                      _formRow(
                        context,
                        label: "Pekerjaan yang Dilaksanakan",
                        hintText: "Masukkan Pekerjaan yang Dilaksanakan",
                        controller: controller.workDescCtrl.value,
                        maxLines: 4,
                        enabled: !(controller.progressDetail.value.status == 'reported' &&
                            controller.statusProject.value == 3),
                      ),
                      _formRow(
                        context,
                        label: "Catatan",
                        hintText: "Masukkan Catatan",
                        controller: controller.notesCtrl.value,
                        maxLines: 4,
                        enabled: !(controller.progressDetail.value.status == 'reported' &&
                            controller.statusProject.value == 3),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Upload Foto (max 5)",
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColor.colorSubtitleGrey,
                                  ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            if (controller.progressDetail.value.status == 'reported' &&
                                controller.statusProject.value == 3)
                              GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 3 / 3,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.progressDetail.value.documents!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  String filePath = controller
                                      .progressDetail.value.documents![index]['file_path'];
                                  return InkWell(
                                    onTap: () {
                                      Get.bottomSheet(
                                          Stack(
                                            children: [
                                              PhotoView(
                                                imageProvider: CachedNetworkImageProvider(filePath),
                                              ),
                                              Positioned(
                                                bottom: 50,
                                                left: 70,
                                                right: 70,
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: Colors.white,
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                    shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(Radius.circular(32.0)),
                                                    ),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    'TUTUP'.toUpperCase(),
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(Get.context!)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          color: Colors.white,
                                                          letterSpacing: 1,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          isScrollControlled: true);
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl: filePath,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: const Icon(
                                            Icons.broken_image,
                                            size: 64,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            //&& controller.statusProject.value == 3
                            if (controller.files.isNotEmpty ||
                                (controller.progressDetail.value.status == 'reported' &&
                                    controller.statusProject.value != 3))
                              GridView(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 3 / 3,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  ...controller.progressDetail.value.documents!.map(
                                    (element) {
                                      return InkWell(
                                        onTap: () {
                                          Get.bottomSheet(
                                              Stack(
                                                children: [
                                                  PhotoView(
                                                    imageProvider: CachedNetworkImageProvider(
                                                        "${element['file_path']}"),
                                                  ),
                                                  Positioned(
                                                    bottom: 50,
                                                    left: 70,
                                                    right: 70,
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                        foregroundColor: Colors.white,
                                                        padding: const EdgeInsets.symmetric(
                                                            horizontal: 16.0),
                                                        shape: const RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(32.0)),
                                                        ),
                                                        backgroundColor: Colors.red,
                                                      ),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        'TUTUP'.toUpperCase(),
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(Get.context!)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                              color: Colors.white,
                                                              letterSpacing: 1,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              isScrollControlled: true);
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: element['file_path'],
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: const Icon(
                                                Icons.broken_image,
                                                size: 64,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  ...controller.files.map(
                                    (element) {
                                      return Stack(
                                        alignment: Alignment.center,
                                        fit: StackFit.expand,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.bottomSheet(
                                                  Stack(
                                                    children: [
                                                      PhotoView(
                                                        imageProvider:
                                                            FileImage(File(element.path)),
                                                      ),
                                                      Positioned(
                                                        bottom: 50,
                                                        left: 70,
                                                        right: 70,
                                                        child: TextButton(
                                                          style: TextButton.styleFrom(
                                                            foregroundColor: Colors.white,
                                                            padding: const EdgeInsets.symmetric(
                                                                horizontal: 16.0),
                                                            shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(32.0)),
                                                            ),
                                                            backgroundColor: Colors.red,
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          child: Text(
                                                            'TUTUP'.toUpperCase(),
                                                            textAlign: TextAlign.center,
                                                            style: Theme.of(Get.context!)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                  color: Colors.white,
                                                                  letterSpacing: 1,
                                                                  fontWeight: FontWeight.w700,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  isScrollControlled: true);
                                            },
                                            child: Image.file(
                                              File(element.path),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.files.remove(element);
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 2, vertical: 2),
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  if (((controller.progressDetail.value.documents!.length +
                                              controller.files.length) <
                                          5) &&
                                      controller.statusProject.value != 3)
                                    InkWell(
                                      onTap: () {
                                        Get.bottomSheet(_bottomSheet(context),
                                            backgroundColor: Colors.white);
                                      },
                                      child: DottedBorder(
                                        color: const Color.fromRGBO(206, 212, 218, 1),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 26,
                                        ),
                                        radius: const Radius.circular(10),
                                        borderType: BorderType.RRect,
                                        dashPattern: const [6, 0, 0, 2],
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset("assets/icons/ic_image.svg"),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Tambah Foto",
                                                style:
                                                    Theme.of(context).textTheme.bodySmall!.copyWith(
                                                          color: AppColor.colorTitle,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            const SizedBox(
                              height: 8,
                            ),
                            if (controller.files.isEmpty &&
                                (controller.progressDetail.value.documents!.isEmpty))
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.bottomSheet(_bottomSheet(context),
                                            backgroundColor: Colors.white);
                                      },
                                      child: DottedBorder(
                                        color: const Color.fromRGBO(206, 212, 218, 1),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 26,
                                        ),
                                        radius: const Radius.circular(10),
                                        borderType: BorderType.RRect,
                                        dashPattern: const [6, 0, 0, 2],
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset("assets/icons/ic_image.svg"),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Tambah Foto",
                                                style:
                                                    Theme.of(context).textTheme.bodySmall!.copyWith(
                                                          color: AppColor.colorTitle,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      if (!controller.showBtnSubmit.value)
                        const SizedBox(
                          height: 16,
                        ),
                      if (controller.showBtnSubmit.value) ...[
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: TextButton(
                            onPressed: () async {
                              if (controller.isSubmit.value) {
                                return;
                              }
                              await controller.submitProgress();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: AppColor.colorTitle,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: controller.isSubmit.value
                                ? const SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    "Update Progress",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: TextButton(
                            onPressed: () {
                              if (controller.isSubmit.value) {
                                return;
                              }
                              Get.back();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: AppColor.colorDescGrey,
                                ),
                              ),
                            ),
                            child: Text(
                              "Batal",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColor.colorDescGrey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
        ));
  }

  _formRow(BuildContext context,
      {required String label,
      required TextEditingController controller,
      String? hintText,
      bool? enabled = true,
      Color? fillColor = Colors.white,
      Color? borderColor = const Color.fromRGBO(206, 212, 218, 1),
      int? maxLines = 1,
      TextInputType? inputType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColor.colorSubtitleGrey),
          ),
          const SizedBox(
            height: 4,
          ),
          CustomTextField(
            controller: controller,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColor.colorBorder,
                ),
            borderColor: borderColor,
            enabled: enabled,
            fillColor: fillColor,
            maxLines: maxLines,
            inputType: inputType,
          ),
        ],
      ),
    );
  }

  _bottomSheet(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 12,
        ),
        Container(
          width: 40,
          height: 6,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(234, 235, 235, 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Text(
            "Upload Foto",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColor.colorBlack,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: InkWell(
                  onTap: () async {
                    await controller.imagePicker();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(249, 249, 249, 1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.colorBorder,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.image,
                          size: 32,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Galeri",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: AppColor.colorDescGrey,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: InkWell(
                  onTap: () async {
                    await controller.imagePickCamera();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(249, 249, 249, 1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.colorBorder,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.camera_alt,
                          size: 32,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Foto",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: AppColor.colorDescGrey,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
