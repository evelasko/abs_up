// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_settings.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum WorkoutSettingsKey {
  length,
  intensity,
  difficulty,
  impact,
  equipment,
}

extension WorkoutSettingsKeyExtension on WorkoutSettingsKey {
  String get value {
    switch (this) {
      case WorkoutSettingsKey.length:
        return 'length';
      case WorkoutSettingsKey.intensity:
        return 'intensity';
      case WorkoutSettingsKey.difficulty:
        return 'difficulty';
      case WorkoutSettingsKey.impact:
        return 'impact';
      case WorkoutSettingsKey.equipment:
        return 'equipment';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(WorkoutSettings doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'length', doc.length);
  Helper.writeNotNull(data, 'intensity', doc.intensity);
  Helper.writeNotNull(data, 'difficulty', doc.difficulty);
  Helper.writeNotNull(data, 'impact', doc.impact);
  Helper.writeNotNull(data, 'equipment', doc.equipment);

  return data;
}

/// For load data
void _$fromData(WorkoutSettings doc, Map<String, dynamic> data) {
  doc.length = Helper.valueFromKey<int>(data, 'length');
  doc.intensity = Helper.valueFromKey<int>(data, 'intensity');
  doc.difficulty = Helper.valueFromKey<int>(data, 'difficulty');
  doc.impact = Helper.valueFromKey<bool>(data, 'impact');
  doc.equipment = Helper.valueListFromKey<String>(data, 'equipment');
}
