import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/presentation/router/routes.dart';
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
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
          color: Colors.transparent,
          key: Key('contentItem:${workout.key}'),
          child: Row(
            children: <Widget>[
              //= Saved workout content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //= Workout Name
                    RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: workout.name,
                          style: AppTextStyles.savedWorkoutTitle.copyWith(
                              fontFamily: 'Montserrat',
                              color: AppColors.greyLight),
                        )),

                    //= Workout Equipment
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: equipmentRowContent(
                          activeEquipment: workout.equipmentTotal,
                          iconSize: 28,
                          baseColor: AppColors.greyDarkest,
                          activeColor: AppColors.greyLightest),
                    ),

                    //= Workout intensity & difficulty
                    Row(
                      // TODO Implement exercise item intensity level indicator
                      children: <Widget>[
                        Text('intensity'.toUpperCase(),
                            style: AppTextStyles.listItemBottomInfo
                                .copyWith(fontSize: 10, color: AppColors.grey)),
                        Text('difficulty'.toUpperCase(),
                            style: AppTextStyles.listItemBottomInfo
                                .copyWith(fontSize: 10, color: AppColors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              //= Workout time
              Container(
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
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
                              fontWeight: FontWeight.w800,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                    RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            // TODO define the final saved workout items content
                            text: '1 mont ago',
                            style: AppTextStyles.savedWorkoutTitle.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color: AppColors.grey))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
