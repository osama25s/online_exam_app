sealed class ResetPasswordEvents {}

class ResetPasswordEvent extends ResetPasswordEvents {
  final String email;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordEvent({
    required this.email,
    required this.newPassword,
    required this.confirmPassword,
  });
}

class ResetResetPasswordEvent extends ResetPasswordEvents {}