import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/domain/usecases/get_exams_usecase.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/presentation/view_models/get_exams_events.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/presentation/view_models/get_exams_states.dart';

@injectable
class GetExamsViewModel extends Cubit<GetExamsStates> {
  final GetExamsUsecase _getExamsUseCase;

  GetExamsViewModel(this._getExamsUseCase) : super(GetExamsStates());

  // نقطة الدخول للأحداث
  void doIntent(GetExamsEvents event) {
    switch (event) {
      case GetExamsEvent():
        _getExams();
      case RefreshExamsEvent():
        _getExams();
    }
  }

  Future<void> _getExams() async {
    // 1. Emit loading state
    emit(
      state.copyWith(examsState: BaseState<List<ExamEntity>>(isLoading: true)),
    );
    //!========================Must Change for test only========================
    const token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MDc4YWVkOGZiMTlhZDk1NWIyNTRlOSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYzMjMwNDAyfQ.FGXHcafaM-2-bcLOoOzQJIN7JUOmYEhwev8RRa0osuU";
    const subjectId = "670037f6728c92b7fdf434fc";

    // 2. Call UseCase
    BaseResponse<List<ExamEntity>> response = await _getExamsUseCase.call(
      token: token,
      subjectId: subjectId,
    );
    //!========================Must Change for test only========================

    // 3. Handle response using when
    response.when(
      success: (exams) {
        emit(
          state.copyWith(
            examsState: BaseState<List<ExamEntity>>(
              isLoading: false,
              data: exams,
            ),
          ),
        );
      },
      failure: (errorHandler) {
        emit(
          state.copyWith(
            examsState: BaseState<List<ExamEntity>>(
              isLoading: false,
              errorMessage: errorHandler.apiErrorModel.message,
            ),
          ),
        );
      },
    );
  }
}
