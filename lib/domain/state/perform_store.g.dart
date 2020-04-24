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

  final _$workoutLogKeyAtom = Atom(name: '_PerformStore.workoutLogKey');

  @override
  String get workoutLogKey {
    _$workoutLogKeyAtom.context.enforceReadPolicy(_$workoutLogKeyAtom);
    _$workoutLogKeyAtom.reportObserved();
    return super.workoutLogKey;
  }

  @override
  set workoutLogKey(String value) {
    _$workoutLogKeyAtom.context.conditionallyRunInAction(() {
      super.workoutLogKey = value;
      _$workoutLogKeyAtom.reportChanged();
    }, _$workoutLogKeyAtom, name: '${_$workoutLogKeyAtom.name}_set');
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

  final _$initNewAsyncAction = AsyncAction('initNew');

  @override
  Future<void> initNew(String newWorkoutLogKey) {
    return _$initNewAsyncAction.run(() => super.initNew(newWorkoutLogKey));
  }

  final _$_PerformStoreActionController =
      ActionController(name: '_PerformStore');

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
  void updateCurrentItem(int itemIndex) {
    final _$actionInfo = _$_PerformStoreActionController.startAction();
    try {
      return super.updateCurrentItem(itemIndex);
    } finally {
      _$_PerformStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'workoutLogKey: ${workoutLogKey.toString()},state: ${state.toString()},workoutItems: ${workoutItems.toString()},overallDuration: ${overallDuration.toString()},timeRemaining: ${timeRemaining.toString()},currentItemIndex: ${currentItemIndex.toString()},currentItem: ${currentItem.toString()},currentItemProgress: ${currentItemProgress.toString()},currentTimer: ${currentTimer.toString()},performing: ${performing.toString()},timeRemainingString: ${timeRemainingString.toString()}';
    return '{$string}';
  }
}
