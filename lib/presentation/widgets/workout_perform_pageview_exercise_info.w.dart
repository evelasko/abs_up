import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:flutter/material.dart';

class WorkoutPerformPageViewNextExerciseInfo extends StatelessWidget {
  const WorkoutPerformPageViewNextExerciseInfo({
    Key key,
    @required this.nextExercise,
  }) : super(key: key);

  final Exercise nextExercise;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(right: 15, top: 2),
          child: Text(
            'NEXT\nUP',
            textAlign: TextAlign.right,
            style: TextStyle(color: AppColors.black),
          ),
        ),
        Expanded(
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text:
                    nextExercise != null ? nextExercise.name : 'End of Workout',
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.greyDarkest,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                )),
          ),
        ),
        Container(
          height: 39,
          width: 39,
          child: nextExercise != null
              ? Icon(nextExercise.equipmentIcon,
                  size: 38, color: AppColors.grey)
              : Container(),
        )
      ],
    );
  }
}
