import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/verify_code_entity.dart';

/// Repository contract for forget password feature
abstract class ForgetPasswordRepoContract {
  /// Send OTP to user's email
  /// Returns BaseResponse<ForgetPasswordEntity>
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword(String email);

  /// Verify OTP code sent to email
  /// Returns BaseResponse<VerifyCodeEntity>
  Future<BaseResponse<VerifyCodeEntity>> verifyResetCode(String code);

  /// Reset password with new password
  /// Returns BaseResponse<ResetPasswordEntity>
  Future<BaseResponse<ResetPasswordEntity>> resetPassword(
    String email,
    String newPassword,
  );
}