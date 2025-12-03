import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/login/data/datasources/login_datasource_contract.dart';
import 'package:online_exam_app/features/login/data/models/requests_models/login_request_model.dart';
import 'package:online_exam_app/features/login/domain/entities/login_entity.dart';
import 'package:online_exam_app/features/login/domain/repos/login_repo_contract.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl implements LoginRepoContract {
  final LoginDatasourceContract _loginDatasource;

  LoginRepoImpl(this._loginDatasource);

  @override
  Future<BaseResponse<LoginEntity>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    final loginResponse = await _loginDatasource.login(loginRequestModel);

    return loginResponse.map(
      success: (success) => BaseResponse.success(success.data.toEntity()),
      failure: (failure) => BaseResponse.failure(failure.errorhandeler),
    );
  }
}
