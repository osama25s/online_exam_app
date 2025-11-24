import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/domain/entities/exam_entity.dart';

abstract class ExamRepoContract {
  Future<BaseResponse<List<ExamEntity>>> getExams({
    required String token,
    required String subjectId,
  });
}
