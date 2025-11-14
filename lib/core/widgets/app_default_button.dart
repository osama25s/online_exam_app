import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

class AppDefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final bool isLoading;

  const AppDefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.width,
    this.height,
    this.textStyle,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          disabledBackgroundColor: (backgroundColor ?? AppColors.grey),
          foregroundColor: textColor ?? AppColors.bgColor,
          padding: padding ?? EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 28.r),
          ),
          elevation: 0,
        ),
        child: Center(
          child: Text(
            text,
            style:
                textStyle ??
                TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
