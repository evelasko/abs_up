import 'package:abs_up/domain/core/failures.dart';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/services/exercise.s.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  final BoxExerciseMock<Exercise> exercisesBox = BoxExerciseMock<Exercise>();
  final ExerciseService exerciseService = ExerciseService(exercisesBox);

  group('Service: Exercise', () {
    test('should return an instance of Exercise Service', () async {
      //= arrange
      when(exercisesBox.isEmpty).thenReturn(true);
      //= act
      final ExerciseService service = await ExerciseService.init(exercisesBox);
      //= assert
      expect(service, isNotNull);
    });
    test('should return a list of exercises', () async {
      //= arrange
      final Iterable<Exercise> exercises = await fetchTestExercises();
      when(exercisesBox.values).thenReturn(exercises);
      //= act
      final List<Exercise> all = exerciseService.allExercises;
      //= assert
      verify(exercisesBox.values);
      expect(all, isNotNull);
    });
    test('should save a new exercise', () async {
      //= arrange
      const String keyNull = null;
      const Exercise exNull = null;
      final Exercise exercise = Exercise();
      when(exercisesBox.keys).thenReturn(
          Map<String, Workout>.of({'key': Workout(items: [])}).keys);
      //= act
      final Either<CoreFailure<String>, String> resultFailed =
          await exerciseService.saveNewExercise(keyNull, exNull);
      final Either<CoreFailure<String>, String> resultFailed2 =
          await exerciseService.saveNewExercise('key', Exercise());
      final Either<CoreFailure<String>, String> resultSucceed =
          await exerciseService.saveNewExercise('key_', Exercise());
      //= assert
      expect(resultFailed.isLeft(), true);
      expect(resultFailed2.isLeft(), true);
      expect(resultSucceed.isRight(), true);
    });
    test('should retrieve an exercise for the given key', () {
      //= arrange
      when(exercisesBox.get('key')).thenReturn(Exercise());
      //= act
      final Exercise result = exerciseService.exerciseFromKey('key');
      //= assert
      verify(exercisesBox.get('key'));
      expect(result.runtimeType.toString(), 'Exercise');
    });
    test('should save an exercise into the given key', () async {
      //= arrange
      final Exercise ex = Exercise();
      //= act
      await exerciseService.setExercise('key', ex);
      //= assert
      verify(exercisesBox.put('key', ex));
    });
    test('should set an exercise as favorite, as blacklisted, or remove tag',
        () async {
      //= arrange
      final Exercise ex = Exercise();
      when(exercisesBox.get('key')).thenReturn(ex);
      //= act
      await exerciseService.setFavorite('key');
      await exerciseService.setBlacklist('key');
      await exerciseService.removeTag('key');
      //= assert
      verify(exercisesBox.get('key')).called(3);
    });
  });
}
