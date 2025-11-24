import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_constants.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/data/models/get_exams_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@injectable
@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiConstants.get_exams_on_subject)
  Future<GetExamsResponse> getExams(
    @Header("token") String token,
    @Query("subject") String subject,
  );
}
