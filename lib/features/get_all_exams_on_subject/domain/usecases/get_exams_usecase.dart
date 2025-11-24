import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/domain/repo/exam_repo_contract.dart';

@injectable
class GetExamsUsecase {
  final ExamRepoContract examRepoContract;

  GetExamsUsecase({required this.examRepoContract});
  Future<BaseResponse<List<ExamEntity>>> call({
    required String token,
    required String subjectId,
  }) => examRepoContract.getExams(token: token, subjectId: subjectId);
}
