import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bgColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.bgColor, elevation: 0),
  );
}
