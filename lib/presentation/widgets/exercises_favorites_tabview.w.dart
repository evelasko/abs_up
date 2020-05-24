import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/models/exercise.dart';
import 'shared/exercise_items.w.dart';
import 'shared/lists_empty_feedback.w.dart';

class ExercisesFavoritesTabView extends StatelessWidget {
  final Box<Exercise> exerciseBox;

  const ExercisesFavoritesTabView(this.exerciseBox, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Exercise> exerciseList = exerciseBox.values
        .where((exercise) => exercise.tag == ExerciseTag.favorited.index)
        .toList();
    return exerciseList.isEmpty
        ? const EmptyListFeedback('There is no favorited exercise')
        : Column(children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: exerciseList.length,
                    itemBuilder: (_, index) => ExerciseItem(
                        key: Key('favoritesList:${exerciseList[index].key}'),
                        exercise: exerciseList[index]))),
          ]);
  }
}
