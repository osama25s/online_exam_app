import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/forget_password_requests_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/reset_password_request_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/verify_reset_code_request_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/responses_models/forget_password_response_models.dart';
import 'package:online_exam_app/features/forget_password/data/models/responses_models/reset_password_response_models.dart';
import 'package:online_exam_app/features/forget_password/data/models/responses_models/verify_reset_code_response_models.dart';

abstract class ForgetPasswordDataSourcesContract {
  /// Send OTP to user's email
  Future<BaseResponse<ForgetPasswordResponseModels>> forgetPassword(
    ForgetPasswordRequest request,
  );

  /// Verify OTP code
  Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode(
    VerifyResetCodeRequestModel request,
  );

  /// Reset password with new password
  Future<BaseResponse<ResetPasswordResponseModels>> resetPassword(
    ResetPasswordRequestModel request,
  );
}