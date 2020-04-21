import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/domain/models/workout.dart';
import 'package:data_setup/domain/models/workout_item.dart';
import 'package:data_setup/domain/repositories/i_hive_facade.dart';
import 'package:data_setup/presentation/theme/colors.dart';
import 'package:data_setup/presentation/widgets/exercise_details_pageview.dart';
import 'package:data_setup/presentation/widgets/workout_item_perform_pageview.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkoutPerformPage extends StatefulWidget {
  final String workoutKey;
  const WorkoutPerformPage(this.workoutKey);

  @override
  _WorkoutPerformPageState createState() => _WorkoutPerformPageState();
}

class _WorkoutPerformPageState extends State<WorkoutPerformPage> {
  // final Workout workout = IHiveFacade.workoutsBox.get(widget.workoutKey);

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    // final int currentIndex =
    //     exercises.indexWhere((exercise) => exercise.key == widget.exerciseKey);
    // _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Performing workout...'),
          flexibleSpace: Container(),
        ),
        backgroundColor: AppColors.greyDarkest,
        body: ValueListenableBuilder(
          valueListenable:
              IHiveFacade.workoutLogsBox.listenable(keys: [widget.workoutKey]),
          builder: (context, Box<Workout> box, _) {
            final Workout workout = box.get(widget.workoutKey);
            final List<WorkoutItem> items = workout.items;
            return Column(
              children: <Widget>[
                Container(
                  height: 20,
                  child: Text(
                    'progress bar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      itemCount: items.length,
                      itemBuilder: (context, index) =>
                          WorkoutItemPerformPageView(
                            items[index],
                            pageController: _pageController,
                          )),
                ),
              ],
            );
          },
        ),
      );
}
