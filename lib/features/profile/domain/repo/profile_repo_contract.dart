import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/models/request_models/edit_profile_request_model.dart';
import 'package:online_exam_app/features/profile/domain/entitys/edit_user_profile_entity.dart';
import 'package:online_exam_app/features/profile/domain/entitys/get_profile_entity.dart';

abstract class ProfileRepoContract {
  Future<BaseResponse<GetProfileEntity>>getProfile();
   Future<BaseResponse<EditUserProfileEntity>>editProfile(EditProfileRequestModel request);

}