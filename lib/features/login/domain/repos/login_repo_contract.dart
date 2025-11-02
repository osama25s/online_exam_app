import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/login/data/models/requests_models/login_request_model.dart';
import 'package:online_exam_app/features/login/data/models/responses_models/login_response_model.dart';

abstract class LoginRepoContract {
  Future<BaseResponse<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel, {
    bool rememberMe,
  });
}
