import 'shared/lists_empty_feedback.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/exercise.dart';
import '../../domain/repositories/i_hive_facade.dart';
import 'shared/exercise_items.dart';

class ExercisesExercisesTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: IHiveFacade.exercisesBox.listenable(),
                builder: (context, Box<Exercise> box, widget) {
                  final exercises = box.values.toList();

                  // TODO implement the filtering function (check lines below)
                  // print(exercises[0].key);
                  // final filtered = box.values
                  //     .where((exercise) => exercise.name.contains('Raises'));
                  // print(filtered.length);

                  // TODO implement ListView being fed with a List<Exercise>
                  return ListView(
                      children: box.keys.length > 0
                          //= Exercise items list
                          ? box.keys
                              .map((key) => ExerciseItem(
                                  key: Key('exerciseList:$key'),
                                  exercise: box.get(key)))
                              .toList()
                          //= Empty exercise list feedback widget
                          : emptyListFeedbackExercises);
                },
              ),
            ),
            Container(
              height: 20,
            )
          ],
        ),
      );
}
