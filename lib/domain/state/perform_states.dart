import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/perform_item.dart';
import 'package:abs_up/domain/models/workout_item.dart';
import 'package:flutter/foundation.dart';

enum PerformingItemStatus {
  initial,
  presenting,
  ready,
  performing,
  waiting,
  performed,
}
enum PerformState {
  idle,
  welcoming,
  // initial,
  // started,
  performing,
  standby,
  paused,
  done
}

class PerformingItem extends PerformItem {
  final PerformingItemStatus status;

  PerformingItem({
    @required this.status,
    @required PerformItem item,
  }) : super(
          exercise: item.exercise,
          order: item.order,
          duration: item.duration,
          side: item.side,
          weight: item.weight,
          progress: item.progress,
        );

  /// Creates a PerformingItem from a WorkoutItem
  /// with weight and progress initialized with 0
  /// and status: initial
  PerformingItem.fromWorkoutItem({
    this.status = PerformingItemStatus.initial,
    @required WorkoutItem item,
  }) : super(
            exercise: item.exercise,
            order: item.order,
            duration: item.duration,
            side: item.side,
            weight: 0,
            progress: 0);

  /// Returns a copy of the instance with progress incremented
  PerformingItem incrementProgressOneUnit() => copyWith(progress: progress + 1);

  @override
  PerformingItem copyWith({
    PerformingItemStatus status,
    Exercise exercise,
    int order,
    int duration,
    int side,
    double weight,
    int progress,
  }) =>
      PerformingItem(
        status: status ?? this.status,
        item: PerformItem(
          exercise: exercise ?? this.exercise,
          order: order ?? this.order,
          duration: duration ?? this.duration,
          side: side ?? this.side,
          weight: weight ?? this.weight,
          progress: progress ?? this.progress,
        ),
      );

  PerformItem fold() => PerformItem(
        exercise: exercise,
        order: order,
        duration: duration,
        side: side,
        weight: weight,
        progress: progress,
      );
}
