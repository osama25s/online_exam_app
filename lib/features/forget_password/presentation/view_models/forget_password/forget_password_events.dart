sealed class ForgetPasswordEvents {}

class SendOtpEvent extends ForgetPasswordEvents {
  final String email;
  SendOtpEvent(this.email);
}

class ResetForgetPasswordEvent extends ForgetPasswordEvents {}