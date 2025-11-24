import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/widgets/loading_indicator_widget.dart';
import 'package:online_exam_app/core/widgets/custom_snackbar.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_models/reset_password/reset_password_view_model.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_models/reset_password/reset_password_states.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_models/reset_password/reset_password_events.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;

  const ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResetPasswordViewModel>(),
      child: _ResetPasswordView(email: email),
    );
  }
}

class _ResetPasswordView extends StatefulWidget {
  final String email;

  const _ResetPasswordView({required this.email});

  @override
  State<_ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<_ResetPasswordView> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<ResetPasswordViewModel, ResetPasswordStates>(
          listener: (context, state) {
            final resetPasswordState = state.resetPasswordState;

            // Check if we have data (success) ✅
            if (resetPasswordState.data != null) {
              // Show success dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  title: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 28.sp,
                      ),
                      SizedBox(width: 8.w),
                      const Text('Success'),
                    ],
                  ),
                  content: Text(
                    resetPasswordState.data?.message ??
                        'Password reset successfully',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Navigate to login screen
                        context.go('/login');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }

            // Check if we have error ❌
            if (resetPasswordState.errorMessage != null) {
              CustomSnackBar.showError(
                context: context,
                message: resetPasswordState.errorMessage!,
              );
            }
          },
          builder: (context, state) {
            final isLoading = state.resetPasswordState.isLoading;

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
                            'Reset password',
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Password must be at least 8 characters and must contain at least one number or special character',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),

                      // New Password Input
                      SizedBox(height: 8.h),
                      TextField(
                        controller: _newPasswordController,
                        obscureText: _obscureNewPassword,
                        enabled: !isLoading,
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          labelText: "New password",
                          hintText: 'Enter you password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          //!==============================================
                          floatingLabelStyle: TextStyle(
                            color: AppColors.primary,
                          ),
                          //!==============================================
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureNewPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              //!==============================================
                              color: _obscureNewPassword
                                  ? Colors.grey
                                  : AppColors.primary,
                              //!==============================================
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureNewPassword = !_obscureNewPassword;
                              });
                            },
                          ),
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
                      SizedBox(height: 20.h),

                      // Confirm Password Input
                      SizedBox(height: 8.h),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        enabled: !isLoading,
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          labelText: "Confirm password",
                          hintText: 'Confirm your password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(
                            color: AppColors.primary,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              //!==============================================
                              color: _obscureConfirmPassword
                                  ? Colors.grey
                                  : AppColors.primary,
                              //!==============================================
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                          ),
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
                      SizedBox(height: 32.h),

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

                                  final newPassword =
                                      _newPasswordController.text;
                                  final confirmPassword =
                                      _confirmPasswordController.text;

                                  if (newPassword.isEmpty ||
                                      confirmPassword.isEmpty) {
                                    // ⚠️ Warning SnackBar
                                    CustomSnackBar.showWarning(
                                      context: context,
                                      message: 'Please fill all fields',
                                    );
                                    return;
                                  }

                                  if (newPassword != confirmPassword) {
                                    // ⚠️ Warning SnackBar
                                    CustomSnackBar.showWarning(
                                      context: context,
                                      message: 'Passwords do not match',
                                    );
                                    return;
                                  }

                                  context
                                      .read<ResetPasswordViewModel>()
                                      .doIntent(
                                        ResetPasswordEvent(
                                          email: widget.email,
                                          newPassword: newPassword,
                                          confirmPassword: confirmPassword,
                                        ),
                                      );
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
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
