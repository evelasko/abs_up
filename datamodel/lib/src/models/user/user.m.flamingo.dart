// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum UserKey {
  displayName,
  workoutSettings,

  workoutLog,
}

extension UserKeyExtension on UserKey {
  String get value {
    switch (this) {
      case UserKey.displayName:
        return 'displayName';
      case UserKey.workoutSettings:
        return 'workoutSettings';
      case UserKey.workoutLog:
        return 'workoutLog';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(User doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'displayName', doc.displayName);

  Helper.writeModelNotNull(data, 'workoutSettings', doc.workoutSettings);

  return data;
}

/// For load data
void _$fromData(User doc, Map<String, dynamic> data) {
  doc.displayName = Helper.valueFromKey<String>(data, 'displayName');

  final _workoutSettings =
      Helper.valueMapFromKey<String, dynamic>(data, 'workoutSettings');
  if (_workoutSettings != null) {
    doc.workoutSettings = WorkoutSettings(values: _workoutSettings);
  } else {
    doc.workoutSettings = null;
  }
}
