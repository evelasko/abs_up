import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../constants.dart';
import '../interfaces/exercise.i.dart';
import '../interfaces/speech.i.dart';
import '../interfaces/user_settings.i.dart';
import '../interfaces/workout.i.dart';
import '../interfaces/workout_logs.i.dart';
import '../models/exercise.dart';
import '../models/workout.dart';
import 'perform_states.dart';

part 'perform_store.g.dart';

@lazySingleton
class PerformStore extends _PerformStore with _$PerformStore {
  PerformStore(
    ExerciseInterface exerciseService,
    WorkoutInterface workoutService,
    WorkoutLogsInterface workoutLogsService,
    UserSettingsInterface userSettings,
    SpeechInterface speechService,
  ) : super(
          exerciseService,
          workoutService,
          workoutLogsService,
          userSettings,
          speechService,
        );
}

abstract class _PerformStore with Store {
  _PerformStore(
    this.exerciseService,
    this.workoutService,
    this.workoutLogsService,
    this.userSettings,
    this.speechService,
  );

  final ExerciseInterface exerciseService;
  final WorkoutInterface workoutService;
  final WorkoutLogsInterface workoutLogsService;
  final UserSettingsInterface userSettings;
  final SpeechInterface speechService;
  final List<ReactionDisposer> reactionDisposables = [];

  /// Observable fields
  @observable
  String sourceWorkout;
  @observable
  PerformState state;
  @observable
  ObservableFuture<void> _speechFuture;
  @observable
  SpeechState speechState;
  @observable
  Timer currentTimer;
  @observable
  String errorMessage;
  @observable
  String sourceWorkoutKey = CURRENT_WORKOUT_KEY;
  @observable
  int itemIndex = 0;
  final items = ObservableList<PerformingItem>.of([]);

  /// Computed fields
  @computed
  Workout get workout => workoutService.getWorkout(sourceWorkoutKey);

  PerformingItem get currentItem => items.elementAt(itemIndex);

  @computed
  Duration get duration =>
      Duration(seconds: items.fold(0, (prev, item) => prev + item.duration));
  @computed
  Duration get remaining =>
      Duration(seconds: duration.inSeconds) -
      Duration(seconds: items.fold(0, (prev, item) => prev + item.progress));
  @computed
  String get timeRemainingString =>
      RegExp(r'\d{2}\:\d{2}(?=\.)').stringMatch(remaining.toString()) ??
      '00:00';
  @computed
  bool get currentItemIsLast => itemIndex + 1 == items.length;
  @computed
  int get workoutProgress {
    final int progressCompleted =
        items.fold(0, (prev, item) => prev + item.progress);
    final int progressRequired =
        items.fold(0, (prev, item) => prev + item.duration);
    return ((progressCompleted / progressRequired) * 100).round();
  }

  /// Actions

  /// Initialize the store to perform a workout
  /// sets the state to welcoming, fill the items with status initial
  /// and if not present, registers the stateManager autorun reaction
  @action
  void initializePerformanceOf([String key = CURRENT_WORKOUT_KEY]) {
    //= clear or reset main properties
    sourceWorkoutKey = key ?? CURRENT_WORKOUT_KEY;
    items.clear();
    items.insertAll(
      0,
      workout.items.map((item) => PerformingItem.fromWorkoutItem(item: item)),
    );
    itemIndex = 0;

    //= set state to welcome
    setState(PerformState.welcoming);
  }

  /// Starts presenting the workout to be performed and when done
  /// sets the state to performing via speechService callback
  @action
  void welcomeWorkout() {
    final minutes = remaining.inMinutes;
    final seconds = (Duration(seconds: remaining.inSeconds) -
            Duration(minutes: remaining.inMinutes))
        .inSeconds;
    speechService.speakAndDo(
        'You are about to start an abs training session of $minutes minutes and $seconds seconds... make sure to have your equipment ready',
        () => setState(PerformState.performing));
  }

  /// Speak the presentation of the current item's exercise and follow up to countdown
  /// if current item is not Rest
  @action
  Future<void> presentCurrentItem() async {
    setStatus(PerformingItemStatus.presenting);
    try {
      await speechService.speakAndDo(
        buildPerformingItemPresentationSpeech(),
        // = the function that runs after presentation finishes
        items[itemIndex].exercise.name == 'Rest'
            //= if current item is Rest: just set the item to ready
            ? makeCurrentItemReady
            //= if current item is not Rest, run countDown
            : countdownCurrentItem,
      );
    } catch (e) {
      errorMessage = "Couldn't play audio...";
    }
  }

  /// Speak a countdown for x seconds and set workout item status to ready
  @action
  Future<void> countdownCurrentItem(
      {int seconds = COUNTDOWN_DEFAULT_SECONDS}) async {
    if (seconds <= 0) return;
    int countdown = seconds;
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) async {
        if (countdown > 0) {
          await speechService.speak(countdown.toString());
          countdown -= 1;
        } else {
          await speechService.speakAndDo(
            PERFORM_VOICE_START_MARK,
            makeCurrentItemReady,
          );
          timer.cancel();
        }
      },
    );
  }

  /// Starts the timer for the current item
  @action
  void performCurrentItem() =>
      Timer.periodic(const Duration(seconds: 1), (timer) {
        final int progress = currentItem.progress;
        final int duration = currentItem.duration;
        // = finish timer if reached duration
        if (progress == duration) {
          timer.cancel();
          currentTimer = null;
          setStatus(PerformingItemStatus.performed);
          return;
        } else if (currentItem.status != PerformingItemStatus.performing) {
          setStatus(PerformingItemStatus.performing);
        }

        // = halfway alert only if duration is one minute or more
        if (duration >= 60 &&
            progress == duration ~/ 2 &&
            speechService.speechState != SpeechState.playing) {
          speechService.speak('${(duration / 2).round()} seconds left');
        }

        // = 10 second alert
        if (progress == duration - 10 &&
            speechService.speechState != SpeechState.playing) {
          speechService.speak('${duration - progress} seconds left');
        }

        //= set currentTimer to this timer so it can be cancelled when pause
        currentTimer = timer;
        // = advance progress by one step
        incrementCurrentItemProgress();
      });

  /// Stop timers and speaking before abandoning or completing the workout
  @action
  Future<void> prepareToAbandonWorkout({bool silently = false}) async {
    _panic();
    if (silently) return;
    String greeting = PERFORM_VOICE_GREETING_CONGRATS_COMPLETED;
    if (workoutProgress < 50) {
      greeting = PERFORM_VOICE_GREETING_HALF_COMPLETED;
    } else if (workoutProgress >= 50 && workoutProgress < 95) {
      greeting = PERFORM_VOICE_GREETING_ALMOST_COMPLETED;
    }
    speechService.speak(greeting);
  }

  /// Change current item's exercise for a random one
  @action
  void shuffleCurrentItemExercise() {
    _panic();
    _updateCurrentItem(status: PerformingItemStatus.waiting);
    final List<Exercise> availableExercises =
        workoutService.getAvailableExercises(
      exerciseService.allExercises,
      userSettings.workoutSettings,
    )..shuffle();
    replaceAndResetWorkoutItemExercise(availableExercises.last);
  }

  /// Replace the currently performing workout item's exercise
  /// and reset its progress to 0
  @action
  void replaceAndResetWorkoutItemExercise(Exercise exercise) =>
      _updateCurrentItem(
        exercise: exercise,
        progress: 0,
        status: PerformingItemStatus.initial,
      );

  /// Saves the entire state as a new workout log entry and resets the store
  @action
  Future<void> _saveWorkoutLogEntry() async =>
      workoutLogsService.saveNewWorkoutLogEntry(
        items: items.map((item) => item.fold()).toList(),
        sourceWorkoutKey: sourceWorkoutKey,
      );

  /// Abandon and reset the store (it might not be needed)
  @action
  void abandonWorkout() => _reset();

  /// Saves the entire state as new workout lo entry and resets the store
  @action
  Future<void> finishWorkout() async {
    _saveWorkoutLogEntry();
    _reset();
  }

  @action
  void changeCurrentItemIndex(int index) {
    if (index == items.length) return;
    itemIndex = index;
  }

  @action
  void goToNextItem() => changeCurrentItemIndex(itemIndex + 1);

  @action
  void pause() {
    if (state != PerformState.performing) return;
    setState(PerformState.paused);
    setStatus(PerformingItemStatus.waiting);
    _panic();
  }

  @action
  void resume() {
    if (state == PerformState.paused || state == PerformState.standby) {
      setState(PerformState.performing);
    }
  }

  // ignore: use_setters_to_change_properties
  @action
  void setState(PerformState newState) {
    state = newState;
    print(
        '@state = state: ${state.toString()}, status: ${currentItem.status.toString()}');
  }

  @action
  void setStatus(PerformingItemStatus newStatus) {
    _updateCurrentItem(status: newStatus);
    print(
        '@status = requested: ${newStatus.toString()} state: ${state.toString()}, status: ${currentItem.status.toString()}');
  }

  void incrementCurrentItemProgress() =>
      _updateCurrentItem(progress: currentItem.progress + 1
          // item: currentItem.incrementProgressOneUnit()
          );

  /// Inmediately sets the status of current item to ready
  void makeCurrentItemReady() => setStatus(PerformingItemStatus.ready);

  /// Internal methods _____________________________________

  /// Update current item with new values
  void _updateCurrentItem({
    // PerformingItem item,
    PerformingItemStatus status,
    Exercise exercise,
    int order,
    int duration,
    int side,
    double weight,
    int progress,
  }) =>
      items.replaceRange(itemIndex, itemIndex + 1, [
        // item ??
        currentItem.copyWith(
          status: status,
          exercise: exercise,
          order: order,
          duration: duration,
          side: side,
          weight: weight,
          progress: progress,
        )
      ]);

  /// Stop any running speaking action
  Future<void> _stopSpeech() async {
    if (speechService.speechState != SpeechState.playing) return;
    await speechService.panic();
  }

  /// Stop the timer currently running
  void _stopCurrentTimer() {
    currentTimer?.cancel();
    currentTimer = null;
  }

  /// Panic method
  void _panic() {
    _stopSpeech();
    _stopCurrentTimer();
  }

  /// Clear the store to idle
  void _reset() {
    sourceWorkoutKey = CURRENT_WORKOUT_KEY;
    state = PerformState.idle;
    items.clear();
    _disposeAllReactionsAndClearDisposer();
  }

  void _disposeAllReactionsAndClearDisposer() {
    if (reactionDisposables.isEmpty) return;
    reactionDisposables.forEach((dispose) => dispose());
    reactionDisposables.clear();
  }

  /// Returns the string to speech for presenting a performing item
  String buildPerformingItemPresentationSpeech() {
    final Duration duration = Duration(seconds: items[itemIndex].duration);
    final String minutes = duration.inMinutes > 0
        ? '${duration.inMinutes.toString()} minutes'
        : '';
    final String seconds =
        items[itemIndex].duration - (duration.inMinutes * 60) != 0
            ? '${items[itemIndex].duration - (duration.inMinutes * 60)} seconds'
            : '';
    final String joint = minutes.isNotEmpty && seconds.isNotEmpty ? 'and' : '';

    final String finale =
        items[itemIndex].exercise.name != 'Rest' ? 'begin, in' : '';
    return '${items[itemIndex].exercise.name} for $minutes $joint $seconds, $finale';
  }
}

//! deprecated: use items
// @observable
// List<WorkoutItem> workoutItems;
//! deprecated: use duration
// @observable
// Duration overallDuration;
//! deprecated: use remaining
// @observable
// Duration timeRemaining;
//! deprecated: use itemIndex
// @observable
// int currentItemIndex;
//! deprecated: use items[itemIndex]
// @observable
// WorkoutItem currentItem;
//! deprecated: use items[x]
// @observable
// int currentItemProgress;
// @observable
// WorkoutItemStatus currentItemStatus;

//! deprecated: use initializePerformanceOf(...)
/*
  @action
  void initializeFor(String sourceWorkoutKey) {
    state = PerformState.loading;
    final Workout workoutBlueprint =
        workoutService.getWorkout(sourceWorkoutKey);
    overallDuration = const Duration();
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
    state = PerformState.welcoming;
  }
  */

/// Switch the item at current item
//! deprecated: use changeCurrentItemIndex(int itemIndex)
/*
  @action
  void switchCurrentItem(int itemIndex) {
    if (itemIndex > workoutItems.length - 1 || currentItemIndex == itemIndex) {
      return;
    }
    if (performing) stopCurrentTimer();
    if (speechService.speechState == SpeechState.playing) _stopSpeech();

    //currentItemIsLast = itemIndex == workoutItems.length - 1;
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
  */

/// Update the current item's exercises and switches back to it
//! deprecated -> use replaceAndResetWorkoutItemExercise
// @action
// void updateCurrentItemsExercise(Exercise exercise) {
//   workoutItems.replaceRange(currentItemIndex, currentItemIndex + 1,
//       [currentItem.copyWith(exercise: exercise, progress: 0)]);
//   switchCurrentItem(currentItemIndex);
// }

//= Reaction: When performStore state is initial and itemIndex is 0 and its status is also initial
//= Effect:   Set performStore state to performing (so that AutoPerform reaction can get triggered)
//! to be deprecated by stateManage autorun
// void rrAutoStartPerforming() => when(
//       (_) =>
//           state == PerformState.initial &&
//           itemIndex == 0 &&
//           items[itemIndex].status == PerformingItemStatus.initial,
//       () => state = PerformState.performing,
//     );

//= Reaction: When the current workout item is the same as the one of the page and is in initial state
//= Effect:   Present workout item
//! to be deprecated by stateManage autorun
// void rrAutoPerform() => reactionDisposables.add(
//       autorun((_) => state == PerformState.performing &&
//               items[itemIndex].status == PerformingItemStatus.initial
//           ? presentCurrentItem() : null),
//     );
