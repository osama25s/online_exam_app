// verify_code_view_model.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/verify_code_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/usecases/verify_reset_code_usecase.dart';
import 'package:online_exam_app/features/forget_password/domain/usecases/forget_password_usecase.dart';
import 'verify_code_events.dart';
import 'verify_code_states.dart';

@injectable
class VerifyCodeViewModel extends Cubit<VerifyCodeStates> {
  final VerifyResetCodeUsecase _verifyResetCodeUseCase;
  final ForgetPasswordUsecase _forgetPasswordUseCase;

  VerifyCodeViewModel(
    this._verifyResetCodeUseCase,
    this._forgetPasswordUseCase,
  ) : super(VerifyCodeStates());

  void doIntent(VerifyCodeEvents event) {
    switch (event) {
      case VerifyCodeEvent():
        _verifyCode(event.code);
      case ResendCodeEvent():
        _resendCode(event.email);
      case ResetVerifyCodeEvent():
        _reset();
    }
  }

  Future<void> _verifyCode(String code) async {
    emit(
      state.copyWith(
        verifyCodeState: BaseState<VerifyCodeEntity>(isLoading: true),
      ),
    );

    try {
      BaseResponse<VerifyCodeEntity> response = 
          await _verifyResetCodeUseCase.call(code);

      response.when(
        success: (data) {
          emit(
            state.copyWith(
              verifyCodeState: BaseState<VerifyCodeEntity>(
                isLoading: false,
                data: data,
              ),
            ),
          );
        },
        failure: (errorHandler) {
          emit(
            state.copyWith(
              verifyCodeState: BaseState<VerifyCodeEntity>(
                isLoading: false,
                errorMessage: errorHandler.apiErrorModel.message ?? 'Verification failed',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          verifyCodeState: BaseState<VerifyCodeEntity>(
            isLoading: false,
            errorMessage: e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> _resendCode(String email) async {
    emit(
      state.copyWith(
        verifyCodeState: BaseState<VerifyCodeEntity>(isLoading: true),
      ),
    );

    try {
      BaseResponse<ForgetPasswordEntity> response = 
          await _forgetPasswordUseCase.call(email);

      response.when(
        success: (data) {
          // عودة للـ initial state بعد نجاح إعادة الإرسال
          emit(VerifyCodeStates());
        },
        failure: (errorHandler) {
          emit(
            state.copyWith(
              verifyCodeState: BaseState<VerifyCodeEntity>(
                isLoading: false,
                errorMessage: errorHandler.apiErrorModel.message ?? 'Failed to resend code',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          verifyCodeState: BaseState<VerifyCodeEntity>(
            isLoading: false,
            errorMessage: e.toString(),
          ),
        ),
      );
    }
  }

  void _reset() {
    emit(VerifyCodeStates());
  }
}