
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_model.g.dart';

@JsonSerializable()
class EditProfileRequestModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  final String? image;

  
  EditProfileRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.image
  });
  
  factory EditProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$EditProfileRequestModelToJson(this);
}