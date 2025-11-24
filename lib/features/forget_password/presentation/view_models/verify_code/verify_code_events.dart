sealed class VerifyCodeEvents {}

class VerifyCodeEvent extends VerifyCodeEvents {
  final String code;
  VerifyCodeEvent(this.code);
}

class ResendCodeEvent extends VerifyCodeEvents {
  final String email;
  ResendCodeEvent(this.email);
}

class ResetVerifyCodeEvent extends VerifyCodeEvents {}