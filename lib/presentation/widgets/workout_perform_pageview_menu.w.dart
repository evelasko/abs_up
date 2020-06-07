import 'package:flutter/material.dart';

import 'shared/buttons.w.dart';

class WorkoutPerformPageViewMenu extends StatelessWidget {
  final void Function() moreInfo;
  final void Function() replaceExercise;
  final void Function() shuffleExercise;
  final void Function() skipToNext;

  const WorkoutPerformPageViewMenu({
    Key key,
    this.moreInfo,
    this.replaceExercise,
    this.shuffleExercise,
    this.skipToNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BoxedSmallIconButton(
            onTap: moreInfo,
            icon: Icons.info_outline,
            text: 'info',
            buttonType: ButtonTypes.other),
        BoxedSmallIconButton(
            onTap: replaceExercise,
            icon: Icons.swap_horiz,
            text: 'replace',
            buttonType: ButtonTypes.other),
        BoxedSmallIconButton(
            onTap: shuffleExercise,
            icon: Icons.shuffle,
            text: 'shuffle',
            buttonType: ButtonTypes.secondary),
        BoxedSmallIconButton(
          onTap: skipToNext,
          icon: Icons.skip_next,
          text: 'skip',
        )
      ],
    );
  }
}
