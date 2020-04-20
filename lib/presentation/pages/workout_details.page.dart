import 'package:data_setup/domain/models/workout_settings.dart';
import 'package:data_setup/domain/repositories/i_workout_facade.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/workout.dart';
import '../../domain/repositories/data_values.dart';
import '../../domain/repositories/i_hive_facade.dart';
import '../theme/colors.dart';
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
  @override
  Widget build(BuildContext context) {
    Workout workout = IHiveFacade.workoutsBox.get(widget.workoutKey);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.workoutKey != DataValues.currentWorkoutKey
              ? workout?.name ?? 'Preview Workout'
              : 'Preview Workout',
          style: TextStyle(
              color: AppColors.coquelicot, fontWeight: FontWeight.w800),
        ),
        actions: <Widget>[
          // TODO implement saving the workout at preview window or update an already saved workout being previewed
          IconButton(
              icon: Icon(
                Icons.save_alt,
              ),
              iconSize: 30,
              padding: EdgeInsets.only(top: 6),
              // TODO the workout being retrieved to save is not the last generated...
              onPressed: () {})
        ],
      ),
      //= Workout Listenable
      body: ValueListenableBuilder(
          valueListenable: IHiveFacade.workoutsBox
              .listenable(keys: [DataValues.currentWorkoutKey]),
          builder: (context, Box<Workout> box, widget) {
            final Workout currentWorkout =
                box.get(DataValues.currentWorkoutKey);
            final WorkoutSettings workoutSettings = IWorkoutFacade.settings;

            return Column(
              children: <Widget>[
                //= Workout Details Panel
                WorkoutDetailsPanel(
                  activeEquipment: currentWorkout.equipmentTotal,
                  averageDifficulty: workoutSettings.difficultyString,
                  averageIntensity: workoutSettings.intensityString,
                  totalDuration: currentWorkout.totalDurationString,
                ),
                //= Workout Reorderable Items List
                Expanded(
                    child: ReorderableListView(
                        children: currentWorkout.items
                            .map((item) => WorkoutItemWidget(
                                key: Key('workoutItem:${item.exercise.key}'),
                                workoutItem: item))
                            .toList(),
                        onReorder: (oldIndex, newIndex) async =>
                            await currentWorkout.reorderItems(
                                oldIndex, newIndex))),
                //= Menu Buttons
                WorkoutDetailsMenu()
              ],
            );
          }),
    );
  }
}
