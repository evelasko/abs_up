import 'package:flutter/material.dart';

import '../../domain/models/workout.dart';
import '../../domain/state/workouts_store.dart';
import '../../injection.dart';

class ExercisesSelectorPage extends StatefulWidget {
  final String workoutKey;

  const ExercisesSelectorPage({Key key, this.workoutKey}) : super(key: key);
  @override
  _ExercisesSelectorPageState createState() => _ExercisesSelectorPageState();
}

class _ExercisesSelectorPageState extends State<ExercisesSelectorPage> {
  final WorkoutsStore workoutsStore = getIt.get<WorkoutsStore>();
  Workout _workout;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _workout = widget.workoutKey == null ? null : workoutsStore.currentWorkout;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: _workout != null,
      appBar: AppBar(
        title: _workout == null ? null : Text('add to ${_workout.name}'),
      ),
      // TODO ValueListenableBuilder not yet refactored
      // body: ValueListenableBuilder(
      //   valueListenable: PDataService.exercisesBox.listenable(),
      //   builder: (_, __, ___) => Provider<Workout>(
      //     create: (_) => _workout,
      //     child: const Center(child: Text('list...')),
      //   ),
      // ),
    );
  }
}
