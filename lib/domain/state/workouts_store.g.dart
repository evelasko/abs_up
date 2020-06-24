// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkoutsStore on _WorkoutsStore, Store {
  Computed<Workout> _$currentWorkoutComputed;

  @override
  Workout get currentWorkout => (_$currentWorkoutComputed ??= Computed<Workout>(
          () => super.currentWorkout,
          name: '_WorkoutsStore.currentWorkout'))
      .value;
  Computed<Option<List<WorkoutLog>>> _$workoutLogsComputed;

  @override
  Option<List<WorkoutLog>> get workoutLogs => (_$workoutLogsComputed ??=
          Computed<Option<List<WorkoutLog>>>(() => super.workoutLogs,
              name: '_WorkoutsStore.workoutLogs'))
      .value;
  Computed<Option<List<String>>> _$userActivityComputed;

  @override
  Option<List<String>> get userActivity => (_$userActivityComputed ??=
          Computed<Option<List<String>>>(() => super.userActivity,
              name: '_WorkoutsStore.userActivity'))
      .value;

  final _$listenableAtom = Atom(name: '_WorkoutsStore.listenable');

  @override
  int get listenable {
    _$listenableAtom.reportRead();
    return super.listenable;
  }

  @override
  set listenable(int value) {
    _$listenableAtom.reportWrite(value, super.listenable, () {
      super.listenable = value;
    });
  }

  final _$workoutAtom = Atom(name: '_WorkoutsStore.workout');

  @override
  Workout get workout {
    _$workoutAtom.reportRead();
    return super.workout;
  }

  @override
  set workout(Workout value) {
    _$workoutAtom.reportWrite(value, super.workout, () {
      super.workout = value;
    });
  }

  final _$workoutKeyAtom = Atom(name: '_WorkoutsStore.workoutKey');

  @override
  String get workoutKey {
    _$workoutKeyAtom.reportRead();
    return super.workoutKey;
  }

  @override
  set workoutKey(String value) {
    _$workoutKeyAtom.reportWrite(value, super.workoutKey, () {
      super.workoutKey = value;
    });
  }

  final _$searchStringAtom = Atom(name: '_WorkoutsStore.searchString');

  @override
  String get searchString {
    _$searchStringAtom.reportRead();
    return super.searchString;
  }

  @override
  set searchString(String value) {
    _$searchStringAtom.reportWrite(value, super.searchString, () {
      super.searchString = value;
    });
  }

  final _$equipmentFilterAtom = Atom(name: '_WorkoutsStore.equipmentFilter');

  @override
  List<String> get equipmentFilter {
    _$equipmentFilterAtom.reportRead();
    return super.equipmentFilter;
  }

  @override
  set equipmentFilter(List<String> value) {
    _$equipmentFilterAtom.reportWrite(value, super.equipmentFilter, () {
      super.equipmentFilter = value;
    });
  }

  final _$targetFilterAtom = Atom(name: '_WorkoutsStore.targetFilter');

  @override
  List<String> get targetFilter {
    _$targetFilterAtom.reportRead();
    return super.targetFilter;
  }

  @override
  set targetFilter(List<String> value) {
    _$targetFilterAtom.reportWrite(value, super.targetFilter, () {
      super.targetFilter = value;
    });
  }

  final _$sortByIntensityAtom = Atom(name: '_WorkoutsStore.sortByIntensity');

  @override
  bool get sortByIntensity {
    _$sortByIntensityAtom.reportRead();
    return super.sortByIntensity;
  }

  @override
  set sortByIntensity(bool value) {
    _$sortByIntensityAtom.reportWrite(value, super.sortByIntensity, () {
      super.sortByIntensity = value;
    });
  }

  final _$sortByDifficultyAtom = Atom(name: '_WorkoutsStore.sortByDifficulty');

  @override
  bool get sortByDifficulty {
    _$sortByDifficultyAtom.reportRead();
    return super.sortByDifficulty;
  }

  @override
  set sortByDifficulty(bool value) {
    _$sortByDifficultyAtom.reportWrite(value, super.sortByDifficulty, () {
      super.sortByDifficulty = value;
    });
  }

  final _$allAtom = Atom(name: '_WorkoutsStore.all');

  @override
  List<Workout> get all {
    _$allAtom.reportRead();
    return super.all;
  }

  @override
  set all(List<Workout> value) {
    _$allAtom.reportWrite(value, super.all, () {
      super.all = value;
    });
  }

  final _$allUserWorkoutsAtom = Atom(name: '_WorkoutsStore.allUserWorkouts');

  @override
  List<Workout> get allUserWorkouts {
    _$allUserWorkoutsAtom.reportRead();
    return super.allUserWorkouts;
  }

  @override
  set allUserWorkouts(List<Workout> value) {
    _$allUserWorkoutsAtom.reportWrite(value, super.allUserWorkouts, () {
      super.allUserWorkouts = value;
    });
  }

  final _$deleteSavedWorkoutAsyncAction =
      AsyncAction('_WorkoutsStore.deleteSavedWorkout');

  @override
  Future<void> deleteSavedWorkout(String workoutKey) {
    return _$deleteSavedWorkoutAsyncAction
        .run(() => super.deleteSavedWorkout(workoutKey));
  }

  final _$saveCurrentWorkoutAsAsyncAction =
      AsyncAction('_WorkoutsStore.saveCurrentWorkoutAs');

  @override
  Future<void> saveCurrentWorkoutAs(String name) {
    return _$saveCurrentWorkoutAsAsyncAction
        .run(() => super.saveCurrentWorkoutAs(name));
  }

  final _$generateCurrentWorkoutAsyncAction =
      AsyncAction('_WorkoutsStore.generateCurrentWorkout');

  @override
  Future<void> generateCurrentWorkout() {
    return _$generateCurrentWorkoutAsyncAction
        .run(() => super.generateCurrentWorkout());
  }

  final _$_WorkoutsStoreActionController =
      ActionController(name: '_WorkoutsStore');

  @override
  Workout workoutFromKey(String workoutKey) {
    final _$actionInfo = _$_WorkoutsStoreActionController.startAction(
        name: '_WorkoutsStore.workoutFromKey');
    try {
      return super.workoutFromKey(workoutKey);
    } finally {
      _$_WorkoutsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool checkEquipmentStatus(String equipmentKey) {
    final _$actionInfo = _$_WorkoutsStoreActionController.startAction(
        name: '_WorkoutsStore.checkEquipmentStatus');
    try {
      return super.checkEquipmentStatus(equipmentKey);
    } finally {
      _$_WorkoutsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listenable: ${listenable},
workout: ${workout},
workoutKey: ${workoutKey},
searchString: ${searchString},
equipmentFilter: ${equipmentFilter},
targetFilter: ${targetFilter},
sortByIntensity: ${sortByIntensity},
sortByDifficulty: ${sortByDifficulty},
all: ${all},
allUserWorkouts: ${allUserWorkouts},
currentWorkout: ${currentWorkout},
workoutLogs: ${workoutLogs},
userActivity: ${userActivity}
    ''';
  }
}
