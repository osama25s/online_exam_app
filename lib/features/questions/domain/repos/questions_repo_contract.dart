import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/questions/domain/entities/questions_list_entitiy.dart';

abstract class QuestionsRepoContract {
  Future<BaseResponse<QuestionsListEntitiy>> getQuestions(String exam);
}
