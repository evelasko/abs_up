import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../domain/state/workouts_store.dart';
import '../widgets/savedworkout_items.w.dart';

class WorkoutsPage extends StatefulWidget {
  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  WorkoutsStore _workoutsStore;

  @override
  void didChangeDependencies() {
    _workoutsStore = Provider.of<WorkoutsStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => CustomScrollView(
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
            SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                _workoutsStore.workouts
                    .map(
                      (workout) => SavedWorkoutItem(workout),
                    )
                    .toList(),
              ),
              itemExtent: 90.0,
            )
          ],
        ),
      );
}
