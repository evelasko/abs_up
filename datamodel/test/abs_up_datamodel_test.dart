import 'package:flutter_test/flutter_test.dart';

import 'package:abs_up_datamodel/abs_up_datamodel.dart';

void main() {
  test('exercise model', () {
    final exercise = Exercise();
    expect(exercise, isNotNull);
  });
}
