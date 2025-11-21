// progress_indicator_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/constants/app_text_constants.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';
import 'package:online_exam_app/core/widgets/spacing.dart';

class ExamProgressIndicator extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final double progress;

  const ExamProgressIndicator({
    Key? key,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: AppColors.bgColor,
      child: Column(
        children: [
          Text(
            '${AppTextConstants.question} $currentQuestion ${AppTextConstants.of} $totalQuestions',
            style: TextStyles.font16Black500Weight(),
          ),
          verticalSpace(12.h),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.lightGrey,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            minHeight: 6.h,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ],
      ),
    );
  }
}
