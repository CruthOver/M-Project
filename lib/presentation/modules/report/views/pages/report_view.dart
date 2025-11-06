import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/application/configs/routers/app_pages.dart';
import 'package:management_project/application/helpers/date_helper.dart';
import 'package:management_project/data/models/progress/progress_model.dart';
import 'package:management_project/presentation/modules/report/controllers/report_controller.dart';
import 'package:management_project/presentation/shared/card_progress.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            elevation: 2.0,
            shadowColor: Colors.black,
            // automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: Text(
              "Laporan Progress",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.colorBlack,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        margin: const EdgeInsets.only(bottom: 10),
                        color: Colors.white,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Color.fromRGBO(230, 230, 230, 1), width: 1.0),
                          ),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromRGBO(230, 230, 230, 1),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "ID Pekerjaan : ${controller.projectDetail.value.projectNo}",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: AppColor.colorBlack,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.projectDetail.value.projectName}",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: AppColor.colorTitle,
                                          ),
                                    ),
                                    Text(
                                      "${controller.projectDetail.value.companyName}",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: AppColor.colorSubtitleGrey,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Divider(),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Lokasi",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: AppColor.colorSubtitleGrey,
                                                    ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      "${controller.projectDetail.value.location}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            color: AppColor.colorBlack,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Waktu Pelaksanaan",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: AppColor.colorSubtitleGrey,
                                                    ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      "${DateHelper.formatDate(controller.projectDetail.value.dateStart!)} - "
                                                      "${DateHelper.formatDate(controller.projectDetail.value.dateEnd!)} "
                                                      "(${DateHelper.differenceDate(controller.projectDetail.value.dateStart!, controller.projectDetail.value.dateEnd!)})",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            color: AppColor.colorBlack,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.projectDetails,
                                        arguments: controller.projectId.value);
                                  },
                                  child: Text(
                                    "Lihat Detail Proyek",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: AppColor.colorTitle,
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "INPUT PROGRESS",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColor.colorBlack,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.projectDetail.value.progress!.length,
                                itemBuilder: (context, index) {
                                  ProgressModel model =
                                      controller.projectDetail.value.progress![index];
                                  return CardProgress(
                                    progressModel: model,
                                    onClicked: (progress) {
                                      Get.toNamed(
                                        Routes.inputProgress,
                                        arguments: {
                                          "project_id": progress.projectId,
                                          "progress_id": progress.id,
                                          "status_project": controller.projectDetail.value.status,
                                        },
                                      )!
                                          .then(
                                        (value) async {
                                          await controller.getDetailProject();
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
        ));
  }
}
