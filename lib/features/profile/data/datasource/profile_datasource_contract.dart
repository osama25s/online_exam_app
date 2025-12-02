import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/models/request_models/edit_profile_request_model.dart';
import 'package:online_exam_app/features/profile/data/models/response_models/get_user_response_model.dart';
import 'package:online_exam_app/features/profile/data/models/response_models/user_response_model.dart';

abstract class ProfileDatasourceContract {
  Future<BaseResponse<UserResponseModel>> editProfile(EditProfileRequestModel request);
  Future<BaseResponse<GetUserResponseModel>> getProfile();
}