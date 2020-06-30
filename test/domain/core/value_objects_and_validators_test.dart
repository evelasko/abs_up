import 'package:abs_up/domain/core/errors.dart';
import 'package:abs_up/domain/core/failures.dart';
import 'package:abs_up/domain/core/value_objects.dart';
import 'package:abs_up/domain/core/value_validators.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('Value Objects', () {
    const email = 'a@b.com';
    test('should return the hash of the value object', () {
      //= arrange
      final emailValueObject = EmailAddress(email);
      //= act
      final hash = emailValueObject.hashCode;
      //= assert
      expect(hash, isNotNull);
    });
    test('should return the string representation of the value object', () {
      //= arrange
      final emailValueObject = EmailAddress(email);
      //= act
      final str = emailValueObject.toString();
      //= assert
      expect(str.contains(email), true);
    });
    test('should build a uniqueId', () {
      //= arrange
      //= act
      final unique = UniqueId();
      //= assert
      expect(unique.value.isRight(), true);
    });
    test('should throw assertion error if created without value', () {
      expect(() => EmailAddress(null), throwsAssertionError);
      expect(() => Password(null), throwsAssertionError);
      expect(() => UniqueId.fromUniqueString(null), throwsAssertionError);
    });
    test('should throw unexpected error while retrieving the value', () {
      //= arrange
      const email = '1@2';
      final emailVO = EmailAddress(email);
      //= assert
      expect(() => emailVO.getOrCrash(), throwsTypeOf<UnexpectedValueError>());
    });
  });
  group('Value Object Validators', () {
    test('should validate a string by its length', () {
      //= act
      final success = validateMaxStringLength('1234', 6);
      final failure = validateMaxStringLength('1234567', 6);
      //= assert
      expect(success.isRight(), true);
      expect(failure.isLeft(), true);
    });
  });
  group('Custom Errors', () {
    test('should be able to create an UnexpectedError and retrieve its source',
        () {
      //= arrange
      const value = '1@2';
      //= act
      final error = UnexpectedValueError(
          const ValueFailure.invalidEmail(failedValue: value));
      //= assert
      expect(error.toString().contains(value), true);
    });
  });
}
