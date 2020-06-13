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
          Computed<String>(() => super.timeRemainingString))
      .value;
  Computed<int> _$workoutProgressComputed;

  @override
  int get workoutProgress =>
      (_$workoutProgressComputed ??= Computed<int>(() => super.workoutProgress))
          .value;

  final _$sourceWorkoutAtom = Atom(name: '_PerformStore.sourceWorkout');

  @override
  String get sourceWorkout {
    _$sourceWorkoutAtom.context.enforceReadPolicy(_$sourceWorkoutAtom);
    _$sourceWorkoutAtom.reportObserved();
    return super.sourceWorkout;
  }

  @override
  set sourceWorkout(String value) {
    _$sourceWorkoutAtom.context.conditionallyRunInAction(() {
      super.sourceWorkout = value;
      _$sourceWorkoutAtom.reportChanged();
    }, _$sourceWorkoutAtom, name: '${_$sourceWorkoutAtom.name}_set');
  }

  final _$stateAtom = Atom(name: '_PerformStore.state');

  @override
  PerformState get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(PerformState value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$workoutItemsAtom = Atom(name: '_PerformStore.workoutItems');

  @override
  List<WorkoutItem> get workoutItems {
    _$workoutItemsAtom.context.enforceReadPolicy(_$workoutItemsAtom);
    _$workoutItemsAtom.reportObserved();
    return super.workoutItems;
  }

  @override
  set workoutItems(List<WorkoutItem> value) {
    _$workoutItemsAtom.context.conditionallyRunInAction(() {
      super.workoutItems = value;
      _$workoutItemsAtom.reportChanged();
    }, _$workoutItemsAtom, name: '${_$workoutItemsAtom.name}_set');
  }

  final _$overallDurationAtom = Atom(name: '_PerformStore.overallDuration');

  @override
  Duration get overallDuration {
    _$overallDurationAtom.context.enforceReadPolicy(_$overallDurationAtom);
    _$overallDurationAtom.reportObserved();
    return super.overallDuration;
  }

  @override
  set overallDuration(Duration value) {
    _$overallDurationAtom.context.conditionallyRunInAction(() {
      super.overallDuration = value;
      _$overallDurationAtom.reportChanged();
    }, _$overallDurationAtom, name: '${_$overallDurationAtom.name}_set');
  }

  final _$timeRemainingAtom = Atom(name: '_PerformStore.timeRemaining');

  @override
  Duration get timeRemaining {
    _$timeRemainingAtom.context.enforceReadPolicy(_$timeRemainingAtom);
    _$timeRemainingAtom.reportObserved();
    return super.timeRemaining;
  }

  @override
  set timeRemaining(Duration value) {
    _$timeRemainingAtom.context.conditionallyRunInAction(() {
      super.timeRemaining = value;
      _$timeRemainingAtom.reportChanged();
    }, _$timeRemainingAtom, name: '${_$timeRemainingAtom.name}_set');
  }

  final _$currentItemIndexAtom = Atom(name: '_PerformStore.currentItemIndex');

  @override
  int get currentItemIndex {
    _$currentItemIndexAtom.context.enforceReadPolicy(_$currentItemIndexAtom);
    _$currentItemIndexAtom.reportObserved();
    return super.currentItemIndex;
  }

  @override
  set currentItemIndex(int value) {
    _$currentItemIndexAtom.context.conditionallyRunInAction(() {
      super.currentItemIndex = value;
      _$currentItemIndexAtom.reportChanged();
    }, _$currentItemIndexAtom, name: '${_$currentItemIndexAtom.name}_set');
  }

  final _$currentItemAtom = Atom(name: '_PerformStore.currentItem');

  @override
  WorkoutItem get currentItem {
    _$currentItemAtom.context.enforceReadPolicy(_$currentItemAtom);
    _$currentItemAtom.reportObserved();
    return super.currentItem;
  }

  @override
  set currentItem(WorkoutItem value) {
    _$currentItemAtom.context.conditionallyRunInAction(() {
      super.currentItem = value;
      _$currentItemAtom.reportChanged();
    }, _$currentItemAtom, name: '${_$currentItemAtom.name}_set');
  }

  final _$currentItemProgressAtom =
      Atom(name: '_PerformStore.currentItemProgress');

  @override
  int get currentItemProgress {
    _$currentItemProgressAtom.context
        .enforceReadPolicy(_$currentItemProgressAtom);
    _$currentItemProgressAtom.reportObserved();
    return super.currentItemProgress;
  }

  @override
  set currentItemProgress(int value) {
    _$currentItemProgressAtom.context.conditionallyRunInAction(() {
      super.currentItemProgress = value;
      _$currentItemProgressAtom.reportChanged();
    }, _$currentItemProgressAtom,
        name: '${_$currentItemProgressAtom.name}_set');
  }

  final _$currentItemStatusAtom = Atom(name: '_PerformStore.currentItemStatus');

  @override
  WorkoutItemStatus get currentItemStatus {
    _$currentItemStatusAtom.context.enforceReadPolicy(_$currentItemStatusAtom);
    _$currentItemStatusAtom.reportObserved();
    return super.currentItemStatus;
  }

  @override
  set currentItemStatus(WorkoutItemStatus value) {
    _$currentItemStatusAtom.context.conditionallyRunInAction(() {
      super.currentItemStatus = value;
      _$currentItemStatusAtom.reportChanged();
    }, _$currentItemStatusAtom, name: '${_$currentItemStatusAtom.name}_set');
  }

  final _$currentItemIsLastAtom = Atom(name: '_PerformStore.currentItemIsLast');

  @override
  bool get currentItemIsLast {
    _$currentItemIsLastAtom.context.enforceReadPolicy(_$currentItemIsLastAtom);
    _$currentItemIsLastAtom.reportObserved();
    return super.currentItemIsLast;
  }

  @override
  set currentItemIsLast(bool value) {
    _$currentItemIsLastAtom.context.conditionallyRunInAction(() {
      super.currentItemIsLast = value;
      _$currentItemIsLastAtom.reportChanged();
    }, _$currentItemIsLastAtom, name: '${_$currentItemIsLastAtom.name}_set');
  }

  final _$_speechFutureAtom = Atom(name: '_PerformStore._speechFuture');

  @override
  ObservableFuture<void> get _speechFuture {
    _$_speechFutureAtom.context.enforceReadPolicy(_$_speechFutureAtom);
    _$_speechFutureAtom.reportObserved();
    return super._speechFuture;
  }

  @override
  set _speechFuture(ObservableFuture<void> value) {
    _$_speechFutureAtom.context.conditionallyRunInAction(() {
      super._speechFuture = value;
      _$_speechFutureAtom.reportChanged();
    }, _$_speechFutureAtom, name: '${_$_speechFutureAtom.name}_set');
  }

  final _$speechStateAtom = Atom(name: '_PerformStore.speechState');

  @override
  SpeechState get speechState {
    _$speechStateAtom.context.enforceReadPolicy(_$speechStateAtom);
    _$speechStateAtom.reportObserved();
    return super.speechState;
  }

  @override
  set speechState(SpeechState value) {
    _$speechStateAtom.context.conditionallyRunInAction(() {
      super.speechState = value;
      _$speechStateAtom.reportChanged();
    }, _$speechStateAtom, name: '${_$speechStateAtom.name}_set');
  }

  final _$currentTimerAtom = Atom(name: '_PerformStore.currentTimer');

  @override
  Timer get currentTimer {
    _$currentTimerAtom.context.enforceReadPolicy(_$currentTimerAtom);
    _$currentTimerAtom.reportObserved();
    return super.currentTimer;
  }

  @override
  set currentTimer(Timer value) {
    _$currentTimerAtom.context.conditionallyRunInAction(() {
      super.currentTimer = value;
      _$currentTimerAtom.reportChanged();
    }, _$currentTimerAtom, name: '${_$currentTimerAtom.name}_set');
  }

  final _$performingAtom = Atom(name: '_PerformStore.performing');

  @override
  bool get performing {
    _$performingAtom.context.enforceReadPolicy(_$performingAtom);
    _$performingAtom.reportObserved();
    return super.performing;
  }

  @override
  set performing(bool value) {
    _$performingAtom.context.conditionallyRunInAction(() {
      super.performing = value;
      _$performingAtom.reportChanged();
    }, _$performingAtom, name: '${_$performingAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_PerformStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$presentCurrentItemAsyncAction = AsyncAction('presentCurrentItem');

  @override
  Future<dynamic> presentCurrentItem() {
    return _$presentCurrentItemAsyncAction
        .run(() => super.presentCurrentItem());
  }

  final _$prepareToAbandonWorkoutAsyncAction =
      AsyncAction('prepareToAbandonWorkout');

  @override
  Future<void> prepareToAbandonWorkout({bool silently = false}) {
    return _$prepareToAbandonWorkoutAsyncAction
        .run(() => super.prepareToAbandonWorkout(silently: silently));
  }

  final _$stopSpeechAsyncAction = AsyncAction('stopSpeech');

  @override
  Future<void> stopSpeech() {
    return _$stopSpeechAsyncAction.run(() => super.stopSpeech());
  }

  final _$_PerformStoreActionController =
      ActionController(name: '_PerformStore');

  @override
  void welcomeWorkout() {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super.welcomeWorkout();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _incrementCurrentItemProgressByOneUnit() {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super._incrementCurrentItemProgressByOneUnit();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void performCurrentItem() {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super.performCurrentItem();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopCurrentTimer() {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super.stopCurrentTimer();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchCurrentItem(int itemIndex) {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super.switchCurrentItem(itemIndex);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void countdownCurrentItem({int seconds = 3}) {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super.countdownCurrentItem(seconds: seconds);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void shuffleCurrentItemsExercise() {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super.shuffleCurrentItemsExercise();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCurrentItemsExercise(Exercise exercise) {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super.updateCurrentItemsExercise(exercise);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void abandonWorkout() {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super.abandonWorkout();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super.dispose();
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'sourceWorkout: ${sourceWorkout.toString()},state: ${state.toString()},workoutItems: ${workoutItems.toString()},overallDuration: ${overallDuration.toString()},timeRemaining: ${timeRemaining.toString()},currentItemIndex: ${currentItemIndex.toString()},currentItem: ${currentItem.toString()},currentItemProgress: ${currentItemProgress.toString()},currentItemStatus: ${currentItemStatus.toString()},currentItemIsLast: ${currentItemIsLast.toString()},speechState: ${speechState.toString()},currentTimer: ${currentTimer.toString()},performing: ${performing.toString()},errorMessage: ${errorMessage.toString()},timeRemainingString: ${timeRemainingString.toString()},workoutProgress: ${workoutProgress.toString()}';
    return '{$string}';
  }
}
