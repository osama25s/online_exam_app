import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/responses_models/sign_up_response_model.dart';
import 'package:online_exam_app/features/sign_up/data/models/requests_models/sign_up_request_model.dart';

abstract class RepoSignUpContract {
  Future<BaseResponse<SignUpResponseModel>> signup(SignUpRequestModel signUpRequestModel);
}
