import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/state/workouts_store.dart';
import '../widgets/savedworkout_items.w.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _workoutsStore = Provider.of<WorkoutsStore>(context);
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
        ValueListenableBuilder(
          valueListenable: _workoutsStore.getWorkoutListenable(),
          builder: (_, __, ___) => _workoutsStore.workouts.fold(
              () => const SliverFillRemaining(
                    child: Center(
                      child: Text('no saved workouts found'),
                    ),
                  ),
              (workouts) => SliverFixedExtentList(
                    delegate: SliverChildListDelegate(
                      workouts
                          .map(
                            (workout) => SavedWorkoutItem(workout),
                          )
                          .toList(),
                    ),
                    itemExtent: 90.0,
                  )),
        ),
      ],
    );
  }
}
