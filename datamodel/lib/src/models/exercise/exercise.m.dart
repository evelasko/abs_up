import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/constants.dart';

part 'exercise.m.g.dart';

enum ExerciseTag { exercise, favorited, blacklisted }

@immutable
@CopyWith()
@JsonSerializable()
class Exercise extends Equatable {
  final String name;
  final int difficulty;
  final int intensity;
  final String target;
  final String equipment;
  final bool weighted;
  final bool sided;
  final bool impact;
  final String group;
  final String description;
  final String media;
  final String thumb;
  final String owner;

  const Exercise({
    this.owner,
    this.description = '',
    this.media = '',
    this.thumb = '',
    this.impact,
    this.group = 'Free',
    this.name,
    this.difficulty,
    this.intensity,
    this.target,
    this.equipment,
    this.weighted,
    this.sided,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  String get intensityString => intensityToString(intensity);
  String get difficultyString => difficultyToString(difficulty);

  @override
  List<Object> get props => [
        owner,
        description,
        media,
        thumb,
        impact,
        group,
        name,
        difficulty,
        intensity,
        target,
        equipment,
        weighted,
        sided,
      ];

  @override
  bool get stringify => true;
}
