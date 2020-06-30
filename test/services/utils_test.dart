import 'package:abs_up/services/utils/generate_unique_key.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Service Utils', () {
    test('should return a unique id not present in list', () {
      //= act
      final uniqueId = generateUniqueKey(['']);
      //= assert
      expect(uniqueId, isNotNull);
    });
  });
}
