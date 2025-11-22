import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/constants/app_reoutes_constants.dart';
import 'package:online_exam_app/core/constants/app_text_constants.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';
import 'package:online_exam_app/core/validators/app_validators.dart';
import 'package:online_exam_app/core/widgets/app_default_button.dart';
import 'package:online_exam_app/core/widgets/app_text_button.dart';
import 'package:online_exam_app/core/widgets/app_text_form_field.dart';
import 'package:online_exam_app/core/widgets/loading_indicator_widget.dart';
import 'package:online_exam_app/core/widgets/spacing.dart';
import 'package:online_exam_app/features/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:online_exam_app/features/login/presentation/view_model/cubit/login_events.dart';
import 'package:online_exam_app/features/login/presentation/view_model/cubit/login_state.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/dont_have_account_text.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/remember_me_check_box.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginCubit _loginCubit = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _loginCubit,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          final loginState = state.loginStates;
          if (loginState.isLoading) {
            showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: LoadingIndicator(size: 220)),
            );
          }
          if (loginState.errorMessage != null) {
            context.pop();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(loginState.errorMessage!)));
          }

          if (loginState.data != null) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppTextConstants.loginSuccess)),
            );
            context.go(AppReoutesConstants.homeScreen);
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          ;
          final loginState = state.loginStates;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.bgColor,
              elevation: 0,
              title: Text(
                AppTextConstants.loginText,
                style: TextStyles.font20Black500Weight(),
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Form(
                key: cubit.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(8),
                    AppTextFormField(
                      controller: cubit.emailController,
                      label: AppTextConstants.email,
                      hintText: AppTextConstants.enterYourEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: AppValidators.validateEmail,
                    ),
                    verticalSpace(36),
                    AppTextFormField(
                      controller: cubit.passwordController,
                      label: AppTextConstants.password,
                      hintText: AppTextConstants.enterYourPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      validator: AppValidators.validatePassword,
                    ),
                    verticalSpace(18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RememberMeCheckBox(
                          label: AppTextConstants.rememberMe,
                          value: state.rememberMe,
                          onChanged: (value) {
                            cubit.toggleRememberMe(value ?? false);
                          },
                        ),
                        AppTextButton(
                          text: AppTextConstants.forgetPassword,
                          onPressed: () {},
                          textColor: AppColors.black,
                          underline: true,
                        ),
                      ],
                    ),
                    verticalSpace(48),
                    AppDefaultButton(
                      text: AppTextConstants.loginText,
                      isLoading: loginState.isLoading,
                      onPressed: () {
                        if (cubit.formkey.currentState!.validate()) {
                          cubit.onEvent(
                            Login(
                              email: cubit.emailController.text.trim(),
                              password: cubit.passwordController.text.trim(),
                              rememberMe: state.rememberMe,
                            ),
                          );
                        }
                      },
                    ),
                    verticalSpace(16),
                    const DontHaveAccountText(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
