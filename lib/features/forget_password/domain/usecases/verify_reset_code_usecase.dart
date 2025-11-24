import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/core/validators/app_validators.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/verify_code_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class VerifyResetCodeUsecase {
  final ForgetPasswordRepoContract _repository;

  VerifyResetCodeUsecase(this._repository);

  Future<BaseResponse<VerifyCodeEntity>> call(String code) async {
    // Validation
    final codeError = AppValidators.validateVerificationCode(code);
    if (codeError != null) {
      return BaseResponse.failure(
        ErrorHandler.handle(Exception(codeError)),
      );
    }

    // Call repository
    return await _repository.verifyResetCode(code.trim());
  }
}