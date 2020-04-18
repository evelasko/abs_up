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

  /// Class overrides
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Workout && o.name == name && o.items.length == items.length;
  }

  @override
  int get hashCode => name.hashCode;
}
