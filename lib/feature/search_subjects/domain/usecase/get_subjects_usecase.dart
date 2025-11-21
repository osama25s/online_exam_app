import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/feature/search_subjects/domain/entitys/subject_entity.dart';
import 'package:online_exam_app/feature/search_subjects/domain/repo/search_subjects_repo_contract.dart';

@injectable
class GetSubjectsUsecase {
  final SearchSubjectsRepoContract searchSubjectsRepoContract;

  GetSubjectsUsecase(this.searchSubjectsRepoContract);
  Future<BaseResponse<List<SubjectEntity>>> call() => searchSubjectsRepoContract.getAllSubjects() ;
  
}
