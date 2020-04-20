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

  Workout({
    this.name = 'untitled',
    this.items,
  }) {
    this.createdAt = DateTime.now();
  }

  Future<void> updateWorkoutItem(int index,
      {Exercise exercise,
      int order,
      int duration,
      double weight,
      int progress}) async {
    WorkoutItem oldItem = this.items[index];
    if (oldItem == null) return;
    items.replaceRange(index, index + 1, [
      WorkoutItem(
          exercise: exercise ?? oldItem.exercise,
          order: order ?? oldItem.order,
          duration: duration ?? oldItem.duration,
          weight: weight ?? oldItem.weight,
          progress: progress ?? oldItem.progress)
    ]);
    if (this.isInBox) await this.save();
  }

  /// Getters
  Duration get totalDuration {
    Duration totalDuration = Duration(seconds: 0);
    items.forEach((item) => totalDuration += Duration(seconds: item.duration));
    return totalDuration;
  }

  String get totalDurationString =>
      RegExp(r'\d{2}\:\d{2}(?=\.)')
          .stringMatch(this.totalDuration.toString()) ??
      '00:00';

  List<String> get equipmentTotal =>
      Set.from(items.map((item) => item.exercise.equipment.toLowerCase()))
          .toList()
          .cast<String>();

  /// Custom methods
  Future<void> reorderItems(int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) newIndex -= 1;
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    refreshOrder();
    this.save();
  }

  void refreshOrder() => Iterable.generate(items.length, (x) => x + 1).forEach(
      (iterationNumber) => items[iterationNumber - 1].order = iterationNumber);

  Future<void> removeItem(WorkoutItem item) async {
    items.removeWhere((workoutItem) => workoutItem == item);
    refreshOrder();
    if (isInBox) await this.save();
  }

  Workout copyWith({String name, List<WorkoutItem> items}) => Workout(
      name: name ?? this.name + DateTime.now().toIso8601String(),
      items: items ?? this.items);

  /// Class overrides
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Workout && o.name == name && o.items.length == items.length;
  }

  @override
  int get hashCode => name.hashCode;
}
