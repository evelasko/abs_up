import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../exercise/exercise.m.dart';

part 'workout_item.m.g.dart';

@immutable
@CopyWith()
@JsonSerializable(nullable: false)
class WorkoutItem extends Equatable {
  final Exercise exercise;
  final int order;
  final int duration;
  final int side;

  const WorkoutItem({
    this.exercise,
    this.order,
    this.duration,
    this.side = 0,
  });

  factory WorkoutItem.fromJson(Map<String, dynamic> json) =>
      _$WorkoutItemFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutItemToJson(this);

  @override
  List<Object> get props => [
        exercise,
        order,
        duration,
        side,
      ];

  @override
  bool get stringify => true;
}
