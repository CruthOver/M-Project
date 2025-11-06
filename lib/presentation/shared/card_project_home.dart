import 'package:flutter/material.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/application/utils/dotted_divider.dart';
import 'package:management_project/data/models/project/project_home_model.dart';

class CardProjectHome extends StatelessWidget {
  final ProjectHomeModel projectModel;
  const CardProjectHome({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color.fromRGBO(230, 230, 230, 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(230, 230, 230, 1),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Deadline ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.colorSubtitleGrey,
                          fontSize: 12.0,
                        ),
                    children: [
                      TextSpan(
                        text: projectModel.deadline ?? "-",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Text(
                  projectModel.week != null ? "Minggu ${projectModel.week}" : "N/A",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
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
                  projectModel.projectName ?? "-",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColor.colorTitle,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  projectModel.companyName ?? "-",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColor.colorSubtitleGrey,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const DottedDivider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: projectModel.colorStatus("Sedang Berjalan"),
                              shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Sedang Berjalan", // projectModel.status ?? "-",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: AppColor.colorBlack,
                              ),
                        ),
                      ],
                    ),
                    Text(
                      "${projectModel.getRealization()} %", //projectModel.realization
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColor.colorBlack,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  color: projectModel.colorStatus("Sedang Berjalan"),
                  value: projectModel.getRealization() / 100,
                  // projectModel.realization != null
                  //     ? (double.tryParse(projectModel.realization!) ?? 0) / 100
                  //     : 0 / 100,
                  borderRadius: BorderRadius.circular(10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
