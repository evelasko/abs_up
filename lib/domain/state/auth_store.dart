import 'package:abs_up/domain/core/failures.dart';
import 'package:abs_up/domain/core/value_objects.dart';
import 'package:abs_up/domain/interfaces/auth.i.dart';
import 'package:abs_up/domain/models/user.dart';
import 'package:abs_up/domain/state/auth_form_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

@injectable
class AuthStore extends _AuthStore with _$AuthStore {
  AuthStore(AuthInterface authFacade) : super(authFacade);
}

abstract class _AuthStore with Store {
  final AuthInterface authFacade;
  _AuthStore(this.authFacade);

  @observable
  AuthFormState authFormState;

  @observable
  Option<User> user;

  @action
  Future<void> getUser() async {
    user = await authFacade.getLoggedInUser();
  }

  @action
  void initAuthForm() => updateAuthFormState(AuthFormState.initial());

  @action
  void emailChanged(String email) => updateAuthFormState(authFormState.copyWith(
      emailAddress: EmailAddress(email), authFailureOrSuccessOption: none()));

  @action
  void passwordChanged(String password) =>
      updateAuthFormState(authFormState.copyWith(
          password: Password(password), authFailureOrSuccessOption: none()));

  @action
  Future<void> registerWithEmailAndPassword() async {
    _performActionOnAuthFacadeWithEmailAndPassword(
        authFacade.registerWithEmailAndPassword);
  }

  @action
  Future<void> logInWithEmailAndPassword() async {
    _performActionOnAuthFacadeWithEmailAndPassword(
        authFacade.loginWithEmailAndPassword);
  }

  @action
  Future<void> signInWithGooglePressed() async {
    updateAuthFormState(authFormState.copyWith(
        isSubmitting: true, authFailureOrSuccessOption: none()));

    final failureOrSuccess = await authFacade.loginWithGoogle();
    updateAuthFormState(authFormState.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(failureOrSuccess)));
  }

  // ignore: use_setters_to_change_properties
  /// Helpers
  void updateAuthFormState(AuthFormState newState) => authFormState = newState;

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
      Future<Either<AuthFailure, Unit>> Function(
              {@required EmailAddress emailAddress,
              @required Password password})
          forwardedCall) async {
    Either<AuthFailure, Unit> failureOrSuccess;
    final isEmailValid = authFormState.emailAddress.isValid();
    final isPasswordValid = authFormState.password.isValid();
    if (isEmailValid && isPasswordValid) {
      updateAuthFormState(authFormState.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none()));

      failureOrSuccess = await forwardedCall(
          emailAddress: authFormState.emailAddress,
          password: authFormState.password);
    }
    updateAuthFormState(authFormState.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess)));
  }
}
