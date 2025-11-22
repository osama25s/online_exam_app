import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/feature/sign_up/data/models/requests_models/sign_up_request_model.dart';
import 'package:online_exam_app/feature/sign_up/data/models/responses_models/sign_up_response_model.dart';
import 'package:online_exam_app/feature/sign_up/domian/repo/repo_sign_up_contract.dart';

@injectable
class DoSignUpUsecase {
  final RepoSignUpContract repoSignUpContract;

  DoSignUpUsecase(this.repoSignUpContract);

  Future<BaseResponse<SignUpResponseModel>> doSignUp(SignUpRequestModel request) async {
    return await repoSignUpContract.signup(request);
  }
}
