// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.m.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ExerciseCopyWithExtension on Exercise {
  Exercise copyWith({
    String description,
    int difficulty,
    String equipment,
    String group,
    bool impact,
    int intensity,
    String media,
    String name,
    String owner,
    bool sided,
    String target,
    String thumb,
    bool weighted,
  }) {
    return Exercise(
      description: description ?? this.description,
      difficulty: difficulty ?? this.difficulty,
      equipment: equipment ?? this.equipment,
      group: group ?? this.group,
      impact: impact ?? this.impact,
      intensity: intensity ?? this.intensity,
      media: media ?? this.media,
      name: name ?? this.name,
      owner: owner ?? this.owner,
      sided: sided ?? this.sided,
      target: target ?? this.target,
      thumb: thumb ?? this.thumb,
      weighted: weighted ?? this.weighted,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return Exercise(
    owner: json['owner'] as String,
    description: json['description'] as String,
    media: json['media'] as String,
    thumb: json['thumb'] as String,
    impact: json['impact'] as bool,
    group: json['group'] as String,
    name: json['name'] as String,
    difficulty: json['difficulty'] as int,
    intensity: json['intensity'] as int,
    target: json['target'] as String,
    equipment: json['equipment'] as String,
    weighted: json['weighted'] as bool,
    sided: json['sided'] as bool,
  );
}

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'name': instance.name,
      'difficulty': instance.difficulty,
      'intensity': instance.intensity,
      'target': instance.target,
      'equipment': instance.equipment,
      'weighted': instance.weighted,
      'sided': instance.sided,
      'impact': instance.impact,
      'group': instance.group,
      'description': instance.description,
      'media': instance.media,
      'thumb': instance.thumb,
      'owner': instance.owner,
    };
