// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_log.m.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension WorkoutLogCopyWithExtension on WorkoutLog {
  WorkoutLog copyWith({
    List<PerformItem> items,
    String name,
    DateTime performedAt,
    String sourceWorkoutId,
    String sourceWorkoutName,
  }) {
    return WorkoutLog(
      items: items ?? this.items,
      name: name ?? this.name,
      performedAt: performedAt ?? this.performedAt,
      sourceWorkoutId: sourceWorkoutId ?? this.sourceWorkoutId,
      sourceWorkoutName: sourceWorkoutName ?? this.sourceWorkoutName,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutLog _$WorkoutLogFromJson(Map<String, dynamic> json) {
  return WorkoutLog(
    name: json['name'] as String,
    items: (json['items'] as List)
        .map((e) => PerformItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    sourceWorkoutName: json['sourceWorkoutName'] as String,
    sourceWorkoutId: json['sourceWorkoutId'] as String,
    performedAt: DateTime.parse(json['performedAt'] as String),
  );
}

Map<String, dynamic> _$WorkoutLogToJson(WorkoutLog instance) =>
    <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
      'performedAt': instance.performedAt.toIso8601String(),
      'sourceWorkoutName': instance.sourceWorkoutName,
      'sourceWorkoutId': instance.sourceWorkoutId,
    };
