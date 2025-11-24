import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/verify_code_entity.dart';

class VerifyCodeStates {
  BaseState<VerifyCodeEntity> verifyCodeState;

  VerifyCodeStates({BaseState<VerifyCodeEntity>? verifyCodeState})
      : verifyCodeState = verifyCodeState ?? BaseState<VerifyCodeEntity>();

  VerifyCodeStates copyWith({BaseState<VerifyCodeEntity>? verifyCodeState}) {
    return VerifyCodeStates(
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
    );
  }
}