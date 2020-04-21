import 'package:flutter/material.dart';

import '../../domain/repositories/data_values.dart';
import '../../domain/repositories/i_workout_facade.dart';
import '../router/routes.dart';
import 'shared/buttons.dart';

class HomeSectionPerform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          AppButtons.boxedBigIconButton(
              onTap: () => IWorkoutFacade.generateCurrentWorkout().then(
                  (value) => Navigator.pushNamed(
                      context,
                      FluroRouter.getWorkoutDetailsLink(
                          workoutKey: DataValues.currentWorkoutKey))),
              icon: Icons.playlist_play,
              text: 'preview',
              buttonType: ButtonTypes.secondary),
          AppButtons.boxedBigIconButton(
              onTap: () async => Navigator.pushNamed(
                  context,
                  FluroRouter.getWorkoutPerformLink(
                      workoutKey: await IWorkoutFacade.performWorkout())),
              icon: Icons.play_circle_outline,
              text: 'start')
        ],
      ),
    );
  }
}
