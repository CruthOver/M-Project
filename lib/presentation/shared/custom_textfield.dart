import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color? borderColor;
  final Color? fillColor;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final int? maxLines;
  final TextStyle? hintStyle;
  final bool? obscureText;
  final TextInputType? inputType;
  final void Function(String?)? onSubmitted;
  const CustomTextField(
      {super.key,
      required this.controller,
      this.fillColor = Colors.white,
      this.borderColor,
      this.hintText,
      this.enabled = true,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines = 1,
      this.hintStyle,
      this.obscureText = false,
      this.inputType = TextInputType.text,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black,
          ),
      obscureText: obscureText ?? false,
      maxLines: maxLines,
      keyboardType: inputType,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor ?? Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor ?? Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor ?? Colors.white),
        ),
        hintText: hintText,
        hintStyle: hintStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        isDense: true,
      ),
    );
  }
}
