import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/exercise.dart';
import '../../domain/repositories/data_values.dart';
import '../../domain/repositories/i_hive_facade.dart';
import 'shared/exercise_items.dart';
import 'shared/lists_empty_feedback.dart';

class ExercisesBlacklistTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
          child: Column(children: <Widget>[
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: IHiveFacade.userSettingsBox
                  .listenable(keys: [DataValues.blacklistExercisesKey]),

              /// Listenable manager
              builder: (context, Box box, widget) {
                List<String> blacklist = box.get(
                    DataValues.blacklistExercisesKey,
                    defaultValue: []).cast<String>();
                return blacklist.length > 0
                    //= Blacklist exercise items list
                    ? ListView(
                        children: blacklist.map((key) {
                        Exercise exercise = IHiveFacade.exercisesBox.get(key);
                        return Container(
                          child: ExerciseItem(
                              key: Key('blacklistList:$key'),
                              exercise: exercise),
                        );
                      }).toList())
                    //= Empty blacklist feedback widget
                    : emptyListFeedbackBlacklist;
              }),
        ),
      ]));
}
