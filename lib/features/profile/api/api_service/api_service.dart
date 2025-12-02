import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_constants.dart';
import 'package:online_exam_app/features/profile/data/models/request_models/edit_profile_request_model.dart';
import 'package:online_exam_app/features/profile/data/models/response_models/get_user_response_model.dart';
import 'package:online_exam_app/features/profile/data/models/response_models/user_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@injectable
@RestApi() // اختياري بس مفيد
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;
  @PUT(ApiConstants.editProfile)
  Future<UserResponseModel> editProfile(
    @Body() EditProfileRequestModel request,
    @Header("Authorization") String token,
  );

  @GET(ApiConstants.getProfile)
  Future<GetUserResponseModel> getUserProfile(
    @Header("Authorization") String token,
  );
  // @PUT(ApiConstants.editProfile)
  // Future<UserResponseModel> editProfile(
  //   @Body() EditProfileRequestModel request,
  //   @Header("token") String token,
  // );

  // @GET(ApiConstants.getProfile)
  // Future<GetUserResponseModel> getUserProfile(
  //   @Header("token") String token,
  // );
}
