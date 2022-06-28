import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(LoginState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.email]),
      ),
    );
  }

  Future<void> logIn() async {
    if (state.status.isInvalid) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logIn(
          email: state.email.value, password: state.password.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.errorMessage));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> LogInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      _authenticationRepository.LogInWithEmail();
      emit(
        state.copyWith(status: FormzStatus.submissionSuccess),
      );
    } on LogInWithGoogleFailure catch (e) {
      emit(state.copyWith(
          errorMessage: e.errorMessage, status: FormzStatus.submissionFailure));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
