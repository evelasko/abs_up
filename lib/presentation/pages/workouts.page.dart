import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants.dart';
import '../../services/p_data.s.dart';
import '../widgets/shared/savedworkout_items.w.dart';

class WorkoutsPage extends StatefulWidget {
  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage>
    with SingleTickerProviderStateMixin {
  // TODO get rid of the tabs and place an action button in the appbar linking to Create new workout page
  final List<Tab> _tabList = const <Tab>[
    Tab(text: 'SAVED'),
    Tab(text: 'FEED'),
    Tab(text: 'CREATE'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        primary: false,
        appBar: AppBar(
          // TODO switch this whole view to use slivers
          bottom: TabBar(controller: _tabController, tabs: _tabList),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            WorkoutsSavedTabView(),
            // TODO implement a row to filter workouts feed
            Center(
              child: Text('workouts filtered feed'),
            ),
            Center(
              child: Text('new workout from srcatch'),
            ),
          ],
        ),
      );
}

class WorkoutsSavedTabView extends StatelessWidget {
  const WorkoutsSavedTabView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: PDataService.workoutsBox.listenable(),
      builder: (_, __, ___) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: PDataService.workoutsBox.values
              .where((workout) => workout.key != CURRENT_WORKOUT_KEY)
              .map((workout) => savedWorkoutItem(context, workout))
              .toList(),
        ),
      ),
    );
  }
}
