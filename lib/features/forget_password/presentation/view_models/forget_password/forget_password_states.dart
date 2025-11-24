import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_password_entity.dart';

class ForgetPasswordStates {
  BaseState<ForgetPasswordEntity> forgetPasswordState;

  ForgetPasswordStates({BaseState<ForgetPasswordEntity>? forgetPasswordState})
    : forgetPasswordState =
          forgetPasswordState ?? BaseState<ForgetPasswordEntity>();

  ForgetPasswordStates copyWith({
    BaseState<ForgetPasswordEntity>? forgetPasswordState,
  }) {
    return ForgetPasswordStates(
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
    );
  }
}
