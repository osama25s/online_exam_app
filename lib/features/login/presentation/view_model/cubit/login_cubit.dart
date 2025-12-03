import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/config/shared_preferences_module/shared_preferences_module.dart';
import 'package:online_exam_app/core/constants/cache_constants.dart';
import 'package:online_exam_app/features/login/data/models/requests_models/login_request_model.dart';
import 'package:online_exam_app/features/login/domain/entities/login_entity.dart';
import 'package:online_exam_app/features/login/domain/usecases/do_login_usecase.dart';
import 'package:online_exam_app/features/login/presentation/view_model/cubit/login_events.dart';
import 'package:online_exam_app/features/login/presentation/view_model/cubit/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final DoLoginUsecase loginUsecase;
  final CacheHelper _cacheHelper;
  LoginCubit(this.loginUsecase, this._cacheHelper)
    : super(
        LoginState(
          loginStates: BaseState<LoginEntity>(isLoading: false),
          rememberMe: false,
        ),
      );

  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toggleRememberMe(bool value) {
    emit(state.copyWith(rememberMe: value));
  }

  void onEvent(LoginEvent event) {
    if (event is Login) {
      _login(event.rememberMe);
    }
  }

  Future<void> _login(bool rememberMe) async {
    emit(state.copyWith(loginStates: BaseState<LoginEntity>(isLoading: true)));

    final response = await loginUsecase.dologinUseacase(
      LoginRequestModel(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    response.when(
      success: (data) async {
        emit(
          state.copyWith(
            loginStates: BaseState<LoginEntity>(isLoading: false, data: data),
          ),
        );
        if (rememberMe) {
          final result = await _cacheHelper.saveData(
            key: CacheConstants.token,
            value: data.accessToken,
          );
        } else {
          await _cacheHelper.remove(CacheConstants.token);
        }
      },
      failure: (errorMessage) {
        emit(
          state.copyWith(
            loginStates: BaseState<LoginEntity>(
              isLoading: false,
              errorMessage: errorMessage.apiErrorModel.message,
            ),
          ),
        );
      },
    );
  }
}
