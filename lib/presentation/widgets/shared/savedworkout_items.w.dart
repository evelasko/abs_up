import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/presentation/router/routes.dart';
import 'package:abs_up/presentation/widgets/shared/rate_data_chip.w.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.t.dart';
import '../../theme/text.t.dart';
import 'equipment_row.w.dart';
import 'wrappers.w.dart';

/// Renders Exercise List Item Body Content
Widget savedWorkoutItem(BuildContext context, Workout workout) =>
    // TODO make saved workout items dissmissible to delete
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
