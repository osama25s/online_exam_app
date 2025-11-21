import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/questions/data/models/questions_response.dart';

abstract class QuestionsDatasourcesContract {
  Future<BaseResponse<QuestionsResponse>> getQuestions(String exam);
}
