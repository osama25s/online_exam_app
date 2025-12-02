// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserResponseModel _$GetUserResponseModelFromJson(
  Map<String, dynamic> json,
) => GetUserResponseModel(
  message: json['message'] as String,
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetUserResponseModelToJson(
  GetUserResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};
