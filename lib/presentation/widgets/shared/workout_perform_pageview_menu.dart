import 'package:abs_up/presentation/widgets/shared/buttons.dart';
import 'package:flutter/material.dart';

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
        AppButtons.boxedSmallIconButton(
            onTap: moreInfo,
            icon: Icons.info_outline,
            text: 'info',
            buttonType: ButtonTypes.other),
        AppButtons.boxedSmallIconButton(
            onTap: replaceExercise,
            icon: Icons.swap_horiz,
            text: 'replace',
            buttonType: ButtonTypes.other),
        AppButtons.boxedSmallIconButton(
            onTap: shuffleExercise,
            icon: Icons.shuffle,
            text: 'shuffle',
            buttonType: ButtonTypes.secondary),
        AppButtons.boxedSmallIconButton(
            onTap: skipToNext,
            icon: Icons.skip_next,
            text: 'skip',
            buttonType: ButtonTypes.primary)
      ],
    );
  }
}
