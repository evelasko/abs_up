//: Validation logic for user inputs

import 'package:dartz/dartz.dart';

import 'failures.dart';

/// EmailAddress - Validation logic
Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

/// Password - Validation logic
Either<ValueFailure<String>, String> validatePassword(String input) {
  const securePasswordRegEx =
      """^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{8,})""";
  if (RegExp(securePasswordRegEx).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.insecurePassword(fieldValue: input));
  }
}
