import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/api/api_service/api_service.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/data/datasources/get_exams_datasources_contract.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/data/models/exam_model.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/data/models/get_exams_response.dart';

@Injectable(as: GetExamsDatasourcesContract)
class GetExamsDatasourcesImpl implements GetExamsDatasourcesContract {
  final ApiService apiService;

  GetExamsDatasourcesImpl(this.apiService);

  @override
  Future<BaseResponse<List<ExamModel>>> getExams({
    required String token,
    required String subjectId,
  }) async {
    try {
      GetExamsResponse response = await apiService.getExams(token, subjectId);
      List<ExamModel> exams = response.exams ?? [];
      return BaseResponse.success(exams);
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e.toString()));
    }
  }
}
