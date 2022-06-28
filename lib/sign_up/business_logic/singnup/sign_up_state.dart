import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

class SignUpState {
  final PasswordInput password;
  final EmailInput email;
  final String? errorMessage;
  final FormzStatus status;
  final ConfirmPassword confirmPassword;

  const SignUpState(
      {this.password = const PasswordInput.pure(),
      this.confirmPassword = const ConfirmPassword.pure(),
      this.status = FormzStatus.pure,
      this.email = const EmailInput.pure(),
      this.errorMessage});

  SignUpState copyWith({
    PasswordInput? password,
    EmailInput? email,
    String? errorMessage,
    FormzStatus? status,
    ConfirmPassword? confirmPassword,
  }) {
    return SignUpState(
      email: email != null ? email : this.email,
      status: status != null ? status : this.status,
      errorMessage: errorMessage != null ? errorMessage : this.errorMessage,
      password: password != null ? password : this.password,
      confirmPassword:
          confirmPassword != null ? confirmPassword : this.confirmPassword,
    );
  }
}
