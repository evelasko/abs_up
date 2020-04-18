import 'dart:math';

import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/domain/models/workout.dart';
import 'package:data_setup/domain/models/workout_item.dart';
import 'package:data_setup/domain/models/workout_settings.dart';
import 'package:data_setup/domain/repositories/data_values.dart';
import 'package:data_setup/domain/repositories/i_user_settings_facade.dart';
import 'package:hive/hive.dart';

import 'i_hive_facade.dart';

class IWorkoutFacade {
  static Box workoutSettingsBox = IHiveFacade.workoutSettingsBox;
  static Box<Workout> workoutsBox = IHiveFacade.workoutsBox;
  static Box<Exercise> exercisesBox = IHiveFacade.exercisesBox;

  static const List<String> availableTargets = [
    'Core',
    'Lower',
    'Upper',
    'Rect',
    'Obliques',
    // TODO implement what to do with Kegel exercises (for now dey won't be included in the distirbution)
    // 'Kegel'
  ];

  //: Getters _________________________________________________
  /// Returns the current workout settings
  WorkoutSettings get workoutSettings =>
      workoutSettingsBox.get(DataValues.workoutSettingsKey);

  /// Returns a rough amount exercises to include by the length set in settings
  int get roughtExerciseAmount => IWorkoutFacade().workoutSettings.length <= 1
      ? 9
      : IWorkoutFacade().workoutSettings.length == 2 ? 18 : 20;

  //: Main methods ___________________________________________
  static Future<void> initWorkoutSettings() async {
    if (workoutSettingsBox.containsKey(DataValues.workoutSettingsKey)) return;

    await workoutSettingsBox.put(
        DataValues.workoutSettingsKey, WorkoutSettings());
    await workoutsBox.put(
        DataValues.currentWorkoutKey, Workout(name: 'Workout'));
  }

  /// Exercise durations given the settings length
  static const List<int> durationLength = [30, 60, 90, 100];

  /// Generates a new workout basedon current settings
  static Workout generateWorkout() {
    final WorkoutSettings settings =
        workoutSettingsBox.get(DataValues.workoutSettingsKey);

    //= filter exercises
    Iterable<Exercise> availableExercises = exercisesBox.values.where(
        (exercise) =>
            intensityFilter(exercise.intensity, settings.intensity) &&
            difficultyFilter(exercise.difficulty, settings.difficulty) &&
            exercise.impact == settings.impact &&
            settings.equipment.contains(exercise.equipment.toLowerCase()));
    // .where((exercise) => IUserSettingsFacade.isBlacklist(exercise.key));

    //= distribute exercises
    final Map<String, List<Exercise>> distributedExercises =
        distributeByTargets(availableExercises.toList());

    // TODO prefer favorites

    List<Exercise> randomizedExercises =
        randomizeExercises(distributedExercises);

    print('randomized length: ${(randomizedExercises.length * 30) / 60}');

    int order = -1;
    final Workout generated = Workout(
        items: availableExercises
            .map((exercise) => WorkoutItem(
                exercise: exercise,
                order: order += 1,
                duration: durationLength[settings.length]))
            .toList());
    print('generated with ${generated.items.length * 30 / 60} items');
    return generated;
  }

  /// Generates a new workout based on current settings
  /// and saves it into the currentWorkout key of the workouts box
  static Future<void> generateCurrentWorkout() async =>
      await workoutsBox.put(DataValues.currentWorkoutKey, generateWorkout());

  /// Distributes available exercises into lists based in their targets
  static Map<String, List<Exercise>> distributeByTargets(
          List<Exercise> availableExercises) =>
      Map.fromIterable(availableTargets,
          key: (target) => target,
          value: (target) => availableExercises
              .where((exercise) => exercise.target == target)
              .toList());

  //: Helper Methods_____________________________________________

  /// Returns random exercises from a list of exercises
  static List<Exercise> randomizeExercises(
      Map<String, List<Exercise>> distributedExercises) {
    List<Exercise> randomizedExercises = [];
    int currentIndex = 0;
    Random random = Random(1);
    Iterator<String> targetIterator = availableTargets.iterator;
    while (currentIndex <= IWorkoutFacade().roughtExerciseAmount) {
      if (targetIterator.current == null) targetIterator.moveNext();
      List<Exercise> targetedExercises =
          distributedExercises[targetIterator.current ?? availableTargets[0]];
      if (targetedExercises.length <= 0) continue;
      randomizedExercises
          .add(targetedExercises[random.nextInt(targetedExercises.length - 1)]);
      if (!targetIterator.moveNext())
        targetIterator = availableTargets.iterator;
      currentIndex++;
    }
    return randomizedExercises;
  }

  /// Intensity filter for exercise availability at generating a workout
  static bool intensityFilter(int exerciseIntensity, int settingsIntensity) {
    switch (settingsIntensity) {
      case 1:
        return exerciseIntensity <= 2;
      case 2:
        return exerciseIntensity <= 2;
      case 3:
        return exerciseIntensity <= 3;
      case 4:
        return exerciseIntensity >= 2 && exerciseIntensity <= 4;
      default:
        return false;
    }
  }

  /// Intensity filter for exercise availability at generating a workout
  static bool difficultyFilter(int exerciseDifficulty, int settingsDifficulty) {
    switch (settingsDifficulty) {
      case 1:
        return exerciseDifficulty <= 2;
      case 2:
        return exerciseDifficulty <= 3;
      case 3:
        return exerciseDifficulty <= 3;
      case 4:
        return exerciseDifficulty >= 2 && exerciseDifficulty <= 4;
      default:
        return false;
    }
  }
}
