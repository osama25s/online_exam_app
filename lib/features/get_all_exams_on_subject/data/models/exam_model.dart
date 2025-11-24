import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/domain/entities/exam_entity.dart';

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

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModelToJson(this);

  ExamEntity toDomain() => ExamEntity(
    id: id ?? "",
    title: title ?? "",
    duration: duration ?? 0,
    subject: subject ?? "",
    numberOfQuestions: numberOfQuestions ?? 0,
   
  );
}
