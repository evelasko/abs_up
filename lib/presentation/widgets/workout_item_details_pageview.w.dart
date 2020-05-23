import 'package:abs_up/domain/models/workout_item.dart';
import 'package:flutter/material.dart';

import '../../domain/models/exercise.dart';
import '../theme/colors.t.dart';
import '../theme/text.t.dart';
import 'exercise_details_content.w.dart';

class WorkoutItemDetailsPageView extends StatelessWidget {
  final WorkoutItem workoutItem;
  final PageController pageController;

  const WorkoutItemDetailsPageView(
      {Key key, @required this.workoutItem, @required this.pageController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Exercise exercise = workoutItem.exercise;
    return Container(
      margin: const EdgeInsets.only(top: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: <Widget>[
          //= Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.greyDark,
                  ),
                  onPressed: () => Navigator.pop(context)),
              Expanded(
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      text:
                          '(${workoutItem.order}) ${exercise.name.toUpperCase()}',
                      style: AppTextStyles.listItemTitle),
                ),
              ),
              IconButton(
                  icon:
                      const Icon(Icons.filter_none, color: AppColors.greyDark),
                  onPressed: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.ease))
            ],
          ),
          //= Content
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(20),
            color: AppColors.greyLightest,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(child: ExerciseDetailsContent(exercise)),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
