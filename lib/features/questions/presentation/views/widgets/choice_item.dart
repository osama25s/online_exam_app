// answer_option_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';

class AnswerOption extends StatelessWidget {
  final String optionText;
  final bool isSelected;
  final VoidCallback onTap;
  final String optionLabel;

  const AnswerOption({
    Key? key,
    required this.optionText,
    required this.isSelected,
    required this.onTap,
    required this.optionLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightBlue : AppColors.extraLightGrey,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 2.w),
              ),
              child: isSelected
                  ? Container(
                      margin: EdgeInsets.all(2.5.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                    )
                  : null,
            ),
            Expanded(
              child: Text(optionText, style: TextStyles.font14Black400Weight()),
            ),
          ],
        ),
      ),
    );
  }
}
