import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 0)
class Exercise {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int difficulty;
  @HiveField(3)
  final int intensity;
  @HiveField(4)
  final String target;
  @HiveField(5)
  final String equipment;
  @HiveField(6)
  final bool weighted;
  @HiveField(7)
  final bool sided;

  Exercise(
      {this.id,
      this.name,
      this.difficulty,
      this.intensity,
      this.target,
      this.equipment,
      this.weighted,
      this.sided});
}
