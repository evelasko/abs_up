// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perform_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerformStore on _PerformStore, Store {
  Computed<String> _$timeRemainingStringComputed;

  @override
  String get timeRemainingString => (_$timeRemainingStringComputed ??=
          Computed<String>(() => super.timeRemainingString,
              name: '_PerformStore.timeRemainingString'))
      .value;
  Computed<int> _$workoutProgressComputed;

  @override
  int get workoutProgress =>
      (_$workoutProgressComputed ??= Computed<int>(() => super.workoutProgress,
              name: '_PerformStore.workoutProgress'))
          .value;
  Computed<Workout> _$workoutComputed;

  @override
  Workout get workout => (_$workoutComputed ??=
          Computed<Workout>(() => super.workout, name: '_PerformStore.workout'))
      .value;
  Computed<Duration> _$durationComputed;

  @override
  Duration get duration =>
      (_$durationComputed ??= Computed<Duration>(() => super.duration,
              name: '_PerformStore.duration'))
          .value;
  Computed<Duration> _$remainingComputed;

  @override
  Duration get remaining =>
      (_$remainingComputed ??= Computed<Duration>(() => super.remaining,
              name: '_PerformStore.remaining'))
          .value;

  final _$sourceWorkoutAtom = Atom(name: '_PerformStore.sourceWorkout');

  @override
  String get sourceWorkout {
    _$sourceWorkoutAtom.reportRead();
    return super.sourceWorkout;
  }

  @override
  set sourceWorkout(String value) {
    _$sourceWorkoutAtom.reportWrite(value, super.sourceWorkout, () {
      super.sourceWorkout = value;
    });
  }

  final _$stateAtom = Atom(name: '_PerformStore.state');

  @override
  PerformState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(PerformState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$workoutItemsAtom = Atom(name: '_PerformStore.workoutItems');

  @override
  List<WorkoutItem> get workoutItems {
    _$workoutItemsAtom.reportRead();
    return super.workoutItems;
  }

  @override
  set workoutItems(List<WorkoutItem> value) {
    _$workoutItemsAtom.reportWrite(value, super.workoutItems, () {
      super.workoutItems = value;
    });
  }

  final _$overallDurationAtom = Atom(name: '_PerformStore.overallDuration');

  @override
  Duration get overallDuration {
    _$overallDurationAtom.reportRead();
    return super.overallDuration;
  }

  @override
  set overallDuration(Duration value) {
    _$overallDurationAtom.reportWrite(value, super.overallDuration, () {
      super.overallDuration = value;
    });
  }

  final _$timeRemainingAtom = Atom(name: '_PerformStore.timeRemaining');

  @override
  Duration get timeRemaining {
    _$timeRemainingAtom.reportRead();
    return super.timeRemaining;
  }

  @override
  set timeRemaining(Duration value) {
    _$timeRemainingAtom.reportWrite(value, super.timeRemaining, () {
      super.timeRemaining = value;
    });
  }

  final _$currentItemIndexAtom = Atom(name: '_PerformStore.currentItemIndex');

  @override
  int get currentItemIndex {
    _$currentItemIndexAtom.reportRead();
    return super.currentItemIndex;
  }

  @override
  set currentItemIndex(int value) {
    _$currentItemIndexAtom.reportWrite(value, super.currentItemIndex, () {
      super.currentItemIndex = value;
    });
  }

  final _$currentItemAtom = Atom(name: '_PerformStore.currentItem');

  @override
  WorkoutItem get currentItem {
    _$currentItemAtom.reportRead();
    return super.currentItem;
  }

  @override
  set currentItem(WorkoutItem value) {
    _$currentItemAtom.reportWrite(value, super.currentItem, () {
      super.currentItem = value;
    });
  }

  final _$currentItemProgressAtom =
      Atom(name: '_PerformStore.currentItemProgress');

  @override
  int get currentItemProgress {
    _$currentItemProgressAtom.reportRead();
    return super.currentItemProgress;
  }

  @override
  set currentItemProgress(int value) {
    _$currentItemProgressAtom.reportWrite(value, super.currentItemProgress, () {
      super.currentItemProgress = value;
    });
  }

  final _$currentItemStatusAtom = Atom(name: '_PerformStore.currentItemStatus');

  @override
  WorkoutItemStatus get currentItemStatus {
    _$currentItemStatusAtom.reportRead();
    return super.currentItemStatus;
  }

  @override
  set currentItemStatus(WorkoutItemStatus value) {
    _$currentItemStatusAtom.reportWrite(value, super.currentItemStatus, () {
      super.currentItemStatus = value;
    });
  }

  final _$currentItemIsLastAtom = Atom(name: '_PerformStore.currentItemIsLast');

  @override
  bool get currentItemIsLast {
    _$currentItemIsLastAtom.reportRead();
    return super.currentItemIsLast;
  }

  @override
  set currentItemIsLast(bool value) {
    _$currentItemIsLastAtom.reportWrite(value, super.currentItemIsLast, () {
      super.currentItemIsLast = value;
    });
  }

  final _$_speechFutureAtom = Atom(name: '_PerformStore._speechFuture');

  @override
  ObservableFuture<void> get _speechFuture {
    _$_speechFutureAtom.reportRead();
    return super._speechFuture;
  }

  @override
  set _speechFuture(ObservableFuture<void> value) {
    _$_speechFutureAtom.reportWrite(value, super._speechFuture, () {
      super._speechFuture = value;
    });
  }

  final _$speechStateAtom = Atom(name: '_PerformStore.speechState');

  @override
  SpeechState get speechState {
    _$speechStateAtom.reportRead();
    return super.speechState;
  }

  @override
  set speechState(SpeechState value) {
    _$speechStateAtom.reportWrite(value, super.speechState, () {
      super.speechState = value;
    });
  }

  final _$currentTimerAtom = Atom(name: '_PerformStore.currentTimer');

  @override
  Timer get currentTimer {
    _$currentTimerAtom.reportRead();
    return super.currentTimer;
  }

  @override
  set currentTimer(Timer value) {
    _$currentTimerAtom.reportWrite(value, super.currentTimer, () {
      super.currentTimer = value;
    });
  }

  final _$performingAtom = Atom(name: '_PerformStore.performing');

  @override
  bool get performing {
    _$performingAtom.reportRead();
    return super.performing;
  }

  @override
  set performing(bool value) {
    _$performingAtom.reportWrite(value, super.performing, () {
      super.performing = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_PerformStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$sourceWorkoutKeyAtom = Atom(name: '_PerformStore.sourceWorkoutKey');

  @override
  String get sourceWorkoutKey {
    _$sourceWorkoutKeyAtom.reportRead();
    return super.sourceWorkoutKey;
  }

  @override
  set sourceWorkoutKey(String value) {
    _$sourceWorkoutKeyAtom.reportWrite(value, super.sourceWorkoutKey, () {
      super.sourceWorkoutKey = value;
    });
  }

  final _$itemIndexAtom = Atom(name: '_PerformStore.itemIndex');

  @override
  int get itemIndex {
    _$itemIndexAtom.reportRead();
    return super.itemIndex;
  }

  @override
  set itemIndex(int value) {
    _$itemIndexAtom.reportWrite(value, super.itemIndex, () {
      super.itemIndex = value;
    });
  }

  final _$presentCurrentItemAsyncAction =
      AsyncAction('_PerformStore.presentCurrentItem');

  @override
  Future<dynamic> presentCurrentItem() {
    return _$presentCurrentItemAsyncAction
        .run(() => super.presentCurrentItem());
  }

  final _$prepareToAbandonWorkoutAsyncAction =
      AsyncAction('_PerformStore.prepareToAbandonWorkout');

  @override
  Future<void> prepareToAbandonWorkout({bool silently = false}) {
    return _$prepareToAbandonWorkoutAsyncAction
        .run(() => super.prepareToAbandonWorkout(silently: silently));
  }

  final _$_stopSpeechAsyncAction = AsyncAction('_PerformStore._stopSpeech');

  @override
  Future<void> _stopSpeech() {
    return _$_stopSpeechAsyncAction.run(() => super._stopSpeech());
  }

  final _$_PerformStoreActionController =
      ActionController(name: '_PerformStore');

  @override
  void initializeFor(String sourceWorkoutKey) {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.initializeFor');
    try {
      return super.initializeFor(sourceWorkoutKey);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void welcomeWorkout() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.welcomeWorkout');
    try {
      return super.welcomeWorkout();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _incrementCurrentItemProgressByOneUnit() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore._incrementCurrentItemProgressByOneUnit');
    try {
      return super._incrementCurrentItemProgressByOneUnit();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void performCurrentItem() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.performCurrentItem');
    try {
      return super.performCurrentItem();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopCurrentTimer() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.stopCurrentTimer');
    try {
      return super.stopCurrentTimer();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchCurrentItem(int itemIndex) {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.switchCurrentItem');
    try {
      return super.switchCurrentItem(itemIndex);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void countdownCurrentItem({int seconds = 3}) {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.countdownCurrentItem');
    try {
      return super.countdownCurrentItem(seconds: seconds);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void shuffleCurrentItemsExercise() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.shuffleCurrentItemsExercise');
    try {
      return super.shuffleCurrentItemsExercise();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCurrentItemsExercise(Exercise exercise) {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.updateCurrentItemsExercise');
    try {
      return super.updateCurrentItemsExercise(exercise);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void replaceAndResetWorkoutItemExercise(Exercise exercise) {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.replaceAndResetWorkoutItemExercise');
    try {
      return super.replaceAndResetWorkoutItemExercise(exercise);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void abandonWorkout() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.abandonWorkout');
    try {
      return super.abandonWorkout();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initializePerformanceOf([String key = CURRENT_WORKOUT_KEY]) {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.initializePerformanceOf');
    try {
      return super.initializePerformanceOf(key);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentItemIndex(int index) {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.changeCurrentItemIndex');
    try {
      return super.changeCurrentItemIndex(index);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToNextItem() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.goToNextItem');
    try {
      return super.goToNextItem();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sourceWorkout: ${sourceWorkout},
state: ${state},
workoutItems: ${workoutItems},
overallDuration: ${overallDuration},
timeRemaining: ${timeRemaining},
currentItemIndex: ${currentItemIndex},
currentItem: ${currentItem},
currentItemProgress: ${currentItemProgress},
currentItemStatus: ${currentItemStatus},
currentItemIsLast: ${currentItemIsLast},
speechState: ${speechState},
currentTimer: ${currentTimer},
performing: ${performing},
errorMessage: ${errorMessage},
sourceWorkoutKey: ${sourceWorkoutKey},
itemIndex: ${itemIndex},
timeRemainingString: ${timeRemainingString},
workoutProgress: ${workoutProgress},
workout: ${workout},
duration: ${duration},
remaining: ${remaining}
    ''';
  }
}
