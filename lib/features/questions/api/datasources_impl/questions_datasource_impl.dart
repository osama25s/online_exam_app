import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/features/questions/api/api_service/api_service.dart';
import 'package:online_exam_app/features/questions/data/datasources/questions_datasources_contract.dart';
import 'package:online_exam_app/features/questions/data/models/questions_response.dart';

@Injectable(as: QuestionsDatasourcesContract)
class QuestionsDatasourceImpl implements QuestionsDatasourcesContract {
  final ApiService _apiService;

  QuestionsDatasourceImpl(this._apiService);

  @override
  Future<BaseResponse<QuestionsResponse>> getQuestions(String exam) async {
    try {
      final String token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmJkMjE2OGZiMTlhZDk1NWIyMzg5NSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYxNDI0NDAxfQ.D4azBYSwsUBEz6m3I-LZDe02OPq4-lCRyDYfhRJsUmg';
      final response = await _apiService.getQuestions(exam, token);
      return BaseResponse.success(response);
    } on Exception catch (error) {
      return BaseResponse.failure(ErrorHandler.handle(error));
    }
  }
}
