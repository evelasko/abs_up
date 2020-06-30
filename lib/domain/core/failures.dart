import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Authentication Failure Validation class
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required T failedValue,
    int maxAllowed,
  }) = InvalidEmail<T>;

  const factory ValueFailure.emptyLine({
    @required T failedValue,
  }) = EmptyLine<T>;

  const factory ValueFailure.insecurePassword({
    @required T fieldValue,
  }) = InsecurePassword<T>;

  const factory ValueFailure.textTooLong({
    @required T fieldValue,
    int maxLength,
  }) = TextTooLong<T>;
}

@freezed
abstract class CoreFailure<T> with _$CoreFailure<T> {
  const factory CoreFailure.internalError({
    @required T message,
  }) = InternalError<T>;
}

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidCredentials() = InvalidCredentials;
  const factory AuthFailure.appleSignInNotAvailable() = AppleSignInNotAvailable;
}
