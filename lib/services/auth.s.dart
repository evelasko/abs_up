import 'dart:io';

import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:http/http.dart' as http;

import '../domain/core/failures.dart';
import '../domain/core/value_objects.dart';
import '../domain/interfaces/auth.i.dart';
import './core/firebase_user_mapper.dart';

@lazySingleton
@RegisterAs(AuthInterface)
class FirebaseAuthService implements AuthInterface {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthService(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Future<Option<String>> getUserDisplayName() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    if (user == null) return none();
    final String displayName = user.displayName;
    return displayName.isEmpty ? none() : some(displayName);
  }

  @override
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword(
      {@required EmailAddress emailAddress,
      @required Password password}) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr);
      return right(unit);
    } on PlatformException catch (e) {
      return left(
          (e.code == 'ERROR_WRONG_PASSWORD' || e.code == 'ERROR_USER_NOT_FOUND')
              ? const AuthFailure.invalidCredentials()
              : const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {@required EmailAddress emailAddress,
      @required Password password}) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr);
      final FirebaseUser user = await _firebaseAuth.currentUser();
      if (user != null) {
        final UserUpdateInfo profile = UserUpdateInfo();
        profile.displayName = emailAddressStr.replaceFirst(RegExp('@.+'), '');
        await user.updateProfile(profile);
      }
      return right(unit);
    } on PlatformException catch (e) {
      return left(e.code == 'ERROR_EMAIL_ALREADY_IN_USE'
          ? const AuthFailure.emailAlreadyInUse()
          : const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return left(const AuthFailure.cancelledByUser());
      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.getCredential(
          idToken: googleAuthentication.idToken,
          accessToken: googleAuthentication.accessToken);
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((result) => right(unit));
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> loginWithApple() async {
    final bool available = await SignInWithApple.isAvailable();
    if (!available) return left(const AuthFailure.appleSignInNotAvailable());
    try {
      final AuthorizationCredentialAppleID credential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final AuthCredential authCredential =
          const OAuthProvider(providerId: 'apple.com').getCredential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((result) async {
        await result.user.updateProfile(UserUpdateInfo()
          ..displayName = '${credential.givenName} ${credential.familyName}');
        return right(unit);
      });
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Option<User>> getLoggedInUser() => _firebaseAuth
      .currentUser()
      .then((firebaseUser) => optionOf<User>(firebaseUser?.toDomain()));

  @override
  Future<void> logOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);
}
