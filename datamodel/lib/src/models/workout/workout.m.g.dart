// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.m.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension WorkoutCopyWithExtension on Workout {
  Workout copyWith({
    DateTime createdAt,
    List<WorkoutItem> items,
    String name,
    String ownerId,
    String uid,
  }) {
    return Workout(
      createdAt: createdAt ?? this.createdAt,
      items: items ?? this.items,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      uid: uid ?? this.uid,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return Workout(
    uid: json['uid'] as String,
    ownerId: json['ownerId'] as String,
    name: json['name'] as String,
    items: (json['items'] as List)
        .map((e) => WorkoutItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'ownerId': instance.ownerId,
      'items': instance.items,
      'createdAt': instance.createdAt.toIso8601String(),
    };
