// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseModels _$ResetPasswordResponseModelsFromJson(
  Map<String, dynamic> json,
) => ResetPasswordResponseModels(
  token: json['token'] as String?,
  message: json['message'] as String,
);

Map<String, dynamic> _$ResetPasswordResponseModelsToJson(
  ResetPasswordResponseModels instance,
) => <String, dynamic>{'token': instance.token, 'message': instance.message};
