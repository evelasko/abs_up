import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../constants.dart';
import '../domain/interfaces/workout.i.dart';
import '../domain/models/exercise.dart';
import '../domain/models/workout.dart';
import '../domain/models/workout_item.dart';
import '../domain/models/workout_settings.dart';
import 'utils/generate_unique_key.dart';

@singleton
@RegisterAs(WorkoutInterface)
class WorkoutService implements WorkoutInterface {
  @factoryMethod
  static Future<WorkoutService> init() async {
    final singleton = WorkoutService();
    return singleton;
  }

  Box<Workout> get _workoutsBox => Hive.box(WORKOUTS_BOX_NAME);

  @override
  final List<String> availableTargets = [
    'Core',
    'Lower',
    'Upper',
    'Rect',
    'Obliques',
    // 'Kegel'
  ];

  @override
  List<Workout> get allWorkouts => _workoutsBox.values.toList();

  @override
  List<Workout> get allUserWorkouts =>
      _workoutsBox.values.where((w) => w.key != CURRENT_WORKOUT_KEY).toList();

  @override
  Workout getWorkout([String key = CURRENT_WORKOUT_KEY]) =>
      _workoutsBox.get(key ?? CURRENT_WORKOUT_KEY,
          defaultValue: _workoutsBox.get(CURRENT_WORKOUT_KEY));

  @override
  void registerListener(void Function() listener) =>
      _workoutsBox.listenable().addListener(listener);

  @override
  Future<void> saveWorkout(
          {String key = CURRENT_WORKOUT_KEY,
          @required Workout workout}) async =>
      _workoutsBox.put(key, workout);

  @override
  Future<void> deleteWorkout(String workoutKey) =>
      _workoutsBox.delete(workoutKey);

  @override
  Future<String> saveCurrentWorkoutAs(String name) async {
    // TODO should check for errors and return an Either
    final Workout workout = getWorkout().copy()..name = name;
    final String key =
        generateUniqueKey(_workoutsBox.keys.toList().cast<String>());
    await _workoutsBox.put(key, workout);
    return key;
  }

  @override
  Workout generateWorkout(List<Exercise> exercises, WorkoutSettings settings) {
    //= filter exercises
    final List<Exercise> availableExercises = getAvailableExercises(
      exercises,
      settings,
    );

    //= distribute exercises
    final Map<String, List<Exercise>> distributedExercises =
        _distributeByTargets(availableExercises);

    //= randomize by targets
    final List<Exercise> randomizedExercises = _randomizeExercises(
        distributedExercises, _getRoughExerciseAmount(settings));

    //= sort randomized exercises by intensity
    randomizedExercises
        .sort((exA, exB) => exA.intensity.compareTo(exB.intensity));

    //= build exerciseItems
    final List<WorkoutItem> exerciseItems = [];
    int total = 0;
    for (final exercise in randomizedExercises) {
      int duration = 0;
      duration = _getWorkoutItemDuration(exercise.intensity, settings.length);
      exerciseItems.add(WorkoutItem(exercise: exercise, duration: duration));
      total += duration;
      if (total > _getMinWorkoutLength(settings)) break;
    }

    //= add rest items
    final Exercise rest =
        exercises.where((exercise) => exercise.name == 'Rest').first;
    final List<WorkoutItem> workoutItems =
        _addRestItems(exerciseItems, settings, rest);

    //= set order of items and return final items
    Iterable.generate(workoutItems.length, (x) => x + 1).forEach(
        (iterationNumber) =>
            workoutItems[iterationNumber - 1].order = iterationNumber);

    return Workout(items: workoutItems);
  }

  /// Returns a rough amount exercises to include by the length set in settings
  int _getRoughExerciseAmount(WorkoutSettings settings) =>
      settings.length <= 1 ? 9 : settings.length == 2 ? 18 : 20;

  /// Get minimum workout duration by settings length
  int _getMinWorkoutLength(WorkoutSettings settings) {
    switch (settings.length) {
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
  int _getWorkoutItemDuration(int intensity, int settingsLength) {
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

  @override
  List<Exercise> getAvailableExercises(
          List<Exercise> allExercises, WorkoutSettings settings) =>
      allExercises
          .where((exercise) =>
              _intensityFilter(exercise.intensity, settings.intensity) &&
              _difficultyFilter(exercise.difficulty, settings.difficulty) &&
              exercise.impact == settings.impact &&
              settings.equipment.contains(exercise.equipment.toLowerCase()) &&
              exercise.tag != ExerciseTag.blacklisted.index &&
              exercise.name != 'Rest')
          .toList();

  /// Distributes available exercises into lists based in their targets
  Map<String, List<Exercise>> _distributeByTargets(
          List<Exercise> availableExercises) =>
      Map.fromIterable(availableTargets,
          key: (target) => target as String,
          value: (target) => availableExercises
              .where((exercise) => exercise.target == target)
              .toList());

  /// Returns random exercises from a list of distributed exercises
  List<Exercise> _randomizeExercises(
      Map<String, List<Exercise>> distributedExercises,
      int roughExerciseAmount) {
    final List<Exercise> randomizedExercises = [];

    int currentIndex = 0;

    //= consinuously iterate thru all available targets
    Iterator<String> targetIterator = availableTargets.iterator;
    while (currentIndex <= roughExerciseAmount) {
      if (targetIterator.current == null) targetIterator.moveNext();
      if (distributedExercises[targetIterator.current].isEmpty) continue;

      //= shuffle the targeted list
      distributedExercises[targetIterator.current].shuffle();
      //= extract the last exercise and add it to the returned list
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
  List<WorkoutItem> _addRestItems(List<WorkoutItem> exerciseItems,
      WorkoutSettings settings, Exercise rest) {
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
          index, WorkoutItem(exercise: rest, duration: interval));
    });
    return exerciseAndRestItems;
  }

  /// Intensity filter for exercise availability at generating a workout
  static bool _intensityFilter(int exerciseIntensity, int settingsIntensity) {
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
  static bool _difficultyFilter(
      int exerciseDifficulty, int settingsDifficulty) {
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
