import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/workout_item.dart';
import 'package:hive/hive.dart';

part 'workout_log.g.dart';

@HiveType(typeId: 5, adapterName: 'WorkoutLogAdapter')
class WorkoutLog extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final List<WorkoutItem> items;
  @HiveField(2)
  DateTime performedAt;
  @HiveField(3)
  final String sourceWorkoutName;
  @HiveField(4)
  final String sourceWorkoutId;

  WorkoutLog(
      {this.name = 'untitled',
      this.items,
      this.sourceWorkoutName,
      this.sourceWorkoutId}) {
    performedAt = DateTime.now();
  }

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
      Set.from(items.map((item) => item.exercise.equipment.toLowerCase()))
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

  /// Class overrides
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is WorkoutLog &&
        o.name == name &&
        o.items.length == items.length &&
        o.performedAt == performedAt &&
        o.sourceWorkoutId == sourceWorkoutId;
  }

  @override
  int get hashCode => name.hashCode;
}
