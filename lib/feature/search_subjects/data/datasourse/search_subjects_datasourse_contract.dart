
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/feature/search_subjects/data/models/responses/subject_model.dart';



abstract class SearchSubjectsDataSourceContract {
   Future<BaseResponse<List<SubjectModel>>> getAllSubjects();}