import 'package:hive/hive.dart';

import '../../constants.dart';
import 'exercise.dart';
import 'workout_item.dart';

part 'workout.g.dart';

@HiveType(typeId: 4, adapterName: 'WorkoutAdapter')
class Workout extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<WorkoutItem> items;
  @HiveField(2)
  DateTime createdAt;
  @HiveField(3)
  String sourceWorkout;

  Workout({
    this.name = 'untitled',
    this.items = const [],
    this.sourceWorkout = CURRENT_WORKOUT_KEY,
  }) {
    createdAt = DateTime.now();
  }

  /// Update workout item
  Future<void> updateWorkoutItem(int index,
      {Exercise exercise, int order, int duration, int side}) async {
    if (index + 1 > items.length) return;
    final WorkoutItem oldItem = items[index];
    if (oldItem == null) return;
    items[index] = oldItem.copyWith(
      exercise: exercise,
      order: order,
      duration: duration,
      side: side,
    );
    if (isInBox) await save();
  }

  /// Getters
  Duration get totalDuration => Duration(
      seconds: items.fold(0, (prev, element) => prev + element.duration));

  String get totalDurationString =>
      RegExp(r'\d{2}\:\d{2}(?=\.)').stringMatch(totalDuration.toString()) ??
      '00:00';

  List<String> get equipmentTotal =>
      Set.from(items.map((item) => item.exercise.equipment.toLowerCase()))
          .toList()
          .cast<String>();

  int get intensityAverage =>
      items.map((e) => e.exercise.intensity).toList().reduce((a, b) => a + b) ~/
      items.length;

  String get intensityAverageString => intensityToString(intensityAverage);

  int get difficultyAverage =>
      items
          .map((e) => e.exercise.difficulty)
          .toList()
          .reduce((a, b) => a + b) ~/
      items.length;

  String get difficultyAverageString => difficultyToString(difficultyAverage);

  /// Custom methods
  Future<void> reorderItems(int oldIndex, int newIndex) async {
    final int _index = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final item = items.removeAt(oldIndex);
    items.insert(_index, item);
    _refreshOrder();
    if (isInBox) await save();
  }

  void _refreshOrder() => Iterable.generate(items.length, (x) => x + 1).forEach(
      (iterationNumber) => items[iterationNumber - 1].order = iterationNumber);

  Future<void> removeItem(WorkoutItem item) async {
    items.removeWhere((workoutItem) => workoutItem == item);
    _refreshOrder();
    if (isInBox) await save();
  }

  // Workout copyWith({String name, List<WorkoutItem> items }) => Workout(
  //     name: name ?? this.name + DateTime.now().toIso8601String(),
  //     items: items ?? this.items
  //       .map((item) => WorkoutItem(

  //       )).toList(),
  //       );

  Workout copy() => Workout(name: name, items: items);
}
