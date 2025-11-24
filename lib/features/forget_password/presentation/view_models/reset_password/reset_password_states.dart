import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/reset_password_entity.dart';

class ResetPasswordStates {
  BaseState<ResetPasswordEntity> resetPasswordState;

  ResetPasswordStates({BaseState<ResetPasswordEntity>? resetPasswordState})
      : resetPasswordState = resetPasswordState ?? BaseState<ResetPasswordEntity>();

  ResetPasswordStates copyWith({BaseState<ResetPasswordEntity>? resetPasswordState}) {
    return ResetPasswordStates(
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }
}