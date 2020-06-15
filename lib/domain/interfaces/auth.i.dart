import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../core/failures.dart';
import '../core/value_objects.dart';
import '../models/user.dart';

abstract class AuthInterface {
  /// Retreive a registered and signed in user
  Future<Option<User>> getLoggedInUser();

  /// Register a new user with email and password
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});

  /// Log in a registered user with email and password
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});

  /// Register and log in a user with Google
  Future<Either<AuthFailure, Unit>> loginWithGoogle();

  /// Register and log in a user with Apple
  Future<Either<AuthFailure, Unit>> loginWithApple();

  /// Log out an already logged in user
  Future<void> logOut();

  /// Retrieve the display name of the user
  Future<Option<String>> getUserDisplayName();
}
