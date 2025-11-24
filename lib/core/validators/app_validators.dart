import 'app_regex.dart';

class AppValidators {
  /// Validate email field
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    } else if (!AppRegex.isEmailValid(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  /// Validate password field
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!AppRegex.hasMinLength(value)) {
      return 'Password must be at least 8 characters';
    } else if (!AppRegex.hasUpperCase(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!AppRegex.hasLowerCase(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!AppRegex.hasNumber(value)) {
      return 'Password must contain at least one number';
    } else if (!AppRegex.hasSpecialCharacter(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  /// Confirm password validation
  static String? validateConfirmPassword(
    String? value,
    String? originalPassword,
  ) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  /// Validate verification code field
  static String? validateVerificationCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Verification code is required';
    } else if (value.trim().length < 4) {
      return 'Please enter a valid verification code';
    }
    return null;
  }
}