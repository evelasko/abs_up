// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perform_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerformStore on _PerformStore, Store {
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
  Computed<String> _$timeRemainingStringComputed;

  @override
  String get timeRemainingString => (_$timeRemainingStringComputed ??=
          Computed<String>(() => super.timeRemainingString,
              name: '_PerformStore.timeRemainingString'))
      .value;
  Computed<bool> _$currentItemIsLastComputed;

  @override
  bool get currentItemIsLast => (_$currentItemIsLastComputed ??= Computed<bool>(
          () => super.currentItemIsLast,
          name: '_PerformStore.currentItemIsLast'))
      .value;
  Computed<int> _$workoutProgressComputed;

  @override
  int get workoutProgress =>
      (_$workoutProgressComputed ??= Computed<int>(() => super.workoutProgress,
              name: '_PerformStore.workoutProgress'))
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
  Future<void> presentCurrentItem() {
    return _$presentCurrentItemAsyncAction
        .run(() => super.presentCurrentItem());
  }

  final _$countdownCurrentItemAsyncAction =
      AsyncAction('_PerformStore.countdownCurrentItem');

  @override
  Future<void> countdownCurrentItem({int seconds = COUNTDOWN_DEFAULT_SECONDS}) {
    return _$countdownCurrentItemAsyncAction
        .run(() => super.countdownCurrentItem(seconds: seconds));
  }

  final _$prepareToAbandonWorkoutAsyncAction =
      AsyncAction('_PerformStore.prepareToAbandonWorkout');

  @override
  Future<void> prepareToAbandonWorkout({bool silently = false}) {
    return _$prepareToAbandonWorkoutAsyncAction
        .run(() => super.prepareToAbandonWorkout(silently: silently));
  }

  final _$_saveWorkoutLogEntryAsyncAction =
      AsyncAction('_PerformStore._saveWorkoutLogEntry');

  @override
  Future<void> _saveWorkoutLogEntry() {
    return _$_saveWorkoutLogEntryAsyncAction
        .run(() => super._saveWorkoutLogEntry());
  }

  final _$finishWorkoutAsyncAction = AsyncAction('_PerformStore.finishWorkout');

  @override
  Future<void> finishWorkout() {
    return _$finishWorkoutAsyncAction.run(() => super.finishWorkout());
  }

  final _$_PerformStoreActionController =
      ActionController(name: '_PerformStore');

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
  void shuffleCurrentItemExercise() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.shuffleCurrentItemExercise');
    try {
      return super.shuffleCurrentItemExercise();
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
  void pause() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.pause');
    try {
      return super.pause();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resume() {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.resume');
    try {
      return super.resume();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(PerformState newState) {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.setState');
    try {
      return super.setState(newState);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(PerformingItemStatus newStatus) {
    final _$actionInfo = _$_PerformStoreActionController.startAction(
        name: '_PerformStore.setStatus');
    try {
      return super.setStatus(newStatus);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sourceWorkout: ${sourceWorkout},
state: ${state},
speechState: ${speechState},
currentTimer: ${currentTimer},
errorMessage: ${errorMessage},
sourceWorkoutKey: ${sourceWorkoutKey},
itemIndex: ${itemIndex},
workout: ${workout},
duration: ${duration},
remaining: ${remaining},
timeRemainingString: ${timeRemainingString},
currentItemIsLast: ${currentItemIsLast},
workoutProgress: ${workoutProgress}
    ''';
  }
}
