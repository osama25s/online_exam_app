import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/feature/search_subjects/data/datasourse/search_subjects_datasourse_contract.dart';
import 'package:online_exam_app/feature/search_subjects/data/models/responses/subject_model.dart';
import 'package:online_exam_app/feature/search_subjects/domain/entitys/subject_entity.dart';
import 'package:online_exam_app/feature/search_subjects/domain/repo/search_subjects_repo_contract.dart';

@Injectable(as: SearchSubjectsRepoContract)
class SearchSubjectsRepoImpl implements SearchSubjectsRepoContract {
  SearchSubjectsDataSourceContract searchSubjectsDataSourceContract;

  SearchSubjectsRepoImpl(this.searchSubjectsDataSourceContract);

  @override
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects() async {
    BaseResponse<List<SubjectModel>> subjectsResponse =
        await searchSubjectsDataSourceContract.getAllSubjects();

    return subjectsResponse.when(
      success: (subjectModel) {
        List<SubjectEntity> subjectEntity = subjectModel
        .map((e) => e.toDomain() ).toList();
        return BaseResponse.success(subjectEntity);
      },

      failure: (error) {
        return BaseResponse.failure(error);
      },
    );
  }
}
