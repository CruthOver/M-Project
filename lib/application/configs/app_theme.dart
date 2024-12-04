import 'package:flutter/material.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/application/configs/app_text_theme.dart';

class AppTheme {
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.appBackground,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColor.colorBtnYellow,
      disabledColor: Colors.grey,
    ),
  );

  ThemeData lightTheme = ThemeData(
      textTheme: const TextTheme(
        labelSmall: AppTextTheme.bodyVerySmall,
        bodySmall: AppTextTheme.bodySmall,
        bodyMedium: AppTextTheme.bodyMedium,
        bodyLarge: AppTextTheme.bodyLarge,
        titleLarge: AppTextTheme.titleLarge,
        headlineSmall: AppTextTheme.headlineSmall,
        headlineMedium: AppTextTheme.headlineMedium,
        headlineLarge: AppTextTheme.headlineLarge,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: AppTextTheme.bodyVerySmall.copyWith(
          color: AppColor.colorTitle,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppTextTheme.bodyVerySmall.copyWith(
          color: AppColor.colorGrey,
          fontWeight: FontWeight.w400,
        ),
        selectedItemColor: AppColor.colorTitle,
        unselectedItemColor: AppColor.colorGrey,
      ));
}
