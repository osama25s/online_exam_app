import 'package:online_exam_app/features/questions/domain/entities/answer_entity.dart';
import 'package:online_exam_app/features/questions/domain/entities/exam_entity.dart';

class QuestionEntity {
  final String? question;
  final List<AnswerEntity>? answers;
  final String? type;
  final String? correct;
  final String? id;
  final ExamEntity? exam;

  QuestionEntity({
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.exam,
    this.id,
  });
}
