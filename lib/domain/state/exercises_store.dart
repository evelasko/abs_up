import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../constants.dart';
import '../interfaces/exercise.i.dart';
import '../models/exercise.dart';
import '../models/workout.dart';

part 'exercises_store.g.dart';

@lazySingleton
class ExercisesStore extends _ExercisesStore with _$ExercisesStore {
  ExercisesStore(ExerciseInterface exerciseService) : super(exerciseService);
}

abstract class _ExercisesStore with Store {
  final ExerciseInterface exerciseService;

  _ExercisesStore(this.exerciseService) {
    exercises = exerciseService.allExercises;
    exerciseService.registerListener(_filterExercises);
  }

  List<Exercise> get all => exerciseService.allExercises;

  @observable
  List<Exercise> exercises;
  @observable
  String searchString = '';
  @observable
  bool filterFavorites = false;
  @observable
  bool filterBlacklisted = false;
  @observable
  List<String> equipmentFilter = [];
  @observable
  List<String> targetFilter = [];
  @observable
  bool sortByIntensity = false;
  @observable
  bool sortByDifficulty = false;

  @computed
  List<String> get equipmentSet =>
      Set<String>.from(all.map((e) => e.equipment)).toList();

  @observable
  Workout workout;

  @action
  void _filterExercises() => exercises = all
      .where((Exercise exercise) =>
          exercise.name.contains(searchString.length < 3
              ? ''
              : RegExp(searchString, caseSensitive: false)) &&
          (equipmentFilter.isEmpty ||
              equipmentFilter.contains(exercise.equipment)) &&
          (_tagPredicate(exercise.tag)))
      .toList()
        ..sort(_sortPredicate());

  @action
  void updateSearchString(String input) {
    searchString = input;
    _filterExercises();
  }

  bool _tagPredicate(int tag) {
    if (!filterFavorites && !filterBlacklisted) {
      return true;
    } else if (filterFavorites && tag == 1) {
      return true;
    } else if (filterBlacklisted && tag == 2) {
      return true;
    }
    return false;
  }

  int Function(Exercise, Exercise) _sortPredicate() {
    if (sortByIntensity) {
      return (a, b) => a.intensity.compareTo(b.intensity);
    } else if (sortByDifficulty) {
      return (a, b) => a.difficulty.compareTo(b.difficulty);
    }
    return (a, b) => a.name.compareTo(b.name);
  }

  @action
  void updateEquipmentFilter(String input) {
    if (!equipmentSet.contains(input)) return;
    if (equipmentFilter.contains(input)) {
      equipmentFilter.removeWhere((element) => element == input);
    } else {
      equipmentFilter.add(input);
    }
    _filterExercises();
  }

  @action
  void toggleFilterFavorites(bool input) {
    filterFavorites = input ?? false;
    _filterExercises();
  }

  @action
  void toggleFilterBlacklisted(bool input) {
    filterBlacklisted = input ?? false;
    _filterExercises();
  }

  @action
  void toggleSortByIntensity([bool input]) {
    sortByIntensity = !sortByIntensity;
    sortByDifficulty = sortByIntensity ? !sortByIntensity : sortByDifficulty;
    _filterExercises();
  }

  @action
  void toggleSortByDifficulty([bool input]) {
    sortByDifficulty = !sortByDifficulty;
    sortByIntensity = sortByDifficulty ? !sortByDifficulty : sortByIntensity;
    _filterExercises();
  }

  @action
  void clearFilters() {
    searchString = '';
    equipmentFilter = [...EQUIPMENT_DATA_KEYS];
    targetFilter = [];
    sortByDifficulty = false;
    sortByIntensity = false;
    filterFavorites = false;
    filterBlacklisted = false;
    exercises = exerciseService.allExercises;
  }
}
