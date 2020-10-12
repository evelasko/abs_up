// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ExerciseKey {
  name,
  difficulty,
  intensity,
  target,
  equipment,
  weighted,
  sided,
  impact,
  group,
  description,
  media,
  thumb,
  owner,
}

extension ExerciseKeyExtension on ExerciseKey {
  String get value {
    switch (this) {
      case ExerciseKey.name:
        return 'name';
      case ExerciseKey.difficulty:
        return 'difficulty';
      case ExerciseKey.intensity:
        return 'intensity';
      case ExerciseKey.target:
        return 'target';
      case ExerciseKey.equipment:
        return 'equipment';
      case ExerciseKey.weighted:
        return 'weighted';
      case ExerciseKey.sided:
        return 'sided';
      case ExerciseKey.impact:
        return 'impact';
      case ExerciseKey.group:
        return 'group';
      case ExerciseKey.description:
        return 'description';
      case ExerciseKey.media:
        return 'media';
      case ExerciseKey.thumb:
        return 'thumb';
      case ExerciseKey.owner:
        return 'owner';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Exercise doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'difficulty', doc.difficulty);
  Helper.writeNotNull(data, 'intensity', doc.intensity);
  Helper.writeNotNull(data, 'target', doc.target);
  Helper.writeNotNull(data, 'equipment', doc.equipment);
  Helper.writeNotNull(data, 'weighted', doc.weighted);
  Helper.writeNotNull(data, 'sided', doc.sided);
  Helper.writeNotNull(data, 'impact', doc.impact);
  Helper.writeNotNull(data, 'group', doc.group);
  Helper.writeNotNull(data, 'description', doc.description);
  Helper.writeNotNull(data, 'media', doc.media);
  Helper.writeNotNull(data, 'thumb', doc.thumb);
  Helper.writeNotNull(data, 'owner', doc.owner);

  return data;
}

/// For load data
void _$fromData(Exercise doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.difficulty = Helper.valueFromKey<int>(data, 'difficulty');
  doc.intensity = Helper.valueFromKey<int>(data, 'intensity');
  doc.target = Helper.valueFromKey<String>(data, 'target');
  doc.equipment = Helper.valueFromKey<String>(data, 'equipment');
  doc.weighted = Helper.valueFromKey<bool>(data, 'weighted');
  doc.sided = Helper.valueFromKey<bool>(data, 'sided');
  doc.impact = Helper.valueFromKey<bool>(data, 'impact');
  doc.group = Helper.valueFromKey<String>(data, 'group');
  doc.description = Helper.valueFromKey<String>(data, 'description');
  doc.media = Helper.valueFromKey<String>(data, 'media');
  doc.thumb = Helper.valueFromKey<String>(data, 'thumb');
  doc.owner = Helper.valueFromKey<String>(data, 'owner');
}
