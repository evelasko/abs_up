// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_item.m.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension WorkoutItemCopyWithExtension on WorkoutItem {
  WorkoutItem copyWith({
    int duration,
    Exercise exercise,
    int order,
    int side,
  }) {
    return WorkoutItem(
      duration: duration ?? this.duration,
      exercise: exercise ?? this.exercise,
      order: order ?? this.order,
      side: side ?? this.side,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutItem _$WorkoutItemFromJson(Map<String, dynamic> json) {
  return WorkoutItem(
    exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
    order: json['order'] as int,
    duration: json['duration'] as int,
    side: json['side'] as int,
  );
}

Map<String, dynamic> _$WorkoutItemToJson(WorkoutItem instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
      'order': instance.order,
      'duration': instance.duration,
      'side': instance.side,
    };
