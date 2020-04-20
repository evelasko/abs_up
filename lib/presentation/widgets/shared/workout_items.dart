import 'package:flutter/material.dart';

import '../../../domain/models/workout_item.dart';
import '../../../domain/repositories/data_values.dart';
import '../../../domain/repositories/i_hive_facade.dart';
import '../../theme/colors.dart';
import 'swipable_actions.dart';
import 'workout_items_body.dart';

/// Workout Item Widget Class
class WorkoutItemWidget extends StatefulWidget {
  final WorkoutItem workoutItem;

  const WorkoutItemWidget({Key key, @required this.workoutItem})
      : super(key: key);

  @override
  _WorkoutItemWidgetState createState() => _WorkoutItemWidgetState();
}

class _WorkoutItemWidgetState extends State<WorkoutItemWidget> {
  void removeItem() => IHiveFacade.workoutsBox
      .get(DataValues.currentWorkoutKey)
      .removeItem(widget.workoutItem)
      .then((_) => print('show snackbar'));

  @override
  Widget build(BuildContext context) => Dismissible(
        key: Key(widget.workoutItem.exercise.key.toString()),
        background: SwipableActions.background(
            AppColors.brandeis, Icons.favorite, 'replace\nexercise'),
        secondaryBackground: SwipableActions.secondaryBackground(
            Colors.red, Icons.delete, 'remove from\nworkout'),
        child: workoutItemBody(context, widget.workoutItem),
        onDismissed: (direction) => removeItem(),
      );
}
