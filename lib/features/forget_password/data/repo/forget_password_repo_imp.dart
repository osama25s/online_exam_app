import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/features/forget_password/data/datasources/forget_password_datasources_contract.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/forget_password_requests_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/reset_password_request_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/requests_models/verify_reset_code_request_model.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/verify_code_entity.dart';import 'package:online_exam_app/features/forget_password/domain/repo/forget_password_repo_contract.dart';

@LazySingleton(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImp implements ForgetPasswordRepoContract {
  final ForgetPasswordDataSourcesContract _dataSource;

  ForgetPasswordRepoImp(this._dataSource);

  @override
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword(
    String email,
  ) async {
    try {
      final request = ForgetPasswordRequest(email: email);
      final response = await _dataSource.forgetPassword(request);

      return response.when(
        success: (data) {
          // Map DTO to Entity
          final entity = ForgetPasswordEntity(
            message: data.message,
            info: data.info,
          );
          return BaseResponse.success(entity);
        },
        failure: (error) => BaseResponse.failure(error),
      );
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<VerifyCodeEntity>> verifyResetCode(String code) async {
    try {
      final request = VerifyResetCodeRequestModel(resetCode: code);
      final response = await _dataSource.verifyResetCode(request);

      return response.when(
        success: (data) {
          final entity = VerifyCodeEntity(status: data.status);
          return BaseResponse.success(entity);
        },
        failure: (error) => BaseResponse.failure(error),
      );
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<ResetPasswordEntity>> resetPassword(
    String email,
    String newPassword,
  ) async {
    try {
      final request = ResetPasswordRequestModel(
        email: email,
        newPassword: newPassword,
      );
      final response = await _dataSource.resetPassword(request);

      return response.when(
        success: (data) {
          final entity = ResetPasswordEntity(
            token: data.token,
            message: data.message,
          );
          return BaseResponse.success(entity);
        },
        failure: (error) => BaseResponse.failure(error),
      );
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }
}