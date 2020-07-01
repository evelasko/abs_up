import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout.dart';
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

    final Workout tWorkout = Workout(
        items: List.generate(
            4,
            (index) => WorkoutItem(
                  exercise: tExercise,
                  duration: 30,
                  order: index,
                )));

    test('should update a workout item', () async {
      //= arrange
      final Workout workout = Workout(
          items: List.generate(
              4,
              (index) => WorkoutItem(
                    exercise: tExercise,
                    duration: 30,
                    order: index,
                  )));
      //= act
      await workout.updateWorkoutItem(
        0,
        duration: 60,
        exercise: tExercise,
        order: 2,
      );
      final wItem = workout.items[0];
      //= assert
      expect(wItem.duration, 60);
    });
    test(
        'should return the total duration of the workout as duration and as string',
        () {
      //= act
      final totalDuration = tWorkout.totalDuration;
      final totalDurationString = tWorkout.totalDurationString;
      //= assert
      expect(totalDuration, isNotNull);
      expect(totalDurationString, isNotNull);
      expect(totalDuration.inSeconds, 30 * 4);
      expect(totalDurationString.length > 1, true);
      expect(totalDurationString.contains(':'), true);
    });
    test('should return the total of equipment used in items', () {
      //= assert
      expect(tWorkout.equipmentTotal.length, 1);
    });
    test(
        'should calculate the intensity and difficulty average as int and as string from exercise values',
        () {
      //= assert
      expect(tWorkout.intensityAverage, intensity);
      expect(tWorkout.difficultyAverage, difficulty);
      expect(tWorkout.intensityAverageString, isNotEmpty);
      expect(tWorkout.difficultyAverageString, isNotEmpty);
    });
    test(
        'should reorder items and update the order field to be the same as the item index in list',
        () async {
      //= arrange
      const itemsLength = 4;
      final Workout workout = Workout(
          items: List.generate(
              itemsLength,
              (index) => WorkoutItem(
                    exercise: tExercise,
                    duration: (index + 1) * 10,
                    order: index,
                  )));
      //= act
      await workout.reorderItems(3, 0);
      //= assert
      expect(workout.items[0].duration, itemsLength * 10);
      expect(workout.items[0].order, 1);
    });
    test('should remove an item from its items', () async {
      //= arrange
      const itemsLength = 4;
      final items = List.generate(
          itemsLength,
          (index) => WorkoutItem(
                exercise: tExercise,
                duration: (index + 1) * 10,
                order: index,
              ));
      final Workout workout = Workout(items: items);
      //= act
      await workout.removeItem(items[0]);
      //= assert
      expect(workout.items.length, itemsLength - 1);
    });
    test('should duplicate a workout', () {
      //= arrange
      final Workout aWorkout = Workout(
          items: List.generate(
              4,
              (index) => WorkoutItem(
                    exercise: tExercise,
                    duration: (index + 1) * 10,
                    order: index,
                  )));
      //= act
      final Workout bWorkout = aWorkout.copy();
      //= assert
      expect(aWorkout.name, bWorkout.name);
      expect(aWorkout.items.length, bWorkout.items.length);
      expect(aWorkout.createdAt, isNot(bWorkout.createdAt));
    });
  });
}
