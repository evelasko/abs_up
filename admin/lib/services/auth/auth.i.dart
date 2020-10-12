import 'package:dartz/dartz.dart';
import 'package:abs_up_datamodel/abs_up_datamodel.dart';

enum UserDomainRole { teacher, student, admin, guest }

abstract class AuthInterface {
  //String get userId;
  //String get deviceId;
  //UserDomainRole get userDomainRole;

  /// Returns true if user is signed in
  bool get authenticated;

  /// Returns the currently signed in user's unique id or null if none
  String get userId;

  /// Signs a user in and links its account with the device ID
  Future<Either<AuthFailure, Unit>> handleSignIn();

  /// Signs a user out , clear all its data stored in device ad removes
  /// the linked device id from its account
  Future<Either<AuthFailure, Unit>> handleSignOut();
}
