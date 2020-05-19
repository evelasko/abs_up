import 'package:abs_up/domain/core/failures.dart';
import 'package:abs_up/domain/core/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_form_states.freezed.dart';

@freezed
abstract class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    @required EmailAddress emailAddress,
    @required Password password,
    @required bool isSubmitting,
    @required bool showErrorMessages,
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _AuthFormState;

  factory AuthFormState.initial() => AuthFormState(
      emailAddress: EmailAddress(''),
      password: Password(''),
      showErrorMessages: false,
      authFailureOrSuccessOption: none(),
      isSubmitting: false);
}
