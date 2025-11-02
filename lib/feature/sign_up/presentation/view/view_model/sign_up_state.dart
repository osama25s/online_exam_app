part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final SignUpResponseModel response;
  SignUpSuccess(this.response);
}

class SignUpError extends SignUpState {
  final String message;
  SignUpError(this.message);
}
