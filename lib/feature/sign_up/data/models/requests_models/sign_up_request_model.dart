import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;


  SignUpRequestModel({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    
  });

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}