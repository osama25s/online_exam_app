import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/feature/search_subjects/domain/entitys/subject_entity.dart';
import 'package:online_exam_app/feature/search_subjects/domain/usecase/get_subjects_usecase.dart';
import 'package:online_exam_app/feature/search_subjects/presentation/view_models/get_subjects_states.dart';

@injectable
class GetSubjectsViewModel extends Cubit<GetSubjectsStates> {
  final GetSubjectsUsecase _getSubjectsUsecase;

  GetSubjectsViewModel(this._getSubjectsUsecase) : super(GetSubjectsStates());

  Future<void> getSubjects() async {
    // 1. Emit loading state
    emit(
      state.copyWith(
        subjectsStates: BaseState<List<SubjectEntity>>(isLoading: true),
      ),
    );

    // 2. Call UseCase
    BaseResponse<List<SubjectEntity>> response = await _getSubjectsUsecase
        .call();

    // 3. Handle response using when
    response.when(
      success: (exams) {
        emit(
          state.copyWith(
            subjectsStates: BaseState<List<SubjectEntity>>(
              isLoading: false,
              data: exams,
            ),
          ),
        );
      },
      failure: (errorHandler) {
        emit(
          state.copyWith(
            subjectsStates: BaseState<List<SubjectEntity>>(
              isLoading: false,
              errorMessage: errorHandler.apiErrorModel.message,
            ),
          ),
        );
      },
    );
  }
}
