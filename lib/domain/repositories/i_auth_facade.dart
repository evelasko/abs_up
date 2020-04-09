import 'package:dartz/dartz.dart';
import 'package:data_setup/domain/core/failures.dart';
import 'package:flutter/foundation.dart';
import '../core/value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});
  Future<Either<AuthFailure, Unit>> loginWithGoogle();
}
