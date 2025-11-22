
import 'package:online_exam_app/feature/sign_up/data/models/responses_models/sign_up_response_model.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';

class SignUpState {
  BaseState<SignUpResponseModel> signUpBaseState;


  SignUpState({
     required this.signUpBaseState,

});

  SignUpState copyWith({
    BaseState<SignUpResponseModel>? signUpBaseState,

  }) {
    return SignUpState(
      signUpBaseState: signUpBaseState ?? this.signUpBaseState,

    );
  }
}



















// part of 'sign_up_cubit.dart';

// abstract class SignUpState {}

// class SignUpInitial extends SignUpState {}

// class SignUpLoading extends SignUpState {}

// class SignUpSuccess extends SignUpState {
//   final SignUpResponseModel response;
//   SignUpSuccess(this.response);
// }

// class SignUpError extends SignUpState {
//   final String message;
//   SignUpError(this.message);
// }
