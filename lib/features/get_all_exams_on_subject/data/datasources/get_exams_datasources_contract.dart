import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/data/models/exam_model.dart';

abstract class GetExamsDatasourcesContract {
  Future<BaseResponse<List<ExamModel>>> getExams({
    required String token,
    required String subjectId,
  });
}
