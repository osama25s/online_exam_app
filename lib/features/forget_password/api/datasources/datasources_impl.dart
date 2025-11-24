import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/features/forget_password/data/datasources/forget_password_datasources_contract.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/forget_password_requests_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/reset_password_request_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/verify_reset_code_request_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/responses_models/forget_password_response_models.dart';
import 'package:online_exam_app/features/forget_password/data/models/responses_models/reset_password_response_models.dart';
import 'package:online_exam_app/features/forget_password/data/models/responses_models/verify_reset_code_response_models.dart';
import '../api_service/api_service.dart';

@LazySingleton(as: ForgetPasswordDataSourcesContract)
class DatasourcesImpl implements ForgetPasswordDataSourcesContract {
  final ApiService _apiService;

  DatasourcesImpl(this._apiService);

  @override
  Future<BaseResponse<ForgetPasswordResponseModels>> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    try {
      final response = await _apiService.forgetPassword(request);
      return BaseResponse.success(response);
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode(
    VerifyResetCodeRequestModel request,
  ) async {
    try {
      final response = await _apiService.verifyResetCode(request);
      return BaseResponse.success(response);
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<ResetPasswordResponseModels>> resetPassword(
    ResetPasswordRequestModel request,
  ) async {
    try {
      final response = await _apiService.resetPassword(request);
      return BaseResponse.success(response);
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }
}