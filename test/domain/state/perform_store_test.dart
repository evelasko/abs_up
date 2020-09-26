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
    const savedItemsTotal = 5;
    const flashItemsTotal = 8;
    const savedItemsDuration = 45;
    const flashItemsDuration = 30;
    const savedWorkoutKey = 'savedWorkout';
    final flashWorkoutItems = List.generate(
      flashItemsTotal,
      (index) => WorkoutItem(
          exercise: Exercise(name: 'Exercise $index'),
          order: index,
          duration: flashItemsDuration),
    );
    final savedWorkoutItems = List.generate(
      savedItemsTotal,
      (index) => WorkoutItem(
          exercise: Exercise(name: 'Exercise $index'),
          order: index,
          duration: savedItemsDuration),
    );
    final savedWorkout =
        Workout(items: savedWorkoutItems, name: savedWorkoutKey);
    final flashWorkout = Workout(items: flashWorkoutItems);

    test('should initialize the store using the provided workout key', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      //= act
      performStore.initializeFor(savedWorkoutKey);
      //= assert
      expect(performStore.state, PerformState.welcoming);
      expect(performStore.timeRemaining.inSeconds,
          savedItemsTotal * savedItemsDuration);
    });

    test('should speak the welcoming and change store state to initial', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializeFor(savedWorkoutKey);
      when(speechService.speakAndDo(any, any)).thenAnswer((_) {
        performStore.state = PerformState.initial;
        return Future.value();
      });
      //= act
      performStore.welcomeWorkout();
      //= assert
      verify(speechService.speakAndDo(any, any));
      expect(performStore.state, PerformState.initial);
    });

    test(
        'should initialize perform store either with the requested workout or the generated if no key provided',
        () {
      //= arrange
      // ignore: avoid_redundant_argument_values
      when(workoutService.getWorkout(CURRENT_WORKOUT_KEY))
          .thenReturn(flashWorkout);
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      //= act
      performStore.initializePerformanceOf();
      //= assert
      expect(performStore.sourceWorkoutKey, CURRENT_WORKOUT_KEY);
      expect(performStore.items.length, flashItemsTotal);
      expect(performStore.state, PerformState.welcoming);
      expect(performStore.duration.inSeconds,
          flashItemsTotal * flashItemsDuration);
      expect(performStore.duration.inSeconds, performStore.remaining.inSeconds);
      expect(performStore.itemIndex, 0);
      //= act
      performStore.initializePerformanceOf(savedWorkoutKey);
      //= assert
      expect(performStore.sourceWorkoutKey, savedWorkoutKey);
      expect(performStore.items.length, savedItemsTotal);
      expect(performStore.state, PerformState.welcoming);
      expect(performStore.duration.inSeconds,
          savedItemsTotal * savedItemsDuration);
      expect(performStore.duration.inSeconds, performStore.remaining.inSeconds);
      expect(performStore.itemIndex, 0);
    });
  });
}
