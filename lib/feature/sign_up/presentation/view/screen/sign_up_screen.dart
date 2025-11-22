import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/app_text_form_field.dart';
import 'package:online_exam_app/core/constants/app_text_constants.dart';
import 'package:online_exam_app/core/widgets/spacing.dart';
import 'package:online_exam_app/feature/sign_up/presentation/view/view_model/sign_up_event.dart';
import 'package:online_exam_app/feature/sign_up/presentation/view/view_model/sign_up_state.dart';
import 'package:online_exam_app/feature/sign_up/presentation/view/view_model/sign_up_cubit.dart';

@injectable
class SignUpScreen extends StatelessWidget {
  static const String routename = "";

  SignUpScreen({super.key});

  final SignUpCubit signUpCubit = getIt<SignUpCubit>();
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => signUpCubit,
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          final signUpState = state.signUpBaseState;

          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          if (signUpState.isLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 12),
                    Text("جاري التحميل..."),
                  ],
                ),
                duration: Duration(days: 1),
              ),
            );
          } else if (signUpState.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(signUpState.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          } else if (signUpState.data != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(AppTextConstants.successMessage),
                backgroundColor: Colors.green,
              ),
            );
          }
        },

        builder: (context, state) {
          final cubit = context.read<SignUpCubit>();

          return Scaffold(
            appBar: AppBar(title: const Text(AppTextConstants.signUp)),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    // Username
                    AppTextFormField(
                      controller: usernameController,
                      label: AppTextConstants.username,
                      hintText: AppTextConstants.enterUserName,
                      validator: (v) =>
                          v!.isEmpty ? AppTextConstants.usernameError : null,
                    ),

                    verticalSpace(20),

                    // FirstName + LastName
                    Row(
                      children: [
                        Expanded(
                          child: AppTextFormField(
                            controller: firstnameController,
                            label: AppTextConstants.firstname,
                            hintText: AppTextConstants.enterYourFirstName,
                            validator: (v) => v!.isEmpty
                                ? AppTextConstants.firstNameError
                                : null,
                          ),
                        ),
                        horizontalSpace(16),
                        Expanded(
                          child: AppTextFormField(
                            controller: lastnameController,
                            label: AppTextConstants.lastname,
                            hintText: AppTextConstants.enterLastName,
                            validator: (v) => v!.isEmpty
                                ? AppTextConstants.lastnameError
                                : null,
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(20),

                    // Email
                    AppTextFormField(
                      controller: emailController,
                      label: AppTextConstants.email,
                      hintText: AppTextConstants.enterYourEmail,
                      validator: (v) => v!.isEmpty
                          ? AppTextConstants.enterYourPassword
                          : null,
                    ),

                    verticalSpace(20),

                    // Password + Confirm Password
                    Row(
                      children: [
                        Expanded(
                          child: AppTextFormField(
                            controller: passwordController,
                            label: AppTextConstants.password,
                            hintText: AppTextConstants.enterYourPassword,
                            validator: (v) => v!.isEmpty
                                ? AppTextConstants.enterYourPassword
                                : null,
                          ),
                        ),
                        horizontalSpace(16),
                        Expanded(
                          child: AppTextFormField(
                            controller: confirmPasswordController,
                            label: AppTextConstants.confirmPassword,
                            hintText: AppTextConstants.confirmPassword,
                            validator: (v) => v!.isEmpty
                                ? AppTextConstants.confirmPasswordError
                                : null,
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(20),
                    // Phone
                    AppTextFormField(
                      controller: phoneController,
                      label: AppTextConstants.phone,
                      hintText: AppTextConstants.enteryourphone,
                      validator: (v) =>
                          v!.isEmpty ? AppTextConstants.enteryourphone : null,
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                          0xFF003DA5,
                        ), // اللون الأزرق الغامق زي الصورة
                        foregroundColor: Colors.white, // لون الخط أبيض
                        minimumSize: const Size(
                          double.infinity,
                          55,
                        ), // العرض كامل والارتفاع ثابت
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ), // نفس الـ radius اللي في الصورة
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.doIntent(
                            SubmitSignUpEvent(
                              username: usernameController.text,
                              firstname: firstnameController.text,
                              lastname: lastnameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              passwordConfirmation:
                                  confirmPasswordController.text,
                            ),
                          );
                        }
                      },
                      child: const Text(
                        AppTextConstants.textsignUpButton,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: Add navigation to Login screen
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
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
