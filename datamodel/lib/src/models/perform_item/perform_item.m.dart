import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../exercise/exercise.m.dart';

part 'perform_item.m.g.dart';

@immutable
@CopyWith()
@JsonSerializable(nullable: false)
class PerformItem extends Equatable {
  final Exercise exercise;
  final int order;
  final int duration;
  final int side;
  final double weight;
  final int progress;

  const PerformItem({
    this.exercise,
    this.order,
    this.duration,
    this.side = 0,
    this.weight = 0,
    this.progress = 0,
  });

  factory PerformItem.fromJson(Map<String, dynamic> json) =>
      _$PerformItemFromJson(json);
  Map<String, dynamic> toJson() => _$PerformItemToJson(this);

  @override
  List<Object> get props => [
        exercise,
        order,
        duration,
        side,
        weight,
        progress,
      ];

  @override
  bool get stringify => true;
}
