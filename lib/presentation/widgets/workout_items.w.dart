import 'package:abs_up/domain/state/workouts_store.dart';
import 'package:flutter/material.dart';

import '../../domain/models/workout.dart';
import '../../domain/models/workout_item.dart';
import '../../injection.dart';
import '../theme/colors.t.dart';
import 'shared/snackbars.w.dart';
import 'shared/swipable_actions.w.dart';
import 'workout_items_body.w.dart';

/// Consumes: WorkoutService
class WorkoutItemWidget extends StatelessWidget {
  final WorkoutItem workoutItem;
  const WorkoutItemWidget({
    Key key,
    @required this.workoutItem,
  }) : super(key: key);

  void removeItem(
          ScaffoldState scaffold, WorkoutItem workoutItem, Workout workout) =>
      workout.removeItem(workoutItem).then((_) => scaffold.showSnackBar(
          AppSnackbars.removedWorkoutItem(workoutItem.exercise.name)));
  @override
  Widget build(BuildContext context) {
    final Workout workout = getIt.get<WorkoutsStore>().workout;
    return Dismissible(
      key: Key(workoutItem.exercise.key.toString()),
      background: const SwipableActionBackground(
        color: AppColors.brandeis,
        icon: Icons.find_replace,
        text: 'replace\nexercise',
        primary: true,
      ),
      secondaryBackground: const SwipableActionBackground(
          color: Colors.red,
          icon: Icons.delete,
          text: 'remove from\nworkout',
          primary: false),
      onDismissed: (direction) =>
          removeItem(Scaffold.of(context), workoutItem, workout),
      // TODO *** implement the swippable action to replace the exercise of a workout item
      // confirmDismiss: (direction) async { return true;},
      child: WorkoutItemBody(workoutItem: workoutItem, workout: workout),
    );
  }
}
