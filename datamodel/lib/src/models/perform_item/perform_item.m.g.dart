// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perform_item.m.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension PerformItemCopyWithExtension on PerformItem {
  PerformItem copyWith({
    int duration,
    Exercise exercise,
    int order,
    int progress,
    int side,
    double weight,
  }) {
    return PerformItem(
      duration: duration ?? this.duration,
      exercise: exercise ?? this.exercise,
      order: order ?? this.order,
      progress: progress ?? this.progress,
      side: side ?? this.side,
      weight: weight ?? this.weight,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerformItem _$PerformItemFromJson(Map<String, dynamic> json) {
  return PerformItem(
    exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
    order: json['order'] as int,
    duration: json['duration'] as int,
    side: json['side'] as int,
    weight: (json['weight'] as num).toDouble(),
    progress: json['progress'] as int,
  );
}

Map<String, dynamic> _$PerformItemToJson(PerformItem instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
      'order': instance.order,
      'duration': instance.duration,
      'side': instance.side,
      'weight': instance.weight,
      'progress': instance.progress,
    };
