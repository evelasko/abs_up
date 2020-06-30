import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/domain/models/workout_settings.dart';
import 'package:abs_up/services/workout.s.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  final BoxWorkoutMock<Workout> workoutsBox = BoxWorkoutMock<Workout>();
  final WorkoutService workoutService = WorkoutService(workoutsBox);

  group('Service: Workout - Algorithm', () {
    test('should return bool to filter exercises by intensity setting',
        () async {
      //= arrange
      final Iterable<Exercise> exercises = await fetchTestExercises();
      //= act & assert
      LENGTH_STRINGS.forEach((lengthString) {
        final Workout workout = workoutService.generateWorkout(
          exercises.toList(),
          WorkoutSettings(
            length: lengthToInt(lengthString),
          ),
        );
        expect(workout.runtimeType.toString(), 'Workout');
      });
      INTENSITY_STRINGS.forEach((intensityString) {
        final Workout workout = workoutService.generateWorkout(
          exercises.toList(),
          WorkoutSettings(
            intensity: intensityToInt(intensityString),
          ),
        );
        expect(workout.runtimeType.toString(), 'Workout');
      });
      DIFFICULTY_STRINGS.forEach((difficultyString) {
        final Workout workout = workoutService.generateWorkout(
          exercises.toList(),
          WorkoutSettings(
            difficulty: difficultyToInt(difficultyString),
          ),
        );
        expect(workout.runtimeType.toString(), 'Workout');
      });
    });
  });
  group('Service: Workout - Hive Box Interaction', () {
    test('should return all workouts as list', () {
      //= arrange
      when(workoutsBox.values)
          .thenReturn(Map.of({'key': Workout(items: [])}).values);
      //= act
      List<Workout> all = workoutService.allWorkouts;
      //= assert
      verify(workoutsBox.values);
      expect(all, isNotNull);
    });
    test('should return all user workouts as list', () {
      //= arrange
      when(workoutsBox.values)
          .thenReturn(Map.of({'key': Workout(items: [])}).values);
      //= act
      List<Workout> userWorkouts = workoutService.allUserWorkouts;
      //= assert
      verify(workoutsBox.values);
      expect(userWorkouts, isNotNull);
    });
    // test('should register a listener for the Hive box listenable', () {
    //   //= arrange
    //   // when(workoutsBox.listenable()).thenReturn(expected)
    //   //= act
    //   workoutService.registerListener(() {});
    //   //= assert
    //   verify(workoutsBox.listenable());
    // });
    test(
        'should return a workout by its key or the default current workout if no key provided',
        () {
      //= arrange
      when(workoutsBox.get('key')).thenReturn(Workout(items: []));
      //= act
      final Workout workout = workoutService.getWorkout('key');
      //= assert
      verify(workoutsBox.get('key'));
      expect(workout, isNotNull);
    });
    test('should save a workout into the given key', () {
      //= arrange
      final Workout workout = Workout(items: []);
      //= act
      workoutService.saveWorkout(workout: workout);
      workoutService.saveWorkout(key: 'key', workout: workout);
      //= assert
      verify(workoutsBox.put(CURRENT_WORKOUT_KEY, workout));
      verify(workoutsBox.put('key', workout));
    });
    // test('should save a workout with the given name', () {
    //   //= arrange
    //   final WorkoutMock woMock = WorkoutMock();
    //   when(workoutsBox.get(CURRENT_WORKOUT_KEY)).thenReturn(Workout(items: []));
    //   when(workoutsBox.keys)
    //       .thenReturn(Map.of({'key': Workout(items: [])}).keys);
    //   when(woMock.copy()).thenReturn(woMock);
    //   //= act
    //   workoutService.saveCurrentWorkoutAs('name');
    //   //= assert
    //   verify(workoutsBox.get(CURRENT_WORKOUT_KEY));
    //   verify(workoutsBox.keys);
    //   verify(woMock.copy);
    //   verify(woMock.name);
    //   verify(workoutsBox.put);
    // });
    test('should delete a workout for the given key', () async {
      //= act
      workoutService.deleteWorkout('workoutKey');
      //= assert
      verify(workoutsBox.delete('workoutKey'));
    });
  });
}
