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
  final int side;

  WorkoutItem({
    this.exercise,
    this.order,
    this.duration,
    this.side = 0,
  });

  /// Class overrides
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is WorkoutItem &&
        o.exercise == exercise &&
        o.order == order &&
        o.duration == duration &&
        o.side == side;
  }

  WorkoutItem copyWith({
    Exercise exercise,
    int order,
    int duration,
    int side,
  }) =>
      WorkoutItem(
        exercise: exercise ?? this.exercise,
        order: order ?? this.order,
        duration: duration ?? this.duration,
        side: side ?? this.side,
      );

  @override
  int get hashCode => exercise.name.hashCode;
}
