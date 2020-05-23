import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../services/workout.s.dart';
import '../router/routes.dart';
import 'shared/buttons.w.dart';

class HomeSectionPerform extends StatelessWidget {
  final WorkoutService workoutService = WorkoutService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // = Preview Workout
          BoxedBigIconButton(
              onTap: () => workoutService.generateCurrentWorkout().then(
                  (value) => Navigator.pushNamed(
                      context,
                      FluroRouter.getWorkoutDetailsLink(
                          workoutKey: CURRENT_WORKOUT_KEY))),
              icon: Icons.playlist_play,
              text: 'preview',
              buttonType: ButtonTypes.secondary),
          // = Perform Workout
          BoxedBigIconButton(
              onTap: () async => Navigator.pushNamed(
                  context, FluroRouter.getWorkoutPerformLink()),
              icon: Icons.play_circle_outline,
              text: 'start')
        ],
      ),
    );
  }
}
