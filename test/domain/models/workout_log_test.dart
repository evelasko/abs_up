import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout_log.dart';
import 'package:abs_up/domain/models/workout_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    //
  });

  group('Workout Model', () {
    //= arrange
    const intensity = 1;
    const difficulty = 1;
    final Exercise tExercise = Exercise(
      difficulty: difficulty,
      intensity: intensity,
      name: 'Test Exercise',
      target: 'Core',
      equipment: 'None',
      weighted: false,
      sided: false,
      impact: false,
    );

    final WorkoutLog tWorkoutLog = WorkoutLog(
        items: List.generate(
            4,
            (index) => WorkoutItem(
                  exercise: tExercise,
                  duration: 30,
                  order: index,
                )));

    test(
        'should return the total duration of the workout as duration and as string',
        () {
      //= act
      final totalDuration = tWorkoutLog.totalDuration;
      final totalDurationString = tWorkoutLog.totalDurationString;
      //= assert
      expect(totalDuration, isNotNull);
      expect(totalDurationString, isNotNull);
      expect(totalDuration.inSeconds, 30 * 4);
      expect(totalDurationString.length > 1, true);
      expect(totalDurationString.contains(':'), true);
    });
    test('should return the total of equipment used in items', () {
      //= assert
      expect(tWorkoutLog.equipmentTotal.length, 1);
    });
    test(
        'should calculate the intensity and difficulty average as int and as string from exercise values',
        () {
      //= assert
      expect(tWorkoutLog.intensityAverage, intensity);
      expect(tWorkoutLog.difficultyAverage, difficulty);
      expect(tWorkoutLog.intensityAverageString, isNotEmpty);
      expect(tWorkoutLog.difficultyAverageString, isNotEmpty);
    });
  });
}
