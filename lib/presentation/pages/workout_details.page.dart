import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/domain/models/workout.dart';
import 'package:data_setup/domain/repositories/data_values.dart';
import 'package:data_setup/domain/repositories/i_hive_facade.dart';
import 'package:data_setup/presentation/theme/colors.dart';
import 'package:data_setup/presentation/widgets/shared/workout_details_menu.dart';
import 'package:data_setup/presentation/widgets/shared/workout_details_panel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:data_setup/presentation/widgets/shared/buttons.dart';
import 'package:data_setup/presentation/widgets/shared/equipment_row.dart';
import 'package:data_setup/presentation/widgets/shared/workout_items.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WorkoutDetailsPage extends StatefulWidget {
  final String workoutId;
  const WorkoutDetailsPage(this.workoutId);

  @override
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  /// DUMMY DATA START
  List<Exercise> workoutItems = IHiveFacade.exercisesBox.values
      .where((exercise) => exercise.intensity == 1)
      .toList();

  /// DUMMY DATA END

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
                  activeEquipment: ['none', 'barbell', 'cable'],
                  averageDifficulty: 'extreme',
                  averageIntensity: 'moderate',
                  totalDuration: '09:30',
                ),
                //= Workout Reorderable Items List
                Expanded(
                    child: ReorderableListView(
                        children: currentWorkout.items
                            .map((workoutItem) => WorkoutItemWidget(
                                key: Key(
                                    'workoutItem:${workoutItem.exercise.key}'),
                                workoutItem: workoutItem))
                            .toList(),
                        onReorder: (oldIndex, newIndex) => setState(() {
                              if (newIndex > oldIndex) newIndex -= 1;
                              final item = workoutItems.removeAt(oldIndex);
                              workoutItems.insert(newIndex, item);
                            }))),
                //= Menu Buttons
                WorkoutDetailsMenu()
              ],
            );
          }),
    );
  }
}
