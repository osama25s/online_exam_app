import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/data/datasources/get_exams_datasources_contract.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/data/models/exam_model.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/domain/repo/exam_repo_contract.dart';

@Injectable(as: ExamRepoContract)
class ExamRepoImpl implements ExamRepoContract {
  final GetExamsDatasourcesContract getExamsDatasourcesContract;

  ExamRepoImpl(this.getExamsDatasourcesContract);

  @override
  Future<BaseResponse<List<ExamEntity>>> getExams({
    required String token,
    required String subjectId,
  }) async {
    BaseResponse<List<ExamModel>> response = await getExamsDatasourcesContract
        .getExams(token: token, subjectId: subjectId);

    return response.when(
      success: (examModels) {
        List<ExamEntity> examEntities = examModels
            .map((e) => e.toDomain())
            .toList();
        return BaseResponse.success(examEntities);
      },
      failure: (error) {
        return BaseResponse.failure(error);
      },
    );
  }
}
