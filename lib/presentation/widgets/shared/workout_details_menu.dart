import 'package:data_setup/domain/repositories/i_workout_facade.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'buttons.dart';

class WorkoutDetailsMenu extends StatelessWidget {
  const WorkoutDetailsMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(color: AppColors.greyDarkest, boxShadow: [
        BoxShadow(color: Colors.black45, offset: Offset(0, 0), blurRadius: 20)
      ]),
      child: Column(
        children: <Widget>[
          //= Menu Buttons
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.shuffle),
                    color: AppColors.greyLight,
                    onPressed: () => IWorkoutFacade.generateCurrentWorkout()),
                IconButton(
                    icon: Icon(Icons.tune),
                    color: AppColors.greyLight,
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    color: AppColors.greyLight,
                    onPressed: () {})
              ],
            ),
          ),
          //= Primary Action
          AppButtons.primaryActionButton(
              onTap: () {
                print('start workout');
              },
              text: 'Start Workout'),
        ],
      ),
    );
  }
}
