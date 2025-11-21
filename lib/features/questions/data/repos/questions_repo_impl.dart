import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/questions/data/datasources/questions_datasources_contract.dart';
import 'package:online_exam_app/features/questions/domain/entities/questions_list_entitiy.dart';
import 'package:online_exam_app/features/questions/domain/repos/questions_repo_contract.dart';

@Injectable(as: QuestionsRepoContract)
class QuestionsRepoImpl implements QuestionsRepoContract {
  QuestionsDatasourcesContract datasource;
  QuestionsRepoImpl(this.datasource);
  @override
  Future<BaseResponse<QuestionsListEntitiy>> getQuestions(String exam) async {
    final questionsResponse = await datasource.getQuestions(exam);
    return questionsResponse.map(
      success: (success) => BaseResponse.success(success.data.toEntity()),
      failure: (failure) => BaseResponse.failure(failure.errorhandeler),
    );
  }
}
