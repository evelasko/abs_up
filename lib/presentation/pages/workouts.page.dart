import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../domain/models/workout.dart';
import '../../domain/state/workouts_store.dart';
import '../../injection.dart';
import '../utils/choice.dart';
import '../widgets/savedworkout_items.w.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WorkoutsStore _workoutsStore = getIt.get<WorkoutsStore>();
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          automaticallyImplyLeading: false,
          floating: true,
          title: Text('Saved Workouts'),
          //= Create new workout button
          // TODO (late) implement workout from scratch creation
          //= Reset filters button
          // TODO implement clear filters on workouts page
        ),
        //= Workout Items List
        Observer(builder: (_) {
          final List<Workout> workouts = _workoutsStore.allUserWorkouts;
          return choiceWidget(
              workouts == null || workouts.isEmpty,
              const SliverFillRemaining(
                child: Center(
                  child: Text('no saved workouts found'),
                ),
              ),
              SliverFixedExtentList(
                delegate: SliverChildListDelegate(
                  workouts
                      .map(
                        (workout) => SavedWorkoutItem(workout),
                      )
                      .toList(),
                ),
                itemExtent: 90.0,
              ));
        }),
      ],
    );
  }
}
