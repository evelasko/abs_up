import 'package:flutter/material.dart';

import '../../constants.dart';
import '../router/routes.dart';
import 'shared/buttons.w.dart';

class MenuHomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /// Exercise List
        HomePageButton(
            onTap: () => Navigator.pushNamed(context, EXERCISES_LIST_LINK),
            icon: Icons.local_library,
            text: 'exercises',
            buttonSide: ButtonSide.left),

        /// Workout List
        HomePageButton(
            onTap: () => Navigator.pushNamed(context, WORKOUT_LIST_LINK),
            icon: Icons.import_contacts,
            text: 'workouts',
            buttonSide: ButtonSide.center),

        /// New Workout
        HomePageButton(
            onTap: () => Navigator.pushNamed(context,
                FluroRouter.getWorkoutDetailsLink(workoutKey: 'WO-123')),
            icon: Icons.fitness_center,
            text: 'build new',
            buttonSide: ButtonSide.right),
      ],
    );
  }
}
