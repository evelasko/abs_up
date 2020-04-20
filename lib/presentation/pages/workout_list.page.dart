import 'package:data_setup/domain/models/workout.dart';
import 'package:data_setup/domain/repositories/data_values.dart';
import 'package:data_setup/domain/repositories/i_hive_facade.dart';
import 'package:data_setup/presentation/widgets/shared/savedworkout_items.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkoutListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Workouts'.toUpperCase()),
      ),
      body: ValueListenableBuilder(
        valueListenable: IHiveFacade.workoutsBox.listenable(),
        builder: (context, Box<Workout> box, widget) => Column(
          children: box.values
              .where((workout) => workout.key != DataValues.currentWorkoutKey)
              .map((workout) => savedWorkoutItem(context, workout))
              .toList(),
        ),
      ),
    );
  }
}
