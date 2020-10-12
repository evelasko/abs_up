import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

import '../../constants/constants.dart';

part 'workout_settings.m.flamingo.dart';
part 'workout_settings.m.g.dart';

@CopyWith()
class WorkoutSettings extends Model {
  @Field()
  int length;
  @Field()
  int intensity;
  @Field()
  int difficulty;
  @Field()
  bool impact;
  @Field()
  List<String> equipment;

  WorkoutSettings({
    this.length = LENGTH_DEFAULT,
    this.intensity = INTENSITY_DEFAULT,
    this.difficulty = DIFFICULTY_DEFAULT,
    this.impact = IMPACT_DEFAULT,
    this.equipment = const [EQUIPMENT_DEFAULT],
    Map<String, dynamic> values,
  }) : super(values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);
  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

  /// Data UI getters
  String get intensityString => intensityToString(intensity);
  String get difficultyString => difficultyToString(difficulty);
  String get lengthString => lengthToString(length);
  String get impactString => impactToString(impact);

  bool checkEquipmentStatusFor(String equipmentKey) =>
      equipment.contains(equipmentKey);
}
