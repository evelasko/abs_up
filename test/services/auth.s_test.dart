import 'package:abs_up/domain/core/failures.dart';
import 'package:abs_up/domain/core/value_objects.dart';
import 'package:abs_up/services/auth.s.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final FirebaseAuthMock firebaseAuth = FirebaseAuthMock();
  final GoogleSignInMock googleSignIn = GoogleSignInMock();
  final FirebaseAuthService authService =
      FirebaseAuthService(firebaseAuth, googleSignIn);

  const emailString = 'some@mail.com';
  const passwordString = 'Some5ecurePa';

  group('Service: Auth', () {
    test('should retrieve the currently logged in user', () async {
      //= arrange
      final fbUser = FirebaseUserMock();
      when(fbUser.uid).thenReturn('expected');
      when(firebaseAuth.currentUser()).thenAnswer((_) => Future.value(fbUser));
      //= act
      final user = await authService.getLoggedInUser();
      //= assert
      verify(firebaseAuth.currentUser());
      expect(user.isSome(), true);
    });
    test('should return null if not user has logged in', () async {
      //= arrange
      when(firebaseAuth.currentUser()).thenAnswer((_) => Future.value());
      //= act
      final user = await authService.getLoggedInUser();
      //= assert
      verify(firebaseAuth.currentUser());
      expect(user.isSome(), false);
    });
    test('should login with email and password', () async {
      //= arrange
      final emailAddress = EmailAddress(emailString);
      final password = Password(passwordString);
      when(firebaseAuth.signInWithEmailAndPassword(
              email: emailString, password: passwordString))
          .thenAnswer((_) => Future.value());
      //= act
      final result = await authService.loginWithEmailAndPassword(
          emailAddress: emailAddress, password: password);
      //= assert
      expect(result.isRight(), true);
    });
    test('should return left if login fails', () async {
      //= arrange
      final emailAddress = EmailAddress(emailString);
      final password = Password(passwordString);
      when(firebaseAuth.signInWithEmailAndPassword(
              email: emailString, password: passwordString))
          .thenThrow(PlatformException(code: 'ERROR_USER_NOT_FOUND'));
      //= act
      final result = await authService.loginWithEmailAndPassword(
          emailAddress: emailAddress, password: password);
      //= assert
      expect(result.isLeft(), true);
    });
    test('should register with email and password', () async {
      //= arrange
      final AuthResultMock authResult = AuthResultMock();
      final fbUser = FirebaseUserMock();
      when(firebaseAuth.createUserWithEmailAndPassword(
              email: emailString, password: passwordString))
          .thenAnswer((_) => Future<AuthResultMock>.value(authResult));
      when(firebaseAuth.currentUser())
          .thenAnswer((_) => Future<FirebaseUserMock>.value(fbUser));

      final emailAddress = EmailAddress(emailString);
      final password = Password(passwordString);

      //= act
      final Either<AuthFailure, Unit> result =
          await authService.registerWithEmailAndPassword(
              emailAddress: emailAddress, password: password);
      //= assert
      expect(result.isRight(), true);
      verify(firebaseAuth.createUserWithEmailAndPassword(
          email: emailString, password: passwordString));
    });
    test('should return left if email is already registered', () async {
      //= arrange
      when(firebaseAuth.createUserWithEmailAndPassword(
              email: emailString, password: passwordString))
          .thenThrow(PlatformException(code: 'ERROR_EMAIL_ALREADY_IN_USE'));
      final emailAddress = EmailAddress(emailString);
      final password = Password(passwordString);

      //= act
      final result = await authService.registerWithEmailAndPassword(
          emailAddress: emailAddress, password: password);
      //= assert
      expect(result.isLeft(), true);
    });
    test('should logout user from any auth provider', () async {
      //= arrange
      when(firebaseAuth.signOut()).thenAnswer((_) => Future.value());
      when(googleSignIn.signOut()).thenAnswer((_) => Future.value());
      //= act
      await authService.logOut();
      //= assert
      verify(googleSignIn.signOut());
      verify(firebaseAuth.signOut());
    });
    test('should return user display name', () async {
      //= arrange
      final fUser = FirebaseUserMock();
      when(firebaseAuth.currentUser()).thenAnswer((_) => Future.value(fUser));
      when(fUser.displayName).thenReturn('Display Name');
      //= act
      final result = await authService.getUserDisplayName();
      //= assert
      expect(result.isSome(), true);
    });
    test('should not return user display name if no user is authenticated',
        () async {
      //= arrange
      when(firebaseAuth.currentUser()).thenAnswer((_) => Future.value());
      //= act
      final result = await authService.getUserDisplayName();
      //= assert
      expect(result.isNone(), true);
    });
    test('should sign in with google', () async {
      //= arrange
      final GoogleSignInAccountMock accountMock = GoogleSignInAccountMock();
      final GoogleSignInAuthenticationMock accountAuth =
          GoogleSignInAuthenticationMock();

      // Mock sign in with Google.
      final _googleSignIn = MockGoogleSignIn();
      final signinAccount = await _googleSignIn.signIn();
      final googleAuth = await signinAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final AuthResultMock res =
          AuthResultMock(); //await auth.signInWithCredential(credential);

      when(googleSignIn.signIn())
          .thenAnswer((_) => Future.value(signinAccount /*accountMock*/));
      when(accountMock.authentication)
          .thenAnswer((_) => Future.value(googleAuth /*accountAuth*/));
      when(accountAuth.idToken).thenReturn(googleAuth.idToken);
      when(accountAuth.accessToken).thenReturn(googleAuth.accessToken);
      when(firebaseAuth.signInWithCredential(any))
          .thenAnswer((_) => Future.value(res));
      //= act
      final result = await authService.loginWithGoogle();
      //= assert
      expect(result.isRight(), true);
    });
    test('should return left if an error is thrown during google login process',
        () async {
      //= arrange
      when(googleSignIn.signIn()).thenThrow(PlatformException(code: 'CODE'));
      //= act
      final result = await authService.loginWithGoogle();
      //= assert
      expect(result.isLeft(), true);
    });
    test('should return left if google login process does not returns a user',
        () async {
      //= arrange
      when(googleSignIn.signIn()).thenAnswer((_) => Future.value());
      //= act
      final result = await authService.loginWithGoogle();
      //= assert
      expect(result.isLeft(), true);
    });
  });
}
