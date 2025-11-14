import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constants/app_text_constants.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';
import 'package:online_exam_app/core/widgets/app_text_button.dart';
import 'package:online_exam_app/core/widgets/spacing.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppTextConstants.dontHaveAnAccount,
          style: TextStyles.font16Black500Weight(),
        ),
        horizontalSpace(2),
        AppTextButton(
          text: AppTextConstants.signUp,
          onPressed: () {},
          textStyle: TextStyles.font16Black500Weight().copyWith(
            color: AppColors.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
