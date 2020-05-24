import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:abs_up/presentation/theme/text.t.dart';
import 'package:flutter/material.dart';

class EmptyListFeedback extends StatelessWidget {
  final String message;
  const EmptyListFeedback(
    this.message, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: AppColors.greyLight,
        child: Center(
          child: Text(
            message,
            style: AppTextStyles.emptyListFeedbackBody,
          ),
        ),
      );
}
