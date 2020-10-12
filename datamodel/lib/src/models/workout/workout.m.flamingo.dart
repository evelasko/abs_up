// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum WorkoutKey {
  name,
  owner,
  sharedWith,
  items,
}

extension WorkoutKeyExtension on WorkoutKey {
  String get value {
    switch (this) {
      case WorkoutKey.name:
        return 'name';
      case WorkoutKey.owner:
        return 'owner';
      case WorkoutKey.sharedWith:
        return 'sharedWith';
      case WorkoutKey.items:
        return 'items';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Workout doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'owner', doc.owner);
  Helper.writeNotNull(data, 'sharedWith', doc.sharedWith);

  Helper.writeModelListNotNull(data, 'items', doc.items);

  return data;
}

/// For load data
void _$fromData(Workout doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.owner = Helper.valueFromKey<String>(data, 'owner');
  doc.sharedWith = Helper.valueListFromKey<String>(data, 'sharedWith');

  final _items = Helper.valueMapListFromKey<String, dynamic>(data, 'items');
  if (_items != null) {
    doc.items = _items
        .where((d) => d != null)
        .map((d) => WorkoutItem(values: d))
        .toList();
  } else {
    doc.items = null;
  }
}
