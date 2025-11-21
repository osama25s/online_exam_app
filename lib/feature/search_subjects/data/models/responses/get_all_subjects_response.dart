import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/feature/search_subjects/data/models/responses/subject_model.dart';

part 'get_all_subjects_response.g.dart';

@JsonSerializable()
class AllSubjectsResponse {
  final String message;
  final Metadata metadata;
  final List<SubjectModel> subjects;

  AllSubjectsResponse({
    required this.message,
    required this.metadata,
    required this.subjects,
  });

  factory AllSubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllSubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllSubjectsResponseToJson(this);
}

@JsonSerializable()
class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
