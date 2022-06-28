import 'package:formz/formz.dart';

enum EmailValidatorError { invalid }

class EmailInput extends FormzInput<String, EmailValidatorError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([String value = '']) : super.dirty(value);
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static final _validEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  EmailValidatorError? validator(String? value) {
    return _validEmail.hasMatch(value ?? '')
        ? null
        : EmailValidatorError.invalid;
  }
}
