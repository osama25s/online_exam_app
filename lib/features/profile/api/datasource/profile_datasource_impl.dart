import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/features/login/api/api_service/api_service.dart';
import 'package:online_exam_app/features/profile/data/datasource/profile_datasource_contract.dart';
import 'package:online_exam_app/features/profile/data/models/request_models/edit_profile_request_model.dart';
import 'package:online_exam_app/features/profile/data/models/response_models/get_user_response_model.dart';
import 'package:online_exam_app/features/profile/data/models/response_models/user_response_model.dart';

@LazySingleton(as: ProfileDatasourceContract)
class ProfileDatasourceImpl implements ProfileDatasourceContract {
  final ApiService _apiService;
  ProfileDatasourceImpl(this._apiService);

  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MTVlMDZmOGZiMTlhZDk1NWIyN2FjMyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzY0MTA1MjIzfQ.2xKomPs69XlQ0TdLp1lgo1JAmt4QxgdMMUTq3gTiSL4";

  // =================== EDIT PROFILE ===================
  @override
  Future<BaseResponse<UserResponseModel>> editProfile(
    EditProfileRequestModel request,
  ) async {
    try {
      final response =await _apiService.editProfile(request,"Bearer $_token");
     // final response = await _apiService.editProfile(request, "Bearer $_token");
      return BaseResponse.success(response);
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }

  // =================== GET PROFILE ===================
  @override
  Future<BaseResponse<GetUserResponseModel>> getProfile() async {
    try {
      final response = await _apiService.getUserProfile("Bearer $_token");

      return BaseResponse.success(response);
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }
}
