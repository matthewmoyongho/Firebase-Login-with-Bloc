import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

class LoginState {
  final EmailInput email;
  final PasswordInput password;
  final String? errorMessage;
  FormzStatus status;
  LoginState(
      {this.email = const EmailInput.pure(),
      this.status = FormzStatus.pure,
      this.errorMessage,
      this.password = const PasswordInput.pure()});

  LoginState copyWith(
      {EmailInput? email,
      PasswordInput? password,
      String? errorMessage,
      FormzStatus? status}) {
    return LoginState(
        email: email != null ? email : this.email,
        status: status != null ? status : this.status,
        errorMessage: errorMessage != null ? errorMessage : this.errorMessage,
        password: password != null ? password : this.password);
  }

  @override
  List<Object> get props => [email, password, status];
}
