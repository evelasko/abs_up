import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Workout Item Model', () {
    //= arrange
    final tExercise1 = Exercise(
      difficulty: 1,
      intensity: 1,
      name: 'Test Exercise 1',
      equipment: 'none',
      target: 'core',
      sided: false,
      impact: false,
    );
    final tExercise2 = Exercise(
      difficulty: 2,
      intensity: 2,
      name: 'Test Exercise 2',
      equipment: 'dumbbell',
      target: 'rect',
      sided: false,
      impact: false,
    );

    final tWorkoutItem1 = WorkoutItem(
      exercise: tExercise1,
      duration: 30,
      order: 0,
    );
    final tWorkoutItem2 = WorkoutItem(
      exercise: tExercise2,
      duration: 60,
      order: 0,
    );

    test('should return a copy with precise modifications', () {
      //= act
      final copyItem1 = tWorkoutItem1.copyWith(duration: 120);
      final copyItem2 = tWorkoutItem1.copyWith(order: 3);
      //= assert
      expect(copyItem1.duration, 120);
      expect(copyItem1.order, tWorkoutItem1.order);
      expect(copyItem2.order, 3);
      expect(copyItem2.duration, tWorkoutItem1.duration);
    });
    test('should evaluate instance equality', () {
      //= act
      final isEqual = tWorkoutItem1 == tWorkoutItem1;
      final isCopied = tWorkoutItem1 == tWorkoutItem1.copyWith();
      final notEqual = tWorkoutItem1 == tWorkoutItem2;
      //= assert
      expect(isEqual, true);
      expect(isCopied, true);
      expect(notEqual, false);
    });
    test('should generate a has code', () {
      //= act
      final hsh = tWorkoutItem1.hashCode;
      //= assert
      expect(hsh, isNotNull);
    });
  });
}
