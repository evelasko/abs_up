// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkoutsStore on _WorkoutsStore, Store {
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
  String get equipmentFilter {
    _$equipmentFilterAtom.context.enforceReadPolicy(_$equipmentFilterAtom);
    _$equipmentFilterAtom.reportObserved();
    return super.equipmentFilter;
  }

  @override
  set equipmentFilter(String value) {
    _$equipmentFilterAtom.context.conditionallyRunInAction(() {
      super.equipmentFilter = value;
      _$equipmentFilterAtom.reportChanged();
    }, _$equipmentFilterAtom, name: '${_$equipmentFilterAtom.name}_set');
  }

  final _$targetFilterAtom = Atom(name: '_WorkoutsStore.targetFilter');

  @override
  String get targetFilter {
    _$targetFilterAtom.context.enforceReadPolicy(_$targetFilterAtom);
    _$targetFilterAtom.reportObserved();
    return super.targetFilter;
  }

  @override
  set targetFilter(String value) {
    _$targetFilterAtom.context.conditionallyRunInAction(() {
      super.targetFilter = value;
      _$targetFilterAtom.reportChanged();
    }, _$targetFilterAtom, name: '${_$targetFilterAtom.name}_set');
  }

  final _$intensityFilterAtom = Atom(name: '_WorkoutsStore.intensityFilter');

  @override
  int get intensityFilter {
    _$intensityFilterAtom.context.enforceReadPolicy(_$intensityFilterAtom);
    _$intensityFilterAtom.reportObserved();
    return super.intensityFilter;
  }

  @override
  set intensityFilter(int value) {
    _$intensityFilterAtom.context.conditionallyRunInAction(() {
      super.intensityFilter = value;
      _$intensityFilterAtom.reportChanged();
    }, _$intensityFilterAtom, name: '${_$intensityFilterAtom.name}_set');
  }

  final _$difficultyFilterAtom = Atom(name: '_WorkoutsStore.difficultyFilter');

  @override
  int get difficultyFilter {
    _$difficultyFilterAtom.context.enforceReadPolicy(_$difficultyFilterAtom);
    _$difficultyFilterAtom.reportObserved();
    return super.difficultyFilter;
  }

  @override
  set difficultyFilter(int value) {
    _$difficultyFilterAtom.context.conditionallyRunInAction(() {
      super.difficultyFilter = value;
      _$difficultyFilterAtom.reportChanged();
    }, _$difficultyFilterAtom, name: '${_$difficultyFilterAtom.name}_set');
  }

  final _$exercisesAtom = Atom(name: '_WorkoutsStore.exercises');

  @override
  List<Exercise> get exercises {
    _$exercisesAtom.context.enforceReadPolicy(_$exercisesAtom);
    _$exercisesAtom.reportObserved();
    return super.exercises;
  }

  @override
  set exercises(List<Exercise> value) {
    _$exercisesAtom.context.conditionallyRunInAction(() {
      super.exercises = value;
      _$exercisesAtom.reportChanged();
    }, _$exercisesAtom, name: '${_$exercisesAtom.name}_set');
  }

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

  @override
  String toString() {
    final string =
        'searchString: ${searchString.toString()},equipmentFilter: ${equipmentFilter.toString()},targetFilter: ${targetFilter.toString()},intensityFilter: ${intensityFilter.toString()},difficultyFilter: ${difficultyFilter.toString()},exercises: ${exercises.toString()},workout: ${workout.toString()}';
    return '{$string}';
  }
}
