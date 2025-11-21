import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:online_exam_app/core/constants/api_constants.dart';
import 'package:online_exam_app/feature/search_subjects/data/models/responses/get_all_subjects_response.dart';

part 'api_service.g.dart';

@RestApi()
@injectable
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiConstants.getAllSubjects)
  Future<AllSubjectsResponse> getAllSubjects(@Header("token") String token);
}
