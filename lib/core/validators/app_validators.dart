import 'package:online_exam_app/core/constants/app_text_constants.dart';
import 'package:online_exam_app/core/validators/app_regex.dart';

class AppValidators {
  /// Validate email field
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppTextConstants.emailRequired;
    } else if (!AppRegex.isEmailValid(value.trim())) {
      return AppTextConstants.invalidEmail;
    }
    return null;
  }

  /// Validate password field
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppTextConstants.passwordRequired;
    } else if (!AppRegex.hasMinLength(value)) {
      return AppTextConstants.passwordMinLength;
    } else if (!AppRegex.hasUpperCase(value)) {
      return AppTextConstants.passwordUpperCase;
    } else if (!AppRegex.hasLowerCase(value)) {
      return AppTextConstants.passwordLowerCase;
    } else if (!AppRegex.hasNumber(value)) {
      return AppTextConstants.passwordNumber;
    } else if (!AppRegex.hasSpecialCharacter(value)) {
      return AppTextConstants.passwordSpecialChar;
    }
    return null;
  }

  /// Validate confirm password field
  static String? validateConfirmPassword(
    String? value,
    String? originalPassword,
  ) {
    if (value == null || value.isEmpty) {
      return AppTextConstants.confirmPasswordRequired;
    } else if (value != originalPassword) {
      return AppTextConstants.passwordsDoNotMatch;
    }
    return null;
  }
}
