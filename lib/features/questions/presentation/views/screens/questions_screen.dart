import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/constants/app_text_constants.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';
import 'package:online_exam_app/core/widgets/app_default_button.dart';
import 'package:online_exam_app/core/widgets/app_outlined_button.dart';
import 'package:online_exam_app/core/widgets/loading_indicator_widget.dart';
import 'package:online_exam_app/core/widgets/spacing.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/cubit/get_questions_cubit.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/cubit/get_questions_events.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/cubit/get_questions_state.dart';
import 'package:online_exam_app/features/questions/presentation/views/widgets/choice_item.dart';
import 'package:online_exam_app/features/questions/presentation/views/widgets/exam_progrss_indicator.dart';
import 'package:online_exam_app/features/questions/presentation/views/widgets/questions_header.dart';
import 'package:online_exam_app/features/questions/presentation/views/widgets/timeout_dialog.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen({Key? key}) : super(key: key);

  final GetQuestionsCubit getQuestionsCubit = getIt<GetQuestionsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getQuestionsCubit..onEvent(GetQuestions(exam: 'exam_id')),
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SafeArea(
          child: BlocBuilder<GetQuestionsCubit, GetQuestionsState>(
            builder: (context, state) {
              if (state.questions.isLoading) {
                return const Center(child: LoadingIndicator(size: 250));
              }

              if (state.questions.errorMessage != null) {
                return Center(
                  child: Text(
                    state.questions.errorMessage!,
                    style: TextStyles.font18Black500Weight(),
                  ),
                );
              }

              final questionsList = state.questions.data?.questions;
              if (questionsList == null || questionsList.isEmpty) {
                return Center(
                  child: Text(
                    AppTextConstants.NoQuestionsAvailable,
                    style: TextStyles.font18Black500Weight(),
                  ),
                );
              }
              final cubit = context.read<GetQuestionsCubit>();
              final currentIndex = state.currentQuestionIndex;
              final currentQuestion = questionsList[currentIndex];
              final totalQuestions = questionsList.length;
              final selectedForCurrent = state.selectedAnswers[currentIndex];

              return Column(
                children: [
                  QuestionHeader(
                    examTiltle:
                        currentQuestion.exam?.title ?? AppTextConstants.exam,
                    initialMinutes: currentQuestion.exam?.duration ?? 30,
                    onTimerComplete: () => showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) =>
                          PopScope(canPop: false, child: TimeoutDialog()),
                    ),
                  ),
                  ExamProgressIndicator(
                    currentQuestion: currentIndex + 1,
                    totalQuestions: totalQuestions,
                    progress: totalQuestions > 0
                        ? (currentIndex + 1) / totalQuestions
                        : 0,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentQuestion.question ??
                                AppTextConstants.NoQuestionsAvailable,
                            style: TextStyles.font20Black500Weight().copyWith(
                              height: 1.5,
                            ),
                          ),
                          verticalSpace(24.h),

                          Column(
                            children: List.generate(
                              currentQuestion.answers?.length ?? 0,
                              (index) {
                                final answer = currentQuestion.answers![index];
                                return AnswerOption(
                                  optionText:
                                      answer.answer ??
                                      AppTextConstants
                                          .NoQuestionOptionsAvailable,
                                  isSelected: selectedForCurrent == index,
                                  onTap: () {
                                    cubit.selectAnswer(
                                      questionIndex: currentIndex,
                                      answerIndex: index,
                                    );
                                    cubit.setAnswerKey(
                                      currentQuestion.id!,
                                      answer.key!,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          verticalSpace(40.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomOutlinedButton(
                                  title: AppTextConstants.back,
                                  borderRadius: 10.r,
                                  onPressed: cubit.goToPreviousQuestion,
                                ),
                              ),
                              horizontalSpace(14.w),
                              Expanded(
                                child: AppDefaultButton(
                                  text: AppTextConstants.next,
                                  onPressed: cubit.goToNextQuestion,
                                  backgroundColor: AppColors.primary,
                                  textColor: Colors.white,
                                  borderRadius: 10.r,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
