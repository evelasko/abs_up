import 'package:abs_up_datamodel/abs_up_datamodel.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:observable_ish/value/value.dart';
import 'package:stacked/stacked.dart';

import 'auth.i.dart';

@Singleton(
  as: AuthInterface,
  signalsReady: false,
)
class AuthService with ReactiveServiceMixin implements AuthInterface {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthService(
    FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignIn,
  )   : assert(firebaseAuth != null),
        assert(googleSignIn != null),
        _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn {
    _firebaseAuth.userChanges().listen((user) => _user.value = user?.uid);
    listenToReactiveValues([_user]);
  }

  final RxValue<String> _user = RxValue<String>();

  @override
  bool get authenticated => _user.value != null;

  @override
  String get userId => _user.value;

  /// Perform all tasks involved in the authentication process
  /// using Google Sign In (instance restricted to domain) and Firebase
  /// Google Auth Provider.
  @override
  Future<Either<AuthFailure, Unit>> handleSignIn() async {
    if (authenticated) return left(const AuthFailure.alreadySignedIn());

    try {
      //= Start Google Sign In process
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final GoogleSignInAuthentication authentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );
      //= Sign into Firebase with Google Credentials
      final UserCredential result =
          await _firebaseAuth.signInWithCredential(credential);

      return result.user.email != null
          ? right(unit)
          : left(const AuthFailure.invalidCredentials());
    } on PlatformException catch (err) {
      log(err);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> handleSignOut() async {
    try {
      if (authenticated) {
        await _firebaseAuth.signOut().then((value) => _googleSignIn.signOut());
      }
      return right(unit);
    } catch (e) {
      log(e.toString());
      return left(const AuthFailure.serverError());
    }
  }
}
