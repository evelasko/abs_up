import 'package:abs_up/presentation/theme/colors.dart';
import 'package:abs_up/presentation/theme/text.dart';
import 'package:flutter/material.dart';

// TODO Implement the empty list feedback content widgets
Widget emptyListFeedbackExercises = Container(
  color: AppColors.greyLight,
  child: const Center(
    child: Text(
      'There is no exercises loaded yet...',
      style: AppTextStyles.emptyListFeedbackBody,
    ),
  ),
);
Widget emptyListFeedbackFavorites = Container(
  color: AppColors.greyLight,
  child: const Center(
    child: Text(
      'There is no favorited exercise yet...',
      style: AppTextStyles.emptyListFeedbackBody,
    ),
  ),
);
Widget emptyListFeedbackBlacklist = Container(
  color: AppColors.greyLight,
  child: const Center(
    child: Text(
      'There is no blacklisted exercise yet...',
      style: AppTextStyles.emptyListFeedbackBody,
    ),
  ),
);
