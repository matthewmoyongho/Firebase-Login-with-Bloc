import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_login/sign_up/business_logic/singnup/sign_up_state.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.confirmPassword, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.confirmPassword, state.email]),
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmPassword =
        ConfirmPassword.dirty(password: state.password.value, value: value);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        status: Formz.validate([confirmPassword, state.email, state.password]),
      ),
    );
  }

  Future<void> signUp() async {
    if (state.status.isInvalid) return;
    emit(
      state.copyWith(status: FormzStatus.submissionInProgress),
    );
    try {
      await _authenticationRepository.signUp(
          email: state.email.value, password: state.password.value);
      emit(
        state.copyWith(status: FormzStatus.submissionSuccess),
      );
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
            errorMessage: e.message, status: FormzStatus.submissionFailure),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
