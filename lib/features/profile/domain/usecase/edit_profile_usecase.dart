import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/models/request_models/edit_profile_request_model.dart';
import 'package:online_exam_app/features/profile/domain/entitys/edit_user_profile_entity.dart';
import 'package:online_exam_app/features/profile/domain/repo/profile_repo_contract.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepoContract _repo;

  EditProfileUseCase(this._repo);

  Future<BaseResponse<EditUserProfileEntity>> call(
      EditProfileRequestModel request) async {
    return await _repo.editProfile(request);
  }
}
