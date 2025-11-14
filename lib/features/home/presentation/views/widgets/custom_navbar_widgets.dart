import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/constants/app_text_constants.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'navbar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteBlue,
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItem(
              index: 0,
              icon: Icons.home_outlined,
              label: AppTextConstants.explore,
              isSelected: currentIndex == 0,
              onTap: onTap,
            ),
            NavBarItem(
              index: 1,
              icon: Icons.edit_document,
              label: AppTextConstants.result,
              isSelected: currentIndex == 1,
              onTap: onTap,
            ),
            NavBarItem(
              index: 2,
              icon: Icons.person_outline,
              label: AppTextConstants.profile,
              isSelected: currentIndex == 2,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
