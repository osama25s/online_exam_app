
import 'package:online_exam_app/features/sign_up/data/models/responses_models/sign_up_response_model.dart';
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












