import 'package:flutter/material.dart';

import '../../../domain/models/workout.dart';
import '../../router/routes.dart';
import '../../theme/colors.t.dart';
import '../../theme/text.t.dart';
import 'equipment_row.w.dart';
import 'rate_data_chip.w.dart';
import 'wrappers.w.dart';

class SavedWorkoutItem extends StatelessWidget {
  final Workout workout;
  const SavedWorkoutItem(
    this.workout, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      // TODO *** make saved workout items dissmissible to delete
      ListItemWrapper(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
              context,
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
      );
}
