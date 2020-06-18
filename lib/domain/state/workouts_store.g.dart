// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkoutsStore on _WorkoutsStore, Store {
  Computed<Option<List<Workout>>> _$workoutsComputed;

  @override
  Option<List<Workout>> get workouts => (_$workoutsComputed ??=
          Computed<Option<List<Workout>>>(() => super.workouts,
              name: '_WorkoutsStore.workouts'))
      .value;
  Computed<WorkoutSettings> _$workoutSettingsComputed;

  @override
  WorkoutSettings get workoutSettings => (_$workoutSettingsComputed ??=
          Computed<WorkoutSettings>(() => super.workoutSettings,
              name: '_WorkoutsStore.workoutSettings'))
      .value;

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

  final _$saveCurrentWorkoutAsAsyncAction =
      AsyncAction('_WorkoutsStore.saveCurrentWorkoutAs');

  @override
  Future<void> saveCurrentWorkoutAs(String name) {
    return _$saveCurrentWorkoutAsAsyncAction
        .run(() => super.saveCurrentWorkoutAs(name));
  }

  final _$_WorkoutsStoreActionController =
      ActionController(name: '_WorkoutsStore');

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
workout: ${workout},
searchString: ${searchString},
equipmentFilter: ${equipmentFilter},
targetFilter: ${targetFilter},
sortByIntensity: ${sortByIntensity},
sortByDifficulty: ${sortByDifficulty},
workouts: ${workouts},
workoutSettings: ${workoutSettings}
    ''';
  }
}
