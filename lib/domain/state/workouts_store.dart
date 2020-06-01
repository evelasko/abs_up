import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../constants.dart';
import '../../services/p_data.s.dart';
import '../interfaces/workout.i.dart';
import '../models/workout.dart';
import '../models/workout_settings.dart';

part 'workouts_store.g.dart';

class WorkoutsStore extends _WorkoutsStore with _$WorkoutsStore {
  WorkoutsStore(WorkoutInterface workoutService, {String workoutKey})
      : super(workoutService, workoutKey: workoutKey);
}

abstract class _WorkoutsStore with Store {
  final WorkoutInterface workoutService;
  final Box<Workout> workoutBox = PDataService.workoutsBox;
  final String workoutKey;

  _WorkoutsStore(this.workoutService, {this.workoutKey}) {
    workouts = workoutService.allWorkouts
        .where((workout) => workout.key != CURRENT_WORKOUT_KEY)
        .toList();
    workoutBox.listenable().addListener(() => workouts = workoutService
        .allWorkouts
        .where((workout) => workout.key != CURRENT_WORKOUT_KEY)
        .toList());

    if (workoutKey != null) {
      workout = workoutBox.get(workoutKey,
          defaultValue: workoutBox.get(CURRENT_WORKOUT_KEY));
      workoutBox.listenable(
          keys: [workoutKey ?? CURRENT_WORKOUT_KEY]).addListener(() {
        workout = workoutBox.get(workoutKey,
            defaultValue: workoutBox.get(CURRENT_WORKOUT_KEY));
      });
    }
  }

  ValueListenable get workoutsListenable => workoutService.workoutsListenable;

  Future<void> deleteSavedWorkout(String workoutKey) =>
      workoutBox.delete(workoutKey);

  ValueListenable<Box<Workout>> getWorkoutListenable(String workoutKey) =>
      PDataService.workoutsBox
          .listenable(keys: [workoutKey ?? CURRENT_WORKOUT_KEY]);

  /// This workouts list includes the current workout
  List<Workout> get all => workoutService.allWorkouts;

  /// This workouts list excludes the current workout
  List<Workout> get allButCurrent => workoutService.allWorkouts
      .where((workout) => workout.key != CURRENT_WORKOUT_KEY)
      .toList();

  @observable
  Workout workout;

  Workout workoutFromKey(String workoutKey) => workoutBox.get(workoutKey,
      defaultValue: workoutBox.get(CURRENT_WORKOUT_KEY));

  @computed
  ValueListenable<Box<Workout>> get currentWorkoutListenable =>
      workoutBox.listenable(keys: [workout?.key ?? CURRENT_WORKOUT_KEY]);
  @computed
  WorkoutSettings get workoutSettings => workoutService.workoutSettings;
  @computed
  bool get isCurrent => workoutKey == CURRENT_WORKOUT_KEY;

  @action
  Future<void> saveCurrentWorkoutAs(String name) async =>
      workoutService.saveCurrentWorkoutAs(name);

  Future<void> Function() get generateCurrentWorkout =>
      workoutService.generateCurrentWorkout;

  @observable
  String searchString = '';
  @observable
  List<String> equipmentFilter = [];
  @observable
  List<String> targetFilter = [];
  @observable
  bool sortByIntensity = false;
  @observable
  bool sortByDifficulty = false;
  @observable
  List<Workout> workouts;
}
