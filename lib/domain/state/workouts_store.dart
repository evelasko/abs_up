import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../constants.dart';
import '../interfaces/exercise.i.dart';
import '../interfaces/user_settings.i.dart';
import '../interfaces/workout.i.dart';
import '../interfaces/workout_logs.i.dart';
import '../models/workout.dart';
import '../models/workout_log.dart';

part 'workouts_store.g.dart';

@lazySingleton
class WorkoutsStore extends _WorkoutsStore with _$WorkoutsStore {
  WorkoutsStore(
    ExerciseInterface exerciseService,
    WorkoutInterface workoutService,
    UserSettingsInterface settingsService,
    WorkoutLogsInterface workoutLogsService,
  ) : super(
          exerciseService,
          workoutService,
          settingsService,
          workoutLogsService,
        );
}

abstract class _WorkoutsStore with Store {
  final ExerciseInterface exerciseService;
  final WorkoutInterface workoutService;
  final UserSettingsInterface settingsService;
  final WorkoutLogsInterface workoutLogsService;

  _WorkoutsStore(
    this.exerciseService,
    this.workoutService,
    this.settingsService,
    this.workoutLogsService,
  ) {
    //= initialize values
    all = workoutService.allWorkouts ?? [];
    allUserWorkouts = workoutService.allUserWorkouts ?? [];
    print('init workouts store');
    generateCurrentWorkout()
        .then((value) => workout = workoutFromKey(CURRENT_WORKOUT_KEY));
    //= initialize listener
    workoutService.registerListener(() {
      all = workoutService.allWorkouts ?? [];
      allUserWorkouts = workoutService.allUserWorkouts ?? [];
      workout = workoutService.getWorkout(workoutKey ?? CURRENT_WORKOUT_KEY);
      // listenable = Random().nextInt(32);
      print('runned workouts box listener, workout:${workout.name}');
    });
  }

  @observable
  int listenable = 0;
  @observable
  Workout workout;
  @observable
  String workoutKey;
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
  List<Workout> all;
  @observable
  List<Workout> allUserWorkouts;
  @computed
  Workout get currentWorkout => workoutService.getWorkout();
  @computed
  Option<List<WorkoutLog>> get workoutLogs =>
      optionOf(workoutLogsService.userLogs);
  @computed
  Option<List<String>> get userActivity => none();

  @action
  Future<void> deleteSavedWorkout(String workoutKey) async =>
      workoutService.deleteWorkout(workoutKey);

  @action
  Workout workoutFromKey(String workoutKey) =>
      workoutService.getWorkout(workoutKey);

  @action
  Future<void> saveCurrentWorkoutAs(String name) async =>
      workoutService.saveCurrentWorkoutAs(name);

  @action
  Future<void> generateCurrentWorkout() async => workoutService.saveWorkout(
          workout: workoutService.generateWorkout(
        exerciseService.allExercises,
        settingsService.workoutSettings,
      ));

  @action
  bool checkEquipmentStatus(String equipmentKey) =>
      settingsService.workoutSettings.checkEquipmentStatusFor(equipmentKey);
}
