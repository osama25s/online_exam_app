// exam_header_widget.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/constants/app_text_constants.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';
import 'package:online_exam_app/core/widgets/spacing.dart';

class QuestionHeader extends StatefulWidget {
  final int initialMinutes;

  const QuestionHeader({super.key, required this.initialMinutes});

  @override
  State<QuestionHeader> createState() => _QuestionHeaderState();
}

class _QuestionHeaderState extends State<QuestionHeader> {
  late int remainingSeconds;
  Timer? timer;
  late int minutes;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.initialMinutes * 60;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() => remainingSeconds--);
      }
    });
  }

  String formatTime(int seconds) {
    minutes = seconds ~/ 60;
    int secs = seconds % 60;

    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
      centerTitle: true,
      title: Text(
        AppTextConstants.exam,
        style: TextStyles.font18Black500Weight(),
      ),
      actions: [
        Icon(Icons.timer_outlined, size: 22.w, color: AppColors.primary),
        horizontalSpace(4.w),
        Text(
          formatTime(remainingSeconds),
          style: TextStyles.font16Primary500Weight().copyWith(
            color: minutes <= 10 ? AppColors.red : AppColors.green,
          ),
        ),
      ],
    );
  }
}
