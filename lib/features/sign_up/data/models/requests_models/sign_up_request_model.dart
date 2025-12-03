import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String rePassword;


  SignUpRequestModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.rePassword,
    
  });

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}