import 'package:abs_up/domain/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:abs_up/domain/core/failures.dart';
import 'package:flutter/foundation.dart';
import '../core/value_objects.dart';

abstract class IAuthFacade {
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

  /// Log out an already logged in user
  Future<void> logOut();
}
