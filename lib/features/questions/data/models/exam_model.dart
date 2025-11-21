import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/questions/domain/entities/exam_entity.dart';

part 'exam_model.g.dart';

@JsonSerializable()
class ExamModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final String? createdAt;

  ExamModel({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  ExamEntity toEntity() {
    return ExamEntity(duration: duration, numberOfQuestions: numberOfQuestions);
  }

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModelToJson(this);
}
