import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/exercise.dart';
import '../../domain/repositories/data_values.dart';
import '../../domain/repositories/i_hive_facade.dart';
import 'shared/exercise_items.dart';
import 'shared/lists_empty_feedback.dart';

class ExercisesFavoritesTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
          child: Column(children: <Widget>[
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: IHiveFacade.userSettingsBox
                  .listenable(keys: [DataValues.favoriteExercisesKey]),

              /// Listenable manager
              builder: (context, Box box, widget) {
                List<String> favorites = box.get(
                    DataValues.favoriteExercisesKey,
                    defaultValue: []).cast<String>();
                return favorites.length > 0
                    //= Favorite list items
                    ? ListView(
                        children: favorites.map((key) {
                        Exercise exercise = IHiveFacade.exercisesBox.get(key);
                        return Container(
                          child: ExerciseItem(
                              key: Key('favoritesList:$key'),
                              exercise: exercise),
                        );
                      }).toList())
                    //= Favorite empty list feedback widget
                    : emptyListFeedbackFavorites;
              }),
        ),
      ]));
}
