import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/login/data/models/responses_models/user_model.dart';
part 'get_user_response_model.g.dart';

@JsonSerializable()
class GetUserResponseModel {
  final String message;
  final UserModel user;

  GetUserResponseModel({
    required this.message,
    required this.user,
  });

  factory GetUserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserResponseModelToJson(this);
}

