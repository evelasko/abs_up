import 'package:flutter/material.dart';

import '../../../domain/models/workout.dart';
import '../../../domain/models/workout_settings.dart';
import '../../theme/colors.t.dart';
import 'equipment_row.w.dart';

class WorkoutDetailsPanel extends StatelessWidget {
  final Workout currentWorkout;
  final WorkoutSettings workoutSettings;

  const WorkoutDetailsPanel({
    Key key,
    this.currentWorkout,
    this.workoutSettings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      height: 100,
      decoration: const BoxDecoration(
          color: AppColors.greyDarkest,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20)]),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            //= Equipment row
            child: equipmentRowContent(
                activeEquipment: currentWorkout.equipmentTotal,
                iconSize: 36,
                activeColor: Colors.white,
                baseColor: Colors.white24),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //= Intensity
                      Text('intensity'.toUpperCase(),
                          style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700)),
                      Text(workoutSettings.intensityString.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                ),
                Text(
                  //= Total duration
                  currentWorkout.totalDurationString,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //= Difficulty
                      Text('difficulty'.toUpperCase(),
                          style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700)),
                      Text(workoutSettings.difficultyString.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
