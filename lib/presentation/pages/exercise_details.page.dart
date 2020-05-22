import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:abs_up/presentation/widgets/exercise_details_pageview.dart';
import 'package:abs_up/services/p_data.s.dart';
import 'package:flutter/material.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final String exerciseKey;

  const ExerciseDetailsPage(this.exerciseKey);

  @override
  _ExerciseDetailsPageState createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  final List<Exercise> exercises = PDataService.exercisesBox.values.toList();

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    final int currentIndex =
        exercises.indexWhere((exercise) => exercise.key == widget.exerciseKey);
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.greyDarkest,
        body: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            itemCount: exercises.length,
            itemBuilder: (context, index) => ExerciseDetailsPageView(
                  exercises.elementAt(index),
                  pageController: _pageController,
                )),
      );
}
