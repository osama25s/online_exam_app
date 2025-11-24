import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/core/constants/app_text_constants.dart';
import 'package:online_exam_app/core/gen/assets.gen.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';
import 'package:online_exam_app/core/widgets/app_default_button.dart';

class TimeoutDialog extends StatelessWidget {
  const TimeoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.sandClock.path,
            width: 45.w,
            height: 86.h,
          ),
          Text(
            AppTextConstants.timeOut,
            style: TextStyles.font24Red400Weight(),
          ),
        ],
      ),
      actions: [
        AppDefaultButton(
          text: AppTextConstants.viewScore,
          onPressed: () {},
          backgroundColor: AppColors.primary,
        ),
      ],
    );
  }
}
