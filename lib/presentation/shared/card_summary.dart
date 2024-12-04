import 'package:flutter/material.dart';
import 'package:management_project/application/configs/app_color.dart';

class CardSummary extends StatelessWidget {
  final Color? colorIcon;
  final Color? colorBackgroundIcon;
  final Color? colorBackground;
  final String label;
  final String value;
  final Widget icon;
  final Color? colorBorder;
  final Color? labelColor;
  const CardSummary(
      {super.key,
      required this.label,
      required this.value,
      required this.icon,
      this.labelColor,
      this.colorIcon,
      this.colorBackgroundIcon,
      this.colorBackground,
      this.colorBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: colorBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorBorder ?? AppColor.colorBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: colorBackgroundIcon ?? Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: icon,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: labelColor ?? Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: labelColor ?? const Color.fromRGBO(135, 135, 135, 1),
                ),
          ),
        ],
      ),
    );
  }
}
