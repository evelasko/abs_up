import 'package:data_setup/domain/models/workout_settings.dart';
import 'package:data_setup/domain/repositories/i_workout_facade.dart';
import 'package:data_setup/presentation/widgets/shared/snackbars.dart';
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
  TextEditingController savedWorkoutNameController = TextEditingController();
  final GlobalKey<ScaffoldState> workoutDetailsScaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'workoutDetailsScaffoldKey');

  Future<String> createSaveCurrentWorkoutAsDialog(BuildContext context) {
    savedWorkoutNameController.clear();
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
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
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                MaterialButton(
                  elevation: 0,
                  color: AppColors.brandeis,
                  child: Text('Save'),
                  onPressed: () => Navigator.of(context)
                      .pop(savedWorkoutNameController.text.toString()),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final Workout workout = IHiveFacade.workoutsBox
        .get(widget.workoutKey ?? DataValues.currentWorkoutKey);
    final bool isCurrent = widget.workoutKey == DataValues.currentWorkoutKey;

    return Scaffold(
      key: workoutDetailsScaffoldKey,
      appBar: AppBar(
        title: Text(
          isCurrent ? 'Preview Workout' : workout?.name ?? 'Preview Workout',
          style: TextStyle(
              color: AppColors.coquelicot, fontWeight: FontWeight.w800),
        ),
        actions: <Widget>[
          // TODO implement saving the workout at preview window or update an already saved workout being previewed
          IconButton(
              icon: Icon(
                isCurrent ? Icons.save_alt : Icons.save,
              ),
              iconSize: 30,
              padding: EdgeInsets.only(top: 6),
              onPressed: () => isCurrent
                  ? createSaveCurrentWorkoutAsDialog(context).then((name) {
                      if (name == null) return;
                      IWorkoutFacade.saveCurrentWorkoutAs(name).then((value) =>
                          workoutDetailsScaffoldKey.currentState
                              .showSnackBar(AppSnackbars.savedWorkoutAs(name)));
                    })
                  : print('update ${widget.workoutKey}'))
        ],
      ),
      //= Workout Listenable
      body: ValueListenableBuilder(
          valueListenable: IHiveFacade.workoutsBox.listenable(
              keys: [widget.workoutKey ?? DataValues.currentWorkoutKey]),
          builder: (context, Box<Workout> box, _) {
            final Workout currentWorkout =
                box.get(widget.workoutKey ?? DataValues.currentWorkoutKey);
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
