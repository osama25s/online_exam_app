import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/login/data/models/requests_models/login_request_model.dart';
import 'package:online_exam_app/features/login/data/models/responses_models/login_response_model.dart';
import 'package:online_exam_app/features/login/domain/repos/login_repo_contract.dart';

class LoginUsecase {
  final LoginRepoContract _repo;
  LoginUsecase(this._repo);

  Future<BaseResponse<LoginResponseModel>> call(
    LoginRequestModel request, {
    bool rememberMe = false,
  }) {
    return _repo.login(request, rememberMe: rememberMe);
  }
}
