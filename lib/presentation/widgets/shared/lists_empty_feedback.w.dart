import 'package:flutter/material.dart';

import '../../theme/text.t.dart';

class EmptyListFeedback extends StatelessWidget {
  final String message;
  const EmptyListFeedback(
    this.message, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          message,
          style: AppTextStyles.emptyListFeedbackBody,
        ),
      );
}
