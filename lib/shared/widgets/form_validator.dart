import 'package:validators/validators.dart';

class FormValidator {
  static validateText(String? value, String? name, {int minLength = 0}) {
    if (value == null || value.trim().isEmpty) {
      return '$name required';
    }
    if (value.trim().length < minLength) {
      return '$name must be at least $minLength characters';
    }

    return null;
  }

  static validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email required';
    }
    if (!isEmail(value.trim())) {
      return 'Enter a valid email';
    }

    return null;
  }

  static validateRetypeText(String? value, String? valueComparison,
      {String message = 'Password not match'}) {
    // print(value);
    // print(valueComparison);
    if (value != valueComparison) {
      return message;
    }
    return null;
  }
}
