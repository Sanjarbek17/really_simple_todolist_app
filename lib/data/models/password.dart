import 'package:formz/formz.dart';

enum PasswordValidationError { empty }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    return null;
  }
}

class ConfirmPassword extends FormzInput<String, PasswordValidationError> {
  const ConfirmPassword.pure([this.password = '']) : super.pure('');
  const ConfirmPassword.dirty([super.value = '', this.password = '']) : super.dirty();
  final String password;
  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value != password) return PasswordValidationError.empty;
    return null;
  }
}
