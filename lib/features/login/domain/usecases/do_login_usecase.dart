import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/login/data/models/requests_models/login_request_model.dart';
import 'package:online_exam_app/features/login/domain/entities/login_entity.dart';
import 'package:online_exam_app/features/login/domain/repos/login_repo_contract.dart';

@injectable
class DoLoginUsecase {
  final LoginRepoContract _repo;
  DoLoginUsecase(this._repo);

  Future<BaseResponse<LoginEntity>> dologinUseacase(LoginRequestModel request) {
    return _repo.login(request);
  }
}
