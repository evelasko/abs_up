import 'package:dartz/dartz.dart';
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
    workout = workoutBox.get(workoutKey ?? CURRENT_WORKOUT_KEY);
  }
  @observable
  Workout workout;
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
  @computed
  Option<List<Workout>> get workouts {
    final List<Workout> _workouts = workoutService.allWorkouts
        .where((workout) => workout.key != CURRENT_WORKOUT_KEY)
        .toList();
    return _workouts.isEmpty ? none() : some(_workouts);
  }

  @computed
  WorkoutSettings get workoutSettings => workoutService.workoutSettings;

  ValueListenable get workoutsListenable => workoutService.workoutsListenable;

  Future<void> deleteSavedWorkout(String workoutKey) =>
      workoutBox.delete(workoutKey);

  ValueListenable<Box<Workout>> getWorkoutListenable([String workoutKey]) =>
      PDataService.workoutsBox.listenable();

  /// This workouts list includes the current workout
  List<Workout> get all => workoutService.allWorkouts;

  /// This workouts list excludes the current workout
  List<Workout> get allButCurrent => workoutService.allWorkouts
      .where((workout) => workout.key != CURRENT_WORKOUT_KEY)
      .toList();

  Workout workoutFromKey(String workoutKey) => workoutBox.get(workoutKey,
      defaultValue: workoutBox.get(CURRENT_WORKOUT_KEY));

  @action
  Future<void> saveCurrentWorkoutAs(String name) async =>
      workoutService.saveCurrentWorkoutAs(name);

  Future<void> Function() get generateCurrentWorkout =>
      workoutService.generateCurrentWorkout;

  @action
  bool checkEquipmentStatus(String equipmentKey) =>
      workoutService.checkEquipmentStatus(equipmentKey);
}
