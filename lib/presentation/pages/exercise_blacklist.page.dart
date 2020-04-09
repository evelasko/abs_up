import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/domain/models/user_settings.dart';
import 'package:data_setup/domain/repositories/i_hive_facade.dart';
import 'package:data_setup/presentation/router/routes.dart';
import 'package:data_setup/presentation/theme/colors.dart';
import 'package:data_setup/presentation/widgets/items_exercise.dart';
import 'package:data_setup/presentation/widgets/lists_empty_feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:flutter/material.dart';

class ExerciseBlacklistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Blacklist'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                color: AppColors.greyLight,
                onPressed: () =>
                    Navigator.pushNamed(context, FluroRouter.exerciseListLink))
          ],
        ),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: IHiveFacade.userSettingsBox
                    .listenable(keys: [UserSettings.blacklistExercises]),
                builder: (context, Box box, widget) {
                  List<String> blacklist = box.get(
                      UserSettings.blacklistExercises,
                      defaultValue: []).cast<String>();
                  return blacklist.length > 0
                      //= Blacklist exercise items list
                      ? ListView(
                          children: blacklist.map((key) {
                          Exercise exercise = IHiveFacade.exercisesBox.get(key);
                          return Container(
                            child: ExerciseItem(
                                key: Key('blacklistList:$key'),
                                exerciseId: key,
                                exercise: exercise),
                          );
                        }).toList())
                      //= Empty blacklist feedback widget
                      : emptyListFeedbackBlacklist;
                }),
          ),
        ])));
  }
}
