import 'package:flutter/material.dart';

import '../../../domain/models/workout_item.dart';
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
  @override
  Widget build(BuildContext context) => Dismissible(
      key: Key(widget.workoutItem.exercise.key),
      background: SwipableActions.background(
          AppColors.brandeis, Icons.favorite, 'replace\nexercise'),
      secondaryBackground: SwipableActions.secondaryBackground(
          Colors.red, Icons.delete, 'remove from\nworkout'),
      child: workoutItemBody(context, widget.workoutItem));
}
