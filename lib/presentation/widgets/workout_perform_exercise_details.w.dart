import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout_item.dart';
import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:abs_up/presentation/theme/text.t.dart';
import 'package:flutter/material.dart';

class WorkoutPerformPageViewExerciseDetails extends StatelessWidget {
  const WorkoutPerformPageViewExerciseDetails(
      {Key key,
      @required this.workoutItem,
      @required this.exercise,
      @required this.progress})
      : super(key: key);

  final WorkoutItem workoutItem;
  final Exercise exercise;
  final int progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // = Exercise Header
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: workoutItem.exercise.name,
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.greyDarkest,
                    fontSize: 24,
                    fontWeight: FontWeight.w800)),
          ),
        ),
        // = Exercise info
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text(
                    'INTENSITY: ',
                    style: AppTextStyles.listItemBottomInfo,
                  ),
                  Text(
                    exercise.intensityString.toUpperCase(),
                    style: AppTextStyles.listItemBottomInfo
                        .copyWith(color: AppColors.greyDark),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  const Text(
                    'DIFFICULTY: ',
                    style: AppTextStyles.listItemBottomInfo,
                  ),
                  Text(
                    exercise.difficultyString.toUpperCase(),
                    style: AppTextStyles.listItemBottomInfo
                        .copyWith(color: AppColors.greyDark),
                  )
                ],
              )
            ],
          ),
        ),
        //= Image
        Container(
          width: double.maxFinite,
          height: 200,
          color: AppColors.coquelicot,
        ),
        // = Info Row
        Container(
          height: 84,
          child: Row(
            children: <Widget>[
              // = Equipment
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                      color: AppColors.greyLightest,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Center(
                      child: Icon(
                    exercise.equipmentIcon,
                    size: 65,
                  )),
                ),
              ),
              // = Progress counter
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 2, left: 2),
                  decoration: const BoxDecoration(
                    color: AppColors.greyLightest,
                  ),
                  child: Center(
                    child: Text(
                      progress.toString(),
                      style: const TextStyle(
                          fontSize: 42,
                          color: AppColors.greyDark,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3.0),
                    ),
                  ),
                ),
              ),
              // = Interval Count
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 2),
                  decoration: const BoxDecoration(
                      color: AppColors.greyLightest,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      '1/1',
                      style: TextStyle(
                          fontSize: 42,
                          color: AppColors.greyDark,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
