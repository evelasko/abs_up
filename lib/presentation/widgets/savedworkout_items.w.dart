import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/workout.dart';
import '../../domain/state/workouts_store.dart';
import '../router/routes.dart';
import '../theme/colors.t.dart';
import '../theme/text.t.dart';
import 'shared/equipment_row.w.dart';
import 'shared/rate_data_chip.w.dart';
import 'shared/swipable_actions.w.dart';
import 'shared/wrappers.w.dart';

class SavedWorkoutItem extends StatelessWidget {
  final Workout workout;
  const SavedWorkoutItem(
    this.workout, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WorkoutsStore store = Provider.of<WorkoutsStore>(context);
    return Dismissible(
      key: Key(workout.key.toString()),
      direction: DismissDirection.endToStart,
      background: const SwipableActionBackground(
          icon: Icons.delete,
          text: 'Delete\nworkout',
          primary: false,
          color: Colors.red),
      onDismissed: (direction) =>
          store.deleteSavedWorkout(workout.key.toString()),
      confirmDismiss: (direction) => showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text('Delete ${workout.name}'),
          content: const Text(
              'This action is irreversible, please confirm deletion'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            )
          ],
        ),
      ),
      child: ListItemWrapper(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
              FluroRouter.getWorkoutDetailsLink(
                  workoutKey: workout.key.toString())),
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.transparent,
            key: Key('contentItem:${workout.key}'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //= Workout Name
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: workout.name,
                          style: AppTextStyles.savedWorkoutTitle.copyWith(
                              fontFamily: 'Montserrat',
                              color: AppColors.greyLight),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.timer,
                      color: AppColors.grey,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      workout.totalDurationString,
                      style: AppTextStyles.savedWorkoutTitle.copyWith(
                          fontWeight: FontWeight.w800, color: AppColors.grey),
                    ),
                  ],
                ),

                //= Workout Equipment
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: EquipmentRow(activeEquipment: workout.equipmentTotal),
                ),
                //= Workout intensity & difficulty
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RateDataChip.circle5(workout.intensityAverage),
                    RateDataChip.square5(workout.difficultyAverage),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
