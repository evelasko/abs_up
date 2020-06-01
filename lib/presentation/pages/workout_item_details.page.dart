import 'package:abs_up/domain/state/workouts_store.dart';
import 'package:flutter/material.dart';

import '../../domain/models/workout.dart';
import '../../services/workout.s.dart';
import '../theme/colors.t.dart';
import '../widgets/workout_item_details_pageview.w.dart';

class WorkoutItemDetailsPage extends StatefulWidget {
  final int itemIndex;
  final String workoutKey;

  const WorkoutItemDetailsPage({this.itemIndex, this.workoutKey});
  @override
  _WorkoutItemDetailsPageState createState() => _WorkoutItemDetailsPageState();
}

class _WorkoutItemDetailsPageState extends State<WorkoutItemDetailsPage> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.itemIndex);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WorkoutsStore _workoutsStore = WorkoutsStore(WorkoutService());
    final Workout workout = _workoutsStore.workoutFromKey(widget.workoutKey);
    return Scaffold(
      backgroundColor: AppColors.greyDarkest,
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          itemCount: workout.items.length,
          itemBuilder: (context, index) => WorkoutItemDetailsPageView(
                workoutItem: workout.items.elementAt(index),
                pageController: _pageController,
              )),
    );
  }
}
