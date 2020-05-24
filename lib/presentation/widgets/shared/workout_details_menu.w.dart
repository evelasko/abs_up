import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../services/workout.s.dart';
import '../../router/routes.dart';
import '../../theme/colors.t.dart';
import '../../utils/choice.dart';
import '../home_bottomsheet_workoutsettings.w.dart';
import 'buttons.w.dart';

class WorkoutDetailsMenu extends StatelessWidget {
  final String workoutKey;
  const WorkoutDetailsMenu({
    Key key,
    this.workoutKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WorkoutService workoutService = WorkoutService();
    final bool isCurrent = workoutKey == CURRENT_WORKOUT_KEY;
    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
          color: AppColors.greyDarkest,
          boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 20)]),
      child: Column(
        children: <Widget>[
          //= Menu Buttons
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: <Widget>[
                choiceWidget(
                    isCurrent,
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.shuffle),
                        color: AppColors.greyLight,
                        onPressed: isCurrent
                            ? workoutService.generateCurrentWorkout
                            : null,
                      ),
                    )),
                choiceWidget(
                    isCurrent,
                    Expanded(
                      child: IconButton(
                          icon: const Icon(Icons.tune),
                          color: AppColors.greyLight,
                          onPressed: () {
                            final PersistentBottomSheetController
                                sheetController = showBottomSheet(
                              context: context,
                              builder: (context) =>
                                  HomeBottomSheetWorkoutsettings(),
                            );

                            sheetController.closed.then((value) =>
                                workoutService.generateCurrentWorkout());
                          }),
                    )),
                Expanded(
                  child: IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      color: AppColors.greyLight,
                      // TODO add exercise to workout in workout details view
                      onPressed: () {}),
                )
              ],
            ),
          ),
          //= Primary Action
          PrimaryActionButton(
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