import 'dart:async';

import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/domain/models/workout_item.dart';
import 'package:abs_up/domain/state/perform_states.dart';
import 'package:abs_up/domain/state/perform_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('Perform Store', () {
    //= setup
    final exerciseService = ExerciseServiceMock();
    final workoutService = WorkoutServiceMock();
    final workoutLogsService = WorkoutLogsServiceMock();
    final userSettings = UserSettingsServiceMock();
    final speechService = SpeechServiceMock();

    final performStore = PerformStore(
      exerciseService,
      workoutService,
      workoutLogsService,
      userSettings,
      speechService,
    );
    const itemsTotal = 5;
    const itemsDuration = 30;
    const savedWorkoutKey = 'savedWorkout';
    final workoutItems = List.generate(
      itemsTotal,
      (index) => WorkoutItem(
          exercise: Exercise(name: 'Exercise $index'),
          order: index,
          duration: itemsDuration),
    );

    final savedWorkout = Workout(items: workoutItems);
    final flashWorkout = Workout(items: workoutItems);

    test('should initialize the store using the provided workout key', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      //= act
      performStore.initializeFor(savedWorkoutKey);
      //= assert
      expect(performStore.state, PerformState.welcoming);
      expect(performStore.timeRemaining.inSeconds, itemsTotal * itemsDuration);
    });

    test('should speak the welcoming and change store state to initial', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializeFor(savedWorkoutKey);
      when(speechService.speakAndDo(any, any))
          .thenAnswer((_) => Future.value());
      //= act
      performStore.welcomeWorkout();
      //= assert
      verify(speechService.speakAndDo(any, any));
    });

    test(
        'should initialize perform store either with the requested workout or the generated if no key provided',
        () {
      //= arrange

      //= act
      performStore.initializePerformanceOf();
      //= assert
      expect(performStore.sourceWorkoutKey, CURRENT_WORKOUT_KEY);
      //= act
      performStore.initializePerformanceOf(savedWorkoutKey);
      //= assert
      expect(performStore.sourceWorkoutKey, savedWorkoutKey);
    });
  });
}
