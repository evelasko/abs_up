import 'package:hive/hive.dart';

import 'exercise.dart';

part 'workout_item.g.dart';

@HiveType(typeId: 3, adapterName: 'WorkoutItemAdapter')
class WorkoutItem extends HiveObject {
  @HiveField(0)
  final Exercise exercise;
  @HiveField(1)
  int order;
  @HiveField(2)
  final int duration;
  @HiveField(3)
  double weight;
  @HiveField(4)
  int progress;

  WorkoutItem(
      {this.exercise,
      this.order,
      this.duration,
      this.weight = 0,
      this.progress = 0});

  /// Class overrides
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is WorkoutItem &&
        o.exercise == exercise &&
        o.order == order &&
        o.duration == duration &&
        o.weight == weight &&
        o.progress == progress;
  }

  WorkoutItem copyWith(
          {Exercise exercise,
          int order,
          int duration,
          double weight,
          int progress}) =>
      WorkoutItem(
          exercise: exercise ?? this.exercise,
          order: order ?? this.order,
          duration: duration ?? this.duration,
          weight: weight ?? this.weight,
          progress: progress ?? this.progress);

  @override
  int get hashCode => exercise.name.hashCode;
}
