import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../models/exercise.dart';
import '../models/workout.dart';
import '../models/workout_item.dart';
import '../models/workout_settings.dart';
import 'data_values.dart';
import 'i_hive_facade.dart';

class IWorkoutFacade {
  static Box workoutSettingsBox = IHiveFacade.workoutSettingsBox;
  static Box<Workout> workoutsBox = IHiveFacade.workoutsBox;
  static Box<Exercise> exercisesBox = IHiveFacade.exercisesBox;
  static Box<Workout> workoutLogsBox = IHiveFacade.workoutLogsBox;
  static final WorkoutSettings settings =
      workoutSettingsBox.get(DataValues.workoutSettingsKey) as WorkoutSettings;
  final Workout currentWorkout = workoutsBox.get(DataValues.currentWorkoutKey);
  static final Uuid uuid = Uuid();

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
  static WorkoutSettings get workoutSettings =>
      workoutSettingsBox.get(DataValues.workoutSettingsKey) as WorkoutSettings;

  /// Returns a rough amount exercises to include by the length set in settings
  int get roughtExerciseAmount => IWorkoutFacade.workoutSettings.length <= 1
      ? 9
      : IWorkoutFacade.workoutSettings.length == 2 ? 18 : 20;

  //: Main methods ___________________________________________
  /// defaultWorkout initializer
  static Future<void> initWorkoutSettings() async {
    if (workoutSettingsBox.containsKey(DataValues.workoutSettingsKey)) return;

    await workoutSettingsBox.put(
        DataValues.workoutSettingsKey, WorkoutSettings());
    await workoutsBox.put(
        DataValues.currentWorkoutKey, Workout(name: 'Workout'));
  }

  /// Generates a new workout based on current settings
  static Workout generateWorkout() {
    //= filter exercises
    final List<Exercise> availableExercises = getAvailableExercises();

    //= distribute exercises
    final Map<String, List<Exercise>> distributedExercises =
        distributeByTargets(availableExercises);

    //= randomize by targets
    final List<Exercise> randomizedExercises =
        randomizeExercises(distributedExercises);

    //= sort randomized exercises by intensity
    randomizedExercises
        .sort((exA, exB) => exA.intensity.compareTo(exB.intensity));

    //= build exerciseItems
    final List<WorkoutItem> exerciseItems = [];
    int total = 0;
    for (final exercise in randomizedExercises) {
      int duration = 0;
      duration = getWorkoutItemDuration(exercise.intensity, settings.length);
      exerciseItems.add(WorkoutItem(exercise: exercise, duration: duration));
      total += duration;
      if (total > IWorkoutFacade.minWorkoutLength) break;
    }

    //= add rest items
    final List<WorkoutItem> workoutItems = addRestItems(exerciseItems);

    //= set order of items and return final items
    Iterable.generate(workoutItems.length, (x) => x + 1).forEach(
        (iterationNumber) =>
            workoutItems[iterationNumber - 1].order = iterationNumber);
    return Workout(items: workoutItems);
  }

  /// Generates a new workout based on current settings
  /// and saves it into the currentWorkout key of the workouts box
  static Future<void> generateCurrentWorkout() async =>
      workoutsBox.put(DataValues.currentWorkoutKey, generateWorkout());

  static Future<void> saveCurrentWorkoutAs(String name) async {
    final Workout currentWorkout =
        workoutsBox.get(DataValues.currentWorkoutKey);
    workoutsBox.put(
        generateUniqueWorkoutKey(), currentWorkout.copyWith(name: name));
  }

  static Future<void> saveNewWorkoutLogEntry(
          {@required List<WorkoutItem> items,
          @required String sourceWorkout}) async =>
      workoutLogsBox.put(
          uuid.v4(),
          Workout(
            name: 'log entry',
            items: items,
            sourceWorkout: sourceWorkout,
          ));

  //: Helper Methods_____________________________________________

  /// Generates a unique key to save a new workout
  static String generateUniqueWorkoutKey() {
    final List<String> savedWorkoutKey =
        workoutsBox.keys.toList().cast<String>();
    String uniqueKey = uuid.v4();
    while (savedWorkoutKey.contains(uniqueKey)) {
      uniqueKey = uuid.v4();
    }
    return uniqueKey;
  }

  /// Get minimum workout duration by settings length
  static int get minWorkoutLength {
    switch (IWorkoutFacade.workoutSettings.length) {
      case 1:
        return DataValues.minimumDurationShortLength;
      case 2:
        return DataValues.minimumDurationMediumLength;
      case 3:
        return DataValues.minimumDurationLongLength;
    }
    return DataValues.minimumDurationDefault;
  }

  /// Workout item duration matrix
  static int getWorkoutItemDuration(int intensity, int settingsLength) {
    const int short = DataValues.workoutItemDurationShort;
    const int medium = DataValues.workoutItemDurationMedium;
    const int long = DataValues.workoutItemDurationLong;

    switch (settingsLength) {
      case 1:
        if (intensity == 1) return medium;
        return short;
        break;
      case 2:
        if (intensity <= 2) return long;
        if (intensity == 3) return medium;
        return short;
        break;
      case 3:
        if (intensity <= 3) return long;
        return medium;
        break;
      default:
        return short;
    }
  }

  /// Filter exercises base on current workout settings
  static List<Exercise> getAvailableExercises() => exercisesBox.values
      .where((exercise) =>
          intensityFilter(exercise.intensity, settings.intensity) &&
          difficultyFilter(exercise.difficulty, settings.difficulty) &&
          exercise.impact == settings.impact &&
          settings.equipment.contains(exercise.equipment.toLowerCase()) &&
          exercise.tag != ExerciseTag.blacklisted.index &&
          exercise.name != 'Rest')
      .toList();

  /// Distributes available exercises into lists based in their targets
  static Map<String, List<Exercise>> distributeByTargets(
          List<Exercise> availableExercises) =>
      Map.fromIterable(availableTargets,
          key: (target) => target as String,
          value: (target) => availableExercises
              .where((exercise) => exercise.target == target)
              .toList());

  /// Returns random exercises from a list of distributed exercises
  static List<Exercise> randomizeExercises(
      Map<String, List<Exercise>> distributedExercises) {
    final List<Exercise> randomizedExercises = [];

    int currentIndex = 0;

    // consinuously iterate thru all available targets
    Iterator<String> targetIterator = availableTargets.iterator;
    while (currentIndex <= IWorkoutFacade().roughtExerciseAmount) {
      if (targetIterator.current == null) targetIterator.moveNext();
      if (distributedExercises[targetIterator.current].isEmpty) continue;

      // shuffle the targeted list
      distributedExercises[targetIterator.current].shuffle();
      // extract the last exercise and add it to the returned list
      randomizedExercises
          .add(distributedExercises[targetIterator.current].removeLast());
      if (!targetIterator.moveNext()) {
        targetIterator = availableTargets.iterator;
      }
      currentIndex++;
    }
    return randomizedExercises;
  }

  /// Returns the exercise items with rest items included
  static List<WorkoutItem> addRestItems(List<WorkoutItem> exerciseItems) {
    //= base duration of rest items
    const int baseInterval = 15;

    const List<int> intervalMatrix = [4, 3, 2];

    //= set rest interval duration
    final int interval = settings.intensity != 4
        ? baseInterval * intervalMatrix[settings.intensity - 1]
        : settings.length == 2
            ? baseInterval * 3
            : settings.length == 3 ? baseInterval * 2 : 0;
    //= set frequency of rest intervals
    final int frequency = settings.intensity != 4
        ? settings.length
        : settings.length - 1; //this yields: 1 = 0, 2 = 1, 3 = 2

    //= length 1 intensity 1 has no rest intervals thus returns the same
    if (frequency == 0) return exerciseItems;

    final List<WorkoutItem> exerciseAndRestItems = [...exerciseItems];

    final int workBlock =
        (exerciseItems.length / (frequency + 1)).floorToDouble().toInt();

    Iterable.generate(frequency, (x) => x + 1).forEach((iterationNumber) {
      final int index = exerciseItems.length - (workBlock * iterationNumber);
      exerciseAndRestItems.insert(
          index,
          WorkoutItem(
              exercise: IHiveFacade.exercisesBox.values
                  .where((exercise) => exercise.name == 'Rest')
                  .first,
              duration: interval));
    });
    return exerciseAndRestItems;
  }

  /// Intensity filter for exercise availability at generating a workout
  static bool intensityFilter(int exerciseIntensity, int settingsIntensity) {
    switch (settingsIntensity) {
      case 1:
        return exerciseIntensity <= 3;
      case 2:
        return exerciseIntensity <= 3;
      case 3:
        return exerciseIntensity <= 4;
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
