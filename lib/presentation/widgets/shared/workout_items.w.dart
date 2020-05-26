import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/workout.dart';
import '../../../domain/models/workout_item.dart';
import '../../theme/colors.t.dart';
import 'snackbars.w.dart';
import 'swipable_actions.w.dart';
import 'workout_items_body.w.dart';

/// Workout Item Widget Class
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
    final Workout workout = Provider.of<Workout>(context);
    return Dismissible(
      key: Key(workoutItem.exercise.key.toString()),
      background: SwipableActions.background(
          AppColors.brandeis, Icons.favorite, 'replace\nexercise'),
      secondaryBackground: SwipableActions.secondaryBackground(
          Colors.red, Icons.delete, 'remove from\nworkout'),
      onDismissed: (direction) =>
          removeItem(Scaffold.of(context), workoutItem, workout),
      // confirmDismiss: (direction) async { return true;},
      child: WorkoutItemBody(workoutItem: workoutItem, workout: workout),
    );
  }
}
