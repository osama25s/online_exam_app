import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/widgets/loading_indicator_widget.dart';
import 'package:online_exam_app/core/widgets/custom_snackbar.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_models/forget_password/forget_password_view_model.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_models/forget_password/forget_password_states.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_models/forget_password/forget_password_events.dart';
import '../../../../../core/routing/app_router.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordViewModel>(),
      child: const _ForgetPasswordView(),
    );
  }
}

class _ForgetPasswordView extends StatefulWidget {
  const _ForgetPasswordView();

  @override
  State<_ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<_ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
          listener: (context, state) {
            final forgetPasswordState = state.forgetPasswordState;

            // Check if we have data (success)
            if (forgetPasswordState.data != null) {
              // Show success message ✅
              CustomSnackBar.showSuccess(
                context: context,
                message:
                    forgetPasswordState.data?.message ??
                    'OTP sent successfully',
              );

              // Navigate to verification screen and pass email
              context.push(
                AppRouter.verificationCode,
                extra: _emailController.text.trim(),
              );

              // Reset state after navigation
              context.read<ForgetPasswordViewModel>().doIntent(
                ResetForgetPasswordEvent(),
              );
            }

            // Check if we have error ❌
            if (forgetPasswordState.errorMessage != null) {
              CustomSnackBar.showError(
                context: context,
                message: forgetPasswordState.errorMessage!,
              );
            }
          },
          builder: (context, state) {
            final isLoading = state.forgetPasswordState.isLoading;

            return Stack(
              children: [
                // Main Content
                Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => context.pop(),
                            child: Icon(Icons.chevron_left, size: 30.sp),
                          ),
                          SizedBox(width: 8.w),
                          Text('Password', style: TextStyle(fontSize: 20.sp)),
                        ],
                      ),
                      SizedBox(height: 32.h),

                      // Title & Description
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Forget password',
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Please enter your email associated to your account',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),

                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        enabled: !isLoading,
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: 'Enter your email',
                          hintStyle: const TextStyle(color: Colors.grey),

                          //!==============================================
                          floatingLabelStyle: TextStyle(
                            color: AppColors.primary,
                          ),
                          //!==============================================
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  // قفل الـ keyboard
                                  FocusScope.of(context).unfocus();

                                  final email = _emailController.text.trim();
                                  if (email.isEmpty) {
                                    // ⚠️ Warning SnackBar
                                    CustomSnackBar.showWarning(
                                      context: context,
                                      message: 'Please enter your email',
                                    );
                                    return;
                                  }

                                  context
                                      .read<ForgetPasswordViewModel>()
                                      .doIntent(SendOtpEvent(email));
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            disabledBackgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Loading Overlay
                if (isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: LoadingIndicator(size: 150.w, repeat: true),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
