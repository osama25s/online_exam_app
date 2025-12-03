import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';
import 'package:online_exam_app/core/widgets/spacing.dart';

class RememberMeCheckBox extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool?) onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final Color? borderColor;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? padding;

  const RememberMeCheckBox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    this.labelStyle,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(4),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20.w,
              height: 20.h,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: activeColor ?? AppColors.black,
                checkColor: checkColor ?? Colors.white,
                side: BorderSide(
                  color: borderColor ?? AppColors.black,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
            horizontalSpace(8),
            Text(
              label,
              style:
                  labelStyle ??
                  TextStyles.font16Grey400Weight().copyWith(
                    color: AppColors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
