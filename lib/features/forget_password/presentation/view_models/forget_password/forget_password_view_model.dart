// forget_password_view_model.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/usecases/forget_password_usecase.dart';
import 'forget_password_events.dart';
import 'forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  final ForgetPasswordUsecase _forgetPasswordUseCase;

  ForgetPasswordViewModel(this._forgetPasswordUseCase) 
      : super(ForgetPasswordStates());

  void doIntent(ForgetPasswordEvents event) {
    switch (event) {
      case SendOtpEvent():
        _sendOtp(event.email);
      case ResetForgetPasswordEvent():
        _reset();
    }
  }

  Future<void> _sendOtp(String email) async {
    emit(
      state.copyWith(
        forgetPasswordState: BaseState<ForgetPasswordEntity>(isLoading: true),
      ),
    );

    try {
      BaseResponse<ForgetPasswordEntity> response = 
          await _forgetPasswordUseCase.call(email);

      // استخدام pattern matching مع Freezed
      response.when(
        success: (data) {
          emit(
            state.copyWith(
              forgetPasswordState: BaseState<ForgetPasswordEntity>(
                isLoading: false,
                data: data,
              ),
            ),
          );
        },
        failure: (errorHandler) {
          emit(
            state.copyWith(
              forgetPasswordState: BaseState<ForgetPasswordEntity>(
                isLoading: false,
                errorMessage: errorHandler.apiErrorModel.message ?? 'Failed to send OTP',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          forgetPasswordState: BaseState<ForgetPasswordEntity>(
            isLoading: false,
            errorMessage: e.toString(),
          ),
        ),
      );
    }
  }

  void _reset() {
    emit(ForgetPasswordStates());
  }
}