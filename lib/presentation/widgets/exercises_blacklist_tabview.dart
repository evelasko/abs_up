import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/models/exercise.dart';
import 'shared/exercise_items.dart';
import 'shared/lists_empty_feedback.dart';

class ExercisesBlacklistTabView extends StatelessWidget {
  final Box<Exercise> exerciseBox;

  const ExercisesBlacklistTabView(this.exerciseBox, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Exercise> exerciseList = exerciseBox.values
        .where((exercise) => exercise.tag == ExerciseTag.blacklisted.index)
        .toList();
    if (exerciseList.isEmpty) return emptyListFeedbackBlacklist;
    return Column(children: <Widget>[
      Expanded(
          child: ListView.builder(
              itemCount: exerciseList.length,
              itemBuilder: (_, index) => ExerciseItem(
                  key: Key('blacklistList:${exerciseList[index].key}'),
                  exercise: exerciseList[index]))),
    ]);
  }
}
