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
          Computed<List<String>>(() => super.equipmentSet,
              name: '_ExercisesStore.equipmentSet'))
      .value;

  final _$exercisesAtom = Atom(name: '_ExercisesStore.exercises');

  @override
  List<Exercise> get exercises {
    _$exercisesAtom.reportRead();
    return super.exercises;
  }

  @override
  set exercises(List<Exercise> value) {
    _$exercisesAtom.reportWrite(value, super.exercises, () {
      super.exercises = value;
    });
  }

  final _$searchStringAtom = Atom(name: '_ExercisesStore.searchString');

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

  final _$filterFavoritesAtom = Atom(name: '_ExercisesStore.filterFavorites');

  @override
  bool get filterFavorites {
    _$filterFavoritesAtom.reportRead();
    return super.filterFavorites;
  }

  @override
  set filterFavorites(bool value) {
    _$filterFavoritesAtom.reportWrite(value, super.filterFavorites, () {
      super.filterFavorites = value;
    });
  }

  final _$filterBlacklistedAtom =
      Atom(name: '_ExercisesStore.filterBlacklisted');

  @override
  bool get filterBlacklisted {
    _$filterBlacklistedAtom.reportRead();
    return super.filterBlacklisted;
  }

  @override
  set filterBlacklisted(bool value) {
    _$filterBlacklistedAtom.reportWrite(value, super.filterBlacklisted, () {
      super.filterBlacklisted = value;
    });
  }

  final _$equipmentFilterAtom = Atom(name: '_ExercisesStore.equipmentFilter');

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

  final _$targetFilterAtom = Atom(name: '_ExercisesStore.targetFilter');

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

  final _$sortByIntensityAtom = Atom(name: '_ExercisesStore.sortByIntensity');

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

  final _$sortByDifficultyAtom = Atom(name: '_ExercisesStore.sortByDifficulty');

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

  final _$workoutAtom = Atom(name: '_ExercisesStore.workout');

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

  final _$_ExercisesStoreActionController =
      ActionController(name: '_ExercisesStore');

  @override
  void _filterExercises() {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore._filterExercises');
    try {
      return super._filterExercises();
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSearchString(String input) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.updateSearchString');
    try {
      return super.updateSearchString(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateEquipmentFilter(String input) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.updateEquipmentFilter');
    try {
      return super.updateEquipmentFilter(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFilterFavorites(bool input) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.toggleFilterFavorites');
    try {
      return super.toggleFilterFavorites(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFilterBlacklisted(bool input) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.toggleFilterBlacklisted');
    try {
      return super.toggleFilterBlacklisted(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSortByIntensity([bool input]) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.toggleSortByIntensity');
    try {
      return super.toggleSortByIntensity(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSortByDifficulty([bool input]) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.toggleSortByDifficulty');
    try {
      return super.toggleSortByDifficulty(input);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exercises: ${exercises},
searchString: ${searchString},
filterFavorites: ${filterFavorites},
filterBlacklisted: ${filterBlacklisted},
equipmentFilter: ${equipmentFilter},
targetFilter: ${targetFilter},
sortByIntensity: ${sortByIntensity},
sortByDifficulty: ${sortByDifficulty},
workout: ${workout},
equipmentSet: ${equipmentSet}
    ''';
  }
}
