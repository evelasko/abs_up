import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../core/failures.dart';
import '../core/value_objects.dart';
import '../interfaces/auth.i.dart';
import '../models/user.dart';
import 'auth_form_states.dart';
import 'auth_state.dart';

part 'auth_store.g.dart';

@injectable
class AuthStore extends _AuthStore with _$AuthStore {
  AuthStore(AuthInterface authService) : super(authService);
}

abstract class _AuthStore with Store {
  final AuthInterface authService;
  _AuthStore(this.authService);

  @observable
  AuthFormState authFormState;

  @observable
  Option<User> user = none<User>();

  @observable
  AuthState authState = const AuthState.initial();

  @action
  Future<Option<User>> getUser() async {
    final Option<User> _user = await authService.getLoggedInUser();
    user = _user;
    return _user;
  }

  @action
  Future<bool> authCheck() async {
    try {
      final _user = await getUser();
      _user.fold(
        () => authState = const AuthState.initial(),
        (user) => authState = const AuthState.authenticated(),
      );
    } catch (e) {
      return false;
    }
    return true;
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
  Future<void> registerWithEmailAndPassword() async =>
      _performActionOnauthServiceWithEmailAndPassword(
          authService.registerWithEmailAndPassword);

  @action
  Future<void> logInWithEmailAndPassword() async =>
      _performActionOnauthServiceWithEmailAndPassword(
          authService.loginWithEmailAndPassword);

  @action
  Future<void> signInWithGooglePressed() async {
    updateAuthFormState(authFormState.copyWith(
        isSubmitting: true, authFailureOrSuccessOption: none()));

    final failureOrSuccess = await authService.loginWithGoogle();
    updateAuthFormState(authFormState.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(failureOrSuccess)));
  }

  @action
  void logOutUser() => authService.logOut().then((_) {
        getUser();
        authState = const AuthState.unauthenticated();
      });

  // ignore: use_setters_to_change_properties
  /// Helpers
  void updateAuthFormState(AuthFormState newState) => authFormState = newState;

  Future<void> _performActionOnauthServiceWithEmailAndPassword(
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
