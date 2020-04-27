import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/presentation/theme/colors.dart';
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
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 2),
          child: Text(
            'Next\nUp'.toUpperCase(),
            textAlign: TextAlign.right,
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
