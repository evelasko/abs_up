// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_item.m.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension WorkoutItemCopyWithExtension on WorkoutItem {
  WorkoutItem copyWith({
    int duration,
    String exerciseId,
    int order,
    int side,
    Map<String, dynamic> values,
  }) {
    return WorkoutItem(
      duration: duration ?? this.duration,
      exerciseId: exerciseId ?? this.exerciseId,
      order: order ?? this.order,
      side: side ?? this.side,
      values: values ?? this.values,
    );
  }
}
