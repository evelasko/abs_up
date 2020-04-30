import 'package:abs_up/domain/repositories/data_values.dart';
import 'package:abs_up/presentation/router/routes.dart';
import 'package:flutter/material.dart';

import '../../../domain/repositories/i_workout_facade.dart';
import '../../theme/colors.dart';
import '../home_bottomsheet_workoutsettings.dart';
import 'buttons.dart';

class WorkoutDetailsMenu extends StatelessWidget {
  final String workoutKey;
  const WorkoutDetailsMenu({
    Key key,
    this.workoutKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isCurrent = workoutKey == DataValues.currentWorkoutKey;
    // TODO disable buttons if the workout being shown is not the current flash workout
    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(color: AppColors.greyDarkest, boxShadow: [
        BoxShadow(color: Colors.black45, offset: Offset(0, 0), blurRadius: 20)
      ]),
      child: Column(
        children: <Widget>[
          //= Menu Buttons
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: const Icon(Icons.shuffle),
                    color: AppColors.greyLight,
                    onPressed: () => IWorkoutFacade.generateCurrentWorkout()),
                IconButton(
                    icon: const Icon(Icons.tune),
                    color: AppColors.greyLight,
                    onPressed: () {
                      final PersistentBottomSheetController sheetController =
                          showBottomSheet(
                        context: context,
                        builder: (context) => HomeBottomSheetWorkoutsettings(),
                      );

                      sheetController.closed.then(
                          (value) => IWorkoutFacade.generateCurrentWorkout());
                    }),
                IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    color: AppColors.greyLight,
                    // TODO add exercise to workout in workout details view
                    onPressed: () {})
              ],
            ),
          ),
          //= Primary Action
          AppButtons.primaryActionButton(
              onTap: () async => Navigator.pushNamed(
                  context,
                  FluroRouter.getWorkoutPerformLink(
                      sourceWorkoutKey: workoutKey)),
              text: 'Start Workout'),
        ],
      ),
    );
  }
}
