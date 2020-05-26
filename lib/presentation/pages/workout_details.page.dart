import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../domain/models/workout.dart';
import '../../domain/models/workout_settings.dart';
import '../../services/p_data.s.dart';
import '../../services/workout.s.dart';
import '../theme/colors.t.dart';
import '../widgets/shared/snackbars.w.dart';
import '../widgets/shared/workout_details_menu.w.dart';
import '../widgets/shared/workout_details_panel.w.dart';
import '../widgets/shared/workout_items.w.dart';

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
                'Save this workout as:',
                style: TextStyle(color: AppColors.greyLight),
              ),
              content: TextField(
                autocorrect: false,
                autofocus: true,
                controller: savedWorkoutNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.greyLightest,
                    ),
                  ),
                ),
                style: const TextStyle(
                    color: AppColors.greyLight,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
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
    final WorkoutService workoutService =
        WorkoutService(workoutKey: widget.workoutKey ?? CURRENT_WORKOUT_KEY);
    final Workout workout = workoutService.currentWorkout;
    final bool isCurrent = widget.workoutKey == CURRENT_WORKOUT_KEY;

    return Scaffold(
      key: workoutDetailsScaffoldKey,
      appBar: AppBar(
        title: Text(
          isCurrent ? 'Preview Workout' : workout?.name ?? 'Preview Workout',
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
          valueListenable: PDataService.workoutsBox
              .listenable(keys: [widget.workoutKey ?? CURRENT_WORKOUT_KEY]),
          builder: (context, Box<Workout> box, _) {
            final Workout currentWorkout =
                box.get(widget.workoutKey ?? CURRENT_WORKOUT_KEY);
            final WorkoutSettings workoutSettings =
                workoutService.workoutSettings;

            return Provider<Workout>(
              create: (_) => currentWorkout,
              child: Column(
                children: <Widget>[
                  //= Workout Details Panel
                  WorkoutDetailsPanel(
                    currentWorkout: currentWorkout,
                    workoutSettings: workoutSettings,
                  ),
                  //= Workout Reorderable Items List
                  Expanded(
                      child: ReorderableListView(
                    onReorder: (oldIndex, newIndex) async =>
                        currentWorkout.reorderItems(oldIndex, newIndex),
                    children: currentWorkout.items
                        .map((item) => WorkoutItemWidget(
                            key: Key('workoutItem:${item.exercise.key}'),
                            workoutItem: item))
                        .toList(),
                  )),
                  //= Menu Buttons
                  const WorkoutDetailsMenu()
                ],
              ),
            );
          }),
    );
  }
}
