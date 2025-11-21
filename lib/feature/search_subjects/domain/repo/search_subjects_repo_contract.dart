import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/feature/search_subjects/domain/entitys/subject_entity.dart';

abstract class SearchSubjectsRepoContract {
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects();
}
