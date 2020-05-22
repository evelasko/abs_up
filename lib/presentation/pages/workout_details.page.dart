import 'package:abs_up/constants.dart';
import 'package:flutter/material.dart';

import '../../services/workout.s.dart';
import '../theme/colors.t.dart';
import '../widgets/shared/snackbars.dart';
import '../widgets/shared/workout_details_menu.dart';
import '../widgets/shared/workout_details_panel.dart';
import '../widgets/shared/workout_items.dart';

class WorkoutDetailsPage extends StatefulWidget {
  final String workoutKey;
  const WorkoutDetailsPage(this.workoutKey);

  @override
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  TextEditingController savedWorkoutNameController = TextEditingController();
  final GlobalKey<ScaffoldState> workoutDetailsScaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'workoutDetailsScaffoldKey');

  Future<String> createSaveCurrentWorkoutAsDialog(BuildContext context) {
    savedWorkoutNameController.clear();
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                'Set Workout Name',
                style: TextStyle(color: AppColors.greyDark),
              ),
              content: TextField(
                controller: savedWorkoutNameController,
              ),
              actions: <Widget>[
                MaterialButton(
                  elevation: 0,
                  color: AppColors.grey,
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  elevation: 0,
                  color: AppColors.brandeis,
                  onPressed: () => Navigator.of(context)
                      .pop(savedWorkoutNameController.text.toString()),
                  child: const Text('Save'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO the statement below should be done by the WorkoutService
    final bool isCurrent = widget.workoutKey == CURRENT_WORKOUT_KEY;

    final WorkoutService workoutService =
        WorkoutService(workoutKey: widget.workoutKey);
    return Scaffold(
      key: workoutDetailsScaffoldKey,
      appBar: AppBar(
        title: Text(
          isCurrent
              ? 'Preview Workout'
              : workoutService.currentWorkout.name ?? 'Preview Workout',
          style: const TextStyle(
              color: AppColors.coquelicot, fontWeight: FontWeight.w800),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              isCurrent ? Icons.save_alt : Icons.save,
            ),
            iconSize: 30,
            padding: const EdgeInsets.only(top: 6),
            onPressed: () => isCurrent
                ? createSaveCurrentWorkoutAsDialog(context).then((name) {
                    if (name == null) return;
                    workoutService.saveCurrentWorkoutAs(name).then((value) =>
                        workoutDetailsScaffoldKey.currentState
                            .showSnackBar(AppSnackbars.savedWorkoutAs(name)));
                  })
                : () {}, // TODO implement saving the workout at preview window or update an already saved workout being previewed
          )
        ],
      ),
      //= Workout Listenable
      body: ValueListenableBuilder(
          valueListenable: workoutService.listenable,
          builder: (_, __, ___) => Column(
                children: <Widget>[
                  //= Workout Details Panel
                  WorkoutDetailsPanel(
                    activeEquipment:
                        workoutService.currentWorkout.equipmentTotal,
                    averageDifficulty:
                        workoutService.workoutSettings.difficultyString,
                    averageIntensity:
                        workoutService.workoutSettings.intensityString,
                    totalDuration:
                        workoutService.currentWorkout.totalDurationString,
                  ),
                  //= Workout Reorderable Items List
                  Expanded(
                      child: ReorderableListView(
                    onReorder: (oldIndex, newIndex) async => workoutService
                        .currentWorkout
                        .reorderItems(oldIndex, newIndex),
                    children: workoutService.currentWorkout.items
                        .map((item) => WorkoutItemWidget(
                            key: Key('workoutItem:${item.exercise.key}'),
                            workoutItem: item))
                        .toList(),
                  )),
                  //= Menu Buttons
                  const WorkoutDetailsMenu()
                ],
              )),
    );
  }
}
