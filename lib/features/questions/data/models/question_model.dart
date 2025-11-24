import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/questions/domain/entities/question_entity.dart';
import 'answer_model.dart';
import 'exam_model.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? question;
  final List<AnswerModel>? answers;
  final String? type;
  final String? correct;
  final dynamic subject;
  final ExamModel? exam;
  final String? createdAt;

  QuestionModel({
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  QuestionEntity toEntity() {
    return QuestionEntity(
      question: question,
      answers: answers?.map((answer) => answer.toEntity()).toList(),
      type: type,
      correct: correct,
      exam: exam?.toEntity(),
      id: id,
    );
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
