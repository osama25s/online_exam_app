import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_constants.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/forget_password_requests_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/reset_password_request_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/verify_reset_code_request_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/responses_models/forget_password_response_models.dart';
import 'package:online_exam_app/features/forget_password/data/models/responses_models/reset_password_response_models.dart';
import 'package:online_exam_app/features/forget_password/data/models/responses_models/verify_reset_code_response_models.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  /// 1️⃣ Forget Password - Send OTP to email
  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponseModels> forgetPassword(
    @Body() ForgetPasswordRequest request,
  );

  /// 2️⃣ Verify Reset Code - Verify OTP
  @POST(ApiConstants.verifyResetCode)
  Future<VerifyResetCodeResponse> verifyResetCode(
    @Body() VerifyResetCodeRequestModel request,
  );

  /// 3️⃣ Reset Password - Set new password
  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordResponseModels> resetPassword(
    @Body() ResetPasswordRequestModel request,
  );
}
