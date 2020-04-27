import 'package:data_setup/domain/models/workout_item.dart';
import 'package:hive/hive.dart';

import 'exercise.dart';

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

  Workout({this.name = 'untitled', this.items, this.sourceWorkout}) {
    createdAt = DateTime.now();
  }

  /// Update workout item
  Future<void> updateWorkoutItem(int index,
      {Exercise exercise,
      int order,
      int duration,
      double weight,
      int progress}) async {
    final WorkoutItem oldItem = items[index];
    if (oldItem == null) return;
    items.replaceRange(index, index + 1, [
      WorkoutItem(
          exercise: exercise ?? oldItem.exercise,
          order: order ?? oldItem.order,
          duration: duration ?? oldItem.duration,
          weight: weight ?? oldItem.weight,
          progress: progress ?? oldItem.progress)
    ]);
    if (isInBox) await save();
  }

  /// Getters
  Duration get totalDuration {
    Duration totalDuration = const Duration(seconds: 0);
    for (final item in items) {
      totalDuration += Duration(seconds: item.duration);
    }
    return totalDuration;
  }

  String get totalDurationString =>
      RegExp(r'\d{2}\:\d{2}(?=\.)').stringMatch(totalDuration.toString()) ??
      '00:00';

  List<String> get equipmentTotal =>
      Set.from(items.map((item) => item.exercise.equipment.toLowerCase()))
          .toList()
          .cast<String>();

  /// Custom methods
  Future<void> reorderItems(int oldIndex, int newIndex) async {
    final int _index = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final item = items.removeAt(oldIndex);
    items.insert(_index, item);
    refreshOrder();
    save();
  }

  void refreshOrder() => Iterable.generate(items.length, (x) => x + 1).forEach(
      (iterationNumber) => items[iterationNumber - 1].order = iterationNumber);

  Future<void> removeItem(WorkoutItem item) async {
    items.removeWhere((workoutItem) => workoutItem == item);
    refreshOrder();
    if (isInBox) await save();
  }

  Workout copyWith({String name, List<WorkoutItem> items}) => Workout(
      name: name ?? this.name + DateTime.now().toIso8601String(),
      items: items ?? this.items);

  Workout copy() => Workout(name: name, items: items);

  /// Class overrides
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Workout && o.name == name && o.items.length == items.length;
  }

  @override
  int get hashCode => name.hashCode;
}
