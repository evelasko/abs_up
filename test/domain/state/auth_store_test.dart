import 'dart:async';

import 'package:abs_up/domain/core/failures.dart';
import 'package:abs_up/domain/core/value_objects.dart';
import 'package:abs_up/domain/models/user.dart';
import 'package:abs_up/domain/state/auth_form_states.dart';
import 'package:abs_up/domain/state/auth_state.dart';
import 'package:abs_up/domain/state/auth_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.dart';

void main() {
  final FirebaseAuthServiceMock authService = FirebaseAuthServiceMock();
  final AuthStore authStore = AuthStore(authService);

  group('Store: Auth', () {
    //= setup
    const email = '1@2.com';
    const password = 'password123456';
    test('should request the currently logged in user and store it', () async {
      //= arrange
      final User user =
          User(id: UniqueId.fromUniqueString('id'), displayName: some('User'));
      when(authService.getLoggedInUser())
          .thenAnswer((_) => Future.value(some(user)));
      //= act
      final result = await authStore.getUser();
      final displayName = authStore.displayName;
      //= assert
      verify(authService.getLoggedInUser());
      expect(result.isSome(), true);
      expect(authStore.user.isSome(), true);
      expect(displayName.isSome(), true);
    });
    test('should return user display name', () async {
      //= arrange
      when(authService.getUserDisplayName())
          .thenAnswer((_) => Future.value(some('User')));
      //= act
      final displayName = await authStore.getUserDisplayName();
      //= assert
      expect(displayName.isSome(), true);
      verify(authService.getUserDisplayName());
    });
    test('should reset authForm to initial', () {
      //= arrange
      authStore.authFormState = AuthFormState(
        emailAddress: EmailAddress('1@2.com'),
        password: Password('1323dsddffv'),
        isSubmitting: false,
        showErrorMessages: false,
        authFailureOrSuccessOption: none(),
      );
      //= act
      authStore.initAuthForm();
      //= assert
      expect(authStore.authFormState, AuthFormState.initial());
    });
    test('should update auth form values', () {
      authStore.initAuthForm();
      //= arrange
      //= act
      authStore.emailChanged(email);
      authStore.passwordChanged(password);
      //= assert
      expect(authStore.authFormState.emailAddress.value.getOrElse(() => 'null'),
          email);
      expect(authStore.authFormState.password.value.getOrElse(() => 'null'),
          password);
    });
    test('should trigger register with email and password', () async {
      //= arrange
      authStore.initAuthForm();
      authStore.emailChanged(email);
      authStore.passwordChanged(password);
      when(authService.registerWithEmailAndPassword(
        emailAddress: authStore.authFormState.emailAddress,
        password: authStore.authFormState.password,
      )).thenAnswer((_) => Future.value(right(unit)));
      //= act
      await authStore.registerWithEmailAndPassword();
      //= assert
      verify(authService.registerWithEmailAndPassword(
        emailAddress: anyNamed("emailAddress"),
        password: anyNamed("password"),
      ));
      expect(
          authStore.authFormState.authFailureOrSuccessOption
              .fold(() => null, id)
              .isRight(),
          true);
    });
    test('should fail to register if invalid email is provided', () async {
      //= arrange
      final FirebaseAuthServiceMock authService = FirebaseAuthServiceMock();
      final authStore = AuthStore(authService);
      authStore.initAuthForm();
      authStore.emailChanged('e');
      authStore.passwordChanged(password);
      //= act
      await authStore.registerWithEmailAndPassword();
      //= assert
      verifyZeroInteractions(authService);
      expect(authStore.authFormState.authFailureOrSuccessOption.isNone(), true);
    });
    test('should fail to register if invalid password is provided', () async {
      //= arrange
      final FirebaseAuthServiceMock authService = FirebaseAuthServiceMock();
      final authStore = AuthStore(authService);
      authStore.initAuthForm();
      authStore.emailChanged(email);
      authStore.passwordChanged('pas');
      //= act
      await authStore.registerWithEmailAndPassword();
      //= assert
      verifyZeroInteractions(authService);
      expect(authStore.authFormState.authFailureOrSuccessOption.isNone(), true);
    });
    test('should successfully login a registered user', () async {
      //= arrange
      authStore.initAuthForm();
      authStore.emailChanged(email);
      authStore.passwordChanged(password);
      when(authService.loginWithEmailAndPassword(
        emailAddress: authStore.authFormState.emailAddress,
        password: authStore.authFormState.password,
      )).thenAnswer((_) => Future.value(right(unit)));
      //= act
      await authStore.logInWithEmailAndPassword();
      //= assert
      verify(authService.loginWithEmailAndPassword(
        emailAddress: anyNamed("emailAddress"),
        password: anyNamed("password"),
      ));
      expect(
          authStore.authFormState.authFailureOrSuccessOption
              .fold(() => null, id)
              .isRight(),
          true);
    });
    test(
        'should report failed attempt to logging a user if not found or invalid credentials',
        () async {
      //= arrange
      authStore.initAuthForm();
      authStore.emailChanged(email);
      authStore.passwordChanged(password);
      when(authService.loginWithEmailAndPassword(
        emailAddress: authStore.authFormState.emailAddress,
        password: authStore.authFormState.password,
      )).thenAnswer(
          (_) => Future.value(left(const AuthFailure.invalidCredentials())));
      //= act
      await authStore.logInWithEmailAndPassword();
      //= assert
      verify(authService.loginWithEmailAndPassword(
        emailAddress: anyNamed("emailAddress"),
        password: anyNamed("password"),
      ));
      expect(
          authStore.authFormState.authFailureOrSuccessOption
              .fold(() => null, id)
              .isLeft(),
          true);
    });
    test('should attempt to login with google and report if success', () async {
      //= arrange
      authStore.initAuthForm();
      when(authService.loginWithGoogle())
          .thenAnswer((_) => Future.value(right(unit)));
      //= act
      await authStore.signInWithGooglePressed();
      //= assert
      verify(authService.loginWithGoogle());
      expect(
          authStore.authFormState.authFailureOrSuccessOption
              .fold(() => null, id)
              .isRight(),
          true);
    });
    test('should attempt to login with google and report if failure', () async {
      //= arrange
      authStore.initAuthForm();
      when(authService.loginWithGoogle()).thenAnswer(
          (_) => Future.value(left(const AuthFailure.serverError())));
      //= act
      await authStore.signInWithGooglePressed();
      //= assert
      verify(authService.loginWithGoogle());
      expect(
          authStore.authFormState.authFailureOrSuccessOption
              .fold(() => null, id)
              .isLeft(),
          true);
    });
    test('should attempt to login with apple and report if success', () async {
      //= arrange
      authStore.initAuthForm();
      when(authService.loginWithApple())
          .thenAnswer((_) => Future.value(right(unit)));
      //= act
      await authStore.signInWithApplePressed();
      //= assert
      verify(authService.loginWithApple());
      expect(
          authStore.authFormState.authFailureOrSuccessOption
              .fold(() => null, id)
              .isRight(),
          true);
    });
    test('should attempt to login with apple and report if failure', () async {
      //= arrange
      authStore.initAuthForm();
      when(authService.loginWithApple()).thenAnswer(
          (_) => Future.value(left(const AuthFailure.serverError())));
      //= act
      await authStore.signInWithApplePressed();
      //= assert
      verify(authService.loginWithApple());
      expect(
          authStore.authFormState.authFailureOrSuccessOption
              .fold(() => null, id)
              .isLeft(),
          true);
    });
    test('should sing out a user if authenticated', () {
      //= arrange
      when(authService.logOut()).thenAnswer((_) => Future.value());
      //= act
      authStore.logOutUser();
      //= assert
      Timer(const Duration(seconds: 1), () {
        expect(authStore.authState, const AuthState.authenticated());
      });
    });
  });
}
