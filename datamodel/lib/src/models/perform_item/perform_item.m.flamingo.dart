// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perform_item.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum PerformItemKey {
  exerciseId,
  order,
  duration,
  side,
  weight,
  progress,
}

extension PerformItemKeyExtension on PerformItemKey {
  String get value {
    switch (this) {
      case PerformItemKey.exerciseId:
        return 'exerciseId';
      case PerformItemKey.order:
        return 'order';
      case PerformItemKey.duration:
        return 'duration';
      case PerformItemKey.side:
        return 'side';
      case PerformItemKey.weight:
        return 'weight';
      case PerformItemKey.progress:
        return 'progress';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(PerformItem doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'exerciseId', doc.exerciseId);
  Helper.writeNotNull(data, 'order', doc.order);
  Helper.writeNotNull(data, 'duration', doc.duration);
  Helper.writeNotNull(data, 'side', doc.side);
  Helper.writeNotNull(data, 'weight', doc.weight);
  Helper.writeNotNull(data, 'progress', doc.progress);

  return data;
}

/// For load data
void _$fromData(PerformItem doc, Map<String, dynamic> data) {
  doc.exerciseId = Helper.valueFromKey<String>(data, 'exerciseId');
  doc.order = Helper.valueFromKey<int>(data, 'order');
  doc.duration = Helper.valueFromKey<int>(data, 'duration');
  doc.side = Helper.valueFromKey<int>(data, 'side');
  doc.weight = Helper.valueFromKey<double>(data, 'weight');
  doc.progress = Helper.valueFromKey<int>(data, 'progress');
}
