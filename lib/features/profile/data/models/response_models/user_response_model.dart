import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/login/data/models/responses_models/user_model.dart';
part 'user_response_model.g.dart';


@JsonSerializable()
class UserResponseModel {
  final String message;
  final UserModel user;

  UserResponseModel({
    required this.message,
    required this.user,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}

