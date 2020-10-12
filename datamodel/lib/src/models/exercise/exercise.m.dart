import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

import '../../constants/constants.dart';

part 'exercise.m.flamingo.dart';

enum ExerciseTag { exercise, favorited, blacklisted }

class Exercise extends Document<Exercise> {
  @Field()
  String name;
  @Field()
  int difficulty;
  @Field()
  int intensity;
  @Field()
  String target;
  @Field()
  String equipment;
  @Field()
  bool weighted;
  @Field()
  bool sided;
  @Field()
  bool impact;
  @Field()
  String group;
  @Field()
  String description;
  @Field()
  String media;
  @Field()
  String thumb;
  @Field()
  String owner;

  Exercise({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);
  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

  String get intensityString => intensityToString(intensity);
  String get difficultyString => difficultyToString(difficulty);
}
