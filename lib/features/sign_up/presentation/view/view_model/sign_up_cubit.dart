import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/sign_up/data/models/responses_models/sign_up_response_model.dart';
import 'package:online_exam_app/features/sign_up/domian/usecase/do_sign_up_usecase.dart';
import 'package:online_exam_app/features/sign_up/presentation/view/view_model/sign_up_event.dart';
import 'package:online_exam_app/features/sign_up/presentation/view/view_model/sign_up_state.dart';
import 'package:online_exam_app/features/sign_up/data/models/requests_models/sign_up_request_model.dart';
@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final DoSignUpUsecase _doSignUpUsecase;

  SignUpCubit(this._doSignUpUsecase) : super(SignUpState(signUpBaseState: BaseState<SignUpResponseModel>(isLoading: false)));

  void doIntent(SignUpEvent event) async {
    switch (event) {
      case SubmitSignUpEvent():
        await _handleSignUp(event);
        break;
    }
  }
Future<void> _handleSignUp(SubmitSignUpEvent event) async {
  emit(state.copyWith(signUpBaseState: BaseState<SignUpResponseModel>(isLoading: true)));

  final request = SignUpRequestModel(
    username: event.username,
    firstName: event.firstname,
    lastName: event.lastname,
    email: event.email,
    phone: event.phone,
    password: event.password,
    rePassword: event.passwordConfirmation,
  );

final response = await _doSignUpUsecase.doSignUp(request);

response.when(
  success: (data) => emit(state.copyWith(
signUpBaseState: BaseState<SignUpResponseModel>(isLoading: false,data: data)
  )),
  failure: (error) => emit(state.copyWith(
signUpBaseState: BaseState<SignUpResponseModel>(isLoading: false,errorMessage: error.apiErrorModel.message)
  )),
);

}

}







