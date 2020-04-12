import 'package:flutter/material.dart';

import '../router/routes.dart';
import 'buttons.dart';

class MenuHomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /// Exercise List
          AppButtons.homePageButton(
              onTap: () =>
                  Navigator.pushNamed(context, FluroRouter.exerciseListLink),
              icon: Icons.local_library,
              text: 'exercises',
              buttonSide: ButtonSide.left),

          /// Workout List
          AppButtons.homePageButton(
              onTap: () =>
                  Navigator.pushNamed(context, FluroRouter.workoutListLink),
              icon: Icons.import_contacts,
              text: 'workouts',
              buttonSide: ButtonSide.center),

          /// New Workout
          AppButtons.homePageButton(
              onTap: () => Navigator.pushNamed(context,
                  FluroRouter.getWorkoutDetailsLink(workoutId: 'WO-123')),
              icon: Icons.fitness_center,
              text: 'build new',
              buttonSide: ButtonSide.right),
        ],
      ),
    );
  }
}
