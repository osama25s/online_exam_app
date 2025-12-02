import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/login/domain/entities/login_entity.dart';
import 'user_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String message;
  final String token;
  final UserModel user;

  LoginResponseModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  LoginEntity toEntity() {
    return LoginEntity(message: message, accessToken: token);
  }
}
