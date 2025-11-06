import 'package:flutter/material.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/application/extensions/string_extension.dart';
import 'package:management_project/application/helpers/date_helper.dart';
import 'package:management_project/data/models/progress/progress_model.dart';

class CardProgress extends StatelessWidget {
  final ProgressModel progressModel;
  final void Function(ProgressModel progress)? onClicked;
  const CardProgress({super.key, required this.progressModel, this.onClicked});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClicked!(progressModel);
      },
      child: Card(
        elevation: 1.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: Color.fromRGBO(230, 230, 230, 1),
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: progressModel.checkTargetCompleted() ? Colors.white : Colors.red,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: progressModel.checkTargetCompleted()
                          ? const Color.fromRGBO(230, 230, 230, 1)
                          : Colors.red,
                    ),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    progressModel.week == null ? "N/A" : "Minggu ke ${progressModel.week}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.colorSoftBlack,
                        ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${DateHelper.formatDate(progressModel.dateStart!)} - ${DateHelper.formatDate(progressModel.dateEnd!)}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.colorSoftBlack,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              color: progressModel.checkTargetCompleted()
                  ? const Color.fromRGBO(239, 243, 250, 1)
                  : Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Realisasi ${progressModel.getRealization()} %", //progressModel.realization
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColor.colorBlack,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    "dari target ${progressModel.getTarget()} %", //progressModel.target ?? 0
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: const Color.fromRGBO(7, 20, 55, 1),
                        ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: progressModel.checkTargetCompleted() ? Colors.white : Colors.red,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: progressModel.colorStatus(),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(progressModel.status != null
                          ? progressModel.status!.capitalizeFirsTofEach
                          : "-"),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Upload",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: progressModel.checkTargetCompleted()
                                      ? AppColor.colorSubtitleGrey
                                      : Colors.white,
                                ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            progressModel.reportAt != null
                                ? DateHelper.formatDateTime(progressModel.reportAt!)
                                : "-",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColor.colorSoftBlack,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Diupload Oleh",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: progressModel.checkTargetCompleted()
                                      ? AppColor.colorSubtitleGrey
                                      : Colors.white,
                                ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            progressModel.reportBy != null ? "${progressModel.reportBy}" : "-",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColor.colorSoftBlack,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
