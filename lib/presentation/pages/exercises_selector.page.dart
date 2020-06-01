import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../domain/models/workout.dart';
import '../../services/p_data.s.dart';
import '../../services/workout.s.dart';

class ExercisesSelectorPage extends StatefulWidget {
  final String workoutKey;

  const ExercisesSelectorPage({Key key, this.workoutKey}) : super(key: key);
  @override
  _ExercisesSelectorPageState createState() => _ExercisesSelectorPageState();
}

class _ExercisesSelectorPageState extends State<ExercisesSelectorPage> {
  Workout _workout;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _workout =
        widget.workoutKey == null ? null : WorkoutService().currentWorkout;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: _workout != null,
      appBar: AppBar(
        title: _workout == null ? null : Text('add to ${_workout.name}'),
      ),
      body: ValueListenableBuilder(
        valueListenable: PDataService.exercisesBox.listenable(),
        builder: (_, __, ___) => Provider<Workout>(
          create: (_) => _workout,
          child: const Center(child: Text('list...')),
        ),
      ),
    );
  }
}
