import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/data/models/activity_model.dart';

class CardActivity extends StatelessWidget {
  final ActivityModel activityModel;
  const CardActivity({super.key, required this.activityModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColor.colorBorder,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(244, 244, 244, 1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset("assets/icons/pie_chart.svg"),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activityModel.title ?? "-",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColor.colorBlack,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        activityModel.desc ?? "-",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColor.colorDescGrey,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  activityModel.duration ?? "-",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.colorSubtitleGrey,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
