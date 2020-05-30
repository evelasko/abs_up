import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '../../constants.dart';
import '../../services/p_data.s.dart';
import '../interfaces/workout.i.dart';
import '../models/workout.dart';

part 'workouts_store.g.dart';

class WorkoutsStore extends _WorkoutsStore with _$WorkoutsStore {
  WorkoutsStore(WorkoutInterface workoutService) : super(workoutService);
}

abstract class _WorkoutsStore with Store {
  final WorkoutInterface workoutService;
  final Box<Workout> workoutBox = PDataService.workoutsBox;
  _WorkoutsStore(this.workoutService) {
    workouts = workoutService.allWorkouts
        .where((workout) => workout.key != CURRENT_WORKOUT_KEY)
        .toList();
  }

  ValueListenable get workoutsListenable => workoutService.workoutsListenable;

  /// This workouts list includes the current workout
  List<Workout> get all => workoutService.allWorkouts;

  /// This workouts list excludes the current workout
  List<Workout> get allButCurrent => workoutService.allWorkouts
      .where((workout) => workout.key != CURRENT_WORKOUT_KEY)
      .toList();

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

  @observable
  Workout workout;
}
