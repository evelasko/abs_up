import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

import '../workout_item/workout_item.m.dart';

part 'workout.m.flamingo.dart';

class Workout extends Document<Workout> {
  @Field()
  String name;
  @Field()
  String owner;
  @Field()
  List<String> sharedWith;
  @ModelField()
  List<WorkoutItem> items;

  Workout({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);
  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

  /// Getters
  Duration get totalDuration => Duration(
      seconds: items.fold(0, (prev, element) => prev + element.duration));

  String get totalDurationString =>
      RegExp(r'\d{2}\:\d{2}(?=\.)').stringMatch(totalDuration.toString()) ??
      '00:00';

  // List<String> get equipmentTotal =>
  //     Set.from(items.map((item) => item.equipment))
  //         .toList();

  // int get intensityAverage =>
  //     items.map((e) => e.exercise.intensity).toList().reduce((a, b) => a + b) ~/
  //     items.length;

  // String get intensityAverageString => intensityToString(intensityAverage);

  // int get difficultyAverage =>
  //     items
  //         .map((e) => e.exercise.difficulty)
  //         .toList()
  //         .reduce((a, b) => a + b) ~/
  //     items.length;

  // String get difficultyAverageString => difficultyToString(difficultyAverage);

  /// Custom methods
  Future<void> reorderItems(String userId, int oldIndex, int newIndex) async {
    if (userId != owner) return; // TODO return an error here
    final int _index = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final item = items.removeAt(oldIndex);
    items.insert(_index, item);
    _refreshOrder();
  }

  void _refreshOrder() => Iterable.generate(items.length, (x) => x + 1).forEach(
      (iterationNumber) => items[iterationNumber - 1] =
          items[iterationNumber - 1].copyWith(order: iterationNumber));

  Future<void> removeItem(String userId, WorkoutItem item) async {
    if (userId != owner) return; // TODO return an error here
    items.removeWhere((workoutItem) => workoutItem == item);
    _refreshOrder();
  }
}
