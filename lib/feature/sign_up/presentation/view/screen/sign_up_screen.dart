import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/feature/sign_up/data/models/requests_models/sign_up_request_model.dart';
import 'package:online_exam_app/feature/sign_up/presentation/view/view_model/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  static const String routname="kgfbnl";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Welcome ${state.response.user.username}!")),
            );
          } else if (state is SignUpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is SignUpLoading;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Username
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: "User name",
                      hintText: "Enter your user name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "User name is required";
                      } else if (value.length < 3) {
                        return "This user name is not valid";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  // First and last name
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: firstnameController,
                          decoration: const InputDecoration(
                            labelText: "First name",
                            hintText: "Enter first name",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: lastnameController,
                          decoration: const InputDecoration(
                            labelText: "Last name",
                            hintText: "Enter last name",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Email
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      } else if (!value.contains("@")) {
                        return "This email is not valid";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  // Password
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            hintText: "Enter password",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            } else if (value.length < 6) {
                              return "Password too short";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: passwordConfirmationController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Confirm password",
                            hintText: "Confirm password",
                          ),
                          validator: (value) {
                            if (value != passwordController.text) {
                              return "Password not matched";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Phone number
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: "Phone number",
                      hintText: "Enter phone number",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required";
                      } else if (value.length < 10) {
                        return "Invalid phone number";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  // Signup button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                final request = SignUpRequestModel(
                                  username: usernameController.text,
                                  firstname: firstnameController.text,
                                  lastname: lastnameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  passwordConfirmation:
                                      passwordConfirmationController.text,
                                  phone: phoneController.text,
                                );
                                context.read<SignUpCubit>().signUp(request);
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isLoading ? Colors.grey : Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Signup",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                    ),
                  ),

                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Login screen
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
