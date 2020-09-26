import 'package:hive/hive.dart';

import 'exercise.dart';

part 'perform_item.g.dart';

@HiveType(typeId: 5, adapterName: 'PerformItemAdapter')
class PerformItem extends HiveObject {
  @HiveField(0)
  final Exercise exercise;
  @HiveField(1)
  int order;
  @HiveField(2)
  final int duration;
  @HiveField(3)
  final int side;
  @HiveField(4)
  double weight;
  @HiveField(5)
  int progress;

  PerformItem(
      {this.exercise,
      this.order,
      this.duration,
      this.side = 0,
      this.weight = 0,
      this.progress = 0});

  /// Class overrides
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is PerformItem &&
        o.exercise == exercise &&
        o.order == order &&
        o.duration == duration &&
        o.side == side &&
        o.weight == weight &&
        o.progress == progress;
  }

  PerformItem copyWith(
          {Exercise exercise,
          int order,
          int duration,
          int side,
          double weight,
          int progress}) =>
      PerformItem(
          exercise: exercise ?? this.exercise,
          order: order ?? this.order,
          duration: duration ?? this.duration,
          side: side ?? this.side,
          weight: weight ?? this.weight,
          progress: progress ?? this.progress);

  @override
  int get hashCode => exercise.name.hashCode;
}
