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
  final String workoutId;
  const WorkoutDetailsPage(this.workoutId);

  @override
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.workoutId,
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

            return Column(
              children: <Widget>[
                //= Workout Details Panel
                WorkoutDetailsPanel(
                  activeEquipment: currentWorkout.equipmentTotal,
                  averageDifficulty: 'extreme',
                  averageIntensity: 'moderate',
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
