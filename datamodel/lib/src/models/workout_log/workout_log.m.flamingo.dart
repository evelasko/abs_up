// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_log.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum WorkoutLogKey {
  name,
  performedAt,
  sourceWorkoutName,
  sourceWorkoutId,
  items,
}

extension WorkoutLogKeyExtension on WorkoutLogKey {
  String get value {
    switch (this) {
      case WorkoutLogKey.name:
        return 'name';
      case WorkoutLogKey.performedAt:
        return 'performedAt';
      case WorkoutLogKey.sourceWorkoutName:
        return 'sourceWorkoutName';
      case WorkoutLogKey.sourceWorkoutId:
        return 'sourceWorkoutId';
      case WorkoutLogKey.items:
        return 'items';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(WorkoutLog doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'performedAt', doc.performedAt);
  Helper.writeNotNull(data, 'sourceWorkoutName', doc.sourceWorkoutName);
  Helper.writeNotNull(data, 'sourceWorkoutId', doc.sourceWorkoutId);

  Helper.writeModelListNotNull(data, 'items', doc.items);

  return data;
}

/// For load data
void _$fromData(WorkoutLog doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.performedAt = Helper.valueFromKey<DateTime>(data, 'performedAt');
  doc.sourceWorkoutName =
      Helper.valueFromKey<String>(data, 'sourceWorkoutName');
  doc.sourceWorkoutId = Helper.valueFromKey<String>(data, 'sourceWorkoutId');

  final _items = Helper.valueMapListFromKey<String, dynamic>(data, 'items');
  if (_items != null) {
    doc.items = _items
        .where((d) => d != null)
        .map((d) => PerformItem(values: d))
        .toList();
  } else {
    doc.items = null;
  }
}
