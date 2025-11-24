import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/widgets/loading_indicator_widget.dart';
import 'package:online_exam_app/core/widgets/custom_snackbar.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_models/verify_code/verify_code_view_model.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_models/verify_code/verify_code_states.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_models/verify_code/verify_code_events.dart';
import '../../../../../core/routing/app_router.dart';

class VerificationCodeScreen extends StatelessWidget {
  final String email;

  const VerificationCodeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VerifyCodeViewModel>(),
      child: _VerificationCodeView(email: email),
    );
  }
}

class _VerificationCodeView extends StatefulWidget {
  final String email;

  const _VerificationCodeView({required this.email});

  @override
  State<_VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<_VerificationCodeView> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  void _onCodeChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }

    // Auto verify when all 6 digits are entered
    String code = _controllers.map((c) => c.text).join();
    if (code.length == 6) {
      // قفل الـ keyboard
      FocusScope.of(context).unfocus();

      context.read<VerifyCodeViewModel>().doIntent(VerifyCodeEvent(code));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<VerifyCodeViewModel, VerifyCodeStates>(
          listener: (context, state) {
            final verifyCodeState = state.verifyCodeState;

            // Check if we have data (success) ✅
            if (verifyCodeState.data != null) {
              // Navigate to reset password and pass email
              context.push(AppRouter.resetPassword, extra: widget.email);

              // Reset state after navigation
              context.read<VerifyCodeViewModel>().doIntent(
                ResetVerifyCodeEvent(),
              );
            }

            // Check if we have error ❌
            if (verifyCodeState.errorMessage != null) {
              CustomSnackBar.showError(
                context: context,
                message: verifyCodeState.errorMessage!,
              );
            }
          },
          builder: (context, state) {
            final isLoading = state.verifyCodeState.isLoading;

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
                            'Email verification',
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Please enter your code that send to your email address',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),

                      // Code Input Boxes (6 digits)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            width: 48.w,
                            height: 70.h,

                            child: TextField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              enabled: !isLoading,
                              //!==============================================
                              cursorColor: AppColors.primary,
                              //!==============================================
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                //!================================================
                                fillColor: Color(
                                  0xFFDFE7F7,
                                ), // ⬅️ لون الـ background (أزرق فاتح)
                                filled: true, // ⬅️ تفعيل الـ background color
                                //!================================================
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: const BorderSide(
                                    color: AppColors.primary,
                                    width: 2,
                                  ),
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) =>
                                  _onCodeChanged(index, value),
                              onTap: () {
                                _controllers[index].selection =
                                    TextSelection.fromPosition(
                                      TextPosition(
                                        offset: _controllers[index].text.length,
                                      ),
                                    );
                              },
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 24.h),

                      // Resend Code
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't receive code? ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: isLoading
                                  ? null
                                  : () {
                                      context
                                          .read<VerifyCodeViewModel>()
                                          .doIntent(
                                            ResendCodeEvent(widget.email),
                                          );

                                      // ℹ️ Info SnackBar
                                      CustomSnackBar.showInfo(
                                        context: context,
                                        message: 'Code resent successfully!',
                                      );
                                    },
                              child: Text(
                                'Resend',
                                style: TextStyle(
                                  color: isLoading
                                      ? Colors.grey
                                      : AppColors.primary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
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
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
