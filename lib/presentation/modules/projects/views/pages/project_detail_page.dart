import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/application/helpers/date_helper.dart';
import 'package:management_project/application/utils/currency_format.dart';
import 'package:management_project/presentation/modules/projects/controllers/project_detail_controller.dart';

class ProjectDetailPage extends GetView<ProjectDetailController> {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 2.0,
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: Text(
              "Detail Proyek",
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
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.projectItem.value.colorStatus(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  controller.projectItem.value.status ?? "-",
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: AppColor.colorBlack,
                                      ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  text:
                                      "${DateHelper.remainingDay(controller.projectItem.value.endDate ?? "").inDays.abs()}",
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: controller.isMinus.value
                                            ? Colors.red
                                            : const Color.fromRGBO(59, 111, 217, 1),
                                        fontWeight: FontWeight.w600,
                                      ),
                                  children: [
                                    TextSpan(
                                      text: " hari",
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: controller.isMinus.value
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    TextSpan(
                                      text: " :",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: controller.isMinus.value
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          " ${DateHelper.remainingDay(controller.projectItem.value.endDate ?? "").inHours % 24}",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: controller.isMinus.value
                                                ? Colors.red
                                                : const Color.fromRGBO(59, 111, 217, 1),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    TextSpan(
                                      text: " jam",
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: controller.isMinus.value
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    TextSpan(
                                      text: " :",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: controller.isMinus.value
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          " ${DateHelper.remainingDay(controller.projectItem.value.endDate ?? "").inMinutes % 60} ",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: controller.isMinus.value
                                                ? Colors.red
                                                : const Color.fromRGBO(59, 111, 217, 1),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    TextSpan(
                                      text: " menit",
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: controller.isMinus.value
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Waktu Proyek",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColor.colorBlack,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color.fromRGBO(230, 230, 230, 1),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Tanggal Mulai",
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                color: AppColor.colorSubtitleGrey,
                                              ),
                                        ),
                                        Text(
                                          DateHelper.formatOnlyDate(
                                              controller.projectItem.value.startDate),
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                color: AppColor.colorSoftBlack,
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
                                          "Tanggal Akhir",
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                color: AppColor.colorSubtitleGrey,
                                              ),
                                        ),
                                        Text(
                                          DateHelper.formatOnlyDate(
                                              controller.projectItem.value.endDate),
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                color: AppColor.colorSoftBlack,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Detail Pekerjaan",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColor.colorBlack,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color.fromRGBO(230, 230, 230, 1),
                                ),
                              ),
                              child: Column(
                                children: [
                                  _itemRow(
                                      "No Pekerjaan", controller.projectItem.value.workNo ?? "-"),
                                  _itemRow("Nama Pekerjaan",
                                      controller.projectItem.value.workName ?? "-"),
                                  _itemRow("Lokasi Pekerjaan",
                                      controller.projectItem.value.workLocation ?? "-"),
                                  _itemRow("Perusahaan",
                                      controller.projectItem.value.companyName ?? "-"),
                                  _itemRow("Status", controller.projectItem.value.status ?? "-"),
                                  _itemRow("Program", controller.projectItem.value.program ?? "-"),
                                  _itemRow("Aktifitas", controller.projectItem.value.activity ?? "-"),
                                  _itemRow("Sub Aktifitas", controller.projectItem.value.subActivity ?? "-"),
                                  const Divider(
                                    color: AppColor.colorSubtitleGrey,
                                  ),
                                  _itemRow(
                                      "Konsultan", controller.projectItem.value.consultant ?? "-"),
                                  _itemRow("Nomor Kontrak",
                                      controller.projectItem.value.contractNo ?? "-"),
                                  _itemRow("Tanggal Kontrak",
                                      controller.projectItem.value.contractDate ?? "-"),
                                  _itemRow(
                                      "Anggaran",
                                      CurrencyFormat.convertToIdr(
                                          controller.projectItem.value.anggaran)),
                                  const Divider(
                                    color: AppColor.colorSubtitleGrey,
                                  ),
                                  _itemRow(
                                      "Nomor BAST", controller.projectItem.value.bastNo ?? "-"),
                                  _itemRow(
                                      "Tgl BAST", controller.projectItem.value.bastDate ?? "-"),
                                  _itemRow("Nomor BAP", controller.projectItem.value.bapNo ?? "-"),
                                  _itemRow("Tgl BAP", controller.projectItem.value.bapDate ?? "-"),
                                  const Divider(
                                    color: AppColor.colorSubtitleGrey,
                                  ),
                                  _itemRow("Adendum", controller.projectItem.value.adendum ?? "-"),
                                  _itemRow("Nomor Adendum",
                                      controller.projectItem.value.adendumNo ?? "-"),
                                  _itemRow("Tanggal Adendum",
                                      controller.projectItem.value.adendumDate ?? "-"),
                                  const Divider(
                                    color: AppColor.colorSubtitleGrey,
                                  ),
                                  _itemRow(
                                      "Deskripsi", controller.projectItem.value.description ?? "-"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }

  Widget _itemRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              label,
              style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
                    color: AppColor.colorSubtitleGrey,
                  ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
                    color: AppColor.colorSoftBlack,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
