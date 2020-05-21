import 'package:abs_up/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'equipment_row.dart';

class WorkoutDetailsPanel extends StatelessWidget {
  final List<String> activeEquipment;
  final String averageIntensity;
  final String averageDifficulty;
  final String totalDuration;

  const WorkoutDetailsPanel({
    Key key,
    @required this.activeEquipment,
    @required this.averageIntensity,
    @required this.averageDifficulty,
    @required this.totalDuration,
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
                activeEquipment: activeEquipment,
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
                      Text(averageIntensity.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                ),
                Text(
                  //= Total duration
                  totalDuration,
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
                      Text(averageDifficulty.toUpperCase(),
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
