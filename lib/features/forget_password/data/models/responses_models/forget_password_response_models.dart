import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_models.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModels {
  final String message;
  final String info;

  ForgetPasswordResponseModels({
    required this.message,
    required this.info,
  });

  factory ForgetPasswordResponseModels.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelsFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseModelsToJson(this);
}