import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_models.g.dart';

@JsonSerializable()
class ResetPasswordResponseModels {
  final String? token;
  final String message;

  ResetPasswordResponseModels({
    this.token,
    required this.message,
  });

  factory ResetPasswordResponseModels.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseModelsFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseModelsToJson(this);
}