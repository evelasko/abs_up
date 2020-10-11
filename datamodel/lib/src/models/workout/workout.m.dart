import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/constants.dart';
import '../exercise/exercise.m.dart';
import '../workout_item/workout_item.m.dart';

part 'workout.m.g.dart';

@immutable
@CopyWith()
@JsonSerializable(nullable: false)
class Workout extends Equatable {
  final String uid;
  final String name;
  final String ownerId;
  final List<WorkoutItem> items;
  final DateTime createdAt;

  Workout({
    this.uid,
    this.ownerId,
    this.name = 'untitled',
    this.items = const [],
    DateTime createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  /// Update workout item
  Future<void> updateWorkoutItem(int index,
      {Exercise exercise, int order, int duration, int side}) async {
    if (index + 1 > items.length) return;
    final WorkoutItem oldItem = items[index];
    if (oldItem == null) return;
    items[index] = oldItem.copyWith(
      exercise: exercise,
      order: order,
      duration: duration,
      side: side,
    );
  }

  /// Getters
  Duration get totalDuration => Duration(
      seconds: items.fold(0, (prev, element) => prev + element.duration));

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

  /// Custom methods
  Future<void> reorderItems(int oldIndex, int newIndex) async {
    final int _index = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final item = items.removeAt(oldIndex);
    items.insert(_index, item);
    _refreshOrder();
  }

  void _refreshOrder() => Iterable.generate(items.length, (x) => x + 1).forEach(
      (iterationNumber) => items[iterationNumber - 1] =
          items[iterationNumber - 1].copyWith(order: iterationNumber));

  Future<void> removeItem(WorkoutItem item) async {
    items.removeWhere((workoutItem) => workoutItem == item);
    _refreshOrder();
  }

  Workout copy() => Workout(name: name, items: items);

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);

  @override
  List<Object> get props => [
        uid,
        ownerId,
        name,
        items,
        createdAt,
      ];

  @override
  bool get stringify => true;
}
