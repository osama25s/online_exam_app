import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/questions/domain/entities/questions_list_entitiy.dart';
import 'package:online_exam_app/features/questions/domain/usecases/get_questions_usecase.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/cubit/get_questions_events.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/cubit/get_questions_state.dart';

@injectable
class GetQuestionsCubit extends Cubit<GetQuestionsState> {
  final GetQuestionsUsecase getQuestionsUsecase;
  Map<String, String> examAnswers = {};
  GetQuestionsCubit(this.getQuestionsUsecase)
    : super(
        GetQuestionsState(
          questions: BaseState<QuestionsListEntitiy>(isLoading: false),
        ),
      );

  void onEvent(GetQuestionsEvents event) {
    if (event is GetQuestions) {
      _getQuestions(event.exam);
    }
  }

  Future<void> _getQuestions(String exam) async {
    emit(
      state.copyWith(
        questions: BaseState<QuestionsListEntitiy>(isLoading: true),
      ),
    );
    final questions = await getQuestionsUsecase.getQuestions(exam);
    questions.when(
      success: (data) => emit(
        state.copyWith(
          questions: BaseState<QuestionsListEntitiy>(
            data: data,
            isLoading: false,
          ),
          selectedAnswers: {},
        ),
      ),
      failure: (error) => emit(
        state.copyWith(
          questions: BaseState<QuestionsListEntitiy>(
            errorMessage: error.apiErrorModel.message,
            isLoading: false,
          ),
        ),
      ),
    );
  }

  void setAnswerKey(String questionId, String answerKey) {
    examAnswers[questionId] = answerKey;
  }

  void selectAnswer({required int questionIndex, required int answerIndex}) {
    final newMap = Map<int, int?>.from(state.selectedAnswers);
    newMap[questionIndex] = answerIndex;
    emit(state.copyWith(selectedAnswers: newMap));
  }

  int? getSelectedAnswer(int questionIndex) {
    return state.selectedAnswers[questionIndex];
  }

  void goToNextQuestion() {
    final totalQuestions = state.questions.data?.questions?.length ?? 0;

    if (state.currentQuestionIndex < totalQuestions - 1) {
      emit(
        state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1),
      );
    }
  }

  void goToPreviousQuestion() {
    if (state.currentQuestionIndex > 0) {
      emit(
        state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1),
      );
    }
  }
}
