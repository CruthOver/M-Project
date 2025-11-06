import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/data/models/notification_model.dart';

class CardNotification extends StatelessWidget {
  final NotificationModel notificationModel;
  const CardNotification({super.key, required this.notificationModel});

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
            child: notificationModel.isSuccess == "warning"
                ? const Icon(
                    Icons.watch_later_outlined,
                    color: Color.fromRGBO(255, 132, 17, 1),
                  )
                : SvgPicture.asset("assets/icons/cube.svg"),
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
                      Row(
                        children: [
                          Text(
                            notificationModel.generateTitle(),
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColor.colorBlack,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            notificationModel.description == "-"
                                ? ""
                                : notificationModel.description ?? "",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColor.colorDescGrey,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        notificationModel.message ?? "-",
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
                  notificationModel.duration(),
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
