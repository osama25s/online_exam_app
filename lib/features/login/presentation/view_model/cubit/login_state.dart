import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/login/domain/entities/login_entity.dart';

class LoginState {
  final BaseState<LoginEntity> loginStates;
  final bool rememberMe;

  LoginState({required this.loginStates, this.rememberMe = false});

  LoginState copyWith({BaseState<LoginEntity>? loginStates, bool? rememberMe}) {
    return LoginState(
      loginStates: loginStates ?? this.loginStates,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}
