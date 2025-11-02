import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/feature/sign_up/data/models/requests_models/sign_up_request_model.dart';
import 'package:online_exam_app/feature/sign_up/data/models/responses_models/sign_up_response_model.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/feature/sign_up/domian/usecase/call_sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final CallSignUpUseCase _callSignUpUsecase;

  SignUpCubit(this._callSignUpUsecase) : super(SignUpInitial());

  Future<void> signUp(SignUpRequestModel request) async {
    emit(SignUpLoading());
    try {
      final BaseResponse<SignUpResponseModel> response =
          await _callSignUpUsecase(request);

      response.when(
        success: (data) {
          emit(SignUpSuccess(data));
        },
        failure: (error) {
          emit(SignUpError(error.toString()));
        },
      );
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }
}
