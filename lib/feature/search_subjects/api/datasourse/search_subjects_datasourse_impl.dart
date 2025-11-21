import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/feature/search_subjects/api/api_service/api_service.dart';
import 'package:online_exam_app/feature/search_subjects/data/datasourse/search_subjects_datasourse_contract.dart';
import 'package:online_exam_app/feature/search_subjects/data/models/responses/get_all_subjects_response.dart';
import 'package:online_exam_app/feature/search_subjects/data/models/responses/subject_model.dart';

@Injectable(as: SearchSubjectsDataSourceContract)
class SearchSubjectsDatasourseImpl implements SearchSubjectsDataSourceContract {
  SearchSubjectsDatasourseImpl(this.apiService);
  ApiService apiService;

  @override
  Future<BaseResponse<List<SubjectModel>>> getAllSubjects() async {
    try {
      AllSubjectsResponse allSubjectsResponse = await apiService.getAllSubjects(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MTVlMDZmOGZiMTlhZDk1NWIyN2FjMyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYzNDE3NDM5fQ.YCLhVA43_NBW4FkxBEF98Ka_ZPsjT6zUdFWOJF7a3xc",
      );
      List<SubjectModel> subjects = allSubjectsResponse.subjects;
      return BaseResponse.success(subjects);
    } catch (e) {
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }
}
