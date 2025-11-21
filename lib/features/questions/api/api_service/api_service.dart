import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_constants.dart';
import 'package:online_exam_app/features/questions/data/models/questions_response.dart';

import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@lazySingleton
@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiConstants.questions)
  Future<QuestionsResponse> getQuestions(
    @Query("exam") String exam,
    @Header(ApiConstants.tokenKey) String token,
  );
}
