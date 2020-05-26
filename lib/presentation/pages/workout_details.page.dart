import 'package:abs_up/presentation/utils/choice.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../domain/models/workout.dart';
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

  WorkoutService workoutService;

  @override
  void didChangeDependencies() {
    workoutService =
        WorkoutService(workoutKey: widget.workoutKey ?? CURRENT_WORKOUT_KEY);
    super.didChangeDependencies();
  }

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
    // final WorkoutService workoutService =
    //     WorkoutService(workoutKey: widget.workoutKey ?? CURRENT_WORKOUT_KEY);
    final bool isCurrent = widget.workoutKey == CURRENT_WORKOUT_KEY;

    return Provider<WorkoutService>(
      create: (_) => workoutService,
      child: Scaffold(
        key: workoutDetailsScaffoldKey,
        appBar: AppBar(
          title: Text(
            isCurrent
                ? 'Preview Workout'
                : workoutService.currentWorkout?.name ?? 'Preview Workout',
            style: const TextStyle(
                color: AppColors.coquelicot, fontWeight: FontWeight.w800),
          ),
          actions: <Widget>[
            choiceWidget(
                isCurrent,
                //= Save workout as...
                IconButton(
                  icon: const Icon(Icons.save_alt),
                  onPressed: () =>
                      createSaveCurrentWorkoutAsDialog(context).then((name) {
                    if (name == null) return;
                    workoutService.saveCurrentWorkoutAs(name).then((value) =>
                        workoutDetailsScaffoldKey.currentState
                            .showSnackBar(AppSnackbars.savedWorkoutAs(name)));
                  }),
                ),
                //= Share saved workout
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed:
                      () {}, // TODO implement share a saved workout function
                )),
          ],
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 100),
            child: ValueListenableBuilder(
                valueListenable: workoutService.listenable,
                //= Workout Details Panel
                builder: (_, __, ___) => WorkoutDetailsPanel(
                      currentWorkout: workoutService.currentWorkout,
                      workoutSettings: workoutService.workoutSettings,
                    )),
          ),
        ),
        //= Workout Listenable
        body: ValueListenableBuilder(
            valueListenable: workoutService.listenable,
            builder: (context, Box<Workout> box, _) {
              //= Workout Reorderable Items List
              return ReorderableListView(
                onReorder: (oldIndex, newIndex) async => workoutService
                    .currentWorkout
                    .reorderItems(oldIndex, newIndex),
                children: workoutService.currentWorkout.items
                    .map((item) => WorkoutItemWidget(
                        key: Key('workoutItem:${item.exercise.key}'),
                        workoutItem: item))
                    .toList(),
              );
            }),
        // = Workout menu
        bottomNavigationBar: const WorkoutDetailsMenu(),
      ),
    );
  }
}
