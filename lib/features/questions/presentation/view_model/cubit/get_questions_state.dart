import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/questions/domain/entities/questions_list_entitiy.dart';

class GetQuestionsState {
  final BaseState<QuestionsListEntitiy> questions;
  final int currentQuestionIndex;
  final int? selectedAnswerIndex;
  final Map<int, int?> selectedAnswers;
  GetQuestionsState({
    required this.questions,
    this.currentQuestionIndex = 0,
    this.selectedAnswerIndex,
    Map<int, int?>? selectedAnswers,
  }) : selectedAnswers = selectedAnswers ?? {};

  GetQuestionsState copyWith({
    BaseState<QuestionsListEntitiy>? questions,
    int? currentQuestionIndex,
    Map<int, int?>? selectedAnswers,
  }) {
    return GetQuestionsState(
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedAnswers:
          selectedAnswers ?? Map<int, int?>.from(this.selectedAnswers),
    );
  }
}
