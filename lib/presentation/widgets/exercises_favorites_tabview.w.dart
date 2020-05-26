import 'package:abs_up/services/exercise.s.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/models/exercise.dart';
import 'shared/exercise_items.w.dart';
import 'shared/lists_empty_feedback.w.dart';

class ExercisesFavoritesTabView extends StatelessWidget {
  const ExercisesFavoritesTabView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Box<Exercise> exerciseBox = ExerciseService().exercisesBox;
    final List<Exercise> exerciseList = exerciseBox.values
        .where((exercise) => exercise.tag == ExerciseTag.favorited.index)
        .toList();
    return exerciseList.isEmpty
        ? const EmptyListFeedback('There is no favorited exercise')
        : Center(
            child: ListView.builder(
              itemCount: exerciseList.length,
              itemBuilder: (_, index) => ExerciseItem(
                  key: Key('favoritesList:${exerciseList[index].key}'),
                  exercise: exerciseList[index]),
            ),
          );
  }
}
