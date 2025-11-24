import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/core/validators/app_validators.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class ForgetPasswordUsecase {
  final ForgetPasswordRepoContract _repository;

  ForgetPasswordUsecase(this._repository);

  Future<BaseResponse<ForgetPasswordEntity>> call(String email) async {
    // Validation
    final emailError = AppValidators.validateEmail(email);
    if (emailError != null) {
      return BaseResponse.failure(
        ErrorHandler.handle(Exception(emailError)),
      );
    }

    // Call repository
    return await _repository.forgetPassword(email.trim());
  }
}