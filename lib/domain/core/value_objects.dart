//: Base abstract class for Value Ojects
import 'package:dartz/dartz.dart';
import 'package:data_setup/domain/core/errors.dart';
import 'package:data_setup/domain/core/value_validators.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  /// Class fields
  Either<ValueFailure<T>, T> get value;

  /// Constructor
  const ValueObject();

  /// Helper methods

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  /// or returns the value
  T getOrCrash() => value.fold((failure) => throw UnexpectedValueError(failure),
      id // (r) => r , identity functor from dartz
      );

  /// Class overrides
  @override
  int get hashCode => value.hashCode;
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  String toString() => 'Value($value)';
}

//: EmailAddress
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(validateEmailAddress(input));
  }
  const EmailAddress._(this.value);
}

//: Password
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(validatePassword(input));
  }
  const Password._(this.value);
}
