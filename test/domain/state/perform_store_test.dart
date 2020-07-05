import 'dart:async';

import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/interfaces/speech.i.dart';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/domain/models/workout_item.dart';
import 'package:abs_up/domain/state/perform_states.dart';
import 'package:abs_up/domain/state/perform_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' show Observable;
import 'package:mockito/mockito.dart';
import 'package:quiver/testing/async.dart';

import '../../helpers/test_helpers.dart';

void main() {
  const savedItemsTotal = 5;
  const flashItemsTotal = 8;
  const savedItemsDuration = 60;
  const flashItemsDuration = 30;
  const savedWorkoutKey = 'savedWorkout';
  group('Performing Item Model', () {
    final workoutItems = List.generate(
      flashItemsTotal,
      (index) => WorkoutItem(
          exercise: Exercise(name: 'Exercise $index'),
          order: index,
          duration: flashItemsDuration),
    );
    test('should return PerformingItem from a WorkoutItem', () {
      //= act
      final performingItem =
          PerformingItem.fromWorkoutItem(item: workoutItems[0]);
      //= assert
      expect(performingItem.status, PerformingItemStatus.initial);
      expect(performingItem.weight, 0);
      expect(performingItem.progress, 0);
      expect(performingItem.exercise.name, 'Exercise 0');
    });
    test('should return a modified copy of the original performing item', () {
      //= arrange
      final performingItem =
          PerformingItem.fromWorkoutItem(item: workoutItems[0]);
      //= act
      final modifiedItem =
          performingItem.copyWith(status: PerformingItemStatus.presenting);
      //= assert
      expect(modifiedItem.status, PerformingItemStatus.presenting);
      expect(modifiedItem.order, performingItem.order);
      expect(modifiedItem.exercise.name, performingItem.exercise.name);
      expect(modifiedItem.weight, performingItem.weight);
      expect(modifiedItem.progress, performingItem.progress);
      //= act
      final remodified = modifiedItem.copyWith(
        exercise: Exercise(name: 'Another'),
        weight: 20,
        progress: 10,
      );
      //= assert
      expect(remodified.exercise.name, 'Another');
      expect(remodified.weight, 20);
      expect(remodified.progress, 10);
      expect(remodified.status, PerformingItemStatus.presenting);
    });
    test(
        'should return a copy of itself with the progress value incremented by 1',
        () {
      //= arrange
      PerformingItem performingItem =
          PerformingItem.fromWorkoutItem(item: workoutItems[0]);
      //= act
      expect(performingItem.progress, 0);
      performingItem = performingItem.incrementProgressOneUnit();
      //= assert
      expect(performingItem.progress, 1);
    });
  });
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

    test('should update status of the current performing item', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      //= act
      performStore.setStatus(PerformingItemStatus.presenting);
      //= assert
      expect(performStore.currentItem.status, PerformingItemStatus.presenting);
    });

    test(
        'should speak the welcoming and register a callback to change state to performing when speech finishes',
        () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      when(speechService.speakAndDo(any, any)).thenAnswer((_) {
        performStore.state = PerformState.performing;
        return Future.value();
      });
      //= act
      performStore.welcomeWorkout();
      //= assert
      verify(speechService.speakAndDo(any, any));
      expect(
        performStore.state,
        PerformState.performing,
      );
      expect(
        performStore.items[performStore.itemIndex].status,
        PerformingItemStatus.initial,
      );
    });

    test('should present and countdown current item', () {
      final performStore = PerformStore(
        exerciseService,
        workoutService,
        workoutLogsService,
        userSettings,
        speechService,
      );
      FakeAsync().run((fAsync) {
        //= arrange
        when(workoutService.getWorkout(savedWorkoutKey))
            .thenReturn(savedWorkout);
        performStore.initializePerformanceOf(savedWorkoutKey);
        when(speechService.speakAndDo(
          performStore.buildPerformingItemPresentationSpeech(),
          performStore.countdownCurrentItem,
        )).thenAnswer((_) {
          performStore.countdownCurrentItem();
          return Future.value();
        });
        //= act
        performStore.presentCurrentItem();
        //= assert
        verify(speechService.speakAndDo(
          performStore.buildPerformingItemPresentationSpeech(),
          performStore.countdownCurrentItem,
        ));
        expect(
          performStore.currentItem.status,
          PerformingItemStatus.presenting,
        );
        fAsync.elapse(const Duration(seconds: COUNTDOWN_DEFAULT_SECONDS + 1));
        verify(speechService.speak(any))
            .called(greaterThanOrEqualTo(COUNTDOWN_DEFAULT_SECONDS));
        // the countdown speakAndDo callback function is tested below
        // this test should just countdown only and not change item status
        expect(
          performStore.items[performStore.itemIndex].status,
          PerformingItemStatus.presenting,
        );
      });
    });

    test('should present Rest item and set it ready after presentation',
        () async {
      //= arrange
      savedWorkout.items.insert(
        0,
        WorkoutItem(
          exercise: Exercise(name: 'Rest'),
          duration: 30,
        ),
      );
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      when(
        speechService.speakAndDo(
          performStore.buildPerformingItemPresentationSpeech(),
          performStore.makeCurrentItemReady,
        ),
      ).thenAnswer((_) {
        performStore.makeCurrentItemReady();
        return Future.value();
      });
      final oldState = performStore.state;
      performStore.setState(PerformState.idle);
      //= act
      await performStore.presentCurrentItem();
      //= assert
      verify(
        speechService.speakAndDo(
          performStore.buildPerformingItemPresentationSpeech(),
          performStore.makeCurrentItemReady,
        ),
      );
      expect(performStore.currentItem.status, PerformingItemStatus.ready);
      performStore.setState(oldState);
    });
    test('should countdown item and set it to ready', () {
      FakeAsync().run((fAsync) {
        //= arrange
        final performStore = PerformStore(
          exerciseService,
          workoutService,
          workoutLogsService,
          userSettings,
          speechService,
        );
        fAsync.flushMicrotasks();
        fAsync.flushTimers();
        when(workoutService.getWorkout(savedWorkoutKey))
            .thenReturn(savedWorkout);
        performStore.initializePerformanceOf(savedWorkoutKey);
        when(speechService.speakAndDo(
          PERFORM_VOICE_START_MARK,
          performStore.makeCurrentItemReady,
        )).thenAnswer((_) {
          performStore.makeCurrentItemReady();
          return Future.value();
        });
        //= act
        performStore.countdownCurrentItem();
        fAsync.elapse(const Duration(seconds: COUNTDOWN_DEFAULT_SECONDS + 1));

        //= assert
        verify(speechService.speak(any)).called(COUNTDOWN_DEFAULT_SECONDS);
        verify(speechService.speakAndDo(
          PERFORM_VOICE_START_MARK,
          any,
        ));
        expect(
          performStore.currentItem.status,
          PerformingItemStatus.ready,
        );
      });
    });
    test('should increment current item progress in one unit', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      //= act
      expect(performStore.items[performStore.itemIndex].progress, 0);
      performStore.incrementCurrentItemProgress();
      //= assert
      expect(performStore.items[performStore.itemIndex].progress, 1);
    });

    test('should perform the current item in the store', () {
      FakeAsync().run((fAsync) {
        //= arrange
        final performStore = PerformStore(
          exerciseService,
          workoutService,
          workoutLogsService,
          userSettings,
          speechService,
        );
        when(workoutService.getWorkout(savedWorkoutKey))
            .thenReturn(savedWorkout);
        performStore.initializePerformanceOf(savedWorkoutKey);
        when(speechService.speechState).thenReturn(SpeechState.stopped);
        //= act
        performStore.performCurrentItem();
        fAsync
            .elapse(Duration(seconds: performStore.currentItem.duration + 100));
        //= assert
        verify(speechService.speak(any))
            .called(performStore.currentItem.duration >= 60 ? 2 : 1);
        expect(
          performStore.currentItem.status,
          PerformingItemStatus.performed,
        );
        expect(
          performStore.currentItem.progress,
          performStore.currentItem.duration,
        );
      });
    });
    test(
        'should replace current item exercise and reset its progress and status',
        () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      const String newName = 'Another Exercise';
      //= act
      performStore.setStatus(PerformingItemStatus.performing);
      performStore.replaceAndResetWorkoutItemExercise(Exercise(name: newName));
      //= assert
      expect(performStore.currentItem.status, PerformingItemStatus.initial);
      expect(performStore.currentItem.exercise.name, newName);
      expect(performStore.currentItem.progress, 0);
    });
    test(
        'should replace current item exercise with shuffled exercise from avaiable and reset its progress and status',
        () {
      //= arrange
      const String newName = 'Another Exercise';
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      when(workoutService.getAvailableExercises(any, any)).thenReturn(
        List.generate(5, (index) => Exercise(name: '$newName - $index')),
      );
      //= act
      performStore.setStatus(PerformingItemStatus.performing);
      performStore.shuffleCurrentItemExercise();
      //= assert
      verify(workoutService.getAvailableExercises(any, any));
      expect(performStore.currentItem.status, PerformingItemStatus.initial);
      expect(performStore.currentItem.exercise.name.contains(newName), true);
      expect(performStore.currentItem.progress, 0);
    });

    test(
        'should save a new workout log entry from the store items and reset the store',
        () async {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      when(workoutLogsService.saveNewWorkoutLogEntry(
        items: anyNamed('items'),
        sourceWorkoutKey: savedWorkoutKey,
      )).thenAnswer((_) => Future.value());
      //= act
      await performStore.finishWorkout();
      //= assert
      verify(workoutLogsService.saveNewWorkoutLogEntry(
        items: anyNamed('items'),
        sourceWorkoutKey: savedWorkoutKey,
      ));
      expect(performStore.state, PerformState.idle);
      expect(performStore.sourceWorkoutKey, CURRENT_WORKOUT_KEY);
      expect(performStore.items.isEmpty, true);
      expect(performStore.reactionDisposables.isEmpty, true);
    });
    test('should change current item to the given index', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      //= act
      expect(performStore.currentItem.exercise.name,
          savedWorkoutItems[0].exercise.name);
      performStore.changeCurrentItemIndex(1);
      //= assert
      expect(performStore.currentItem.exercise.name,
          savedWorkoutItems[1].exercise.name);
    });
    test('should change current item to next item', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      const int startIndex = 0;
      //= act
      expect(performStore.currentItem.exercise.name,
          savedWorkoutItems[startIndex].exercise.name);
      performStore.goToNextItem();
      //= assert
      expect(performStore.currentItem.exercise.name,
          savedWorkoutItems[startIndex + 1].exercise.name);
    });
    test(
        'should abandon workout without saving progress to log and reseting store',
        () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      //= act
      expect(performStore.state, PerformState.welcoming);
      expect(performStore.items.isNotEmpty, true);
      performStore.abandonWorkout();
      //= assert
      verifyNever(workoutLogsService.saveNewWorkoutLogEntry(
        items: anyNamed('items'),
        sourceWorkoutKey: anyNamed('sourceWorkoutKey'),
      ));
      expect(performStore.state, PerformState.idle);
      expect(performStore.items.isEmpty, true);
    });
    test(
        'should stop all actions and speak the corresponding phrase upon abandonig workout',
        () async {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      //= completed less than half workout
      //= arrange
      performStore.items.replaceRange(
        0,
        performStore.items.length,
        List.generate(
          performStore.items.length,
          (index) => performStore.items[index]
              .copyWith(progress: savedItemsDuration ~/ 3),
        ),
      );
      performStore.currentTimer = Timer(
        const Duration(seconds: 20),
        () {},
      );
      //= act
      await performStore.prepareToAbandonWorkout();
      //= assert
      expect(performStore.currentTimer, isNull);
      verify(speechService.speak(PERFORM_VOICE_GREETING_HALF_COMPLETED));
      //= completed more than half workout
      //= arrange
      performStore.items.replaceRange(
        0,
        performStore.items.length,
        List.generate(
          performStore.items.length,
          (index) => performStore.items[index]
              .copyWith(progress: savedItemsDuration - 10),
        ),
      );
      performStore.currentTimer = Timer(
        const Duration(seconds: 20),
        () {},
      );
      //= act
      await performStore.prepareToAbandonWorkout();
      //= assert
      expect(performStore.currentTimer, isNull);
      verify(speechService.speak(PERFORM_VOICE_GREETING_ALMOST_COMPLETED));
      //= completed the whole workout
      //= arrange
      performStore.items.replaceRange(
        0,
        performStore.items.length,
        List.generate(
          performStore.items.length,
          (index) =>
              performStore.items[index].copyWith(progress: savedItemsDuration),
        ),
      );
      performStore.currentTimer = Timer(
        const Duration(seconds: 20),
        () {},
      );
      //= act
      await performStore.prepareToAbandonWorkout();
      //= assert
      expect(performStore.currentTimer, isNull);
      verify(speechService.speak(PERFORM_VOICE_GREETING_CONGRATS_COMPLETED));
    });
    test('should pause the store if performing', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      when(speechService.speechState).thenReturn(SpeechState.playing);
      //= act
      expect(performStore.state, PerformState.welcoming);
      performStore.pause();
      expect(performStore.state, PerformState.welcoming);
      performStore.setState(PerformState.performing);
      performStore.pause();
      //= assert
      verify(speechService.speechState);
      verify(speechService.panic());
      expect(performStore.state, PerformState.paused);
      expect(performStore.items[performStore.itemIndex].status,
          PerformingItemStatus.waiting);
    });
    test('should return the time remaining as a string', () {
      //= arrange
      // ignore: avoid_redundant_argument_values
      when(workoutService.getWorkout(CURRENT_WORKOUT_KEY))
          .thenReturn(flashWorkout);
      performStore.initializePerformanceOf();
      final totalMinutesString =
          const Duration(seconds: flashItemsDuration * flashItemsTotal)
              .inMinutes
              .toString();
      //= act
      final remainingString = performStore.timeRemainingString;
      //= assert
      expect(remainingString.contains('$totalMinutesString:'), true);
    });
    test('should detect that the current item is the last one', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      //= act
      int iteration = 0;
      while (!performStore.currentItemIsLast) {
        iteration++;
        performStore.goToNextItem();
        if (iteration > performStore.items.length + 5) break;
      }
      //= assert
      expect(iteration, performStore.items.length - 1);
      expect(performStore.itemIndex, performStore.items.length - 1);
      expect(performStore.currentItemIsLast, true);
    });
    test('should resume performing the workout', () {
      //= arrange
      when(workoutService.getWorkout(savedWorkoutKey)).thenReturn(savedWorkout);
      performStore.initializePerformanceOf(savedWorkoutKey);
      //= act & assert
      expect(performStore.state, PerformState.welcoming);
      performStore.resume();
      expect(performStore.state, PerformState.welcoming);
      //= act & asssert
      performStore.setState(PerformState.paused);
      performStore.resume();
      expect(performStore.state, PerformState.performing);
      //= act & assert
      performStore.setState(PerformState.standby);
      performStore.resume();
      expect(performStore.state, PerformState.performing);
    });
  });
}
