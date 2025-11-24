sealed class GetQuestionsEvents {}

class GetQuestions extends GetQuestionsEvents {
  final String exam;
  GetQuestions({required this.exam});
}
