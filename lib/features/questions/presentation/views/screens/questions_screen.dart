import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';
import 'package:online_exam_app/core/widgets/app_default_button.dart';
import 'package:online_exam_app/core/widgets/spacing.dart';
import 'package:online_exam_app/features/questions/presentation/views/widgets/choice_item.dart';
import 'package:online_exam_app/features/questions/presentation/views/widgets/exam_progrss_indicator.dart';
import 'package:online_exam_app/features/questions/presentation/views/widgets/questions_header.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  final int totalQuestions = 20;

  final List<String> questions = [
    "Select the correctly punctuated sentence.",
    'second question',
    'third question',
  ];

  final List<List<String>> answerOptions = [
    [
      "The conference was scheduled for November 15 2023, but it was postponed.",
      "The conference was scheduled for November 15, 2023 but it was postponed.",
      "The conference was scheduled for November 15, 2023, but it was postponed.",
      "The conference, was scheduled for November 15 2023 but it was postponed.",
    ],
    ['option A', 'option B', 'option C', 'option D'],
    ['option A', 'option B', 'option C', 'option D'],
  ];

  double get progress => (currentQuestionIndex + 1) / totalQuestions;

  void _selectAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex < totalQuestions - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
      });
    }
  }

  void _goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        selectedAnswerIndex = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            QuestionHeader(initialMinutes: 30),

            ExamProgressIndicator(
              currentQuestion: currentQuestionIndex + 1,
              totalQuestions: totalQuestions,
              progress: progress,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questions[currentQuestionIndex],
                      style: TextStyles.font20Black500Weight().copyWith(
                        height: 1.5,
                      ),
                    ),
                    verticalSpace(24.h),
                    Column(
                      children: List.generate(
                        answerOptions[currentQuestionIndex].length,
                        (index) => AnswerOption(
                          optionText:
                              answerOptions[currentQuestionIndex][index],
                          isSelected: selectedAnswerIndex == index,
                          onTap: () => _selectAnswer(index),
                          optionLabel: String.fromCharCode(65 + index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: currentQuestionIndex > 0
                        ? _goToPreviousQuestion
                        : null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: BorderSide(color: AppColors.primary),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                    ),
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),

                horizontalSpace(12.w),

                Expanded(
                  child: AppDefaultButton(
                    text: "Next",
                    onPressed: _goToNextQuestion,
                    backgroundColor: AppColors.primary,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
