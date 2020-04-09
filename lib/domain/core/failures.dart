//: Validation failure classes
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Authentication Failure Validation class
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  /// Email Validation Failures
  const factory ValueFailure.invalidEmail({@required String failedValue}) =
      InvalidEmail<T>;

  /// Password Validation Failures
  const factory ValueFailure.insecurePassword({@required String fieldValue}) =
      InsecurePassword<T>;
}

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidCredentials() = InvalidCredentials;
}
