// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkoutsStore on _WorkoutsStore, Store {
  Computed<ValueListenable<Box<Workout>>> _$currentWorkoutListenableComputed;

  @override
  ValueListenable<Box<Workout>> get currentWorkoutListenable =>
      (_$currentWorkoutListenableComputed ??=
              Computed<ValueListenable<Box<Workout>>>(
                  () => super.currentWorkoutListenable))
          .value;
  Computed<WorkoutSettings> _$workoutSettingsComputed;

  @override
  WorkoutSettings get workoutSettings => (_$workoutSettingsComputed ??=
          Computed<WorkoutSettings>(() => super.workoutSettings))
      .value;
  Computed<bool> _$isCurrentComputed;

  @override
  bool get isCurrent =>
      (_$isCurrentComputed ??= Computed<bool>(() => super.isCurrent)).value;

  final _$workoutAtom = Atom(name: '_WorkoutsStore.workout');

  @override
  Workout get workout {
    _$workoutAtom.context.enforceReadPolicy(_$workoutAtom);
    _$workoutAtom.reportObserved();
    return super.workout;
  }

  @override
  set workout(Workout value) {
    _$workoutAtom.context.conditionallyRunInAction(() {
      super.workout = value;
      _$workoutAtom.reportChanged();
    }, _$workoutAtom, name: '${_$workoutAtom.name}_set');
  }

  final _$searchStringAtom = Atom(name: '_WorkoutsStore.searchString');

  @override
  String get searchString {
    _$searchStringAtom.context.enforceReadPolicy(_$searchStringAtom);
    _$searchStringAtom.reportObserved();
    return super.searchString;
  }

  @override
  set searchString(String value) {
    _$searchStringAtom.context.conditionallyRunInAction(() {
      super.searchString = value;
      _$searchStringAtom.reportChanged();
    }, _$searchStringAtom, name: '${_$searchStringAtom.name}_set');
  }

  final _$equipmentFilterAtom = Atom(name: '_WorkoutsStore.equipmentFilter');

  @override
  List<String> get equipmentFilter {
    _$equipmentFilterAtom.context.enforceReadPolicy(_$equipmentFilterAtom);
    _$equipmentFilterAtom.reportObserved();
    return super.equipmentFilter;
  }

  @override
  set equipmentFilter(List<String> value) {
    _$equipmentFilterAtom.context.conditionallyRunInAction(() {
      super.equipmentFilter = value;
      _$equipmentFilterAtom.reportChanged();
    }, _$equipmentFilterAtom, name: '${_$equipmentFilterAtom.name}_set');
  }

  final _$targetFilterAtom = Atom(name: '_WorkoutsStore.targetFilter');

  @override
  List<String> get targetFilter {
    _$targetFilterAtom.context.enforceReadPolicy(_$targetFilterAtom);
    _$targetFilterAtom.reportObserved();
    return super.targetFilter;
  }

  @override
  set targetFilter(List<String> value) {
    _$targetFilterAtom.context.conditionallyRunInAction(() {
      super.targetFilter = value;
      _$targetFilterAtom.reportChanged();
    }, _$targetFilterAtom, name: '${_$targetFilterAtom.name}_set');
  }

  final _$sortByIntensityAtom = Atom(name: '_WorkoutsStore.sortByIntensity');

  @override
  bool get sortByIntensity {
    _$sortByIntensityAtom.context.enforceReadPolicy(_$sortByIntensityAtom);
    _$sortByIntensityAtom.reportObserved();
    return super.sortByIntensity;
  }

  @override
  set sortByIntensity(bool value) {
    _$sortByIntensityAtom.context.conditionallyRunInAction(() {
      super.sortByIntensity = value;
      _$sortByIntensityAtom.reportChanged();
    }, _$sortByIntensityAtom, name: '${_$sortByIntensityAtom.name}_set');
  }

  final _$sortByDifficultyAtom = Atom(name: '_WorkoutsStore.sortByDifficulty');

  @override
  bool get sortByDifficulty {
    _$sortByDifficultyAtom.context.enforceReadPolicy(_$sortByDifficultyAtom);
    _$sortByDifficultyAtom.reportObserved();
    return super.sortByDifficulty;
  }

  @override
  set sortByDifficulty(bool value) {
    _$sortByDifficultyAtom.context.conditionallyRunInAction(() {
      super.sortByDifficulty = value;
      _$sortByDifficultyAtom.reportChanged();
    }, _$sortByDifficultyAtom, name: '${_$sortByDifficultyAtom.name}_set');
  }

  final _$workoutsAtom = Atom(name: '_WorkoutsStore.workouts');

  @override
  List<Workout> get workouts {
    _$workoutsAtom.context.enforceReadPolicy(_$workoutsAtom);
    _$workoutsAtom.reportObserved();
    return super.workouts;
  }

  @override
  set workouts(List<Workout> value) {
    _$workoutsAtom.context.conditionallyRunInAction(() {
      super.workouts = value;
      _$workoutsAtom.reportChanged();
    }, _$workoutsAtom, name: '${_$workoutsAtom.name}_set');
  }

  final _$saveCurrentWorkoutAsAsyncAction = AsyncAction('saveCurrentWorkoutAs');

  @override
  Future<void> saveCurrentWorkoutAs(String name) {
    return _$saveCurrentWorkoutAsAsyncAction
        .run(() => super.saveCurrentWorkoutAs(name));
  }

  @override
  String toString() {
    final string =
        'workout: ${workout.toString()},searchString: ${searchString.toString()},equipmentFilter: ${equipmentFilter.toString()},targetFilter: ${targetFilter.toString()},sortByIntensity: ${sortByIntensity.toString()},sortByDifficulty: ${sortByDifficulty.toString()},workouts: ${workouts.toString()},currentWorkoutListenable: ${currentWorkoutListenable.toString()},workoutSettings: ${workoutSettings.toString()},isCurrent: ${isCurrent.toString()}';
    return '{$string}';
  }
}
