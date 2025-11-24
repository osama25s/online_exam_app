class ResetPasswordEntity {
  final String? token;
  final String message;

  ResetPasswordEntity({
    this.token,
    required this.message,
  });
}