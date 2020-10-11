import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../constants/constants.dart';
import '../perform_item/perform_item.m.dart';

part 'workout_log.m.g.dart';

@immutable
@CopyWith()
@JsonSerializable(nullable: false)
class WorkoutLog extends Equatable {
  final String name;
  final List<PerformItem> items;
  final DateTime performedAt;
  final String sourceWorkoutName;
  final String sourceWorkoutId;

  WorkoutLog(
      {this.name = 'untitled',
      this.items,
      this.sourceWorkoutName,
      this.sourceWorkoutId,
      DateTime performedAt})
      : performedAt = performedAt ?? DateTime.now();

  /// Getters
  Duration get totalDuration {
    Duration totalDuration = const Duration();
    for (final item in items) {
      totalDuration += Duration(seconds: item.duration);
    }
    return totalDuration;
  }

  String get totalDurationString =>
      RegExp(r'\d{2}\:\d{2}(?=\.)').stringMatch(totalDuration.toString()) ??
      '00:00';

  List<String> get equipmentTotal =>
      Set.from(items.map((item) => item.exercise.equipment))
          .toList()
          .cast<String>();

  int get intensityAverage =>
      items.map((e) => e.exercise.intensity).toList().reduce((a, b) => a + b) ~/
      items.length;

  String get intensityAverageString => intensityToString(intensityAverage);

  int get difficultyAverage =>
      items
          .map((e) => e.exercise.difficulty)
          .toList()
          .reduce((a, b) => a + b) ~/
      items.length;

  String get difficultyAverageString => difficultyToString(difficultyAverage);

  factory WorkoutLog.fromJson(Map<String, dynamic> json) =>
      _$WorkoutLogFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutLogToJson(this);

  @override
  List<Object> get props => [
        name,
        items,
        sourceWorkoutName,
        sourceWorkoutId,
        performedAt,
      ];

  @override
  bool get stringify => true;
}
