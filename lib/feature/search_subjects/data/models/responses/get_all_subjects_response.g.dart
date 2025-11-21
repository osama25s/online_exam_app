// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_subjects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllSubjectsResponse _$AllSubjectsResponseFromJson(Map<String, dynamic> json) =>
    AllSubjectsResponse(
      message: json['message'] as String,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllSubjectsResponseToJson(
  AllSubjectsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.metadata,
  'subjects': instance.subjects,
};

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
  currentPage: (json['currentPage'] as num).toInt(),
  numberOfPages: (json['numberOfPages'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'numberOfPages': instance.numberOfPages,
  'limit': instance.limit,
};
