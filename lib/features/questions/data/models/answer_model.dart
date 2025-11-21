import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/questions/domain/entities/answer_entity.dart';

part 'answer_model.g.dart';

@JsonSerializable()
class AnswerModel {
  final String? answer;
  final String? key;

  AnswerModel({this.answer, this.key});

  AnswerEntity toEntity() {
    return AnswerEntity(answer: answer, key: key);
  }

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
