import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../domain/models/workout.dart';
import '../../../domain/models/workout_item.dart';
import '../../../services/p_data.s.dart';
import '../../theme/colors.t.dart';
import 'swipable_actions.w.dart';
import 'workout_items_body.w.dart';

/// Workout Item Widget Class
class WorkoutItemWidget extends StatelessWidget {
  final WorkoutItem workoutItem;
  final String workoutKey;
  const WorkoutItemWidget({
    Key key,
    @required this.workoutItem,
    this.workoutKey = CURRENT_WORKOUT_KEY,
  }) : super(key: key);

  void removeItem(WorkoutItem workoutItem, Workout workout) => workout
      .removeItem(workoutItem)
      // TODO show snackbar when deletting a saved workout item
      .then((_) => {});

  @override
  Widget build(BuildContext context) {
    // final WorkoutItem workoutItem = Provider.of<WorkoutItem>(context);
    final Workout workout = PDataService.workoutsBox
        .get(workoutKey); // Provider.of<Workout>(context);
    return Dismissible(
      key: Key(workoutItem.exercise.key.toString()),
      background: SwipableActions.background(
          AppColors.brandeis, Icons.favorite, 'replace\nexercise'),
      secondaryBackground: SwipableActions.secondaryBackground(
          Colors.red, Icons.delete, 'remove from\nworkout'),
      onDismissed: (direction) => removeItem(workoutItem, workout),
      child: WorkoutItemBody(workoutItem: workoutItem, workout: workout),
    );
  }
}
