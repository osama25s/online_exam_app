// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      username: json['username'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
