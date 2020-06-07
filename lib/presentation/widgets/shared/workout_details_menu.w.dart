import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/state/workouts_store.dart';
import '../../router/routes.dart';
import '../../theme/colors.t.dart';
import '../../utils/choice.dart';
import 'buttons.w.dart';

/// consumes: WorkoutService
class WorkoutDetailsMenu extends StatelessWidget {
  const WorkoutDetailsMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Workout workout = Provider.of<Workout>(context);
    final _workoutsStore = Provider.of<WorkoutsStore>(context);
    final bool isCurrent = workout.key.toString() == CURRENT_WORKOUT_KEY;
    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
          color: AppColors.greyDarkest,
          boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 20)]),
      child: Column(
        children: <Widget>[
          //= Menu Buttons
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: <Widget>[
                choiceWidget(
                  isCurrent,
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.shuffle),
                      color: AppColors.greyLight,
                      onPressed: isCurrent
                          ? _workoutsStore.generateCurrentWorkout
                          : null,
                    ),
                  ),
                ),
                Expanded(
                  //= Add Workout Item
                  child: IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    color: AppColors.greyLight,
                    // TODO add exercise to workout in workout details view
                    onPressed: () => Navigator.pushNamed(
                      context,
                      FluroRouter.getExerciseAddToWorkoutLink(
                          workoutKey: workout.key.toString()),
                    ),
                  ),
                )
              ],
            ),
          ),
          //= Primary Action
          PrimaryActionButton(
              onTap: () async => Navigator.pushNamed(
                  context,
                  FluroRouter.getWorkoutPerformLink(
                      sourceWorkoutKey:
                          workout.key.toString() ?? CURRENT_WORKOUT_KEY)),
              text: 'Start Workout'),
        ],
      ),
    );
  }
}
