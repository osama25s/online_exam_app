import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/feature/sign_up/api/api/api_service.dart';
import 'package:online_exam_app/feature/sign_up/data/models/responses_models/sign_up_response_model.dart';
import 'package:online_exam_app/feature/sign_up/data/models/requests_models/sign_up_request_model.dart';
import 'package:online_exam_app/feature/sign_up/domian/repo/repo_sign_up_contract.dart';

@Injectable(as: RepoSignUpContract)
class RepoSignUpImpl implements RepoSignUpContract {
  final ApiService _apiService;

  RepoSignUpImpl(this._apiService);

  @override
  Future<BaseResponse<SignUpResponseModel>> signup(SignUpRequestModel requestModel) async {
    try {
      final response = await _apiService.signup(requestModel);
      return BaseResponse.success(response);
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }
}
