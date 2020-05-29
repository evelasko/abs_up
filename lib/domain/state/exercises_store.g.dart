// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExercisesStore on _ExercisesStore, Store {
  Computed<List<String>> _$equipmentSetComputed;

  @override
  List<String> get equipmentSet => (_$equipmentSetComputed ??=
          Computed<List<String>>(() => super.equipmentSet))
      .value;

  final _$searchStringAtom = Atom(name: '_ExercisesStore.searchString');

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

  final _$filterFavoritesAtom = Atom(name: '_ExercisesStore.filterFavorites');

  @override
  bool get filterFavorites {
    _$filterFavoritesAtom.context.enforceReadPolicy(_$filterFavoritesAtom);
    _$filterFavoritesAtom.reportObserved();
    return super.filterFavorites;
  }

  @override
  set filterFavorites(bool value) {
    _$filterFavoritesAtom.context.conditionallyRunInAction(() {
      super.filterFavorites = value;
      _$filterFavoritesAtom.reportChanged();
    }, _$filterFavoritesAtom, name: '${_$filterFavoritesAtom.name}_set');
  }

  final _$filterBlacklistedAtom =
      Atom(name: '_ExercisesStore.filterBlacklisted');

  @override
  bool get filterBlacklisted {
    _$filterBlacklistedAtom.context.enforceReadPolicy(_$filterBlacklistedAtom);
    _$filterBlacklistedAtom.reportObserved();
    return super.filterBlacklisted;
  }

  @override
  set filterBlacklisted(bool value) {
    _$filterBlacklistedAtom.context.conditionallyRunInAction(() {
      super.filterBlacklisted = value;
      _$filterBlacklistedAtom.reportChanged();
    }, _$filterBlacklistedAtom, name: '${_$filterBlacklistedAtom.name}_set');
  }

  final _$equipmentFilterAtom = Atom(name: '_ExercisesStore.equipmentFilter');

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

  final _$targetFilterAtom = Atom(name: '_ExercisesStore.targetFilter');

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

  final _$sortByIntensityAtom = Atom(name: '_ExercisesStore.sortByIntensity');

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

  final _$sortByDifficultyAtom = Atom(name: '_ExercisesStore.sortByDifficulty');

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

  final _$exercisesAtom = Atom(name: '_ExercisesStore.exercises');

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

  final _$workoutAtom = Atom(name: '_ExercisesStore.workout');

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

  final _$_ExercisesStoreActionController =
      ActionController(name: '_ExercisesStore');

  @override
  void _filterExercises() {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction();
    try {
      return super._filterExercises();
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSearchString(String input) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction();
    try {
      return super.updateSearchString(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateEquipmentFilter(String input) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction();
    try {
      return super.updateEquipmentFilter(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFilterFavorites(bool input) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction();
    try {
      return super.toggleFilterFavorites(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFilterBlacklisted(bool input) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction();
    try {
      return super.toggleFilterBlacklisted(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSortByIntensity([bool input]) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction();
    try {
      return super.toggleSortByIntensity(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSortByDifficulty([bool input]) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction();
    try {
      return super.toggleSortByDifficulty(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction();
    try {
      return super.clearFilters();
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'searchString: ${searchString.toString()},filterFavorites: ${filterFavorites.toString()},filterBlacklisted: ${filterBlacklisted.toString()},equipmentFilter: ${equipmentFilter.toString()},targetFilter: ${targetFilter.toString()},sortByIntensity: ${sortByIntensity.toString()},sortByDifficulty: ${sortByDifficulty.toString()},exercises: ${exercises.toString()},workout: ${workout.toString()},equipmentSet: ${equipmentSet.toString()}';
    return '{$string}';
  }
}
