import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/services/exercise.s.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockExerciseService extends Mock implements ExerciseService {}

void main() {
  setUp(() {
    //
  });

  group('Exercise Model', () {
    //= arrange
    final Exercise tExercise = Exercise(
      difficulty: 1,
      intensity: 1,
      name: 'Test Exercise',
      target: 'Core',
      equipment: 'None',
      weighted: false,
      sided: false,
      impact: false,
    );
    final Map<String, dynamic> anExercise = {
      EXERCISE_NAME_KEY: 'Name',
      EXERCISE_DIFFICULTY_KEY: 1,
      EXERCISE_INTENSITY_KEY: 1,
      EXERCISE_TARGET_KEY: 'Core',
      EXERCISE_EQUIPMENT_KEY: 'None',
      EXERCISE_WEIGHTED_KEY: false,
      EXERCISE_SIDED_KEY: false,
      EXERCISE_IMPACT_KEY: true,
      EXERCISE_DESCRIPTION_KEY: 'Some description',
      EXERCISE_MEDIA_KEY: 'media.mp4',
      EXERCISE_THUMB_KEY: 'media.jpg',
    };
    final Map<String, dynamic> notAnExercise = {
      EXERCISE_NAME_KEY: 'Name',
      EXERCISE_DIFFICULTY_KEY: 1,
    };
    test('should get strings from intensity and difficulty integer values', () {
      //= act
      final String intensityString = tExercise.intensityString;
      final String difficultyString = tExercise.difficultyString;
      //= assert
      expect(intensityString.isNotEmpty, true);
      expect(difficultyString.isNotEmpty, true);
    });
    test('should get icon data from its equipment', () {
      //= act
      final IconData equipmentIcon = tExercise.equipmentIcon;
      //= assert
      expect(equipmentIcon, isNotNull);
    });
    test('should set favorite tag', () async {
      //= act
      await tExercise.setFavorite();
      //= assert
      expect(tExercise.tag, 1);
    });
    test('should set blacklisted tag', () async {
      //= act
      await tExercise.setBlacklist();
      //= assert
      expect(tExercise.tag, 2);
    });
    test('should remove any exercise tag', () async {
      //= act
      await tExercise.removeTag();
      //= assert
      expect(tExercise.tag, 0);
    });
    test('should verify if map has all required components of an exercise', () {
      //= act
      final bool isExercise = Exercise().hasExerciseKeys(anExercise);
      final bool notExercise = Exercise().hasExerciseKeys(notAnExercise);
      final bool onNull = Exercise().hasExerciseKeys(null);
      //= assert
      expect(isExercise, true);
      expect(notExercise, false);
      expect(onNull, false);
    });
    test('should return an exercise from a valid exercise map', () {
      //= act
      final Exercise theExercise = Exercise().exerciseFromMap(anExercise);
      final Exercise notTheExercise = Exercise().exerciseFromMap(notAnExercise);
      final Exercise onNull = Exercise().exerciseFromMap(null);
      //= assert
      expect(theExercise.runtimeType.toString(), 'Exercise');
      expect(notTheExercise, null);
      expect(onNull, null);
    });
  });
}
