import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/questions/domain/entities/questions_list_entitiy.dart';
import 'package:online_exam_app/features/questions/domain/repos/questions_repo_contract.dart';

@injectable
class GetQuestionsUsecase {
  final QuestionsRepoContract _repoContract;

  GetQuestionsUsecase(this._repoContract);

  Future<BaseResponse<QuestionsListEntitiy>> getQuestions(String exam) async {
    return await _repoContract.getQuestions(exam);
  }
}
