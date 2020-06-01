import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/interfaces/workout.i.dart';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/domain/models/workout_item.dart';
import 'package:abs_up/domain/models/workout_settings.dart';
import 'package:abs_up/services/p_data.s.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkoutService implements WorkoutInterface {
  String workoutKey;
  final Box<Workout> workoutsBox = PDataService.workoutsBox;
  static final Uuid uuid = Uuid();
  @override
  final List<String> availableTargets = [
    'Core',
    'Lower',
    'Upper',
    'Rect',
    'Obliques',
    // TODO implement what to do with Kegel exercises (for now dey won't be included in the distirbution)
    // 'Kegel'
  ];

  WorkoutService();

  //: Getters _________________________________________________

  @override
  ValueListenable<Box<Workout>> get workoutsListenable =>
      workoutsBox.listenable();

  @override
  List<Workout> get allWorkouts => workoutsBox.values.toList();

  @override
  WorkoutSettings get workoutSettings =>
      // TODO set the statement below to return fallback default values
      PDataService.workoutSettingsBox.get(WORKOUT_SETTINGS_KEY);

  ValueListenable<Box<WorkoutSettings>> get workoutSettingsListenable =>
      PDataService.workoutSettingsBox.listenable(keys: [WORKOUT_SETTINGS_KEY]);

  bool get isCurrent => workoutKey == CURRENT_WORKOUT_KEY;

  @override
  Workout get currentWorkout => PDataService.workoutsBox.get(workoutKey);

  Workout workoutFromKey(String key) =>
      PDataService.workoutsBox.get(key, defaultValue: currentWorkout);

  /// Returns a rough amount exercises to include by the length set in settings
  @override
  int get roughtExerciseAmount =>
      workoutSettings.length <= 1 ? 9 : workoutSettings.length == 2 ? 18 : 20;

  ValueListenable<Box<Workout>> get listenable =>
      PDataService.workoutsBox.listenable(keys: [workoutKey]);

  @override
  Future<void> initWorkoutSettings() async {
    if (PDataService.workoutSettingsBox.containsKey(WORKOUT_SETTINGS_KEY)) {
      return;
    }
    await PDataService.workoutSettingsBox
        .put(WORKOUT_SETTINGS_KEY, WorkoutSettings());
    await PDataService.workoutsBox
        .put(CURRENT_WORKOUT_KEY, Workout(name: 'Workout'));
  }

  @override
  Workout generateWorkout() {
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
      duration =
          getWorkoutItemDuration(exercise.intensity, workoutSettings.length);
      exerciseItems.add(WorkoutItem(exercise: exercise, duration: duration));
      total += duration;
      if (total > minWorkoutLength) break;
    }

    //= add rest items
    final List<WorkoutItem> workoutItems = addRestItems(exerciseItems);

    //= set order of items and return final items
    Iterable.generate(workoutItems.length, (x) => x + 1).forEach(
        (iterationNumber) =>
            workoutItems[iterationNumber - 1].order = iterationNumber);
    return Workout(items: workoutItems);
  }

  @override
  Future<void> generateCurrentWorkout() async =>
      PDataService.workoutsBox.put(CURRENT_WORKOUT_KEY, generateWorkout());

  @override
  Future<void> saveCurrentWorkoutAs(String name) async {
    final Workout currentWorkout =
        PDataService.workoutsBox.get(CURRENT_WORKOUT_KEY);
    PDataService.workoutsBox
        .put(generateUniqueWorkoutKey(), currentWorkout.copyWith(name: name));
  }

  @override
  Future<void> saveNewWorkoutLogEntry(
          {@required List<WorkoutItem> items,
          @required String sourceWorkout}) async =>
      PDataService.workoutLogsBox.put(
          uuid.v4(),
          Workout(
            name: 'log entry',
            items: items,
            sourceWorkout: sourceWorkout,
          ));

  //: Helper Methods_____________________________________________

  /// Generates a unique key to save a new workout
  String generateUniqueWorkoutKey() {
    final List<String> savedWorkoutKey =
        PDataService.workoutsBox.keys.toList().cast<String>();
    String uniqueKey = uuid.v4();
    while (savedWorkoutKey.contains(uniqueKey)) {
      uniqueKey = uuid.v4();
    }
    return uniqueKey;
  }

  /// Get minimum workout duration by settings length
  int get minWorkoutLength {
    switch (workoutSettings.length) {
      case 1:
        return MINIMUM_DURATION_SHORT_LENGTH;
      case 2:
        return MINIMUM_DURATION_MEDIUM_LENGTH;
      case 3:
        return MINIMUM_DURATION_LONG_LENGTH;
    }
    return MINIMUM_DURATION_DEFAULT;
  }

  /// Workout item duration matrix
  int getWorkoutItemDuration(int intensity, int settingsLength) {
    const int short = WORKOUT_ITEM_DURATION_SHORT;
    const int medium = WORKOUT_ITEM_DURATION_MEDIUM;
    const int long = WORKOUT_ITEM_DURATION_LONG;

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
  List<Exercise> getAvailableExercises() => PDataService.exercisesBox.values
      .where((exercise) =>
          intensityFilter(exercise.intensity, workoutSettings.intensity) &&
          difficultyFilter(exercise.difficulty, workoutSettings.difficulty) &&
          exercise.impact == workoutSettings.impact &&
          workoutSettings.equipment
              .contains(exercise.equipment.toLowerCase()) &&
          exercise.tag != ExerciseTag.blacklisted.index &&
          exercise.name != 'Rest')
      .toList();

  /// Distributes available exercises into lists based in their targets
  Map<String, List<Exercise>> distributeByTargets(
          List<Exercise> availableExercises) =>
      Map.fromIterable(availableTargets,
          key: (target) => target as String,
          value: (target) => availableExercises
              .where((exercise) => exercise.target == target)
              .toList());

  /// Returns random exercises from a list of distributed exercises
  List<Exercise> randomizeExercises(
      Map<String, List<Exercise>> distributedExercises) {
    final List<Exercise> randomizedExercises = [];

    int currentIndex = 0;

    // consinuously iterate thru all available targets
    Iterator<String> targetIterator = availableTargets.iterator;
    while (currentIndex <= roughtExerciseAmount) {
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
  List<WorkoutItem> addRestItems(List<WorkoutItem> exerciseItems) {
    //= base duration of rest items
    const int baseInterval = 15;

    const List<int> intervalMatrix = [4, 3, 2];

    final WorkoutSettings settings = workoutSettings;

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
              exercise: PDataService.exercisesBox.values
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
