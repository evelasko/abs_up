import 'package:flutter/material.dart';

import '../../domain/models/exercise.dart';
import '../theme/colors.dart';
import '../theme/text.dart';
import 'exercise_details_content.dart';

class ExerciseDetailsPageView extends StatelessWidget {
  final Exercise exercise;
  final PageController pageController;

  const ExerciseDetailsPageView(this.exercise,
      {Key key, @required this.pageController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
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
                  icon: Icon(
                    Icons.close,
                    color: AppColors.greyDark,
                  ),
                  onPressed: () => Navigator.pop(context)),
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: exercise.name.toUpperCase(),
                    style: AppTextStyles.listItemTitle),
              ),
              IconButton(
                  icon: Icon(Icons.filter_none, color: AppColors.greyDark),
                  onPressed: () => pageController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.ease))
            ],
          ),
          //= Content
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
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
