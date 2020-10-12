import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

import '../perform_item/perform_item.m.dart';

part 'workout_log.m.flamingo.dart';

class WorkoutLog extends Document<WorkoutLog> {
  @Field()
  String name;
  @ModelField()
  List<PerformItem> items;
  @Field()
  DateTime performedAt;
  @Field()
  String sourceWorkoutName;
  @Field()
  String sourceWorkoutId;

  WorkoutLog({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
    CollectionReference collectionRef,
  }) : super(
            id: id,
            snapshot: snapshot,
            values: values,
            collectionRef: collectionRef);

  @override
  Map<String, dynamic> toData() => _$toData(this);
  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

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

  // List<String> get equipmentTotal =>
  //     Set.from(items.map((item) => item.exercise.equipment))
  //         .toList()
  //         .cast<String>();

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

}
