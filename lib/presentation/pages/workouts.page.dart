import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants.dart';
import '../../services/p_data.s.dart';
import '../widgets/shared/savedworkout_items.w.dart';

class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Saved Workouts'.toUpperCase()),
        ),
        body: ValueListenableBuilder(
          valueListenable: PDataService.workoutsBox.listenable(),
          builder: (_, __, ___) => Column(
            children: PDataService.workoutsBox.values
                .where((workout) => workout.key != CURRENT_WORKOUT_KEY)
                .map((workout) => savedWorkoutItem(context, workout))
                .toList(),
          ),
        ),
      );
}
