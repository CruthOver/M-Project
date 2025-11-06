import 'package:flutter/material.dart';
import 'package:management_project/application/configs/app_color.dart';

class ItemRowWidget extends StatelessWidget {
  final String title;
  final String value;
  const ItemRowWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          color: AppColor.colorSubtitleGrey,
                        ),
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  ":",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.colorSoftBlack,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColor.colorSoftBlack,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
