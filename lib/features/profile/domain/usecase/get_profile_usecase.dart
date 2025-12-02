import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/domain/entitys/get_profile_entity.dart';
import 'package:online_exam_app/features/profile/domain/repo/profile_repo_contract.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepoContract _repo;

  GetProfileUseCase(this._repo);

  Future<BaseResponse<GetProfileEntity>> call() async {
    return await _repo.getProfile();
  }
}
