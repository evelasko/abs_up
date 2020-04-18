import 'package:data_setup/domain/repositories/i_workout_facade.dart';
import 'package:data_setup/presentation/router/routes.dart';
import 'package:flutter/material.dart';

import 'shared/buttons.dart';

class HomeSectionPerform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AppButtons.boxedBigIconButton(
                onTap: () => IWorkoutFacade.generateCurrentWorkout().then(
                    (value) => Navigator.pushNamed(
                        context,
                        FluroRouter.getWorkoutDetailsLink(
                            workoutId: 'WO-123'))),
                icon: Icons.playlist_play,
                text: 'preview',
                buttonType: ButtonTypes.secondary),
            AppButtons.boxedBigIconButton(
                onTap: () {}, icon: Icons.play_circle_outline, text: 'start')
          ],
        ),
      ),
    );
  }
}
