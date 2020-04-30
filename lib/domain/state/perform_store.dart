import 'dart:async';

import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/repositories/i_speech_facade.dart';
import 'package:abs_up/domain/repositories/i_workout_facade.dart';
import 'package:mobx/mobx.dart';

import '../models/workout.dart';
import '../models/workout_item.dart';
import '../repositories/i_hive_facade.dart';

part 'perform_store.g.dart';

enum WorkoutItemStatus {
  initial,
  presenting,
  ready,
  started,
  paused,
  done,
  performed
}
enum PerformState { loading, initial, presenting, started, paused }

class PerformStore extends _PerformStore with _$PerformStore {
  PerformStore(ISpeechFacade speechFacade) : super(speechFacade);
}

abstract class _PerformStore with Store {
  final ISpeechFacade speechFacade;
  _PerformStore(this.speechFacade);

  @observable
  String sourceWorkout;
  @observable
  PerformState state;
  @observable
  List<WorkoutItem> workoutItems;
  @observable
  Duration overallDuration;
  @observable
  Duration timeRemaining;

  @computed
  String get timeRemainingString =>
      RegExp(r'\d{2}\:\d{2}(?=\.)').stringMatch(timeRemaining.toString()) ??
      '00:00';

  /// Current Items State Observables
  @observable
  int currentItemIndex;
  @observable
  WorkoutItem currentItem;
  @observable
  int currentItemProgress;
  @observable
  WorkoutItemStatus currentItemStatus;
  @observable
  bool currentItemIsLast;

  /// Speech observables
  @observable
  ObservableFuture<void> _speechFuture;
  @observable
  SpeechState speechState;

  /// General observables
  @observable
  Timer currentTimer;
  @observable
  bool performing = false;
  @observable
  String errorMessage;
  @computed
  int get workoutProgress {
    int progressCompleted = 0;
    int progressRequired = 0;
    for (final item in workoutItems) {
      progressCompleted += item.progress;
      progressRequired += item.duration;
    }
    return ((progressCompleted / progressRequired) * 100).round();
  }

  /// Actions
  /// Increment progress of current item by one unit (1 second)
  @action
  void _incrementCurrentItemProgressByOneUnit() {
    workoutItems[currentItemIndex].progress += 1;
    timeRemaining -= const Duration(seconds: 1);
    currentItemProgress = workoutItems[currentItemIndex].progress;
  }

  /// Starts the timer for the current item
  @action
  void performCurrentItem() =>
      Timer.periodic(const Duration(seconds: 1), (timer) {
        final int progress = workoutItems[currentItemIndex].progress;
        final int duration = workoutItems[currentItemIndex].duration;

        // = finish timer if reached duration
        if (progress == duration) {
          timer.cancel();
          performing = false;
          currentItemStatus = WorkoutItemStatus.done;
          return;
        }

        // = halfway alert
        if (duration > 30 && progress == (duration / 2).round()) {
          stopSpeech().then((_) =>
              speechFacade.speak('${(duration / 2).round()} seconds left'));
        }

        // = 10 second alert
        if (progress == duration - 10) {
          stopSpeech().then(
              (_) => speechFacade.speak('${duration - progress} seconds left'));
        }

        // = next progress step
        performing = true;
        currentTimer = timer;
        _incrementCurrentItemProgressByOneUnit();
      });

  /// Stop the timer currently running
  @action
  void stopCurrentTimer() {
    currentTimer?.cancel();
    performing = false;
  }

  /// Switch the item at current item
  @action
  void switchCurrentItem(int itemIndex) {
    if (itemIndex > workoutItems.length - 1) return;
    if (performing) stopCurrentTimer();
    if (speechFacade.speechState == SpeechState.playing) stopSpeech();

    currentItemIsLast = itemIndex == workoutItems.length - 1;
    currentItemIndex = itemIndex;
    currentItem = workoutItems[itemIndex];
    currentItemProgress = currentItem.progress;

    // = set status of new active item
    final int check = currentItem.duration - currentItemProgress;
    if (check == currentItem.duration) {
      currentItemStatus = WorkoutItemStatus.initial;
    } else if (check == 0) {
      currentItemStatus = WorkoutItemStatus.performed;
    } else {
      currentItemStatus = WorkoutItemStatus.started;
    }
  }

  /// Speak the presentation of the current item's exercise and follow up to countdown
  @action
  Future presentCurrentItem() async {
    await stopSpeech();
    try {
      errorMessage = null;
      currentItemStatus = WorkoutItemStatus.presenting;

      // = build presentation speech
      final Duration duration = Duration(seconds: currentItem.duration);
      final String minutes = duration.inMinutes > 0
          ? '${duration.inMinutes.toString()} minutes'
          : '';
      final String seconds =
          currentItem.duration - (duration.inMinutes * 60) != 0
              ? '${currentItem.duration - (duration.inMinutes * 60)} seconds'
              : '';
      final String joint =
          minutes.isNotEmpty && seconds.isNotEmpty ? 'and' : '';

      final String finale =
          currentItem.exercise.name != 'Rest' ? 'begin, in' : '';

      // = start presentation speech catching completion to follow with countdown if current item is not rest
      speechFacade.completionHandler = () => currentItem.exercise.name == 'Rest'
          ? currentItemStatus = WorkoutItemStatus.ready
          : countdownCurrentItem(seconds: 3);
      _speechFuture = ObservableFuture(speechFacade.speak(
          '${currentItem.exercise.name} for $minutes $joint $seconds, $finale'));
      await _speechFuture;
    } catch (e) {
      errorMessage = "Couldn't play audio...";
    }
  }

  /// Speak a countdown for x seconds and set workout item status to ready
  @action
  void countdownCurrentItem({int seconds = 3}) {
    if (seconds <= 0) return;
    speechFacade.completionHandler = null;
    int countdown = seconds;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countdown > 0) {
        speechFacade.speak(countdown.toString());
        countdown -= 1;
      } else if (countdown == 0) {
        speechFacade.completionHandler = () {
          currentItemStatus = WorkoutItemStatus.ready;
          speechFacade.completionHandler = null;
        };
        speechFacade.speak('go!');
        timer.cancel();
      }
    });
  }

  /// Stop timers and speaking before abandoning or completing the workout
  @action
  Future<void> prepareToAbandonWorkout({bool silently = false}) async {
    await stopSpeech();
    stopCurrentTimer();
    if (silently) return;
    String greeting = 'Congratulations! You have completed this workout';
    if (workoutProgress < 50) {
      greeting =
          'Your workout has ended, but you completed less than its half...';
    } else if (workoutProgress >= 50 && workoutProgress < 95) {
      greeting =
          'Great! You completed the workout... but I know you cand do better';
    }
    speechFacade.speak(greeting);
  }

  /// Abandon and reset the store (it might not be needed)
  void abandonWorkout() {
    // TODO implement abandon workout
  }

  /// Stop any running speaking action
  @action
  Future<void> stopSpeech() async {
    if (speechFacade.speechState != SpeechState.playing) return;
    speechFacade.completionHandler = null;
    await speechFacade.stop();
  }

  /// Initialize state for new workout to perform
  @action
  Future<void> initNew(String sourceWorkoutKey) async {
    // if (workoutLogKey == sourceWorkoutKey) return;
    state = PerformState.loading;
    final Workout workoutBlueprint =
        IHiveFacade.workoutsBox.get(sourceWorkoutKey);

    overallDuration = const Duration(seconds: 0);
    for (final item in workoutBlueprint.items) {
      overallDuration += Duration(seconds: item.duration);
    }
    timeRemaining = overallDuration;

    workoutItems = workoutBlueprint.items;
    currentItem = workoutItems[0];
    currentItemIndex = 0;
    currentItemProgress = currentItem.progress;
    currentItemStatus = WorkoutItemStatus.initial;
    currentItemIsLast = false;
    sourceWorkout = sourceWorkoutKey;
    state = PerformState.initial;
  }

  /// Change current item's exercise for a random one
  @action
  void shuffleCurrentItemsExercise() {
    stopSpeech();
    stopCurrentTimer();
    currentItemStatus = WorkoutItemStatus.paused;
    final List<Exercise> availableExercises =
        IWorkoutFacade.getAvailableExercises()..shuffle();
    updateCurrentItemsExercise(availableExercises.last);
  }

  /// Update the current item's exercises and switches back to it
  @action
  void updateCurrentItemsExercise(Exercise exercise) {
    workoutItems.replaceRange(currentItemIndex, currentItemIndex + 1,
        [currentItem.copyWith(exercise: exercise, progress: 0)]);
    switchCurrentItem(currentItemIndex);
  }

  /// Saves the entire state as a new workout log entry and resets the store
  Future<void> saveWorkoutLogEntry() async =>
      IWorkoutFacade.saveNewWorkoutLogEntry(
          items: workoutItems, sourceWorkout: sourceWorkout);
}
