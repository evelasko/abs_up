import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../domain/models/workout.dart';
import '../../domain/state/workouts_store.dart';
import '../../services/workout.s.dart';
import '../theme/colors.t.dart';
import '../utils/choice.dart';
import '../widgets/shared/snackbars.w.dart';
import '../widgets/shared/workout_details_menu.w.dart';
import '../widgets/shared/workout_details_panel.w.dart';
import '../widgets/workout_items.w.dart';

class WorkoutDetailsPage extends StatefulWidget {
  final String workoutKey;
  const WorkoutDetailsPage(this.workoutKey);
  @override
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  TextEditingController savedWorkoutNameController;

  @override
  void initState() {
    super.initState();
    savedWorkoutNameController = TextEditingController();
  }

  @override
  void dispose() {
    savedWorkoutNameController.dispose();
    super.dispose();
  }

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
    final _workoutsStore = WorkoutsStore(WorkoutService(),
        workoutKey: widget.workoutKey ?? CURRENT_WORKOUT_KEY);
    return ValueListenableBuilder(
        valueListenable: _workoutsStore.getWorkoutListenable(),
        builder: (_, Box<Workout> box, __) {
          final Workout workout = box.get(widget.workoutKey,
              defaultValue: box.get(CURRENT_WORKOUT_KEY));
          final bool isCurrent = widget.workoutKey == CURRENT_WORKOUT_KEY;
          return Provider<Workout>(
            create: (_) => workout,
            child: Observer(
              builder: (_) => Scaffold(
                key: workoutDetailsScaffoldKey,
                appBar: AppBar(
                  title: Text(
                    isCurrent
                        ? 'Preview Workout'
                        : workout.name ?? 'Preview Workout',
                    style: const TextStyle(
                        color: AppColors.coquelicot,
                        fontWeight: FontWeight.w800),
                  ),
                  actions: <Widget>[
                    choiceWidget(
                        isCurrent,
                        //= Save workout as...
                        IconButton(
                          icon: const Icon(Icons.save_alt),
                          onPressed: () =>
                              createSaveCurrentWorkoutAsDialog(context)
                                  .then((name) {
                            if (name == null) return;
                            _workoutsStore.saveCurrentWorkoutAs(name).then(
                                (value) => workoutDetailsScaffoldKey
                                    .currentState
                                    .showSnackBar(
                                        AppSnackbars.savedWorkoutAs(name)));
                          }),
                        ),
                        //= Share saved workout
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed:
                              () {}, // TODO (late) implement share a saved workout function
                        )),
                  ],
                  bottom: PreferredSize(
                      preferredSize: const Size(double.infinity, 100),
                      child: WorkoutDetailsPanel(
                        currentWorkout: workout,
                        workoutSettings: _workoutsStore.workoutSettings,
                      )),
                ),
                //= Workout List
                body: ReorderableListView(
                  onReorder: (oldIndex, newIndex) async =>
                      workout.reorderItems(oldIndex, newIndex),
                  children: workout.items
                      .map((item) => WorkoutItemWidget(
                          key: ValueKey(
                              '${workout.name ?? 'untitled!'}/item:${item.order}/'),
                          workoutItem: item))
                      .toList(),
                ),
                // = Workout menu
                bottomNavigationBar: Provider<WorkoutsStore>(
                    create: (_) => _workoutsStore,
                    child: const WorkoutDetailsMenu()),
              ),
            ),
          );
        });
  }
}
