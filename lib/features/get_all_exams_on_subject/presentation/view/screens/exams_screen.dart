import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';
import 'package:online_exam_app/core/widgets/custom_snackbar.dart';
import 'package:online_exam_app/core/widgets/loading_indicator_widget.dart';
import 'package:online_exam_app/core/widgets/spacing.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/presentation/view_models/get_exams_events.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/presentation/view_models/get_exams_states.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/presentation/view_models/get_exams_view_model.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetExamsViewModel>()..doIntent(GetExamsEvent()),
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Languages',
            style: TextStyles.font18BlackBold().copyWith(color: Colors.white),
          ),
          actions: [
            BlocBuilder<GetExamsViewModel, GetExamsStates>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  onPressed: state.examsState.isLoading
                      ? null
                      : () {
                          context.read<GetExamsViewModel>().doIntent(
                            RefreshExamsEvent(),
                          );
                        },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<GetExamsViewModel, GetExamsStates>(
          builder: (context, state) {
            final examsState = state.examsState;

            // Loading State
            if (examsState.isLoading) {
              return const Center(
                child: LoadingIndicator(size: 150, repeat: true),
              );
            }

            // Error State
            if (examsState.errorMessage != null) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 60.sp),
                      verticalSpace(16),
                      Text(
                        examsState.errorMessage!,
                        style: TextStyles.font16RedNormal(),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(16),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<GetExamsViewModel>().doIntent(
                            RefreshExamsEvent(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                        ),
                        icon: const Icon(Icons.refresh, color: Colors.white),
                        label: Text(
                          'Retry',
                          style: TextStyles.font14WhiteBold(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Success State
            final exams = examsState.data ?? [];

            if (exams.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.inbox_outlined, size: 60.sp, color: Colors.grey),
                    verticalSpace(16),
                    Text(
                      'No exams available',
                      style: TextStyles.font16BlackNormal().copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<GetExamsViewModel>().doIntent(RefreshExamsEvent());
              },
              color: AppColors.primary,
              child: ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: exams.length,
                itemBuilder: (context, index) {
                  final exam = exams[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 12.h),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text('Opening ${exam.title}'),
                        //     backgroundColor: AppColors.primary,
                        //   ),
                        // );

                        CustomSnackBar.showSuccess(
                          context: context,
                          message: 'Opening ${exam.title}',
                        );
                      },
                      borderRadius: BorderRadius.circular(12.r),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //!==================== SVG Icon ======================
                            // Container(
                            //   width: 50.w,
                            //   height: 50.h,
                            //   padding: EdgeInsets.all(8.w),
                            //   decoration: BoxDecoration(
                            //     color: const Color(0xFFF5F5F5),
                            //     borderRadius: BorderRadius.circular(8.r),
                            //   ),
                            //   child: SvgPicture.asset(
                            //     "assets/images/exam_icon.svg",
                            //     width: 35.w,
                            //     height: 35.h,
                            //     fit: BoxFit.contain,
                            //   ),
                            // ),
                            //!==================== SVG Icon ======================
                            //!====================== Image =======================
                            Image.asset(
                              "assets/images/Profit.png",
                              width: 75.w,
                              height: 75.h,
                              fit: BoxFit.contain,
                            ),

                            //!====================== Image =======================
                            horizontalSpace(12),
                            // Content
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          exam.title,
                                          style: TextStyles.font18BlackBold(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      horizontalSpace(8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timer_outlined,
                                            size: 18.sp,
                                            color: AppColors.primary,
                                          ),
                                          horizontalSpace(3),

                                          Text(
                                            '${exam.duration} Minutes',
                                            style: TextStyles.font14GreyNormal()
                                                .copyWith(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  verticalSpace(4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.quiz_outlined,
                                        size: 18.sp,
                                        color: AppColors.primary,
                                      ),
                                      horizontalSpace(3),

                                      Text(
                                        '${exam.numberOfQuestions} Question',
                                        style: TextStyles.font14GreyNormal(),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(8),
                                  Text(
                                    'From: 1.00  To: 6.00',
                                    style: TextStyles.font14GreyNormal(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
