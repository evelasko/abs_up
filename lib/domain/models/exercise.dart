//: Data model: Exercises
import 'package:hive/hive.dart';

part 'exercise.g.dart';

enum ExerciseTag { exercise, favorited, blacklisted }

@HiveType(typeId: 0, adapterName: 'ExerciseAdapter')
class Exercise extends HiveObject {
  // @HiveField(0)
  // final String id;
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int difficulty;
  @HiveField(2)
  final int intensity;
  @HiveField(3)
  final String target;
  @HiveField(4)
  final String equipment;
  @HiveField(5)
  final bool weighted;
  @HiveField(6)
  final bool sided;
  @HiveField(7)
  final bool impact;
  @HiveField(8)
  final String group;

  Exercise(
      {this.impact,
      this.group,
      this.name,
      this.difficulty,
      this.intensity,
      this.target,
      this.equipment,
      this.weighted,
      this.sided});

  bool hasExerciseKeys(Map<String, dynamic> maybeAnExercise) =>
      maybeAnExercise.containsKey('name') &&
      maybeAnExercise.containsKey('difficulty') &&
      maybeAnExercise.containsKey('intensity') &&
      maybeAnExercise.containsKey('target') &&
      maybeAnExercise.containsKey('equipment') &&
      maybeAnExercise.containsKey('weighted') &&
      maybeAnExercise.containsKey('sided') &&
      maybeAnExercise.containsKey('impact') &&
      maybeAnExercise.containsKey('group');

  Exercise exerciseFromMap(Map<String, dynamic> exerciseMap) => Exercise(
      name: exerciseMap['name'],
      difficulty: exerciseMap['difficulty'],
      intensity: exerciseMap['intensity'],
      target: exerciseMap['target'],
      equipment: exerciseMap['equipment'],
      weighted: exerciseMap['weighted'],
      sided: exerciseMap['sided'],
      impact: exerciseMap['impact'],
      group: exerciseMap['group']);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Exercise &&
        o.name == name &&
        o.difficulty == difficulty &&
        o.intensity == intensity &&
        o.target == target &&
        o.equipment == equipment &&
        o.weighted == weighted &&
        o.sided == sided;
  }

  @override
  int get hashCode => name.hashCode;
}
