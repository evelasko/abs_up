import 'package:flutter/material.dart';

import '../../domain/state/exercises_store.dart';
import '../../injection.dart';
import '../theme/colors.t.dart';
import '../widgets/exercise_details_view.w.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final String exerciseKey;

  const ExerciseDetailsPage(this.exerciseKey);

  @override
  _ExerciseDetailsPageState createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  final ExercisesStore exerciseStore = getIt.get<ExercisesStore>();

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    final int currentIndex = exerciseStore.exercises
        .indexWhere((exercise) => exercise.key == widget.exerciseKey);
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
            controller: _pageController,
            itemCount: exerciseStore.exercises.length,
            itemBuilder: (context, index) => ExerciseDetailsPageView(
                  exerciseStore.exercises.elementAt(index),
                  pageController: _pageController,
                )),
      );
}
