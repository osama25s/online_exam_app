import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/config/shared_preferences_module/shared_preferences_module.dart';
import 'package:online_exam_app/core/constants/cache_constants.dart';
import 'package:online_exam_app/features/login/api/api_service/api_service.dart';
import 'package:online_exam_app/features/login/data/datasources/login_datasource_contract.dart';
import 'package:online_exam_app/features/login/data/models/requests_models/login_request_model.dart';
import 'package:online_exam_app/features/login/data/models/responses_models/login_response_model.dart';

@Injectable(as: LoginDatasourceContract)
class LoginDatasourceImpl implements LoginDatasourceContract {
  final ApiService _apiService;
  final CacheHelper _cacheHelper;

  LoginDatasourceImpl(this._apiService, this._cacheHelper);

  @override
  Future<BaseResponse<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel, {
    bool rememberMe = false,
  }) async {
    try {
      final response = await _apiService.login(loginRequestModel);

      if (rememberMe) {
        await _cacheHelper.saveData(
          key: CacheConstants.token,
          value: response.token,
        );
      } else {
        await _cacheHelper.remove(CacheConstants.token);
      }

      return BaseResponse.success(response);
    } catch (error) {
      return BaseResponse.failure(ErrorHandler.handle(error));
    }
  }
}
