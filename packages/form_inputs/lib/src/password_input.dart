import 'package:formz/formz.dart';

enum PasswordValidatorError { invalid }

class PasswordInput extends FormzInput<String, PasswordValidatorError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  static final RegExp _passRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  static final _validPassword =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidatorError? validator(String? value) {
    return _validPassword.hasMatch(value ?? '')
        ? null
        : PasswordValidatorError.invalid;
  }
}
