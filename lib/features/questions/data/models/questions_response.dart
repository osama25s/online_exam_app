import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/questions/domain/entities/questions_list_entitiy.dart';
import 'question_model.dart';

part 'questions_response.g.dart';

@JsonSerializable()
class QuestionsResponse {
  final String? message;
  final List<QuestionModel>? questions;

  QuestionsResponse({this.message, this.questions});

  QuestionsListEntitiy toEntity() {
    return QuestionsListEntitiy(
      questions: questions?.map((question) => question.toEntity()).toList(),
    );
  }

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}
