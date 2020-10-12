// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_item.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum WorkoutItemKey {
  exerciseId,
  order,
  duration,
  side,
}

extension WorkoutItemKeyExtension on WorkoutItemKey {
  String get value {
    switch (this) {
      case WorkoutItemKey.exerciseId:
        return 'exerciseId';
      case WorkoutItemKey.order:
        return 'order';
      case WorkoutItemKey.duration:
        return 'duration';
      case WorkoutItemKey.side:
        return 'side';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(WorkoutItem doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'exerciseId', doc.exerciseId);
  Helper.writeNotNull(data, 'order', doc.order);
  Helper.writeNotNull(data, 'duration', doc.duration);
  Helper.writeNotNull(data, 'side', doc.side);

  return data;
}

/// For load data
void _$fromData(WorkoutItem doc, Map<String, dynamic> data) {
  doc.exerciseId = Helper.valueFromKey<String>(data, 'exerciseId');
  doc.order = Helper.valueFromKey<int>(data, 'order');
  doc.duration = Helper.valueFromKey<int>(data, 'duration');
  doc.side = Helper.valueFromKey<int>(data, 'side');
}
