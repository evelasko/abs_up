import 'package:data_setup/presentation/widgets/lists_empty_feedback.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/exercise.dart';
import '../../domain/repositories/i_hive_facade.dart';
import '../widgets/items_exercise.dart';

class ExerciseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: IHiveFacade.exercisesBox.listenable(),
                builder: (context, Box<Exercise> box, widget) => ListView(
                    children: box.keys.length > 0
                        //= Exercise items list
                        ? box.keys
                            .map((key) => ExerciseItem(
                                key: Key('exerciseList:$key'),
                                exerciseId: key,
                                exercise: box.get(key)))
                            .toList()
                        //= Empty exercise list feedback widget
                        : emptyListFeedbackExercises),
              ),
            ),
            Text('end of list')
          ],
        ),
      ),
    );
  }
}
