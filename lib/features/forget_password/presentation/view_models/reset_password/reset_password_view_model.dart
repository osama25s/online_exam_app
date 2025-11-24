// reset_password_view_model.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/usecases/reset_password_usecase.dart';
import 'reset_password_events.dart';
import 'reset_password_states.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates> {
  final ResetPasswordUsecase _resetPasswordUseCase;

  ResetPasswordViewModel(this._resetPasswordUseCase) 
      : super(ResetPasswordStates());

  void doIntent(ResetPasswordEvents event) {
    switch (event) {
      case ResetPasswordEvent():
        _resetPassword(
          email: event.email,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
        );
      case ResetResetPasswordEvent():
        _reset();
    }
  }

  Future<void> _resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(
      state.copyWith(
        resetPasswordState: BaseState<ResetPasswordEntity>(isLoading: true),
      ),
    );

    try {
      BaseResponse<ResetPasswordEntity> response = 
          await _resetPasswordUseCase.call(
        email: email,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );

      response.when(
        success: (data) {
          emit(
            state.copyWith(
              resetPasswordState: BaseState<ResetPasswordEntity>(
                isLoading: false,
                data: data,
              ),
            ),
          );
        },
        failure: (errorHandler) {
          emit(
            state.copyWith(
              resetPasswordState: BaseState<ResetPasswordEntity>(
                isLoading: false,
                errorMessage: errorHandler.apiErrorModel.message ?? 'Failed to reset password',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState<ResetPasswordEntity>(
            isLoading: false,
            errorMessage: e.toString(),
          ),
        ),
      );
    }
  }

  void _reset() {
    emit(ResetPasswordStates());
  }
}