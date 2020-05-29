import 'package:abs_up/domain/interfaces/workout.i.dart';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/services/p_data.s.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'workouts_store.g.dart';

class WorkoutsStore extends _WorkoutsStore with _$WorkoutsStore {
  WorkoutsStore(WorkoutInterface workoutService) : super(workoutService);
}

abstract class _WorkoutsStore with Store {
  final WorkoutInterface workoutService;
  final Box<Workout> workoutBox = PDataService.workoutsBox;
  _WorkoutsStore(this.workoutService);

  @observable
  String searchString;
  @observable
  String equipmentFilter;
  @observable
  String targetFilter;
  @observable
  int intensityFilter;
  @observable
  int difficultyFilter;
  @observable
  List<Exercise> exercises;

  // List<Exercise> get all => exercisesBox.values.toList();

  @observable
  Workout workout;

  // @action
  // void filterExercises() =>
  //     exercises = exercisesBox.values.where(filterPredicate).toList();

  bool filterPredicate(Exercise exercise) =>
      exercise.name.contains(searchString.length < 3
          ? ''
          : RegExp(searchString, caseSensitive: false)) &&
      exercise.equipment.contains(equipmentFilter ?? '') &&
      exercise.target.contains(targetFilter ?? '') &&
      (intensityFilter == null || exercise.intensity == intensityFilter) &&
      (difficultyFilter == null || exercise.difficulty == difficultyFilter);

  // void updateSearchString(String input) {
  //   searchString = input;
  //   filterExercises();
  // }

  // void updateEquipmentFilter(String input) {
  //   equipmentFilter = input;
  //   filterExercises();
  // }

  // void updateTargetFilter(String input) {
  //   targetFilter = input;
  //   filterExercises();
  // }

  // void updateIntensityFilter(int input) {
  //   intensityFilter = input;
  //   filterExercises();
  // }

  // void updateDifficultyFilter(int input) {
  //   difficultyFilter = input;
  //   filterExercises();
  // }

  // void clearFilters() {
  //   searchString = '';
  //   equipmentFilter = null;
  //   targetFilter = null;
  //   intensityFilter = null;
  //   difficultyFilter = null;
  //   exercises = exercisesBox.values.toList();
  // }
}
