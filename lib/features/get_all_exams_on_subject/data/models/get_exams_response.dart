import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/data/models/exam_model.dart';

part 'get_exams_response.g.dart';

@JsonSerializable()
class GetExamsResponse {
  final String? message;
  final Metadata? metadata;
  final List<ExamModel>? exams;

  GetExamsResponse({
    this.message,
    this.metadata,
    this.exams,
  });

  factory GetExamsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExamsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetExamsResponseToJson(this);
}

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

