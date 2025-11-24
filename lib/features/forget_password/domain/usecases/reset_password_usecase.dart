import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/core/validators/app_validators.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class ResetPasswordUsecase {
  final ForgetPasswordRepoContract _repository;

  ResetPasswordUsecase(this._repository);

  Future<BaseResponse<ResetPasswordEntity>> call({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    // Email validation
    final emailError = AppValidators.validateEmail(email);
    if (emailError != null) {
      return BaseResponse.failure(
        ErrorHandler.handle(Exception(emailError)),
      );
    }

    // Password validation
    final passwordError = AppValidators.validatePassword(newPassword);
    if (passwordError != null) {
      return BaseResponse.failure(
        ErrorHandler.handle(Exception(passwordError)),
      );
    }

    // Confirm password validation
    final confirmPasswordError = AppValidators.validateConfirmPassword(
      confirmPassword,
      newPassword,
    );
    if (confirmPasswordError != null) {
      return BaseResponse.failure(
        ErrorHandler.handle(Exception(confirmPasswordError)),
      );
    }

    // Call repository
    return await _repository.resetPassword(
      email.trim(),
      newPassword.trim(),
    );
  }
}