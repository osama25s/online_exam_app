
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_constants.dart';
import 'package:online_exam_app/feature/sign_up/data/models/responses_models/sign_up_response_model.dart';
import 'package:online_exam_app/feature/sign_up/data/models/requests_models/sign_up_request_model.dart';
import 'package:retrofit/retrofit.dart';


part 'api_service.g.dart';

@injectable
@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;
 


 @POST(ApiConstants.signUp)
  Future<SignUpResponseModel> signup(
    @Body() SignUpRequestModel signUpRequestModel,
  );
}